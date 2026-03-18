#Requires AutoHotkey v2.0

; Alt + Space: 打开 Windows 搜索
$!Space::Send("#{LWin down}s{LWin up}")

; Win + Enter / Win + T: 打开终端
#Enter::
#t::
{
    try {
        Run("wt.exe")
    } catch {
        Run("powershell.exe")
    }
}

; Win + B: 打开 Firefox
#b::
{
    try {
        Run "firefox.exe"
    } catch {
        Run "C:\Program Files\Mozilla Firefox\firefox.exe"
    }
}

; Win + C: 启动/切换/隐藏 Clash
#c::
{
    processName := "Clash Verge.exe" 
    if WinExist("ahk_exe " . processName)
    {
        if WinActive("ahk_exe " . processName)
            WinMinimize("ahk_exe " . processName)
        else
            WinActivate("ahk_exe " . processName)
    }
    else
    {
        try {
            Run "C:\Program Files\Clash Verge\clash-verge.exe"
        } catch {
            MsgBox "找不到 Clash 安装路径。"
        }
    }
}