Download QB64 v2.0.2 or newer from: https://www.qb64.org/ or https://qb64phoenix.com/
Download InForm v1.3 or newer from: https://www.qb64.org/inform/ or https://github.com/FellippeHeitor/InForm
Download BIN2INCLUDE from: https://github.com/tailscreatesstuff32/BIN2INCLUDE

Changes to InForm:

InForm.ui
---------

FIND:			b$ = "Initializing..."
ADD BEFORE:		IF INSTR(COMMAND$, "-light") = 0 THEN COLOR _RGB32(254,254,255)

FIND:			'This.Canvas holds the children controls' images
ADD BEFORE:		_SETALPHA 16, _RGB(0, 0, 0) TO _RGB(255, 255, 255), ControlImage

FIND:			IF FPS >= 30 THEN
REPLACE W/:		IF FPS >= 15 THEN

InForm.bi
---------

FIND:			__UI_LoadForm
REPLACE W/:		IF INSTR(COMMAND$, "-light") THEN __UI_LoadForm_Light ELSE __UI_LoadForm
