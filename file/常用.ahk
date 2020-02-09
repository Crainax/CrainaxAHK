/*
win+H:置顶窗口
win+-:音量减小
win+=:音量增加
*/

#h::
	;将当前激活窗口存入变量w
	WinGetActiveTitle, w
	;对w窗口置顶，Toggle表示在on 与 off 中切换
	Winset, AlwaysOnTop, Toggle, %w%
	;获得窗口的标题
	WinGetTitle, varTitle, %w%
	;获得窗口的置顶状态
	WinGet, varTopMost, ExStyle, %w%

	If (varTopMost & 0x8)
	{
		ToolTip, %varTitle% 已经置顶
		SetTimer, RemoveToolTip, -2000
	}
	Else
	{
		ToolTip, %varTitle% 取消置顶
		SetTimer, RemoveToolTip, -2000
	}
return

;弹窗消失
RemoveToolTip:
	ToolTip
return

;快捷音量
#-::Volume_Down
#=::Volume_Up
#[::SendInput {Media_Prev}
#]::SendInput {Media_Next}
#\::SendInput {Media_Play_Pause}

;方向映射
!a::Send {Home}
!i::Send {End}
!h::Send {Left}
!l::Send {Right}
!k::Send {Up}
!j::Send {Down}
^!h::Send ^{Left}
^!l::Send ^{Right}
^!k::Send ^{Up}
^!j::Send ^{Down}
^+!h::Send ^+{Left}
^+!l::Send ^+{Right}
^+!k::Send ^+{Up}
^+!j::Send ^+{Down}
