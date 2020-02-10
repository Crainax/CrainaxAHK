/*
win+H:置顶窗口
win+-:音量减小
win+=:音量增加
Ctrl+Win+C 复制文件路径
Cap+B 百度搜索选中的
Cap+Z 百度搜索选中的
Cap+T 百度搜索选中的
Cap+B 百度搜索选中的
Cap+` 大小写
*/

SetCapsLockState, AlwaysOff

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
		SetTimer, RemoveToolTip, -500
	}
	Else
	{
		ToolTip, %varTitle% 取消置顶
		SetTimer, RemoveToolTip, -500
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
+!h::Send +{Left}
+!l::Send +{Right}
+!k::Send +{Up}
+!j::Send +{Down}
^+!h::Send ^+{Left}
^+!l::Send ^+{Right}
^+!k::Send ^+{Up}
^+!j::Send ^+{Down}

;Ctrl+Win+C 复制文件路径
^#c::
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return

;切大小写
CapsLock & `::                                                       ;|
GetKeyState, CapsLockState, CapsLock, T                              ;|
if CapsLockState = D                                                 ;|
    SetCapsLockState, AlwaysOff                                      ;|
else                                                                 ;|
    SetCapsLockState, AlwaysOn                                       ;|
KeyWait, ``                                                          ;|
return

;百度搜索
CapsLock & b:: 
Send ^c 
Run https://www.baidu.com/s?ie=UTF-8&wd=%clipboard% 
return 

;知乎搜索
CapsLock & z:: 
Send ^c 
Run https://www.zhihu.com/search?type=content&q=%clipboard%
return 

;淘宝搜索
CapsLock & t:: 
Send ^c 
Run https://s.taobao.com/search?q=%clipboard%
return 

;谷歌搜索
CapsLock & g:: 
Send ^c 
Run http://www.google.com/search?q=%clipboard% 
return

;
