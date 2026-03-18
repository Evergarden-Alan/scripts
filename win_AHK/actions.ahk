#Requires AutoHotkey v2.0

; Win + Q: 关闭当前活动窗口
#q::
{
    ActiveHwnd := WinExist("A")
    if ActiveHwnd
        WinClose("A")
}

; Win + HJKL (分屏/Snap 功能)
$#h::SendEvent("#{Left}")
$#l::SendEvent("#{Right}")
$#k::SendEvent("#{Up}")
$#j::SendEvent("#{Down}")

; Ctrl + Win + HJKL (像素级移动)
SmallStep := 20
^#h::MoveActiveWindow(-SmallStep, 0)
^#j::MoveActiveWindow(0, SmallStep)
^#k::MoveActiveWindow(0, -SmallStep)
^#l::MoveActiveWindow(SmallStep, 0)

MoveActiveWindow(xOffset, yOffset) {
    try {
        hwnd := WinExist("A")
        if !hwnd
            return
        if WinGetMinMax(hwnd) = 1
            WinRestore(hwnd)
        WinGetPos(&x, &y, &w, &h, hwnd)
        WinMove(x + xOffset, y + yOffset, w, h, hwnd)
    }
}

; =================================================================
; CapsLock + HJKL 类 Vim 方向键映射
; =================================================================

; 单独按下 CapsLock 发送 Esc
; 组合按下 CapsLock + HJKL 发送方向键
CapsLock::Send("{Esc}")

#HotIf GetKeyState("CapsLock", "P")
    h::Send("{Left}")
    j::Send("{Down}")
    k::Send("{Up}")
    l::Send("{Right}")
    
    ; 进阶：顺便把退格和删除也加上，手不离主键盘区
    ; n::Send("{Backspace}")
    ; m::Send("{Delete}")
    i::Send("{Home}")
    o::Send("{End}")
#HotIf