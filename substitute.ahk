
#SingleInstance Force
#NoEnv
SetBatchLines -1

;click on color:
;https://www.autohotkey.com/board/topic/56407-mouse-click-on-a-specified-color/

;gdoc translate action
^t::

clipboard := "Doc_WDS_2"  

Sleep, 500
;Atl Shift d to open data menu
Send, !+d
Sleep, 1000
; open range name bar
Send, n
Sleep, 1000

Loop, 1
{
	Sleep, 500
	Send, {F3}
	Sleep, 500
	Send,  ^v
	Sleep, 500
	;Send, {ENTER}
	
	PixelSearch, Px, Py, 0, 0, 1920, 1080, 0x3296FF, 0, Fast ; search  on orange result
	Sleep, 500
	if ErrorLevel{
		MsgBox, That color was not found in the specified region1.
	}else{
		click %Px%, %Py%
    }
	Sleep, 1000
	
	PixelSearch, Px, Py, 0, 0, 1920, 1080, 0xE8731A, 0, Fast ; search on  green result
	Sleep, 1000
	if ErrorLevel{
		MsgBox, That color was not found in the specified region2.
		;click %Px%+5, %Py%+5
	}else{
		click %Px%+5, %Py%+5
	}
	
	Sleep, 500
	Send, blabla
	Sleep, 500
	Send, {ENTER}
}


Return



^p::  ; Control+p hotkey.
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the current cursor position is %color%.
return


/*
^p::  ; Control+p hotkey.

	PixelSearch, Px, Py, 0, 200, 1920, 1080, 0x84AF7C, 0, Fast ; search on  green result
	if ErrorLevel{
		MsgBox, That color was not found in the specified region2.
	}else{
		click %Px%, %Py%
	}	
return
*/