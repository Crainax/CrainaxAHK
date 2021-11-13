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
Cap+N 快速生成1-50的数字
Cap+C 快速生成abcdefg的字母
Cap+M 快速生成01-50的数字

Cap+A:左屏幕
Cap+D:左屏幕
Cap+W:新建屏幕
Cap+S:关闭屏幕


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

;左手切屏幕
CapsLock & a::Send ^#{Left}
CapsLock & s::Send ^#{Down}
CapsLock & d::Send ^#{Right}
CapsLock & w::Send ^#{Up}
CapsLock & q::Send ^#d
CapsLock & e::Send ^#{F4}

;左手切标签
CapsLock & z::Send ^{PgUp}
CapsLock & x::Send ^{PgDn}

; 左手切屏幕
CapsLock & r::Send +#{Left}


;切大小写
CapsLock & `::                                                       ;|
GetKeyState, CapsLockState, CapsLock, T                              ;|
if CapsLockState = D                                                 ;|
    SetCapsLockState, AlwaysOff                                      ;|
else                                                                 ;|
    SetCapsLockState, AlwaysOn                                       ;|
KeyWait, ``                                                          ;|
return

;知乎搜索
/*
CapsLock & z::
Send ^c
Sleep, 10
Run https://www.zhihu.com/search?type=content&q=%clipboard%
return
*/

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

;翻译句
CapsLock & N::
SendInput 1`n2`n3`n4`n5`n6`n7`n8`n9`n10`n11`n12`n13`n14`n15`n16`n17`n18`n19`n20`n21`n22`n23`n24`n25`n26`n27`n28`n29`n30`n31`n32`n33`n34`n35`n36`n37`n38`n39`n40`n41`n42`n43`n44`n45`n46`n47`n48`n49`n50`na`nb`nc`nd`ne`nf`ng`nh`ni`nj`nk`nl`nm`nn`no`np`nq`nr`ns`nt`nu`nv`nw`nx`ny`nz`n
Return

;翻译句
CapsLock & M::
SendInput 01`n02`n03`n04`n05`n06`n07`n08`n09`n10`n11`n12`n13`n14`n15`n16`n17`n18`n19`n20`n21`n22`n23`n24`n25`n26`n27`n28`n29`n30`n31`n32`n33`n34`n35`n36`n37`n38`n39`n40`n41`n42`n43`n44`n45`n46`n47`n48`n49`n50`n
Return

;翻译句
/*CapsLock & ,::
SendInput
Return*/


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
/*
^#!l::
Send ^#{Right}
Return
*/

/*
^#!h::
Send ^#{Left}
Return
*/

;切换虚拟桌面←
/*
MButton & XButton2::
Send ^#{Left}
Return
*/
