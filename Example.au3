#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.0
 Author:         TheDcoder

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

; Run this script to launch the interactive example :)

; Includes
#include <MsgBoxConstants.au3>
#include "ProcessEx.au3"

MsgBox($MB_ICONINFORMATION, "Welcome", "Welcome to the demo of Process UDF :)" & @CRLF & @CRLF & "Lets start!")

MsgBox($MB_ICONINFORMATION, "Demo", 'Demo for _Process_RunCommand in RUNWAIT mode, This is the function line: _Process_RunCommand($PROCESS_RUNWAIT, $PROCESS_COMMAND & "ping 127.0.0.1")' & @CRLF & @CRLF & "(This will take some time)")
$sOutput = _Process_RunCommand($PROCESS_RUNWAIT, $PROCESS_COMMAND & "ping 127.0.0.1") ; Record the output
$iExitCode = @extended ; Note the exit code
MsgBox($MB_ICONINFORMATION, "Demo", "This is the result: " & @CRLF & @CRLF & $sOutput & @CRLF & @CRLF & "The exit code was: " & $iExitCode)

MsgBox($MB_ICONINFORMATION, "Demo", 'Demo for _Process_RunCommand in RUN mode and Demo for _Process_DebugRunCommand, This is the function line: _Process_RunCommand($PROCESS_RUN, $PROCESS_COMMAND & "tracert google.com")' & @CRLF & @CRLF & "This will be a fun ride :D")
$hProcessHandle = _Process_RunCommand($PROCESS_RUN, $PROCESS_COMMAND & "tracert google.com") ; Capture the Process Handle
$iPID = @extended ; Note the PID
_Process_DebugRunCommand($hProcessHandle, $iPID) ; Display the results in real-time

MsgBox($MB_ICONINFORMATION, "Demo", "This is the end of demo...")
If MsgBox($MB_ICONINFORMATION + $MB_YESNO, "Demo", "Would you like to run a custom command? Press 'No' to exit the demo.") = $IDNO Then Exit

While 1
	$sCommand = InputBox("Demo", "Please enter a command to run") ; Prompt the user...
	If Not @error Then ; If the user does NOT cancels...
		$hProcessHandle = _Process_RunCommand($PROCESS_RUN, $PROCESS_COMMAND & $sCommand) ; Capture the process handle
		$iPID = @extended ; Note the PID
		_Process_DebugRunCommand($hProcessHandle, $iPID) ; Display the results in real-time
	EndIf
	If MsgBox($MB_ICONINFORMATION + $MB_YESNO, "Demo", "Would you like to run another custom command?") = $IDNO Then Exit ; If the user wants to quit
WEnd