
Numpad0 & Numpad1::
 MsgBox, 你大爷
Return

:*:ftw::Free the whales
:*:bbb::nidaye

:c*:j@:: hehehehahaha

:*b0:<sb>::</sb>{left 5}
:*b0:<sb>::</sb2>{left 5}


#IfWinActive ahk_class Notepad
	::ssw::123
#IfWinActive
	::ssw::456

:C:BTW::  ; 输入所有大写字母.
:C:Btw::  ; 只有第一个字母输入大写字母.
: :btw::  ; 输入任何其他组合.
    case_conform_btw() {
        hs := A_ThisHotkey  ; 为了方便, 以防被打断.
        if (hs == ":C:BTW")
            SendInput Keys BY THE WAY
        else if (hs == ":C:Btw")
            SendInput Keys By the way
        else
            SendInput Keys by the way
    }
