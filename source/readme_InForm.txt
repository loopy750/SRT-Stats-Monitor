Download QB64 from: https://qb64phoenix.com/
Download InForm from: https://github.com/a740g/InForm-PE
InForm includes BIN2INCLUDE which can be used to edit image.png.MEM

Copy the InForm folder and files to the QB64 folder

Changes to InForm:


InForm.ui
---------

InForm.ui		copy as InForm.loopy_srt.ui

FIND:			b$ = "Initializing..."
REPLACE W/:		b$ = "Connecting to OBS WebSocket..."
ADD BEFORE:		IF INSTR(COMMAND$, "-light") = 0 THEN COLOR _RGB32(254,254,255)

FIND:			'This.Canvas holds the children controls' images
ADD BEFORE:		_SETALPHA 16, _RGB(0, 0, 0) TO _RGB(255, 255, 255), ControlImage

FIND:			__UI_ExitTriggered = _EXIT
REPLACE W/:		'__UI_ExitTriggered = _EXIT

FIND:			IF FPS >= 30 THEN
REPLACE W/:		IF FPS >= 15 THEN


InForm.bi
---------

InForm.bi		copy as InForm.loopy_srt.bi

FIND:			__UI_LoadForm
REPLACE W/:		IF INSTR(COMMAND$, "-light") THEN
					__UI_LoadForm_Light
				ELSEIF INSTR(COMMAND$, "-classic") THEN __UI_LoadForm_Classic
				ELSE
					__UI_LoadForm
				END IF


loopy_srt_monitor.bas
---------------------

FIND:			VerPortable = "false"
Can be changed to "true" to compile a portable version (seeks "config.ini" in current folder)


BIN2INCLUDE.bas
---------------

If "Memory region out of range" errors are produced, edit with the following:

Find and repeat for each instance of

FIND:			If Len(INDATA$) - BC& < 3 Then
ADD AFTER:		
                ' loopy750: added code
                a$ = Mid$(INDATA$, BC&, 3)
                BC& = BC& + 3: LL& = LL& + 4
                Print #2, E$(a$) + Q$;
                Exit Do ' exit now because the code below isn't required
                '
