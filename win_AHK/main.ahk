#Requires AutoHotkey v2.0
#SingleInstance Force
ProcessSetPriority "High"
InstallKeybdHook()

; =================================================================
; 模块包含 (确保这些文件与 main.ahk 在同一目录下)
; =================================================================

#Include actions.ahk
#Include apps.ahk
#Include utils.ahk

; =================================================================
; 托盘提示（可选，让你知道脚本已启动）
; =================================================================
TraySetIcon("shell32.dll", 16) ; 设置一个精致的小图标