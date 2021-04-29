Download QB64 v1.4 or newer from: https://www.qb64.org/
Download InForm v1.3 or newer from: https://www.qb64.org/inform/

Changes to InForm:

InForm.ui
---------

FIND:			b$ = "Initializing..."
ADD BEFORE:		COLOR _RGB32(254,254,255)

FIND:			'This.Canvas holds the children controls' images
ADD BEFORE:		_SETALPHA 16, _RGB(0, 0, 0) TO _RGB(255, 255, 255), ControlImage

FIND:			__UI_LoadForm
REPLACE W/:		IF INSTR(COMMAND$, "-light") THEN __UI_LoadForm_Light ELSE __UI_LoadForm

FIND:			IF FPS >= 30 THEN
REPLACE W/:		IF FPS >= 15 THEN
