# race-scoring-software

To run locally:
* TODO: setting up secrets. (will likely need to set up secrets locally to use Azure functions)
* `cd ui`
* `npm install`
* `npm start`

Running Azure functions locally:
* `cd api`
* `func start --port 7071`

# Troubleshooting
## Functions Not Showing Up, or messages related to "This version of the Azure Functions Core Tools requires your project to reference version 4.5.0 or later of Microsoft.NET.Sdk.Functions"
Check that `api/local.settings.json` is not encrypted. If it is, run `func settings decrypt` and make sure to set `Values.FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"`
