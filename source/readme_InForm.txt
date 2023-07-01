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
REPLACE W/:		IF INSTR(COMMAND$, "-light") THEN __UI_LoadForm_Light ELSE __UI_LoadForm
