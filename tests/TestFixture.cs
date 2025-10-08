using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading;

// vibe-coded test fixture
public class ServerFixture : IDisposable
{
    private readonly Process _process;
    public HttpClient Client { get; }

    public ServerFixture()
    {
        // Locate func.cmd from PATH dynamically
        var funcPath = Environment.GetEnvironmentVariable("PATH")?
            .Split(';')
            .Select(p => Path.Combine(p, "func.cmd"))
            .FirstOrDefault(File.Exists)
            ?? throw new FileNotFoundException("Could not find func.cmd in PATH. Make sure Azure Functions Core Tools are installed.");
        var functionFolder = Path.GetFullPath(
            Path.Combine(AppContext.BaseDirectory, @"..\..\..\..\api"));

        var startInfo = new ProcessStartInfo(funcPath, "start --port 7071")
        {
            WorkingDirectory = functionFolder,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            UseShellExecute = false,
            CreateNoWindow = true
        };

        _process = Process.Start(startInfo) ?? throw new InvalidOperationException("Failed to start func process");

        // stream logs
        _process.OutputDataReceived += (s, e) => { if (e.Data != null) Console.WriteLine(e.Data); };
        _process.BeginOutputReadLine();
        _process.ErrorDataReceived += (s, e) => { if (e.Data != null) Console.Error.WriteLine(e.Data); };
        _process.BeginErrorReadLine();

        Client = new HttpClient { BaseAddress = new Uri("http://127.0.0.1:7071") };
        WaitForHostReady(Client, TimeSpan.FromSeconds(30));
    }

    private void WaitForHostReady(HttpClient client, TimeSpan timeout)
    {
        var sw = Stopwatch.StartNew();
        while (sw.Elapsed < timeout)
        {
            try
            {
                var resp = client.GetAsync("/admin/host/status").GetAwaiter().GetResult();
                if (resp.IsSuccessStatusCode) return;
            }
            catch (HttpRequestException ex) when (
                ex.InnerException is System.Net.Sockets.SocketException se &&
                se.SocketErrorCode == System.Net.Sockets.SocketError.ConnectionRefused)
            {
                // host not ready yet, just retry
            }

            Thread.Sleep(500);
        }

        throw new TimeoutException("Azure Functions host did not start within timeout.");
    }

    public void Dispose()
    {
        try { _process.Kill(true); } catch { }
        Client.Dispose();
    }
}
