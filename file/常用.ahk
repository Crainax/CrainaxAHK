/*
win+T:置顶窗口
win+h:最小化窗口
win+u:显示刚刚最小化的窗口
win+-:音量减小
win+=:音量增加
Ctrl+Win+C 复制文件路径
Cap+B 百度搜索选中的
Cap+Z 百度搜索选中的
Cap+T 百度搜索选中的
Cap+B 百度搜索选中的
Cap+` 大小写
Cap+1 翻译词
Cap+2 翻译句
鼠标中键+鼠标侧上键:虚拟桌面←
鼠标中键+鼠标侧右键:虚拟桌面→
Cap+Enter:鼠标点击H
*/
SetCapsLockState, AlwaysOff

#Include D:\War3\AHK\file\MinimizeToTrayMenu.ahk

#t::
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
		#Persistent
		SetTimer, RemoveToolTip, -500
	}
	Else
	{
		ToolTip, %varTitle% 取消置顶
		#Persistent
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
+!a::Send +{Home}
+!i::Send +{End}
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
Sleep, 10
Run https://www.baidu.com/s?ie=UTF-8&wd=%clipboard% 
return 

;知乎搜索
CapsLock & z:: 
Send ^c 
Sleep, 10
Run https://www.zhihu.com/search?type=content&q=%clipboard%
return 

;淘宝搜索
CapsLock & t:: 
Send ^c 
Sleep, 10
Run https://s.taobao.com/search?q=%clipboard%
return 

;谷歌搜索
CapsLock & g:: 
Send ^c 
Sleep, 10
Run http://www.google.com/search?q=%clipboard% 
return

;翻译词
CapsLock & 1:: 
Send ^c 
Sleep, 10
Run http://dict.cn/%clipboard%
return

;翻译句
CapsLock & 2:: 
Send ^c 
Sleep, 10
Run https://translate.google.cn/#view=home&op=translate&sl=auto&tl=zh-CN&text=%clipboard%
return

;Cap+Enter
CapsLock & Enter::
Send {Click}
Return

;切换虚拟桌面	→
/*
MButton & XButton1::
Send ^#{Right}
Return
*/

;切换虚拟桌面	→
^#!l::
Send ^#{Right}
Return

^#!h::
Send ^#{Left}
Return

;切换虚拟桌面←
/*
MButton & XButton2::
Send ^#{Left}
Return
*/
