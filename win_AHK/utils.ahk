#Requires AutoHotkey v2.0

; CapsLock 改为 Esc
CapsLock::Esc

; Win + E: 打开文件管理器
#e::Run("explorer.exe")

; Ctrl + Shift + R: 重新加载脚本 (注意：在 main.ahk 中重新加载主脚本即可)
^+r::Reload