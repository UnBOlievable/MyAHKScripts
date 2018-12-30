;This script was made with 150% system scaling in AE CC 2019
;Get the search image used from here:  

;initialize variables
offset := 64  ;distance between top left of lock icon and top of first layer
roundscale := 25.5  ;distance between each layer


#If WinActive("ahk_exe AfterFX.exe")
{


a:: ;  <--- you obviously know what to do with this.
	BlockInput, MouseMove
	MouseGetPos, AEMouseX, AEMouseY 
	;check if tag icon has moved (or was ever found)
	Imagesearch, , , AETagX, AETagY, AETagX+15, AETagY+18, %A_ScriptDir%\Adobe\AfterEffects\ImageSearch\AELockIconS150.png  ;Edit with the filepath you download the icon to
	If ErrorLevel = 1
		{
		ImageSearch, AETagX, AETagY, 0, 24, AEMouseX, AEMouseY,  %A_ScriptDir%\Adobe\AfterEffects\ImageSearch\AELockIconS150.png
		}
	AERoundY := AETagY+offset+Round((AEMouseY-AETagY-offset)/roundscale)*roundscale
	PixelSearch, AEClickX, , AETagX, AERoundY-0, AETagX+400, AERoundY+0, 0x999999, 70,Fast
	If Errorlevel = 1
		{
		BlockInput, MouseMoveOff
		Return
		}
	
	Else
	{
	MouseClick, Left, AEClickX+2, AERoundY, ,0
	MouseMove, AEMouseX, AEMouseY, 0
	}

	; MouseMove, AEMouseX, AERoundY, 0
	BlockInput, MouseMoveOff
Return

}
