': This form was generated by
': InForm - GUI library for QB64 - v1.3
': Fellippe Heitor, 2016-2020 - fellippe@qb64.org - @fellippeheitor
': https://github.com/FellippeHeitor/InForm
'-----------------------------------------------------------
SUB __UI_LoadForm

    DIM __UI_NewID AS LONG, __UI_RegisterResult AS LONG

    __UI_NewID = __UI_NewControl(__UI_Type_Form, "LoopySRTMonitor", 800, 401, 0, 0, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Loopy SRT Monitor"
    Control(__UI_NewID).Font = SetFont("phagspa.ttf?segoeui.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(1, 1, 1)
    Control(__UI_NewID).BackColor = _RGB32(38, 40, 45)
    Control(__UI_NewID).BorderColor = _RGB32(163, 166, 170)

    __UI_NewID = __UI_NewControl(__UI_Type_MenuBar, "FileMenu", 34, 22, 8, 0, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "File"
    Control(__UI_NewID).ForeColor = _RGB32(255, 255, 255)
    Control(__UI_NewID).BorderColor = _RGB32(170, 166, 170)

    __UI_NewID = __UI_NewControl(__UI_Type_MenuBar, "OptionsMenu", 62, 22, 42, 0, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Options"
    Control(__UI_NewID).ForeColor = _RGB32(255, 255, 255)

    __UI_NewID = __UI_NewControl(__UI_Type_MenuBar, "HelpMenu", 41, 22, 104, 0, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Help"
    Control(__UI_NewID).ForeColor = _RGB32(255, 255, 255)

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Status", 753, 64, 24, 37, 0)
    __UI_RegisterResult = 0
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).HasBorder = True
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Settings", 753, 64, 24, 120, 0)
    __UI_RegisterResult = 0
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).HasBorder = True
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "CurrentScene", 199, 106, 301, 204, 0)
    __UI_RegisterResult = 0
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).HasBorder = True
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "DebugFrame", 753, 59, 24, 329, 0)
    __UI_RegisterResult = 0
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(33, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).HasBorder = True
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Stream1", 245, 106, 24, 204, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream #1"
    Control(__UI_NewID).Font = SetFont("phagspa.ttf?seguisb.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(64, 252, 48)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).HasBorder = True
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Stream2", 245, 106, 532, 204, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream #2"
    Control(__UI_NewID).Font = SetFont("phagspa.ttf?seguisb.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(64, 252, 48)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).HasBorder = True
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "versionFrame", 753, 59, 24, 329, 0)
    __UI_RegisterResult = 0
    Control(__UI_NewID).Font = SetFont("phagspa.ttf?seguisb.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(32, 128, 16)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).HasBorder = True
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "FileMenuExit", 63, 20, 0, 4, __UI_GetID("FileMenu"))
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Exit"
    ToolTip(__UI_NewID) = "Exits the program"
    Control(__UI_NewID).ForeColor = _RGB32(1, 1, 2)
    Control(__UI_NewID).BackColor = _RGB32(254, 254, 255)
    Control(__UI_NewID).BorderColor = _RGB32(170, 166, 170)

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "StreamFailTimerLB", 125, 21, 43, 50, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream fail timer"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(3, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(164, 168, 172)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "ServerPingLB", 120, 21, 533, 50, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "WebSocket ping"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(3, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(164, 168, 172)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "UpdateIntervalLB", 105, 21, 653, 50, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Update interval"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(3, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(164, 168, 172)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Timer_FailLB", 190, 21, 43, 72, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Timer_Fail"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(131, 151, 163)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Timer_Fail_CountLB", 130, 21, 168, 72, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Timer_Fail_Count"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(131, 151, 163)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "tPingOutLB", 104, 21, 534, 72, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "tPingOut#"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(131, 151, 163)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "td_updateLB", 105, 21, 655, 72, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "td_update"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(131, 151, 163)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "StreamFailDelayLB", 215, 21, 43, 133, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream fail delay"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(3, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(164, 168, 172)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "MultiCameraSwitchLB", 135, 21, 623, 133, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Multi Camera Switch"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(3, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(164, 168, 172)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Stream_Fail_DelayLB", 190, 21, 44, 155, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream_Fail_Delay"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(142, 166, 143)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "MultiCameraSwitchStatusLB", 135, 21, 623, 155, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "MultiCameraSwitchStatus"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(142, 166, 143)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "TimerLB", 93, 21, 43, 340, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Timer"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(33, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(195, 4, 4)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "TimerSnapshotLB", 120, 21, 136, 340, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Timer (snapshot)"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(33, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(195, 4, 4)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "td_displayVarLB", 95, 21, 256, 340, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "td_display var"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(33, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(195, 4, 4)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "mouseXVarLB", 74, 21, 489, 340, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "mouseX var"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(33, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(195, 4, 4)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "mouseYVarLB", 80, 21, 563, 340, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "mouseY var"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(33, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(195, 4, 4)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "__ERRORLINEVarLB", 114, 21, 643, 340, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "_ERRORLINE var"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(33, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(195, 4, 4)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Debug_TimerLB", 93, 21, 43, 362, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Debug_Timer"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(235, 96, 57)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Debug_Timer_SnapshotLB", 120, 21, 136, 362, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Debug_Timer_Snapshot"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(235, 96, 57)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "td_displayLB", 95, 21, 256, 362, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "td_display"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(235, 96, 57)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "mouseXLB", 74, 21, 489, 362, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "mouseX"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(235, 96, 57)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "mouseYLB", 80, 21, 563, 362, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "mouseY"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(235, 96, 57)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "__ERRORLINELB", 115, 21, 643, 362, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "_ERRORLINE"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(235, 96, 57)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "StreamUptimeLB", 98, 21, 51, 238, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream uptime"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(185, 221, 200)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 35)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "failLB", 107, 21, 42, 269, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream fail timer"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(185, 221, 200)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 35)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Uptime_Stream_1LB", 90, 21, 153, 238, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Uptime_Stream_1"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(185, 181, 211)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Timer_Fail_Stream1LB", 108, 21, 153, 269, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Timer_Fail_Stream1"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(185, 181, 211)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Scene_CurrentLB", 187, 29, 307, 205, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Scene_Current"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?ebrimabd.ttf?phagspa.ttf?segoeui.ttf", 18)
    Control(__UI_NewID).ForeColor = _RGB32(155, 255, 240)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 35)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).Align = __UI_Center
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_PictureBox, "PictureBox1", 64, 64, 369, 236, 0)
    __UI_RegisterResult = 0
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).BackStyle = __UI_Transparent
    Control(__UI_NewID).Align = __UI_Center
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "StreamUptimeLB2", 98, 21, 559, 238, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream uptime"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(185, 221, 200)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 35)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "failLB2", 107, 21, 549, 269, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream fail timer"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(185, 221, 200)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 35)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Uptime_Stream_2LB", 90, 21, 661, 238, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Uptime_Stream_2"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(185, 181, 211)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Timer_Fail_Stream2LB", 108, 21, 661, 269, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Timer_Fail_Stream2"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(185, 181, 211)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle

    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "OptionsMenuDebug", 82, 20, 0, 4, __UI_GetID("OptionsMenu"))
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Debug"
    Control(__UI_NewID).ForeColor = _RGB32(1, 1, 2)
    Control(__UI_NewID).BackColor = _RGB32(254, 254, 255)
    __UI_RegisterResult = RegisterKeyCombo("Ctrl+D", __UI_NewID)

    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "HelpMenuVisitWebsite", 114, 20, 0, 4, __UI_GetID("HelpMenu"))
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Visit Website"

    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "HelpMenuCheckForUpdates", 149, 20, 0, 24, __UI_GetID("HelpMenu"))
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Check for updates-"
    Control(__UI_NewID).ForeColor = _RGB32(1, 1, 2)
    Control(__UI_NewID).BackColor = _RGB32(254, 254, 255)

    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "OptionsMenuFullscreen", 98, 20, 0, 24, __UI_GetID("OptionsMenu"))
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Fullscreen"
    Control(__UI_NewID).ForeColor = _RGB32(1, 1, 2)
    Control(__UI_NewID).BackColor = _RGB32(254, 254, 255)
    __UI_RegisterResult = RegisterKeyCombo("Ctrl+F", __UI_NewID)

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "IndicatorLB", 20, 20, 786, 0, 0)
    __UI_RegisterResult = 0
    Control(__UI_NewID).ForeColor = _RGB32(73, 70, 76)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "HelpMenuAbout", 79, 20, 0, 51, __UI_GetID("HelpMenu"))
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "About"
    Control(__UI_NewID).ForeColor = _RGB32(1, 1, 2)
    Control(__UI_NewID).BackColor = _RGB32(254, 254, 255)

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "StatusLB", 310, 21, 450, 1, 0)
    __UI_RegisterResult = 0
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?seguisb.ttf?phagspa.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(60, 180, 240)
    Control(__UI_NewID).Align = __UI_Right
    Control(__UI_NewID).VAlign = __UI_Middle

    __UI_NewID = __UI_NewControl(__UI_Type_PictureBox, "PictureBoxLogoBottom", 401, 30, 198, 344, 0)
    __UI_RegisterResult = 0
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(33, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).Align = __UI_Center
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "StreamUptimeLB3", 180, 21, 258, 133, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream uptime"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(3, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(164, 168, 172)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "StreamFailTimerLB2", 185, 21, 438, 133, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream fail timer"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(3, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(164, 168, 172)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Stream_UptimeLB", 190, 21, 258, 155, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream_Uptime"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(142, 166, 143)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Stream_Fail_TimerLB", 190, 21, 438, 155, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Stream_Fail_Timer"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(142, 166, 143)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Timer_Fail_Count_2LB", 145, 21, 298, 72, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Timer_Fail_Count_2"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(131, 151, 163)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "IPPingLB", 90, 21, 443, 50, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "IP ping"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(3, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(164, 168, 172)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "tIPPingOutLB", 90, 21, 444, 72, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "tIPPingOut#"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(131, 151, 163)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "FailCount2LB", 145, 21, 298, 50, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "DC / LBR (#2)"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(3, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(164, 168, 172)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "FailCount1LB", 130, 21, 168, 50, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "DC / LBR (#1)"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(3, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(164, 168, 172)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "LowBRTimerLB", 68, 21, 421, 340, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Low BR"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(33, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(195, 4, 4)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "br_countdownLB", 68, 21, 421, 362, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "br_countdown"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(235, 96, 57)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "MSRateLB", 70, 21, 351, 340, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "MS rate"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(33, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(195, 4, 4)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "ms_playLB", 70, 21, 351, 362, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "ms_play"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(235, 96, 57)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "LowBitrateSceneLB", 120, 21, 340, 133, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Low bitrate scene"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?phagspa.ttf?seguisb.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(3, 4, 4)
    Control(__UI_NewID).BackColor = _RGB32(164, 168, 172)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

    __UI_NewID = __UI_NewControl(__UI_Type_Label, "Low_Bitrate_StatusLB", 120, 21, 340, 155, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Low_Bitrate_Status"
    Control(__UI_NewID).Font = SetFont("seguisb.ttf?phagspa.ttf?segoeui.ttf", 12)
    Control(__UI_NewID).ForeColor = _RGB32(142, 166, 143)
    Control(__UI_NewID).BackColor = _RGB32(25, 28, 33)
    Control(__UI_NewID).BorderColor = _RGB32(10, 12, 15)
    Control(__UI_NewID).VAlign = __UI_Middle
    Control(__UI_NewID).Padding = 10

END SUB

SUB __UI_AssignIDs
    LoopySRTMonitor = __UI_GetID("LoopySRTMonitor")
    FileMenu = __UI_GetID("FileMenu")
    OptionsMenu = __UI_GetID("OptionsMenu")
    HelpMenu = __UI_GetID("HelpMenu")
    Status = __UI_GetID("Status")
    Settings = __UI_GetID("Settings")
    CurrentScene = __UI_GetID("CurrentScene")
    DebugFrame = __UI_GetID("DebugFrame")
    Stream1 = __UI_GetID("Stream1")
    Stream2 = __UI_GetID("Stream2")
    versionFrame = __UI_GetID("versionFrame")
    FileMenuExit = __UI_GetID("FileMenuExit")
    StreamFailTimerLB = __UI_GetID("StreamFailTimerLB")
    ServerPingLB = __UI_GetID("ServerPingLB")
    UpdateIntervalLB = __UI_GetID("UpdateIntervalLB")
    Timer_FailLB = __UI_GetID("Timer_FailLB")
    Timer_Fail_CountLB = __UI_GetID("Timer_Fail_CountLB")
    tPingOutLB = __UI_GetID("tPingOutLB")
    td_updateLB = __UI_GetID("td_updateLB")
    StreamFailDelayLB = __UI_GetID("StreamFailDelayLB")
    MultiCameraSwitchLB = __UI_GetID("MultiCameraSwitchLB")
    Stream_Fail_DelayLB = __UI_GetID("Stream_Fail_DelayLB")
    MultiCameraSwitchStatusLB = __UI_GetID("MultiCameraSwitchStatusLB")
    TimerLB = __UI_GetID("TimerLB")
    TimerSnapshotLB = __UI_GetID("TimerSnapshotLB")
    td_displayVarLB = __UI_GetID("td_displayVarLB")
    mouseXVarLB = __UI_GetID("mouseXVarLB")
    mouseYVarLB = __UI_GetID("mouseYVarLB")
    __ERRORLINEVarLB = __UI_GetID("__ERRORLINEVarLB")
    Debug_TimerLB = __UI_GetID("Debug_TimerLB")
    Debug_Timer_SnapshotLB = __UI_GetID("Debug_Timer_SnapshotLB")
    td_displayLB = __UI_GetID("td_displayLB")
    mouseXLB = __UI_GetID("mouseXLB")
    mouseYLB = __UI_GetID("mouseYLB")
    __ERRORLINELB = __UI_GetID("__ERRORLINELB")
    StreamUptimeLB = __UI_GetID("StreamUptimeLB")
    failLB = __UI_GetID("failLB")
    Uptime_Stream_1LB = __UI_GetID("Uptime_Stream_1LB")
    Timer_Fail_Stream1LB = __UI_GetID("Timer_Fail_Stream1LB")
    Scene_CurrentLB = __UI_GetID("Scene_CurrentLB")
    PictureBox1 = __UI_GetID("PictureBox1")
    StreamUptimeLB2 = __UI_GetID("StreamUptimeLB2")
    failLB2 = __UI_GetID("failLB2")
    Uptime_Stream_2LB = __UI_GetID("Uptime_Stream_2LB")
    Timer_Fail_Stream2LB = __UI_GetID("Timer_Fail_Stream2LB")
    OptionsMenuDebug = __UI_GetID("OptionsMenuDebug")
    HelpMenuVisitWebsite = __UI_GetID("HelpMenuVisitWebsite")
    HelpMenuCheckForUpdates = __UI_GetID("HelpMenuCheckForUpdates")
    OptionsMenuFullscreen = __UI_GetID("OptionsMenuFullscreen")
    IndicatorLB = __UI_GetID("IndicatorLB")
    HelpMenuAbout = __UI_GetID("HelpMenuAbout")
    StatusLB = __UI_GetID("StatusLB")
    PictureBoxLogoBottom = __UI_GetID("PictureBoxLogoBottom")
    StreamUptimeLB3 = __UI_GetID("StreamUptimeLB3")
    StreamFailTimerLB2 = __UI_GetID("StreamFailTimerLB2")
    Stream_UptimeLB = __UI_GetID("Stream_UptimeLB")
    Stream_Fail_TimerLB = __UI_GetID("Stream_Fail_TimerLB")
    Timer_Fail_Count_2LB = __UI_GetID("Timer_Fail_Count_2LB")
    IPPingLB = __UI_GetID("IPPingLB")
    tIPPingOutLB = __UI_GetID("tIPPingOutLB")
    FailCount2LB = __UI_GetID("FailCount2LB")
    FailCount1LB = __UI_GetID("FailCount1LB")
    LowBRTimerLB = __UI_GetID("LowBRTimerLB")
    br_countdownLB = __UI_GetID("br_countdownLB")
    MSRateLB = __UI_GetID("MSRateLB")
    ms_playLB = __UI_GetID("ms_playLB")
    LowBitrateSceneLB = __UI_GetID("LowBitrateSceneLB")
    Low_Bitrate_StatusLB = __UI_GetID("Low_Bitrate_StatusLB")
END SUB
