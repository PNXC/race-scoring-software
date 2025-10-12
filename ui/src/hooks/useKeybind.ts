import { useEffect } from "react";

function useShortcut(key: string, requiresCtrlKey: boolean, callback: () => void) {
    useEffect(() => {
        const handler = (e: KeyboardEvent) => {
            const isMac = /Mac/i.test(navigator.userAgent);
            const ctrlOrCmd = isMac ? e.metaKey : e.ctrlKey;

            if ((!requiresCtrlKey || ctrlOrCmd) && e.key.toLowerCase() === key.toLowerCase()) {
                e.preventDefault();
                callback();
            }
        };
        window.addEventListener("keydown", handler);
        return () => window.removeEventListener("keydown", handler);
    }, [callback, key, requiresCtrlKey]);
}

export default useShortcut;
