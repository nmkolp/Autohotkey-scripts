; Run current script as Administrator

#NoEnv
SendMode Input

full_command_line := DllCall("GetCommandLine", "str")
if NOT (A_IsAdmin OR RegExMatch(full_command_line, " /restart(?!\S)")) {
    try {
        if A_IsCompiled {
            Run *RunAs "%A_ScriptFullPath%" /restart
        } else {
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
    }
    ExitApp
}
