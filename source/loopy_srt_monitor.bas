': This program uses
': InForm - GUI library for QB64 - v1.3
': Fellippe Heitor, 2016-2021 - fellippe@qb64.org - @fellippeheitor
': https://github.com/FellippeHeitor/InForm
'-----------------------------------------------------------

': Controls' IDs: ------------------------------------------------------------------
OPTION _EXPLICIT
DIM SHARED LoopySRTMonitor AS LONG
DIM SHARED FileMenu AS LONG
DIM SHARED OptionsMenu AS LONG
DIM SHARED HelpMenu AS LONG
DIM SHARED Status AS LONG
DIM SHARED Settings AS LONG
DIM SHARED CurrentScene AS LONG
DIM SHARED DebugFrame AS LONG
DIM SHARED Stream1 AS LONG
DIM SHARED Stream2 AS LONG
DIM SHARED versionFrame AS LONG
DIM SHARED FileMenuExit AS LONG
DIM SHARED StreamFailTimerLB AS LONG
DIM SHARED ServerPingLB AS LONG
DIM SHARED UpdateIntervalLB AS LONG
DIM SHARED Timer_FailLB AS LONG
DIM SHARED Timer_Fail_CountLB AS LONG
DIM SHARED tPingOutLB AS LONG
DIM SHARED td_updateLB AS LONG
DIM SHARED StreamFailDelayLB AS LONG
DIM SHARED MultiCameraSwitchLB AS LONG
DIM SHARED Stream_Fail_DelayLB AS LONG
DIM SHARED MultiCameraSwitchStatusLB AS LONG
DIM SHARED TimerLB AS LONG
DIM SHARED TimerSnapshotLB AS LONG
DIM SHARED td_displayLB2 AS LONG
DIM SHARED mouseXLB2 AS LONG
DIM SHARED mouseYLB2 AS LONG
DIM SHARED __ERRORLINELB2 AS LONG
DIM SHARED Debug_TimerLB AS LONG
DIM SHARED Debug_Timer_SnapshotLB AS LONG
DIM SHARED td_displayLB AS LONG
DIM SHARED mouseXLB AS LONG
DIM SHARED mouseYLB AS LONG
DIM SHARED __ERRORLINELB AS LONG
DIM SHARED StreamUptimeLB AS LONG
DIM SHARED failLB AS LONG
DIM SHARED Uptime_Stream_1LB AS LONG
DIM SHARED Timer_Fail_Stream1LB AS LONG
DIM SHARED Scene_CurrentLB AS LONG
DIM SHARED PictureBox1 AS LONG
DIM SHARED StreamUptimeLB2 AS LONG
DIM SHARED failLB2 AS LONG
DIM SHARED Uptime_Stream_2LB AS LONG
DIM SHARED Timer_Fail_Stream2LB AS LONG
DIM SHARED OptionsMenuRestoreWindowSize AS LONG
DIM SHARED OptionsMenuFullscreen AS LONG
DIM SHARED OptionsMenuDebug AS LONG
DIM SHARED HelpMenuVisitWebsite AS LONG
DIM SHARED HelpMenuCheckForUpdates AS LONG
DIM SHARED IndicatorLB AS LONG
DIM SHARED HelpMenuAbout AS LONG
DIM SHARED StatusLB AS LONG
DIM SHARED PictureBoxLogoBottom AS LONG
DIM SHARED StreamUptimeLB3 AS LONG
DIM SHARED StreamFailTimerLB2 AS LONG
DIM SHARED Stream_UptimeLB AS LONG
DIM SHARED Stream_Fail_TimerLB AS LONG
DIM SHARED Timer_Fail_Count_2LB AS LONG
DIM SHARED IPPingLB AS LONG
DIM SHARED tIPPingOutLB AS LONG
DIM SHARED FailCount1LB AS LONG
DIM SHARED FailCount2LB AS LONG
DIM SHARED LowBRTimerLB AS LONG
DIM SHARED br_countdownLB AS LONG
DIM SHARED MSRateLB AS LONG
DIM SHARED ms_playLB AS LONG
DIM SHARED LowBitrateSceneLB AS LONG
DIM SHARED Low_Bitrate_StatusLB AS LONG
DIM SHARED MSRateLB2 AS LONG
DIM SHARED ms_playLB2 AS LONG
DIM SHARED OptionsMenuAlwaysOnTop AS LONG
DIM SHARED Stream1LightLB AS LONG
DIM SHARED Stream2LightLB AS LONG
DIM SHARED StreamLightLB AS LONG
DIM SHARED LBRDelayLB AS LONG
DIM SHARED br_delayLB AS LONG
DIM SHARED DebugFrameTemp AS LONG
DIM SHARED DebugTemp1LB AS LONG
DIM SHARED DebugTemp2LB AS LONG
DIM SHARED DebugTemp3LB AS LONG
DIM SHARED DebugTemp4LB AS LONG
DIM SHARED DebugTemp1LB2 AS LONG
DIM SHARED DebugTemp2LB2 AS LONG
DIM SHARED DebugTemp3LB2 AS LONG
DIM SHARED DebugTemp4LB2 AS LONG
DIM SHARED BitrateLB AS LONG
DIM SHARED Bitrate_Stream_1LB AS LONG
DIM SHARED BitrateLB2 AS LONG
DIM SHARED Bitrate_Stream_2LB AS LONG

' Added after InForm entry - BEGIN
DEFINT A-Z
COMMON SHARED Error_msg AS STRING
COMMON SHARED Error_msg_2 AS STRING
COMMON SHARED Ver AS STRING
COMMON SHARED VerBeta AS STRING
COMMON SHARED VerDate AS STRING
COMMON SHARED VerPortable AS STRING
COMMON SHARED bout AS STRING
COMMON SHARED tout AS STRING
COMMON SHARED Refresh_Request AS INTEGER
COMMON SHARED RefreshDisplayRequest AS INTEGER
COMMON SHARED ProgressCounter AS INTEGER
COMMON SHARED updateResult AS STRING
COMMON SHARED updateDisplay AS INTEGER
COMMON SHARED updateDisplayCounter AS INTEGER
COMMON SHARED verCheck AS STRING
COMMON SHARED CheckUpdateOnStartup AS STRING
COMMON SHARED file224 AS STRING
COMMON SHARED FileStatusOutput AS STRING
COMMON SHARED __FileStatusOutput AS _BYTE
COMMON SHARED outputBitrateFile AS STRING
COMMON SHARED outputStatusFile AS STRING
COMMON SHARED outputConnectionsLogFile AS STRING
COMMON SHARED outputKbpsFile1 AS STRING
COMMON SHARED outputKbpsFile2 AS STRING
COMMON SHARED outputLB1 AS STRING
COMMON SHARED outputLB2 AS STRING
COMMON SHARED outputLB_Temp1 AS STRING
COMMON SHARED outputLB_Temp2 AS STRING
COMMON SHARED iniFeatures AS _BYTE
COMMON SHARED Debug AS _BYTE
COMMON SHARED Tooltip_Mouse AS _BYTE
COMMON SHARED Tooltip_Mouse_Active AS _BYTE
COMMON SHARED q AS INTEGER
COMMON SHARED Timer_Failed AS _BYTE
COMMON SHARED Timer_Failed1 AS _BYTE
COMMON SHARED Timer_Failed2 AS _BYTE
COMMON SHARED MediaSource1 AS STRING
COMMON SHARED MediaSource2 AS STRING
COMMON SHARED MediaSource1Time AS LONG
COMMON SHARED MediaSource2Time AS LONG
COMMON SHARED MediaSource1TimeMS AS LONG
COMMON SHARED MediaSource2TimeMS AS LONG
COMMON SHARED MediaSource1TimeMSOffset AS LONG
COMMON SHARED MediaSource2TimeMSOffset AS LONG
COMMON SHARED MediaSourceTimeMSOffsetDisplay AS LONG
COMMON SHARED MediaSource2TimeMSOffsetDisplay AS LONG
COMMON SHARED MediaSource1TimeLog AS LONG
COMMON SHARED MediaSource2TimeLog AS LONG
COMMON SHARED MediaSourceTimeLB AS LONG
COMMON SHARED c34 AS STRING
COMMON SHARED ErrorTestRunOnce AS INTEGER
COMMON SHARED ErrorTestVal AS INTEGER
COMMON SHARED Error_Exit AS INTEGER
COMMON SHARED Test_Pass_9 AS INTEGER
COMMON SHARED Test_Pass_9_Value AS STRING
COMMON SHARED Test_Pass_10 AS INTEGER
COMMON SHARED Test_Pass_10_Value AS STRING
COMMON SHARED ConnectionsLog AS INTEGER
COMMON SHARED ConnectionsLog1Count AS INTEGER
COMMON SHARED ConnectionsLog2Count AS INTEGER
COMMON SHARED CooldownLog AS INTEGER
COMMON SHARED CooldownLogTotal AS INTEGER
COMMON SHARED CooldownStartup AS INTEGER
COMMON SHARED CooldownActive AS INTEGER
COMMON SHARED CooldownDuration AS INTEGER
COMMON SHARED SceneLBActive AS INTEGER
COMMON SHARED SceneLBActive_Temp_Disable AS INTEGER
COMMON SHARED SceneLBActive_Temp_Disable_Display AS STRING
COMMON SHARED srt_warmup_LB AS _BYTE
COMMON SHARED Scene2LBInactive AS INTEGER
COMMON SHARED CMD_EXE AS STRING
COMMON SHARED CMD_EXE_FAST AS STRING

COMMON SHARED tFileFound AS DOUBLE
COMMON SHARED SettingsMissing AS _BYTE
COMMON SHARED tmpFileError AS _BYTE
COMMON SHARED tmpFileRestore AS _BYTE
COMMON SHARED t1 AS SINGLE
COMMON SHARED LBR_Delay AS INTEGER
COMMON SHARED LBR_Delay_Minus AS INTEGER
COMMON SHARED LBR_Delay_Plus AS INTEGER
COMMON SHARED LBR_Delay_Total AS INTEGER
COMMON SHARED Scene_LBR_Delay_Total AS STRING
COMMON SHARED LoopySRTMonitorTheme AS STRING
COMMON SHARED Theme_C1 AS LONG
COMMON SHARED Theme_C2 AS LONG
COMMON SHARED Allow_Resize AS STRING
COMMON SHARED js_Encoding AS STRING
COMMON SHARED Debug_Temp AS STRING
COMMON SHARED Deny_Ping AS STRING
COMMON SHARED Leading_Zero AS STRING

' RIST mode
COMMON SHARED RIST_Fail_Mode_1 AS STRING
COMMON SHARED RIST_Fail_Mode_2 AS STRING
COMMON SHARED RIST_MediaSource1Time AS DOUBLE
COMMON SHARED RIST_MediaSource1Time_Count AS DOUBLE
COMMON SHARED RIST_MediaSource2Time AS DOUBLE
COMMON SHARED RIST_MediaSource2Time_Count AS DOUBLE

' SRT Live Server
COMMON SHARED SLS_1_Enabled AS STRING ' SLS1Enabled=true
COMMON SHARED SLS_2_Enabled AS STRING ' SLS2Enabled=true
COMMON SHARED SLS_Server_IP AS STRING ' ServerIP=127.0.0.1
COMMON SHARED SLS_Server_Port AS STRING ' ServerPort=8181
COMMON SHARED SLS_Stats AS STRING ' ServerStats=stats
COMMON SHARED SLS_Publisher1 AS STRING ' ServerPublisher1=live/stream/stream1
COMMON SHARED SLS_Publisher2 AS STRING ' ServerPublisher1=live/stream/stream2
COMMON SHARED SLS_BitrateLow1 AS SINGLE ' BitrateLow1=800
COMMON SHARED SLS_BitrateLow2 AS SINGLE ' BitrateLow2=800
COMMON SHARED SLS_BitrateFail1 AS SINGLE ' BitratFail1=400
COMMON SHARED SLS_BitrateFail2 AS SINGLE ' BitrateFail2=400
COMMON SHARED SLS_Ping1 AS DOUBLE
COMMON SHARED SLS_Ping2 AS DOUBLE
COMMON SHARED SLS_PingOut AS DOUBLE
COMMON SHARED SLS_Port_Client AS STRING
COMMON SHARED SLS_EOL AS STRING
COMMON SHARED SLS_Header AS STRING
COMMON SHARED SLS_Timer_GET AS SINGLE
COMMON SHARED SLS_GET_a AS STRING
COMMON SHARED SLS_GET_a2 AS STRING
COMMON SHARED SLS_GET_i AS SINGLE
COMMON SHARED SLS_GET_i2 AS SINGLE
COMMON SHARED SLS_GET_i3 AS SINGLE
COMMON SHARED SLS_GET_l AS SINGLE
COMMON SHARED SLS_GET_d AS STRING
COMMON SHARED SLS_Bitrate1 AS SINGLE
COMMON SHARED SLS_Bitrate2 AS SINGLE
COMMON SHARED sls_client AS SINGLE
COMMON SHARED sls_stats.xml AS STRING
COMMON SHARED SLS_streams_seek AS INTEGER
COMMON SHARED SLS_streams_found AS INTEGER
COMMON SHARED SLS_Uptime1 AS INTEGER
COMMON SHARED SLS_Uptime2 AS INTEGER
COMMON SHARED SLS_Active AS _BYTE
COMMON SHARED SLS_Kbps_Precision AS STRING

' obs-websocket-http
DIM SHARED i_JSON
DIM SHARED JSON AS STRING
REDIM SHARED JSON_Multi(10) AS STRING
COMMON SHARED HTTP_Bind_Port AS STRING
COMMON SHARED HTTP_Access AS STRING
COMMON SHARED HTTP_Bind_Address AS STRING
COMMON SHARED HTTP_Auth_Key AS STRING
COMMON SHARED HTTP_Enabled AS STRING
COMMON SHARED HTTP_File AS STRING
COMMON SHARED http_media2_File AS STRING

' obs-websocket-http CMD
COMMON SHARED CMD_EXE_HTTP AS STRING
COMMON SHARED CMD_EXE_HTTP_FAST AS STRING
COMMON SHARED CMD_EXE_HTTP_FAST_GET_SCENE AS STRING
COMMON SHARED CMD_EXE_HTTP_FAST_GET_MEDIA1 AS STRING
COMMON SHARED CMD_EXE_HTTP_GET_SCENE AS STRING
COMMON SHARED CMD_EXE_HTTP_GET_MEDIA1 AS STRING
COMMON SHARED CMD_EXE_HTTP_GET_MEDIA2 AS STRING

COMMON SHARED Scene_OK AS STRING
COMMON SHARED Scene_LBR AS STRING
COMMON SHARED Scene_LBR_Enabled AS STRING
COMMON SHARED Scene2_LBR_Disabled AS STRING
COMMON SHARED NodejsFileSystem AS STRING
COMMON SHARED Nodejs_Access AS STRING
COMMON SHARED Scene_Fail AS STRING
COMMON SHARED Scene_Intro AS STRING
COMMON SHARED Scene_Bypass AS STRING
COMMON SHARED Scene_Bypass_2 AS STRING
COMMON SHARED Scene_Bypass_3 AS STRING
COMMON SHARED Scene_Bypass_4 AS STRING
COMMON SHARED Scene_Bypass_5 AS STRING
COMMON SHARED Scene_Bypass_6 AS STRING
COMMON SHARED Scene_Bypass_7 AS STRING
COMMON SHARED Scene_Bypass_8 AS STRING
COMMON SHARED Scene_Bypass_9 AS STRING
COMMON SHARED Scene_Bypass_Check AS STRING
COMMON SHARED Scene_Bypass_Log AS INTEGER
COMMON SHARED OBS_URL AS STRING
COMMON SHARED OBS_PW AS STRING
COMMON SHARED OBS_Connection AS STRING
COMMON SHARED titleScene1 AS STRING
COMMON SHARED titleScene2 AS STRING
COMMON SHARED titleScene12 AS STRING
COMMON SHARED titleScene1Temp AS STRING
COMMON SHARED titleScene2Temp AS STRING
COMMON SHARED titleScene12Temp AS STRING
COMMON SHARED returnPreviousScene AS STRING
COMMON SHARED shell_cmd_1 AS STRING
COMMON SHARED shell_cmd_2 AS STRING
COMMON SHARED ConnectionsLog_Check AS STRING
COMMON SHARED segment_LBR AS _BYTE

COMMON SHARED config_dir AS STRING
COMMON SHARED nodejs_dir AS STRING
COMMON SHARED temp_dir AS STRING
COMMON SHARED config_main AS STRING
COMMON SHARED obs_change_scene AS STRING
COMMON SHARED obs_get_scene AS STRING
COMMON SHARED obs_get_scene_list AS STRING
COMMON SHARED obs_get_media1 AS STRING
COMMON SHARED obs_get_media1_scene AS STRING
COMMON SHARED obs_get_media2 AS STRING
COMMON SHARED obs_get_media2_scene AS STRING
COMMON SHARED obs_check_websocket AS STRING
COMMON SHARED websocketOK AS _BYTE
COMMON SHARED websocketVersion AS _BYTE
COMMON SHARED checkWebSocketVersion AS STRING
COMMON SHARED filePrevious AS STRING
COMMON SHARED filePrevious_ms AS STRING
COMMON SHARED fileCheckVersion AS STRING

' Forward slash file location
COMMON SHARED s AS STRING
COMMON SHARED sr AS STRING
COMMON SHARED sreplace AS STRING
COMMON SHARED new AS STRING
COMMON SHARED strReplace AS STRING
COMMON SHARED p AS LONG
COMMON SHARED filePrevious_fs AS STRING
COMMON SHARED filePrevious_ms_fs AS STRING

COMMON SHARED Exe_OK AS _BYTE
COMMON SHARED Exe_Fail AS _BYTE
COMMON SHARED Exe_Fail_First AS _BYTE
COMMON SHARED Exe_Fail_First_Stream1 AS _BYTE
COMMON SHARED Exe_Fail_First_Stream2 AS _BYTE

' Fail icon
COMMON SHARED iconStatus AS LONG

' Timer01
COMMON SHARED mouseX AS INTEGER
COMMON SHARED mouseY AS INTEGER
COMMON SHARED Timer_Fail AS INTEGER
COMMON SHARED Timer_Fail_Count AS INTEGER
COMMON SHARED Timer_Fail_Count1 AS INTEGER
COMMON SHARED Timer_Fail_Count2 AS INTEGER
COMMON SHARED Timer_Fail_Stream1 AS INTEGER
COMMON SHARED Timer_Fail_Stream2 AS INTEGER
COMMON SHARED Timer_Fail_Output1 AS INTEGER
COMMON SHARED Timer_Fail_Output2 AS INTEGER
COMMON SHARED Timer_Fail_Output1_Str AS STRING
COMMON SHARED Timer_Fail_Output2_Str AS STRING
COMMON SHARED FullScreen AS _BYTE
COMMON SHARED BG AS LONG
COMMON SHARED srt_warmup AS _BYTE
COMMON SHARED srt_warmup_file_media AS _BYTE
COMMON SHARED srt_warmup_file_scene AS _BYTE
COMMON SHARED td_update AS DOUBLE
COMMON SHARED timer1 AS DOUBLE
COMMON SHARED Debug_Timer AS DOUBLE
COMMON SHARED __returnPreviousScene AS _BYTE
COMMON SHARED __returnPreviousSceneRemember AS _BYTE
COMMON SHARED __MultiCameraSwitch AS _BYTE
COMMON SHARED returnPreviousSceneTime AS _BYTE
COMMON SHARED SRR AS _BYTE
COMMON SHARED returnFirstCheck AS INTEGER
COMMON SHARED App_Refresh AS _BYTE
COMMON SHARED NoKill AS INTEGER
COMMON SHARED file90 AS STRING
COMMON SHARED file92 AS STRING
COMMON SHARED file96 AS STRING
COMMON SHARED streamsUp AS STRING
COMMON SHARED previousScene AS STRING
COMMON SHARED previousSceneDisplay AS STRING
COMMON SHARED tPing1 AS DOUBLE
COMMON SHARED network_client AS SINGLE
COMMON SHARED tPing2 AS DOUBLE
COMMON SHARED tPingOut AS DOUBLE
COMMON SHARED tIPPing1 AS DOUBLE
COMMON SHARED tIPPing2 AS DOUBLE
COMMON SHARED tIPPingOut AS DOUBLE
COMMON SHARED tPingTimer AS INTEGER
COMMON SHARED Stream_Fail_Delay AS INTEGER
COMMON SHARED SD AS INTEGER
COMMON SHARED Scene_Current AS STRING
COMMON SHARED lastStreamUp AS STRING
COMMON SHARED Timer_Fail_First AS INTEGER
COMMON SHARED Timer_Fail_First_Stream1 AS INTEGER
COMMON SHARED Timer_Fail_First_Stream2 AS INTEGER
COMMON SHARED td_display AS DOUBLE

' UNDOCUMENTED
COMMON SHARED MediaSourceTime AS STRING
COMMON SHARED CooldownTotal AS STRING
COMMON SHARED ForceDebugOnStartup AS STRING

' Misc
COMMON SHARED file4_var AS STRING
COMMON SHARED file4_val AS STRING
COMMON SHARED BSOD AS LONG
COMMON SHARED AlwaysOnTop AS INTEGER
COMMON SHARED Answer AS INTEGER
COMMON SHARED NULL AS INTEGER

' OnLoad
COMMON SHARED Desktop_Width_Position AS INTEGER
COMMON SHARED Desktop_Height_Position AS INTEGER
COMMON SHARED file4 AS STRING
COMMON SHARED EqualFound AS INTEGER
COMMON SHARED MultiCameraSwitch AS STRING
COMMON SHARED returnPreviousSceneRemember AS STRING

' SUB TIMEms
COMMON SHARED tout1#
COMMON SHARED tout2#
COMMON SHARED toutint#
COMMON SHARED toutdec#
COMMON SHARED plus

' SUB calcbw
COMMON SHARED bout
COMMON SHARED bout2#
COMMON SHARED bout#
COMMON SHARED boutnodec
COMMON SHARED bits
COMMON SHARED boutint#
COMMON SHARED boutm$
COMMON SHARED boutdec#
COMMON SHARED boutdec$

' FUNC calc_srt$
COMMON SHARED calc_srt_sec$
COMMON SHARED calc_srt_hr_min$
COMMON SHARED convertTime#
COMMON SHARED includeSec
COMMON SHARED leadingZero
COMMON SHARED t_hr
COMMON SHARED t_min
COMMON SHARED t_sec

COMMON SHARED RED_WARNING AS _UNSIGNED LONG
COMMON SHARED RED_FAIL AS _UNSIGNED LONG
COMMON SHARED GREEN_OK AS _UNSIGNED LONG
COMMON SHARED GREEN_SCENE_OK AS _UNSIGNED LONG
COMMON SHARED GREEN_STREAM_OK AS _UNSIGNED LONG

' Linux only
COMMON SHARED DIR_documents AS STRING
COMMON SHARED OS AS STRING

' Always on top
DIM SHARED Myhwnd AS LONG
$IF WIN THEN
    DIM SHARED y& ' Windows only
$END IF

' Set variables on load: ---------------------------------------------------------------
' Linux only
IF MID$(_OS$, 2, 5) = "LINUX" THEN OS = "LINUX" ELSE OS = "WINDOWS"
DIR_documents = _CWD$

' Set OS variables
IF OS = "LINUX" THEN s = "/" ELSE s = "\"

' Darker text in light mode for improved visibility
IF INSTR(COMMAND$, "-light") = 0 THEN
    RED_WARNING = _RGB32(160, 64, 48)
    RED_FAIL = _RGB32(255, 48, 32)
    GREEN_OK = _RGB32(120, 192, 164)
    GREEN_SCENE_OK = _RGB32(155, 255, 240)
    GREEN_STREAM_OK = _RGB32(64, 252, 48)
ELSE
    RED_WARNING = _RGB32(192, 60, 28)
    RED_FAIL = _RGB32(240, 28, 12)
    GREEN_OK = _RGB32(80, 118, 120)
    GREEN_SCENE_OK = _RGB32(64, 128, 120)
    GREEN_STREAM_OK = _RGB32(32, 164, 24)
END IF

q = _EXIT
c34 = CHR$(34)
BG = _RGB(32, 32, 32)
Exe_OK = 1
websocketVersion = 5
checkWebSocketVersion = "unknown"
websocketOK = 0
srt_warmup_LB = 10
' SRT Live Server
SLS_Stats = "stats"
SLS_Server_Port = "8181" ' Temp setting - config.ini should override
SLS_Server_IP = "127.0.0.1" ' Temp setting - config.ini should override
SLS_Port_Client = "TCP/IP:" + SLS_Server_Port + ":"
SLS_Publisher1 = "live/stream/stream1" ' Temp setting - config.ini should override
SLS_Publisher2 = "live/stream/stream2" ' Temp setting - config.ini should override
SLS_EOL = CHR$(13) + CHR$(10)
' ---------------------------------------------------------------

' Error handling when enabled takes place here
App_Fail:
IF ERR THEN CLS: _PRINTSTRING (20, 30), "ERR, _ERRORLINE:" + STR$(ERR) + "," + STR$(_ERRORLINE): _AUTODISPLAY: _DELAY 3: IF App_Refresh = 1 THEN App_Refresh = 0: Refresh_Request = 1: RESUME NEXT ELSE RESUME NEXT
' Added after InForm entry - END

': External modules: ---------------------------------------------------------------
'$INCLUDE:'InForm\InForm.bi'
'$INCLUDE:'InForm\xp.uitheme'
'$INCLUDE:'loopy_srt_monitor.frm'

': Event procedures: ---------------------------------------------------------------
'$INCLUDE:'loopy_srt_monitor_light.frm'
'$INCLUDE:'image.png.MEM'
SUB __UI_BeforeInit
    $VERSIONINFO:CompanyName=loopy750
    $VERSIONINFO:ProductName=Loopy SRT Monitor
    $VERSIONINFO:Comments=Monitor SRT Streams
    $VERSIONINFO:FileDescription=Loopy SRT Monitor
    $VERSIONINFO:FILEVERSION#=0,9,6,0
    $VERSIONINFO:ProductVersion=0,9,6,0
    $VERSIONINFO:LegalCopyright=loopy750
    $VERSIONINFO:OriginalFilename=loopy_srt_monitor.exe
    $CHECKING:ON

    IF ERR = 0 THEN
        ' $EXEICON moved but still parsed on launch
        _TITLE "Loopy SRT Monitor - loopy750"
    END IF
    Ver = "0.9.5.1"
    VerBeta = "0.9.6"
    VerDate = "06/22"
    VerPortable = "false"
END SUB

SUB __UI_OnLoad
    ' Always on top: ------------------------------------------------------------------
    ' Windows only
    $IF WIN THEN
        DECLARE DYNAMIC LIBRARY "user32"
            FUNCTION SetWindowPos& (BYVAL hWnd AS LONG, BYVAL hWndInsertAfter AS _OFFSET, BYVAL X AS INTEGER, BYVAL Y AS INTEGER, BYVAL cx AS INTEGER, BYVAL cy AS INTEGER, BYVAL uFlags AS _OFFSET)
        END DECLARE
    $END IF

    Myhwnd = _WINDOWHANDLE
    ' ----------------------------------------------------------------------------------

    ' Update display: ---------------------------------------------------------------
    SetCaption Timer_FailLB, "-"
    SetCaption Timer_Fail_CountLB, "-"
    SetCaption Timer_Fail_Count_2LB, "-"
    SetCaption tPingOutLB, "-"
    SetCaption tIPPingOutLB, "-"
    SetCaption td_updateLB, "-"
    ' Settings
    SetCaption Stream_Fail_DelayLB, "-"
    SetCaption MultiCameraSwitchStatusLB, "-"
    ' Stream #1
    SetCaption Uptime_Stream_1LB, "-"
    SetCaption Timer_Fail_Stream1LB, "-"
    ' Stream #2
    SetCaption Uptime_Stream_2LB, "-"
    SetCaption Timer_Fail_Stream2LB, "-"
    ' Current Scene
    SetCaption Scene_CurrentLB, "-"
    ' Low bitrate multiple cameras
    SetCaption Low_Bitrate_StatusLB, "-"
    ' Debug
    SetCaption Debug_TimerLB, "-"
    SetCaption Debug_Timer_SnapshotLB, "-"
    SetCaption td_displayLB, "-"
    SetCaption mouseXLB, "-"
    SetCaption mouseYLB, "-"
    SetCaption __ERRORLINELB, "-"
    ' Debug titles
    SetCaption TimerLB, "-"
    SetCaption TimerSnapshotLB, "-"
    SetCaption td_displayLB2, "-"
    SetCaption mouseXLB2, "-"
    SetCaption mouseYLB2, "-"
    SetCaption __ERRORLINELB2, "-"
    ' Stream #1 only
    SetCaption Stream_UptimeLB, "-"
    SetCaption Stream_Fail_TimerLB, "-"
    ' ---------------------------------------------------------------

    ' File variables: ---------------------------------------------------------------
    ' Set OS variables
    SELECT CASE OS
        CASE "WINDOWS"
            config_dir = _DIR$("documents") + "Loopy SRT Monitor"
            nodejs_dir = _DIR$("documents") + "Loopy SRT Monitor\js"
            temp_dir = _DIR$("documents") + "Loopy SRT Monitor\Temp"
        CASE "LINUX"
            config_dir = DIR_documents + ""
            nodejs_dir = DIR_documents + "/js"
            temp_dir = DIR_documents + "/Temp"
    END SELECT
    IF OS = "WINDOWS" AND VerPortable = "true" THEN
        config_dir = DIR_documents + ""
        nodejs_dir = DIR_documents + "\js"
        temp_dir = DIR_documents + "\Temp"
    END IF
    config_main = config_dir + s + "config.ini"
    obs_change_scene = config_dir + s + "js" + s + "obs_change_scene.mjs" ' 5.x
    obs_get_scene = config_dir + s + "js" + s + "obs_get_scene.mjs"
    obs_get_scene_list = config_dir + s + "js" + s + "obs_get_scene_list.mjs"
    obs_get_media1 = config_dir + s + "js" + s + "obs_get_media1.mjs"
    obs_get_media1_scene = config_dir + s + "js" + s + "obs_get_media1_scene.mjs"
    obs_get_media2 = config_dir + s + "js" + s + "obs_get_media2.mjs"
    obs_get_media2_scene = config_dir + s + "js" + s + "obs_get_media2_scene.mjs"
    obs_check_websocket = config_dir + s + "js" + s + "obs_check_websocket.mjs"
    filePrevious = temp_dir + s + "returnPreviousScene.tmp"
    filePrevious_ms = temp_dir + s + "returnPreviousSource.tmp"
    fileCheckVersion = temp_dir + s + "checkversion.txt"
    outputBitrateFile = temp_dir + s + "outputBitrate.txt"
    outputStatusFile = temp_dir + s + "outputStatus.txt"
    outputConnectionsLogFile = temp_dir + s + "outputConnections.log"
    outputKbpsFile1 = temp_dir + s + "_Kbps1.txt"
    outputKbpsFile2 = temp_dir + s + "_Kbps2.txt"
    http_media2_File = temp_dir + s + "http_get_media2.cmd"
    outputLB1 = config_dir + s + "outputLB1."
    outputLB2 = config_dir + s + "outputLB2."
    outputLB_Temp1 = config_dir + s + "_outputLB1."
    outputLB_Temp2 = config_dir + s + "_outputLB2."
    ' ---------------------------------------------------------------

    ' Convert forward slash to backslash for filePrevious_fs
    sreplace$ = "\"
    new$ = "/"
    sr$ = filePrevious
    strReplace$ = sr$
    p = INSTR(sr$, sreplace$)
    WHILE p
        strReplace$ = MID$(strReplace$, 1, p - 1) + new$ + MID$(strReplace$, p + LEN(sreplace$))
        p = INSTR(p + LEN(new$), strReplace$, sreplace$)
    WEND
    filePrevious_fs = strReplace$

    ' Convert forward slash to backslash for filePrevious_ms_fs
    sr$ = filePrevious_ms
    strReplace$ = sr$
    p = INSTR(sr$, sreplace$)
    WHILE p
        strReplace$ = MID$(strReplace$, 1, p - 1) + new$ + MID$(strReplace$, p + LEN(sreplace$))
        p = INSTR(p + LEN(new$), strReplace$, sreplace$)
    WEND
    filePrevious_ms_fs = strReplace$

    ON ERROR GOTO App_Fail
    _DELAY 0.05
    IF VerBeta <> "" THEN _TITLE "Loopy SRT Monitor v" + VerBeta + "beta" ELSE _TITLE "Loopy SRT Monitor v" + Ver
    IF _DIREXISTS(config_dir) THEN IF NOT _DIREXISTS(temp_dir) THEN MKDIR temp_dir
    IF _FILEEXISTS(filePrevious) THEN KILL filePrevious
    IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
    ON ERROR GOTO 0
    _ALLOWFULLSCREEN OFF
    RANDOMIZE TIMER
    ErrorTestRunOnce = 1

    ' Set font for error screen
    ON ERROR GOTO App_Fail
    ' Set OS variables
    SELECT CASE OS
        CASE "WINDOWS"
            IF _FILEEXISTS(ENVIRON$("SYSTEMROOT") + "\fonts\seguisb.ttf") THEN _FONT _LOADFONT(ENVIRON$("SYSTEMROOT") + "\fonts\seguisb.ttf", 12)
        CASE "LINUX"
            IF _FILEEXISTS("seguisb.ttf") THEN _FONT _LOADFONT("seguisb.ttf", 12)
    END SELECT
    ON ERROR GOTO 0

    ' Perform tests before program can continue: ---------------------------------------------------------------
    ' Check config
    ' Test #2
    IF ErrorTestRunOnce = 1 THEN
        IF NOT _FILEEXISTS(config_main) THEN
            Error_msg = "- Unable to read config file in the " + c34 + "Documents\Loopy SRT Monitor" + c34 + " folder" + CHR$(10) + "- File " + c34 + config_main + c34 + " cannot be found."
            ErrorDisplay (2)
        END IF
    END IF

    Stream_Fail_Delay = 10
    IF NOT _FILEEXISTS(config_main) THEN RefreshDisplayRequest = 1: Error_msg = "- Unable to read config file in the " + c34 + "Documents\Loopy SRT Monitor" + c34 + " folder" + CHR$(10) + "- File " + c34 + config_main + c34 + " cannot be accessed, check if it exists. (Error: #1)": _DELAY 3
    IF _FILEEXISTS(config_main) THEN
        OPEN config_main FOR INPUT AS #4 ' Basic INI management, nothing fancy needed
        IF EOF(4) THEN RefreshDisplayRequest = 1: Error_msg = "- Unable to read config file in the " + c34 + "Documents\Loopy SRT Monitor" + c34 + " folder" + CHR$(10) + "- File " + c34 + config_main + c34 + " cannot be accessed, check if it exists. (Error: #10)": _DELAY 3
        DO
            IF NOT EOF(4) THEN LINE INPUT #4, file4
            IF LEFT$(file4, 1) <> "#" AND LEFT$(file4, 1) <> ";" AND LEFT$(file4, 1) <> "" THEN
                EqualFound = INSTR(file4, "=")
                IF EqualFound THEN
                    file4_var$ = LEFT$(file4, INSTR(file4, "=") - 1)
                    file4_val$ = MID$(file4, INSTR(file4, "=") + 1)
                    file4_var$ = LCASE$(file4_var$)
                    IF file4_var$ = "streamfaildelay" THEN Stream_Fail_Delay = VAL(file4_val$)
                    IF file4_var$ = "xwindow" THEN Desktop_Width_Position = VAL(file4_val$)
                    IF file4_var$ = "ywindow" THEN Desktop_Height_Position = VAL(file4_val$)
                    IF file4_var$ = "xwindowposition" THEN Desktop_Width_Position = VAL(file4_val$)
                    IF file4_var$ = "ywindowposition" THEN Desktop_Height_Position = VAL(file4_val$)
                    IF file4_var$ = "sceneok" THEN Scene_OK = file4_val$
                    IF file4_var$ = "scenefail" THEN Scene_Fail = file4_val$
                    IF file4_var$ = "sceneintro" THEN Scene_Intro = file4_val$
                    IF file4_var$ = "scenebypass" THEN Scene_Bypass = file4_val$
                    IF file4_var$ = "scenebypass2" THEN Scene_Bypass_2 = file4_val$
                    IF file4_var$ = "scenebypass3" THEN Scene_Bypass_3 = file4_val$
                    IF file4_var$ = "scenebypass4" THEN Scene_Bypass_4 = file4_val$
                    IF file4_var$ = "scenebypass5" THEN Scene_Bypass_5 = file4_val$
                    IF file4_var$ = "scenebypass6" THEN Scene_Bypass_6 = file4_val$
                    IF file4_var$ = "scenebypass7" THEN Scene_Bypass_7 = file4_val$
                    IF file4_var$ = "scenebypass8" THEN Scene_Bypass_8 = file4_val$
                    IF file4_var$ = "scenebypass9" THEN Scene_Bypass_9 = file4_val$
                    IF file4_var$ = "mediasource1" THEN MediaSource1 = file4_val$
                    IF file4_var$ = "mediasource2" THEN MediaSource2 = file4_val$
                    IF file4_var$ = "websocketaddress" THEN OBS_URL = file4_val$
                    IF file4_var$ = "websocketpassword" THEN OBS_PW = file4_val$
                    IF file4_var$ = "websocketconnection" THEN OBS_Connection = file4_val$
                    IF file4_var$ = "filestatusoutput" THEN FileStatusOutput = file4_val$
                    IF file4_var$ = "connectionslog" THEN ConnectionsLog_Check = file4_val$
                    IF file4_var$ = "scenelbrenabled" THEN Scene_LBR_Enabled = file4_val$
                    IF file4_var$ = "scenelbrdelay" THEN Scene_LBR_Delay_Total = file4_val$
                    IF file4_var$ = "scene2lbrdisabled" THEN Scene2_LBR_Disabled = file4_val$
                    IF file4_var$ = "nodejsfilesystem" THEN NodejsFileSystem = file4_val$
                    IF file4_var$ = "nodejsaccess" THEN Nodejs_Access = file4_val$
                    IF file4_var$ = "ristfailmode1" THEN RIST_Fail_Mode_1 = file4_val$ ' RIST mode
                    IF file4_var$ = "ristfailmode2" THEN RIST_Fail_Mode_2 = file4_val$ ' RIST mode - Source 2
                    IF file4_var$ = "jsencoding" THEN js_Encoding = file4_val$
                    IF file4_var$ = "colortheme" THEN LoopySRTMonitorTheme = file4_val$
                    IF file4_var$ = "allowresize" THEN Allow_Resize = file4_val$
                    IF file4_var$ = "checkupdateonstartup" THEN CheckUpdateOnStartup = file4_val$
                    IF file4_var$ = "multicameraswitch" THEN MultiCameraSwitch = file4_val$
                    IF file4_var$ = "titlescene1" THEN titleScene1 = file4_val$
                    IF file4_var$ = "titlescene2" THEN titleScene2 = file4_val$
                    IF file4_var$ = "titlescene12" THEN titleScene12 = file4_val$
                    IF file4_var$ = "returnpreviousscene" THEN returnPreviousScene = file4_val$
                    IF file4_var$ = "returnprevioussceneremember" THEN returnPreviousSceneRemember = file4_val$
                    ' obs-websocket-http
                    IF file4_var$ = "httpbindaddress" THEN HTTP_Bind_Address = file4_val$
                    IF file4_var$ = "httpbindport" THEN HTTP_Bind_Port = file4_val$
                    IF file4_var$ = "httpauthkey" THEN HTTP_Auth_Key = LEFT$(file4_val$, 256)
                    IF file4_var$ = "httpaccess" THEN HTTP_Access = file4_val$
                    ' SRT Live server
                    IF file4_var$ = "sls1enabled" THEN SLS_1_Enabled = file4_val$
                    IF file4_var$ = "sls2enabled" THEN SLS_2_Enabled = file4_val$
                    IF file4_var$ = "slsserverip" THEN SLS_Server_IP = file4_val$
                    IF file4_var$ = "slsserverport" THEN SLS_Server_Port = file4_val$
                    IF file4_var$ = "slsserverstats" THEN SLS_Stats = file4_val$
                    IF file4_var$ = "slsserverpublisher1" THEN SLS_Publisher1 = file4_val$
                    IF file4_var$ = "slsserverpublisher2" THEN SLS_Publisher2 = file4_val$
                    IF file4_var$ = "slsbitratelow1" THEN SLS_BitrateLow1 = VAL(file4_val$)
                    IF file4_var$ = "slsbitratelow2" THEN SLS_BitrateLow2 = VAL(file4_val$)
                    IF file4_var$ = "slsbitratefail1" THEN SLS_BitrateFail1 = VAL(file4_val$)
                    IF file4_var$ = "slsbitratefail2" THEN SLS_BitrateFail2 = VAL(file4_val$)
                    ' UNDOCUMENTED
                    IF file4_var$ = "mediasourcetime" THEN MediaSourceTime = file4_val$
                    IF file4_var$ = "cooldowntotal" THEN CooldownTotal = file4_val$
                    IF file4_var$ = "forcedebugonstartup" THEN ForceDebugOnStartup = file4_val$
                    IF file4_var$ = "debugtemp" THEN Debug_Temp = file4_val$ ' For coding only
                    IF file4_var$ = "denyping" THEN Deny_Ping = file4_val$
                    IF file4_var$ = "kbpsprecision" THEN SLS_Kbps_Precision = file4_val$
                    IF file4_var$ = "leadingzero" THEN Leading_Zero = file4_val$
                END IF
            END IF
        LOOP UNTIL EOF(4)
        CLOSE #4

        ' obs-websocket-http by default
        HTTP_Enabled = "true"
        IF OBS_Connection = "http" THEN HTTP_Enabled = "true"
        IF OBS_Connection = "js" THEN HTTP_Enabled = "false"

        IF HTTP_Enabled = "true" THEN SetCaption ServerPingLB, "HTTP Ping" ELSE HTTP_Enabled = "false" ' HTTP
        IF HTTP_Enabled = "true" AND NodejsFileSystem = "2" THEN NodejsFileSystem = "1" ' HTTP
        ' Automatically open obs-websocket-http if it's located in the folder
        IF HTTP_Enabled = "true" THEN
            IF _FILEEXISTS(config_dir + "\obs-websocket-http-v1-Windows.exe") THEN HTTP_File = config_dir + "\obs-websocket-http-v1-Windows.exe"
            IF _FILEEXISTS(config_dir + "\obs-websocket-http-Windows.exe") THEN HTTP_File = config_dir + "\obs-websocket-http-Windows.exe"
            IF _FILEEXISTS(config_dir + "\obs-websocket-http.exe") THEN HTTP_File = config_dir + "\obs-websocket-http.exe"
            IF OS = "WINDOWS" AND _FILEEXISTS(HTTP_File) THEN SHELL _DONTWAIT "%ComSpec% /C START " + c34 + c34 + " /MIN " + c34 + HTTP_File + c34 + " --ws_url ws://" + OBS_URL + " --ws_password " + OBS_PW
        END IF


        IF HTTP_Enabled = "false" THEN

            ' Test #1
            IF ErrorTestRunOnce = 1 THEN
                IF NOT _DIREXISTS(nodejs_dir) THEN
                    Error_msg = "- Folder " + c34 + nodejs_dir + c34 + " cannot be accessed, check if it exists."
                    ErrorDisplay (1)
                END IF
            END IF

            ' Test #3
            IF ErrorTestRunOnce = 1 THEN
                ' Set OS variables
                SELECT CASE OS
                    CASE "WINDOWS"
                        IF NOT _DIREXISTS(nodejs_dir + "\node_modules\obs-websocket-js") AND NOT _DIREXISTS(nodejs_dir + "\obs-websocket-js") THEN
                            Error_msg = "- " + c34 + "obs-websocket-js" + c34 + " not found, check if it exists in " + c34 + "\js\node_modules\obs-websocket-js" + c34 + " folder." + CHR$(10) + "- Install node.js from https://nodejs.org/ and then run install.cmd in the settings folder."
                            ErrorDisplay (3)
                        END IF
                    CASE "LINUX"
                        IF NOT _DIREXISTS(nodejs_dir + "/node_modules/obs-websocket-js") AND NOT _DIREXISTS(nodejs_dir + "/obs-websocket-js") THEN
                            Error_msg = "- " + c34 + "obs-websocket-js" + c34 + " not found, check if it exists in " + c34 + "/js/node_modules/obs-websocket-js" + c34 + " folder." + CHR$(10) + "- Install node.js from Terminal."
                            ErrorDisplay (3)
                        END IF
                END SELECT
            END IF

        END IF

        SELECT CASE ""
            CASE Scene_OK: SettingsMissing = 1
            CASE Scene_Fail: SettingsMissing = 1
            CASE Scene_Intro: SettingsMissing = 1
            CASE Scene_Bypass: SettingsMissing = 1
            CASE OBS_URL: SettingsMissing = 1
            CASE OBS_PW: SettingsMissing = 1
            CASE FileStatusOutput: SettingsMissing = 1
            CASE ConnectionsLog_Check: SettingsMissing = 1
            CASE Scene_LBR_Enabled: SettingsMissing = 1
            CASE Scene_LBR_Delay_Total: SettingsMissing = 1
            CASE Scene2_LBR_Disabled: SettingsMissing = 1
            CASE NodejsFileSystem: SettingsMissing = 1
            CASE RIST_Fail_Mode_1: SettingsMissing = 1 ' RIST mode
            CASE RIST_Fail_Mode_2: SettingsMissing = 1 ' RIST mode - Source 2
            CASE LoopySRTMonitorTheme: SettingsMissing = 1
            CASE Allow_Resize: SettingsMissing = 1
            CASE CheckUpdateOnStartup: SettingsMissing = 1
            CASE MultiCameraSwitch: SettingsMissing = 1
            CASE titleScene1: SettingsMissing = 1
            CASE titleScene2: SettingsMissing = 1
            CASE titleScene12: SettingsMissing = 1
            CASE returnPreviousScene: SettingsMissing = 1
            CASE returnPreviousSceneRemember: SettingsMissing = 1
                ' SRT Live Server
            CASE SLS_1_Enabled: SettingsMissing = 1
            CASE SLS_2_Enabled: SettingsMissing = 1
            CASE SLS_Server_IP: SettingsMissing = 1
            CASE SLS_Server_Port: SettingsMissing = 1
            CASE SLS_Stats: SettingsMissing = 1
            CASE SLS_Publisher1: SettingsMissing = 1
            CASE SLS_Publisher2: SettingsMissing = 1
            CASE STR$(SLS_BitrateLow1): SettingsMissing = 1
            CASE STR$(SLS_BitrateLow2): SettingsMissing = 1
            CASE STR$(SLS_BitrateFail1): SettingsMissing = 1
            CASE STR$(SLS_BitrateFail2): SettingsMissing = 1
        END SELECT

        IF SettingsMissing THEN
            verCheck$ = "Settings missing in 'config.ini' file, check 'readme.txt'..."
            iniFeatures = 1
        END IF

        ' ---------------------------------------------------------------
        'NEW
        '---
        'SceneLBRDelay=0
        'jsEncoding=json
        'RISTFailMode1=false
        'RISTFailMode2=false
        'ColorTheme=Default
        'AllowResize=false
        '
        'UNDOCUMENTED
        '------------
        'MediaSourceTime=800
        'CooldownTotal=8
        'ForceDebugOnStartup=false
        'DebugTemp=false
        'DenyPing=true
        'KbpsPrecision=false
        'LeadingZero=false
        ' ---------------------------------------------------------------

        IF Scene_Bypass = "" THEN Scene_Bypass = "none"
        IF Scene_Bypass_2 = "" THEN Scene_Bypass_2 = "none"
        IF Scene_Bypass_3 = "" THEN Scene_Bypass_3 = "none"
        IF Scene_Bypass_4 = "" THEN Scene_Bypass_4 = "none"
        IF Scene_Bypass_5 = "" THEN Scene_Bypass_5 = "none"
        IF Scene_Bypass_6 = "" THEN Scene_Bypass_6 = "none"
        IF Scene_Bypass_7 = "" THEN Scene_Bypass_7 = "none"
        IF Scene_Bypass_8 = "" THEN Scene_Bypass_8 = "none"
        IF Scene_Bypass_9 = "" THEN Scene_Bypass_9 = "none"

        IF NodejsFileSystem <> "1" AND NodejsFileSystem <> "2" THEN NodejsFileSystem = "0"

        IF NodejsFileSystem = "1" THEN
            ' Console will appear regardless
            $CONSOLE
            _CONSOLE ON
            _CONSOLETITLE "Loopy SRT Monitor [Console]"
        ELSE
            _CONSOLE OFF
        END IF

        IF js_Encoding <> "msgpack" AND js_Encoding <> "json" THEN js_Encoding = "json" ' obs-websocket-js connection encoding
        IF Nodejs_Access <> "legacy" THEN Nodejs_Access = "fast"
        IF Leading_Zero = "true" THEN leadingZero = 1

        ' SRT Live Server
        SLS_Header = ""
        SLS_Header = SLS_Header + "GET /" + SLS_Stats + " HTTP/1.1" + SLS_EOL
        SLS_Header = SLS_Header + "Cache-Control: no-cache" + SLS_EOL
        SLS_Header = SLS_Header + "Pragma: no-cache" + SLS_EOL
        SLS_Header = SLS_Header + "User-Agent: Wget/1.19.1 (linux-gnu)" + SLS_EOL
        SLS_Header = SLS_Header + "Accept: */*" + SLS_EOL
        SLS_Header = SLS_Header + "Accept-Encoding: identity" + SLS_EOL
        SLS_Header = SLS_Header + "Host: " + SLS_Server_IP + ":" + SLS_Server_Port + SLS_EOL
        SLS_Header = SLS_Header + "Connection: Keep-Alive" + SLS_EOL
        SLS_Header = SLS_Header + SLS_EOL

        SLS_Port_Client = "TCP/IP:" + SLS_Server_Port + ":"

        IF MultiCameraSwitch = "true" THEN
            __MultiCameraSwitch = 1
        ELSE
            MultiCameraSwitch = "false"
            __MultiCameraSwitch = 0
        END IF

        IF SLS_1_Enabled <> "true" THEN SLS_1_Enabled = "false": IF SLS_2_Enabled <> "true" THEN SLS_2_Enabled = "false" ' Set true and false
        IF __MultiCameraSwitch = 0 THEN SLS_2_Enabled = "false"
        IF SLS_1_Enabled = "true" OR SLS_2_Enabled = "true" THEN SLS_Active = 1

        ' SRT Live Server
        IF SLS_Active = 1 THEN
            SetCaption IPPingLB, "SLS Ping"
            SetCaption Bitrate_Stream_1LB, "-"
            SetCaption Bitrate_Stream_2LB, "-"
        END IF

        IF SLS_Active = 1 AND __MultiCameraSwitch = 0 THEN
            SetCaption MultiCameraSwitchLB, "Bitrate"
        END IF

        IF SLS_Active = 1 AND __MultiCameraSwitch = 1 AND SLS_1_Enabled = "true" AND SLS_2_Enabled = "false" THEN
            Control(StreamUptimeLB).Top = 254
            Control(Uptime_Stream_1LB).Top = 254
            Control(failLB).Top = 278
            Control(Timer_Fail_Stream1LB).Top = 278
            Control(BitrateLB2).Hidden = True
            Control(Bitrate_Stream_2LB).Hidden = True
        END IF

        IF SLS_Active = 1 AND __MultiCameraSwitch = 1 AND SLS_1_Enabled = "false" AND SLS_2_Enabled = "true" THEN
            Control(StreamUptimeLB2).Top = 254
            Control(Uptime_Stream_2LB).Top = 254
            Control(failLB2).Top = 278
            Control(Timer_Fail_Stream2LB).Top = 278
            Control(BitrateLB).Hidden = True
            Control(Bitrate_Stream_1LB).Hidden = True
        END IF

        IF SLS_Active = 1 AND __MultiCameraSwitch = 1 AND SLS_1_Enabled = "true" AND SLS_2_Enabled = "true" THEN
            Control(StreamUptimeLB).Top = 254
            Control(Uptime_Stream_1LB).Top = 254
            Control(failLB).Top = 278
            Control(Timer_Fail_Stream1LB).Top = 278

            Control(StreamUptimeLB2).Top = 254
            Control(Uptime_Stream_2LB).Top = 254
            Control(failLB2).Top = 278
            Control(Timer_Fail_Stream2LB).Top = 278
        END IF

        IF SLS_Active = 0 OR __MultiCameraSwitch = 0 THEN
            Control(BitrateLB).Hidden = True
            Control(Bitrate_Stream_1LB).Hidden = True
            Control(BitrateLB2).Hidden = True
            Control(Bitrate_Stream_2LB).Hidden = True
        END IF

        Scene_LBR = Scene_OK + " LBR"
        _RESIZE OFF , _SMOOTH
        IF Allow_Resize <> "true" THEN
            Allow_Resize = "false"
            Control(OptionsMenuRestoreWindowSize).Hidden = True
        ELSE
            ' Resize will be enabled regardless
            $RESIZE:SMOOTH
        END IF

        ' Set variables for low bitrate detection
        CooldownStartup = 10
        IF ConnectionsLog_Check = "true" THEN ConnectionsLog = 1 ELSE ConnectionsLog = 0
        CooldownLogTotal = 8
        MediaSourceTimeLB = 800
        LBR_Delay_Total = VAL(Scene_LBR_Delay_Total)
        IF LBR_Delay_Total < 0 THEN LBR_Delay_Total = 0
        IF LBR_Delay_Total > 10 THEN LBR_Delay_Total = 10

        ' UNDOCUMENTED
        IF MediaSourceTime <> "" THEN MediaSourceTimeLB = VAL(MediaSourceTime)
        IF CooldownTotal <> "" THEN CooldownLogTotal = VAL(CooldownTotal)
        IF MediaSourceTimeLB < 100 THEN MediaSourceTimeLB = 100
        IF MediaSourceTimeLB > 950 THEN MediaSourceTimeLB = 950
        IF CooldownLogTotal < 3 THEN CooldownLogTotal = 3
        IF CooldownLogTotal > 15 THEN CooldownLogTotal = 15

        ' Set theme if selected
        IF INSTR(COMMAND$, "-light") = 0 THEN
            LoopySRTMonitorTheme = LCASE$(LoopySRTMonitorTheme)
            IF LoopySRTMonitorTheme = "obs" OR LoopySRTMonitorTheme = "acri1" OR LoopySRTMonitorTheme = "acri2" OR LoopySRTMonitorTheme = "rachni" THEN
                SELECT CASE LoopySRTMonitorTheme
                    CASE "obs"
                        Theme_C1 = _RGB32(58, 57, 58)
                        Theme_C2 = _RGB32(31, 30, 31)
                    CASE "acri1"
                        Theme_C1 = _RGB32(24, 24, 25)
                        Theme_C2 = _RGB32(19, 26, 48)
                        Theme_C2 = _RGB32(24, 24, 25)
                    CASE "acri2"
                        Theme_C1 = _RGB32(24, 24, 25)
                        Theme_C2 = _RGB32(19, 26, 48)
                    CASE "rachni"
                        Theme_C1 = _RGB32(49, 54, 59)
                        Theme_C2 = _RGB32(35, 38, 41)
                END SELECT
                Control(LoopySRTMonitor).BackColor = Theme_C1: Control(StatusLB).BackColor = Theme_C1: Control(IndicatorLB).BackColor = Theme_C1
                Control(FileMenu).BackColor = Theme_C1: Control(OptionsMenu).BackColor = Theme_C1: Control(HelpMenu).BackColor = Theme_C1
                Control(Status).BackColor = Theme_C2: Control(Settings).BackColor = Theme_C2: Control(CurrentScene).BackColor = Theme_C2
                Control(Scene_CurrentLB).BackColor = Theme_C2: Control(PictureBox1).BackColor = Theme_C2: Control(Stream1).BackColor = Theme_C2
                Control(Stream2).BackColor = Theme_C2: Control(versionFrame).BackColor = Theme_C2: Control(DebugFrame).BackColor = Theme_C2
                Control(Timer_FailLB).BackColor = Theme_C2: Control(Timer_Fail_CountLB).BackColor = Theme_C2: Control(tPingOutLB).BackColor = Theme_C2
                Control(td_updateLB).BackColor = Theme_C2: Control(Stream_Fail_DelayLB).BackColor = Theme_C2: Control(MultiCameraSwitchStatusLB).BackColor = Theme_C2
                Control(Debug_TimerLB).BackColor = Theme_C2: Control(Debug_Timer_SnapshotLB).BackColor = Theme_C2: Control(td_displayLB).BackColor = Theme_C2
                Control(mouseXLB).BackColor = Theme_C2: Control(mouseYLB).BackColor = Theme_C2: Control(__ERRORLINELB).BackColor = Theme_C2
                Control(StreamUptimeLB).BackColor = Theme_C2: Control(failLB).BackColor = Theme_C2: Control(Uptime_Stream_1LB).BackColor = Theme_C2
                Control(Timer_Fail_Stream1LB).BackColor = Theme_C2: Control(StreamUptimeLB2).BackColor = Theme_C2: Control(failLB2).BackColor = Theme_C2
                Control(Uptime_Stream_2LB).BackColor = Theme_C2: Control(Timer_Fail_Stream2LB).BackColor = Theme_C2: Control(PictureBoxLogoBottom).BackColor = Theme_C2
                Control(Stream_UptimeLB).BackColor = Theme_C2: Control(Stream_Fail_TimerLB).BackColor = Theme_C2: Control(Timer_Fail_Count_2LB).BackColor = Theme_C2
                Control(tIPPingOutLB).BackColor = Theme_C2: Control(br_countdownLB).BackColor = Theme_C2: Control(ms_playLB).BackColor = Theme_C2
                Control(Low_Bitrate_StatusLB).BackColor = Theme_C2: Control(ms_playLB2).BackColor = Theme_C2: Control(br_delayLB).BackColor = Theme_C2
                Control(DebugFrameTemp).BackColor = Theme_C2: Control(BitrateLB).BackColor = Theme_C2: Control(Bitrate_Stream_1LB).BackColor = Theme_C2
                Control(BitrateLB2).BackColor = Theme_C2: Control(Bitrate_Stream_2LB).BackColor = Theme_C2
            END IF
        END IF

        ' Set OS variables
        SELECT CASE OS
            CASE "WINDOWS"
                CMD_EXE = "%ComSpec% /C node.exe "
                CMD_EXE_FAST = "node.exe "
                CMD_EXE_HTTP = "%ComSpec% /C curl.exe -s -XPOST -H " + c34 + "Authorization: " + HTTP_Auth_Key + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " "
                CMD_EXE_HTTP_FAST = "curl.exe -s -XPOST -H " + c34 + "Authorization: " + HTTP_Auth_Key + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " "
            CASE "LINUX"
                CMD_EXE = "node "
                CMD_EXE_FAST = "node "
                CMD_EXE_HTTP = "curl -s -XPOST -H " + c34 + "Authorization: " + OBS_PW + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " "
                CMD_EXE_HTTP_FAST = "curl -s -XPOST -H " + c34 + "Authorization: " + OBS_PW + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " "
        END SELECT
        ' HTTP for all OS's
        CMD_EXE_HTTP_FAST_GET_SCENE = CMD_EXE_HTTP_FAST + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetCurrentProgramScene" + c34 + " -o " + c34 + filePrevious + c34
        CMD_EXE_HTTP_FAST_GET_MEDIA1 = CMD_EXE_HTTP_FAST + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + "Media Source\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " -o " + c34 + filePrevious_ms + c34
        CMD_EXE_HTTP_GET_MEDIA1 = CMD_EXE_HTTP + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + "Media Source\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " -o " + c34 + filePrevious_ms + c34
        CMD_EXE_HTTP_GET_SCENE = CMD_EXE_HTTP + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetCurrentProgramScene" + c34 + " -o " + c34 + filePrevious + c34
        CMD_EXE_HTTP_GET_MEDIA2 = CMD_EXE_HTTP + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + "Media Source\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " > " + c34 + filePrevious_ms + c34 + " && curl -s -XPOST -H " + c34 + "Authorization: " + OBS_PW + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " -d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + "Media Source 2\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " >> " + c34 + filePrevious_ms + c34
        IF OS = "WINDOWS" THEN
            OPEN http_media2_File FOR OUTPUT AS #192
            PRINT #192, "@" + CMD_EXE_HTTP_FAST + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + "Media Source\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " > " + c34 + filePrevious_ms + c34 + " && curl -s -XPOST -H " + c34 + "Authorization: " + OBS_PW + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " -d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + "Media Source 2\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " >> " + c34 + filePrevious_ms + c34
            CLOSE #192
        END IF

        CooldownLog = CooldownLogTotal

        ' Used for LBR and ReturnPreviousSceneRemember=false
        titleScene1Temp = titleScene1
        titleScene2Temp = titleScene2
        titleScene12Temp = titleScene12

        IF Desktop_Width_Position < -(_DESKTOPWIDTH * 4) THEN Desktop_Width_Position = -(_DESKTOPWIDTH * 4)
        IF Desktop_Width_Position > (_DESKTOPWIDTH * 4) THEN Desktop_Width_Position = (_DESKTOPWIDTH * 4)
        IF Desktop_Width_Position < -9999 THEN Desktop_Width_Position = -9999

        IF Desktop_Height_Position < -(_DESKTOPHEIGHT * 4) THEN Desktop_Height_Position = -(_DESKTOPHEIGHT * 4)
        IF Desktop_Height_Position > (_DESKTOPHEIGHT * 4) THEN Desktop_Height_Position = (_DESKTOPHEIGHT * 4)
        IF Desktop_Height_Position < -9999 THEN Desktop_Height_Position = -9999

        IF Desktop_Width_Position < -9999 AND Desktop_Height_Position = -9999 THEN
        ELSE
            IF Desktop_Width_Position = -1 AND Desktop_Height_Position = -1 THEN _SCREENMOVE _MIDDLE ELSE _SCREENMOVE Desktop_Width_Position, Desktop_Height_Position
        END IF
    END IF
    IF returnPreviousScene = "true" THEN __returnPreviousScene = 1 ELSE __returnPreviousScene = 0
    IF FileStatusOutput = "true" THEN __FileStatusOutput = 1 ELSE __FileStatusOutput = 0
    IF returnPreviousSceneRemember = "true" THEN __returnPreviousSceneRemember = 1 ELSE __returnPreviousSceneRemember = 0
    IF __MultiCameraSwitch = 0 THEN __returnPreviousScene = 0: __returnPreviousSceneRemember = 0 ' multi-camera-switch options disabled if not required

    ' LBR enabled if required
    IF Scene_LBR_Enabled = "true" THEN SceneLBActive = 1
    ' Disable Scene #2 LBR if Scene2LBRDisabled is true
    IF Scene2_LBR_Disabled = "true" THEN Scene2LBInactive = 1

    SELECT CASE SceneLBActive
        CASE 0
            IF Stream_Fail_Delay < 3 THEN
                Stream_Fail_Delay = 3
            ELSEIF Stream_Fail_Delay > 99 THEN Stream_Fail_Delay = 99
            END IF
        CASE 1
            IF Stream_Fail_Delay < 5 AND __returnPreviousScene = 1 THEN
                Stream_Fail_Delay = 5
            ELSEIF Stream_Fail_Delay > 99 THEN Stream_Fail_Delay = 99
            END IF
    END SELECT

    IF HTTP_Enabled = "false" THEN IF NOT _DIREXISTS(nodejs_dir) THEN Error_msg = "- Folder " + c34 + nodejs_dir + c34 + " cannot be accessed, check if it exists. (Error: #2)"
    ' ErrorDisplay
    IF Error_msg <> "" THEN
        _DELAY 1
        CLS , _RGB(1, 100, 200)
        BSOD& = __imageMEM&("face_sad_x.png")
        _PUTIMAGE (25, 46)-(82, 158), BSOD&
        _FREEIMAGE BSOD&
        COLOR _RGB(254, 254, 254), _RGB(1, 100, 200)
        _PRINTSTRING (20, 12 * 18), "Program encountered an error and needs to restart."
        IF INSTR(Error_msg, CHR$(10)) >= 1 THEN
            _PRINTSTRING (20, 14 * 18), LEFT$(Error_msg, INSTR(Error_msg, CHR$(10)) - 1)
            _PRINTSTRING (20, 15 * 18), MID$(Error_msg, INSTR(Error_msg, CHR$(10)) + 1)
        ELSE
            _PRINTSTRING (20, 14 * 18), Error_msg
        END IF
        _PRINTSTRING (20, 20 * 18), "Program will exit shortly or press any key to exit now..."
        _DISPLAY
        _DELAY 1
        IF INKEY$ <> "" THEN SYSTEM
        _DELAY 1
        IF INKEY$ <> "" THEN SYSTEM
        _DELAY 3
        IF INKEY$ <> "" THEN SYSTEM
        _DELAY 3
        IF INKEY$ <> "" THEN SYSTEM
        _DELAY 5
        IF INKEY$ <> "" THEN SYSTEM
        _DELAY 5
        SYSTEM
    END IF

    IF HTTP_Enabled = "true" THEN ' HTTP
        shell_cmd_1 = CMD_EXE_HTTP_FAST + "-d " + c34 + "{\" + c34 + "sceneName\" + c34 + ": \" + c34
        shell_cmd_2 = "\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/emit/SetCurrentProgramScene" + c34
    ELSE
        shell_cmd_1 = CMD_EXE + c34 + obs_change_scene + c34 + " "
        shell_cmd_2 = ""
    END IF

    IF HTTP_Enabled = "false" THEN

        ' 4.x
        ' Set OS variables
        obs_change_scene = config_dir + s + "js" + s + "obs_change_scene.js"
        obs_get_scene = config_dir + s + "js" + s + "obs_get_scene.js"
        obs_get_scene_list = config_dir + s + "js" + s + "obs_get_scene_list.js"
        obs_get_media1 = config_dir + s + "js" + s + "obs_get_media1.js"
        obs_get_media1_scene = config_dir + s + "js" + s + "obs_get_media1_scene.js"
        obs_get_media2 = config_dir + s + "js" + s + "obs_get_media2.js"
        obs_get_media2_scene = config_dir + s + "js" + s + "obs_get_media2_scene.js"
        obs_check_websocket = config_dir + s + "js" + s + "obs_check_websocket.js"

        ' 4.x
        OPEN obs_change_scene FOR OUTPUT AS #64
        PRINT #64, "// This file has been automatically generated"
        PRINT #64, "// Any changes made will be lost"
        PRINT #64, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #64, ""
        PRINT #64, "const OBSWebSocket = require('obs-websocket-js');"
        PRINT #64, "const obs = new OBSWebSocket();"
        PRINT #64, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        PRINT #64, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        PRINT #64, "var timer1 = setTimeout(function() { obs.disconnect(); }, 3000);"
        PRINT #64, "var sceneName_1 = process.argv[2];"
        PRINT #64, "var sceneName_2 = process.argv[3];"
        PRINT #64, "var sceneName_3 = process.argv[4];"
        PRINT #64, "var sceneName_4 = process.argv[5];"
        PRINT #64, "var sceneName_5 = process.argv[6];"
        PRINT #64, "var sceneName_6 = process.argv[7];"
        PRINT #64, "var sceneName_7 = process.argv[8];"
        PRINT #64, "var sceneName_8 = process.argv[9];"
        PRINT #64, "if (sceneName_2 === undefined) { var sceneName_2 = '' } else { var sceneName_1 = sceneName_1 + " + c34 + " " + c34 + " }"
        PRINT #64, "if (sceneName_3 === undefined) { var sceneName_3 = '' } else { var sceneName_2 = sceneName_2 + " + c34 + " " + c34 + " }"
        PRINT #64, "if (sceneName_4 === undefined) { var sceneName_4 = '' } else { var sceneName_3 = sceneName_3 + " + c34 + " " + c34 + " }"
        PRINT #64, "if (sceneName_5 === undefined) { var sceneName_5 = '' } else { var sceneName_4 = sceneName_4 + " + c34 + " " + c34 + " }"
        PRINT #64, "if (sceneName_6 === undefined) { var sceneName_6 = '' } else { var sceneName_5 = sceneName_5 + " + c34 + " " + c34 + " }"
        PRINT #64, "if (sceneName_7 === undefined) { var sceneName_7 = '' } else { var sceneName_6 = sceneName_6 + " + c34 + " " + c34 + " }"
        PRINT #64, "if (sceneName_8 === undefined) { var sceneName_8 = '' } else { var sceneName_7 = sceneName_7 + " + c34 + " " + c34 + " }"
        PRINT #64, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        PRINT #64, ".then(() => { return obs.send('GetSceneList'); })"
        PRINT #64, ".then(data => { data.scenes.forEach(scene => {"
        PRINT #64, "        if (scene.name !== data.currentScene) {"
        PRINT #64, "            obs.send('SetCurrentScene', {"
        PRINT #64, "                'scene-name': sceneName_1 + sceneName_2 + sceneName_3 + sceneName_4 + sceneName_5 + sceneName_6 + sceneName_7 + sceneName_8"
        PRINT #64, "            });"
        PRINT #64, "        }"
        PRINT #64, "    });"
        PRINT #64, "})"
        PRINT #64, ".then(() => { obs.disconnect(); clearTimeout(timer1); });"
        CLOSE #64

        IF Nodejs_Access = "fast" THEN
            OPEN obs_get_scene FOR OUTPUT AS #72
            PRINT #72, "// This file has been automatically generated"
            PRINT #72, "// Any changes made will be lost"
            PRINT #72, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #72, ""
            PRINT #72, "const fs = require('fs');"
            PRINT #72, "const OBSWebSocket = require('obs-websocket-js');"
            PRINT #72, "const obs = new OBSWebSocket();"
            PRINT #72, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
            PRINT #72, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
            PRINT #72, "var timer2 = setTimeout(function() { obs.disconnect(); }, 3000);"
            PRINT #72, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
            PRINT #72, ".then(() => { return obs.send('GetCurrentScene'); })"
            PRINT #72, ".then(name => { //console.log(`${name.name}`);"
            PRINT #72, "fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.name}`, function (err) {"
            PRINT #72, "    if (err) return console.log(err);"
            PRINT #72, "}); })"
            PRINT #72, ".then(() => { obs.disconnect(); clearTimeout(timer2); });"
            CLOSE #72
        ELSE
            OPEN obs_get_scene FOR OUTPUT AS #72
            PRINT #72, "// This file has been automatically generated"
            PRINT #72, "// Any changes made will be lost"
            PRINT #72, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #72, ""
            PRINT #72, "const OBSWebSocket = require('obs-websocket-js');"
            PRINT #72, "const obs = new OBSWebSocket();"
            PRINT #72, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
            PRINT #72, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
            PRINT #72, "var timer2 = setTimeout(function() { obs.disconnect(); }, 3000);"
            PRINT #72, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
            PRINT #72, ".then(() => { return obs.send('GetCurrentScene'); })"
            PRINT #72, ".then(name => { console.log(`${name.name}`); })"
            PRINT #72, ".then(() => { obs.disconnect(); clearTimeout(timer2); });"
            CLOSE #72
        END IF

        IF Nodejs_Access = "fast" THEN
            OPEN obs_get_media1 FOR OUTPUT AS #76
            PRINT #76, "// This file has been automatically generated"
            PRINT #76, "// Any changes made will be lost"
            PRINT #76, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #76, ""
            PRINT #76, "const fs = require('fs');"
            PRINT #76, "const OBSWebSocket = require('obs-websocket-js');"
            PRINT #76, "const obs = new OBSWebSocket();"
            PRINT #76, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
            PRINT #76, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
            PRINT #76, "var timer3 = setTimeout(function() { obs.disconnect(); }, 3000);"
            PRINT #76, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
            PRINT #76, ".then(() => {"
            PRINT #76, "        return obs.send('GetMediaTime', {"
            PRINT #76, "                  'sourceName': " + c34 + MediaSource1 + c34
            PRINT #76, "        })"
            PRINT #76, "    })"
            PRINT #76, ".then((data) => {"
            PRINT #76, "    //console.log(`${data.timestamp}`);"
            PRINT #76, "    fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", `${data.timestamp}`, function (err) {"
            PRINT #76, "        if (err) return console.log(err);"
            PRINT #76, "    })"
            PRINT #76, "})"
            PRINT #76, ".then(() => { obs.disconnect(); clearTimeout(timer3); });"
            CLOSE #76
        ELSE
            OPEN obs_get_media1 FOR OUTPUT AS #76
            PRINT #76, "// This file has been automatically generated"
            PRINT #76, "// Any changes made will be lost"
            PRINT #76, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #76, ""
            PRINT #76, "const OBSWebSocket = require('obs-websocket-js');"
            PRINT #76, "const obs = new OBSWebSocket();"
            PRINT #76, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
            PRINT #76, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
            PRINT #76, "var timer3 = setTimeout(function() { obs.disconnect(); }, 3000);"
            PRINT #76, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
            PRINT #76, ".then(() => {"
            PRINT #76, "        return obs.send('GetMediaTime', {"
            PRINT #76, "                  'sourceName': " + c34 + MediaSource1 + c34
            PRINT #76, "        })"
            PRINT #76, "    })"
            PRINT #76, ".then((data) => {"
            PRINT #76, "    console.log(`${data.timestamp}`);"
            PRINT #76, "})"
            PRINT #76, ".then(() => { obs.disconnect(); clearTimeout(timer3); });"
            CLOSE #76
        END IF

        IF Nodejs_Access = "fast" THEN
            OPEN obs_get_media2 FOR OUTPUT AS #80
            PRINT #80, "// This file has been automatically generated"
            PRINT #80, "// Any changes made will be lost"
            PRINT #80, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #80, ""
            PRINT #80, "const fs = require('fs');"
            PRINT #80, "const OBSWebSocket = require('obs-websocket-js');"
            PRINT #80, "const obs = new OBSWebSocket();"
            PRINT #80, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
            PRINT #80, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
            PRINT #80, "var timer4 = setTimeout(function() { obs.disconnect(); }, 3000);"
            PRINT #80, "var media2;"
            PRINT #80, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
            PRINT #80, ".then(() => {"
            PRINT #80, "        return obs.send('GetMediaTime', {"
            PRINT #80, "                  'sourceName': " + c34 + MediaSource1 + c34
            PRINT #80, "        })"
            PRINT #80, "    })"
            PRINT #80, ".then((data) => {"
            PRINT #80, "    //console.log(`${data.timestamp}`);"
            PRINT #80, "    media2 = `${data.timestamp}`;"
            PRINT #80, "})"
            PRINT #80, ".then(() => {"
            PRINT #80, "        return obs.send('GetMediaTime', {"
            PRINT #80, "                  'sourceName': " + c34 + MediaSource2 + c34
            PRINT #80, "        })"
            PRINT #80, "})"
            PRINT #80, ".then((data) => {"
            PRINT #80, "    //console.log(`${data.timestamp}`);"
            PRINT #80, "    media2 = media2 + " + c34 + "\n" + c34 + " + `${data.timestamp}`;"
            PRINT #80, "    fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", media2, function (err) {"
            PRINT #80, "        if (err) return console.log(err);"
            PRINT #80, "    })"
            PRINT #80, "})"
            PRINT #80, ".then(() => { obs.disconnect(); clearTimeout(timer4); });"
            CLOSE #80
        ELSE
            OPEN obs_get_media2 FOR OUTPUT AS #80
            PRINT #80, "// This file has been automatically generated"
            PRINT #80, "// Any changes made will be lost"
            PRINT #80, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #80, ""
            PRINT #80, "const OBSWebSocket = require('obs-websocket-js');"
            PRINT #80, "const obs = new OBSWebSocket();"
            PRINT #80, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
            PRINT #80, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
            PRINT #80, "var timer4 = setTimeout(function() { obs.disconnect(); }, 3000);"
            PRINT #80, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
            PRINT #80, ".then(() => {"
            PRINT #80, "        return obs.send('GetMediaTime', {"
            PRINT #80, "                  'sourceName': " + c34 + MediaSource1 + c34
            PRINT #80, "        })"
            PRINT #80, "    })"
            PRINT #80, ".then((data) => {"
            PRINT #80, "    console.log(`${data.timestamp}`);"
            PRINT #80, "})"
            PRINT #80, ".then(() => {"
            PRINT #80, "        return obs.send('GetMediaTime', {"
            PRINT #80, "                  'sourceName': " + c34 + MediaSource2 + c34
            PRINT #80, "        })"
            PRINT #80, "})"
            PRINT #80, ".then((data) => {"
            PRINT #80, "    console.log(`${data.timestamp}`);"
            PRINT #80, "})"
            PRINT #80, ".then(() => { obs.disconnect(); clearTimeout(timer4); });"
            CLOSE #80
        END IF

        OPEN obs_check_websocket FOR OUTPUT AS #82
        PRINT #82, "// This file has been automatically generated"
        PRINT #82, "// Any changes made will be lost"
        PRINT #82, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #82, ""
        PRINT #82, "const OBSWebSocket = require('obs-websocket-js');"
        PRINT #82, "const obs = new OBSWebSocket();"
        PRINT #82, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        PRINT #82, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        PRINT #82, "var timer5 = setTimeout(function() { obs.disconnect(); }, 3000);"
        PRINT #82, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        PRINT #82, ".then(() => { return obs.send('GetVersion'); })"
        PRINT #82, ".then(name => {"
        PRINT #82, "    console.log(`OK`);"
        PRINT #82, "    console.log(`${name.obsWebsocketVersion}`);"
        PRINT #82, "})"
        PRINT #82, ".then(() => { obs.disconnect(); clearTimeout(timer5); });"
        CLOSE #82

        OPEN obs_get_scene_list FOR OUTPUT AS #84
        PRINT #84, "// This file has been automatically generated"
        PRINT #84, "// Any changes made will be lost"
        PRINT #84, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #84, ""
        PRINT #84, "const OBSWebSocket = require('obs-websocket-js');"
        PRINT #84, "const obs = new OBSWebSocket();"
        PRINT #84, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        PRINT #84, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        PRINT #84, "var timer6 = setTimeout(function() { obs.disconnect(); }, 3000);"
        PRINT #84, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        PRINT #84, ".then(() => { return obs.send('GetCurrentScene'); })"
        PRINT #84, ".then(name => { console.log(`${name.name}`); })"
        PRINT #84, ".then(() => { return obs.send('GetSceneList'); })"
        PRINT #84, ".then(data => {"
        PRINT #84, "    data.scenes.forEach(scene => {"
        PRINT #84, "        if (scene.name !== data.currentScene) {"
        PRINT #84, "            console.log(`${scene.name}`);"
        PRINT #84, "        }"
        PRINT #84, "    });"
        PRINT #84, "})"
        PRINT #84, ".then(() => { obs.disconnect(); clearTimeout(timer6); });"
        CLOSE #84

        OPEN obs_get_media1_scene FOR OUTPUT AS #86
        PRINT #86, "// This file has been automatically generated"
        PRINT #86, "// Any changes made will be lost"
        PRINT #86, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #86, ""
        PRINT #86, "const fs = require('fs');"
        PRINT #86, "const OBSWebSocket = require('obs-websocket-js');"
        PRINT #86, "const obs = new OBSWebSocket();"
        PRINT #86, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        PRINT #86, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        PRINT #86, "var myTimerFunction;"
        PRINT #86, "var myTimerConnect;"
        PRINT #86, ""
        PRINT #86, "repeatConnect();"
        PRINT #86, ""
        PRINT #86, "async function repeatConnect() {"
        PRINT #86, "    console.log(`Connecting...`);"
        PRINT #86, "    obs.disconnect();"
        PRINT #86, ""
        PRINT #86, "    obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        PRINT #86, "    .then(() => {"
        PRINT #86, "        console.log(`OK`);"
        PRINT #86, "        clearInterval(myTimerConnect);"
        PRINT #86, "        clearTimeout(myTimerConnect);"
        PRINT #86, "        myTimerFunction = setInterval(repeatFunction, 1000);"
        PRINT #86, "    })"
        PRINT #86, "}"
        PRINT #86, ""
        PRINT #86, "async function repeatFunction() {"
        PRINT #86, "    console.clear();"
        PRINT #86, "    return obs.send('GetMediaTime', {"
        PRINT #86, "        'sourceName': " + c34 + MediaSource1 + c34
        PRINT #86, "    })"
        PRINT #86, "    .then((data) => {"
        PRINT #86, "        fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", `${data.timestamp}`, function (err) {"
        PRINT #86, "            if (err) return console.log(err);"
        PRINT #86, "            console.log(`${data.timestamp}`);"
        PRINT #86, "        });"
        PRINT #86, "    })"
        PRINT #86, "    .then(() => { return obs.send('GetCurrentScene'); })"
        PRINT #86, "    .then(name => {"
        PRINT #86, "        fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.name}`, function (err) {"
        PRINT #86, "            if (err) return console.log(err);"
        PRINT #86, "            console.log(`${name.name}`);"
        PRINT #86, "        })"
        PRINT #86, "    })"
        PRINT #86, "    .then((data) => {"
        PRINT #86, "        clearInterval(myTimerConnect);"
        PRINT #86, "        clearTimeout(myTimerConnect);"
        PRINT #86, "    })"
        PRINT #86, "}"
        PRINT #86, ""
        PRINT #86, "process.on('uncaughtException', function (err) {"
        PRINT #86, "    console.log(`Error`, err);"
        PRINT #86, "    obs.disconnect();"
        PRINT #86, "    clearInterval(myTimerFunction);"
        PRINT #86, "    clearTimeout(myTimerFunction);"
        PRINT #86, "    clearInterval(myTimerConnect);"
        PRINT #86, "    clearTimeout(myTimerConnect);"
        PRINT #86, "    myTimerConnect = setTimeout(repeatConnect, 2000);"
        PRINT #86, "});"
        CLOSE #86

        OPEN obs_get_media2_scene FOR OUTPUT AS #88
        PRINT #88, "// This file has been automatically generated"
        PRINT #88, "// Any changes made will be lost"
        PRINT #88, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #88, ""
        PRINT #88, "const fs = require('fs');"
        PRINT #88, "const OBSWebSocket = require('obs-websocket-js');"
        PRINT #88, "const obs = new OBSWebSocket();"
        PRINT #88, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        PRINT #88, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        PRINT #88, "var myTimerFunction;"
        PRINT #88, "var myTimerConnect;"
        PRINT #88, "var dataStream1;"
        PRINT #88, "var dataStream2;"
        PRINT #88, ""
        PRINT #88, "repeatConnect();"
        PRINT #88, ""
        PRINT #88, "async function repeatConnect() {"
        PRINT #88, "    console.log(`Connecting...`);"
        PRINT #88, "    obs.disconnect();"
        PRINT #88, ""
        PRINT #88, "    obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        PRINT #88, "    .then(() => {"
        PRINT #88, "        console.log(`OK`);"
        PRINT #88, "        clearInterval(myTimerConnect);"
        PRINT #88, "        clearTimeout(myTimerConnect);"
        PRINT #88, "        myTimerFunction = setInterval(repeatFunction, 1000);"
        PRINT #88, "    })"
        PRINT #88, "}"
        PRINT #88, ""
        PRINT #88, "async function repeatFunction() {"
        PRINT #88, "    console.clear();"
        PRINT #88, "    return obs.send('GetMediaTime', {"
        PRINT #88, "        'sourceName': " + c34 + MediaSource1 + c34
        PRINT #88, "    })"
        PRINT #88, "    .then((data) => {"
        PRINT #88, "        dataStream1 = `${data.timestamp}` + '\n';"
        PRINT #88, "        console.log(`${data.timestamp}`);"
        PRINT #88, "    })"
        PRINT #88, "    .then(() => {"
        PRINT #88, "        return obs.send('GetMediaTime', {"
        PRINT #88, "            'sourceName': " + c34 + MediaSource2 + c34
        PRINT #88, "        })"
        PRINT #88, "    })"
        PRINT #88, "    .then((data) => {"
        PRINT #88, "        dataStream2 = dataStream1 + `${data.timestamp}`"
        PRINT #88, "        fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", dataStream2, function (err) {"
        PRINT #88, "            if (err) return console.log(err);"
        PRINT #88, "            console.log(`${data.timestamp}`);"
        PRINT #88, "        });"
        PRINT #88, "    })"
        PRINT #88, "    .then(() => { return obs.send('GetCurrentScene'); })"
        PRINT #88, "    .then(name => {"
        PRINT #88, "        fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.name}`, function (err) {"
        PRINT #88, "            if (err) return console.log(err);"
        PRINT #88, "            console.log(`${name.name}`);"
        PRINT #88, "        })"
        PRINT #88, "    })"
        PRINT #88, "    .then((data) => {"
        PRINT #88, "        clearInterval(myTimerConnect);"
        PRINT #88, "        clearTimeout(myTimerConnect);"
        PRINT #88, "    })"
        PRINT #88, "}"
        PRINT #88, ""
        PRINT #88, "process.on('uncaughtException', function (err) {"
        PRINT #88, "    console.log(`Error`, err);"
        PRINT #88, "    obs.disconnect();"
        PRINT #88, "    clearInterval(myTimerFunction);"
        PRINT #88, "    clearTimeout(myTimerFunction);"
        PRINT #88, "    clearInterval(myTimerConnect);"
        PRINT #88, "    clearTimeout(myTimerConnect);"
        PRINT #88, "    myTimerConnect = setTimeout(repeatConnect, 2000);"
        PRINT #88, "});"
        CLOSE #88

        ' 5.x
        ' Set OS variables
        obs_change_scene = config_dir + s + "js" + s + "obs_change_scene.mjs"
        obs_get_scene = config_dir + s + "js" + s + "obs_get_scene.mjs"
        obs_get_scene_list = config_dir + s + "js" + s + "obs_get_scene_list.mjs"
        obs_get_media1 = config_dir + s + "js" + s + "obs_get_media1.mjs"
        obs_get_media1_scene = config_dir + s + "js" + s + "obs_get_media1_scene.mjs"
        obs_get_media2 = config_dir + s + "js" + s + "obs_get_media2.mjs"
        obs_get_media2_scene = config_dir + s + "js" + s + "obs_get_media2_scene.mjs"
        obs_check_websocket = config_dir + s + "js" + s + "obs_check_websocket.mjs"

        ' 5.x
        OPEN obs_change_scene FOR OUTPUT AS #164
        PRINT #164, "// This file has been automatically generated"
        PRINT #164, "// Any changes made will be lost"
        PRINT #164, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #164, ""
        PRINT #164, "import OBSWebSocket from 'obs-websocket-js/" + js_Encoding + "'"
        PRINT #164, "var timer1 = setTimeout(function() { obs.disconnect(); }, 2000);"
        PRINT #164, "var sceneName_1 = process.argv[2];"
        PRINT #164, "var sceneName_2 = process.argv[3];"
        PRINT #164, "var sceneName_3 = process.argv[4];"
        PRINT #164, "var sceneName_4 = process.argv[5];"
        PRINT #164, "var sceneName_5 = process.argv[6];"
        PRINT #164, "var sceneName_6 = process.argv[7];"
        PRINT #164, "var sceneName_7 = process.argv[8];"
        PRINT #164, "var sceneName_8 = process.argv[9];"
        PRINT #164, "if (sceneName_2 === undefined) { var sceneName_2 = '' } else { var sceneName_1 = sceneName_1 + " + c34 + " " + c34 + " }"
        PRINT #164, "if (sceneName_3 === undefined) { var sceneName_3 = '' } else { var sceneName_2 = sceneName_2 + " + c34 + " " + c34 + " }"
        PRINT #164, "if (sceneName_4 === undefined) { var sceneName_4 = '' } else { var sceneName_3 = sceneName_3 + " + c34 + " " + c34 + " }"
        PRINT #164, "if (sceneName_5 === undefined) { var sceneName_5 = '' } else { var sceneName_4 = sceneName_4 + " + c34 + " " + c34 + " }"
        PRINT #164, "if (sceneName_6 === undefined) { var sceneName_6 = '' } else { var sceneName_5 = sceneName_5 + " + c34 + " " + c34 + " }"
        PRINT #164, "if (sceneName_7 === undefined) { var sceneName_7 = '' } else { var sceneName_6 = sceneName_6 + " + c34 + " " + c34 + " }"
        PRINT #164, "if (sceneName_8 === undefined) { var sceneName_8 = '' } else { var sceneName_7 = sceneName_7 + " + c34 + " " + c34 + " }"
        PRINT #164, "const obs = new OBSWebSocket();"
        PRINT #164, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        PRINT #164, ".then(() => { return obs.call('GetSceneList'); })"
        PRINT #164, ".then(data => { data.scenes.forEach(scene => {"
        PRINT #164, "        if (scene.sceneName !== data.currentProgramSceneName) {"
        PRINT #164, "            obs.call('SetCurrentProgramScene', {"
        PRINT #164, "                'sceneName': sceneName_1 + sceneName_2 + sceneName_3 + sceneName_4 + sceneName_5 + sceneName_6 + sceneName_7 + sceneName_8"
        PRINT #164, "            });"
        PRINT #164, "        }"
        PRINT #164, "    });"
        PRINT #164, "})"
        PRINT #164, ".then(() => { obs.disconnect(); clearTimeout(timer1); });"
        CLOSE #164

        IF Nodejs_Access = "fast" THEN
            OPEN obs_get_scene FOR OUTPUT AS #172
            PRINT #172, "// This file has been automatically generated"
            PRINT #172, "// Any changes made will be lost"
            PRINT #172, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #172, ""
            PRINT #172, "import * as fs from 'fs';"
            PRINT #172, "import OBSWebSocket from 'obs-websocket-js/" + js_Encoding + "'"
            PRINT #172, "var timer2 = setTimeout(function() { obs.disconnect(); }, 2000);"
            PRINT #172, "const obs = new OBSWebSocket();"
            PRINT #172, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
            PRINT #172, ".then(() => { return obs.call('GetCurrentProgramScene'); })"
            PRINT #172, ".then(name => { //console.log(`${name.currentProgramSceneName}`);"
            PRINT #172, "fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.currentProgramSceneName}`, function (err) {"
            PRINT #172, "    if (err) return console.log(err);"
            PRINT #172, "}); })"
            PRINT #172, ".then(() => { obs.disconnect(); clearTimeout(timer2); });"
            CLOSE #172
        ELSE
            OPEN obs_get_scene FOR OUTPUT AS #172
            PRINT #172, "// This file has been automatically generated"
            PRINT #172, "// Any changes made will be lost"
            PRINT #172, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #172, ""
            PRINT #172, "import OBSWebSocket from 'obs-websocket-js/" + js_Encoding + "'"
            PRINT #172, "var timer2 = setTimeout(function() { obs.disconnect(); }, 2000);"
            PRINT #172, "const obs = new OBSWebSocket();"
            PRINT #172, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
            PRINT #172, ".then(() => { return obs.call('GetCurrentProgramScene'); })"
            PRINT #172, ".then(name => { console.log(`${name.currentProgramSceneName}`); })"
            PRINT #172, ".then(() => { obs.disconnect(); clearTimeout(timer2); });"
            CLOSE #172
        END IF

        IF Nodejs_Access = "fast" THEN
            OPEN obs_get_media1 FOR OUTPUT AS #176
            PRINT #176, "// This file has been automatically generated"
            PRINT #176, "// Any changes made will be lost"
            PRINT #176, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #176, ""
            PRINT #176, "import * as fs from 'fs';"
            PRINT #176, "import OBSWebSocket from 'obs-websocket-js/" + js_Encoding + "'"
            PRINT #176, "var timer3 = setTimeout(function() { obs.disconnect(); }, 2000);"
            PRINT #176, "const obs = new OBSWebSocket();"
            PRINT #176, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
            PRINT #176, ".then(() => {"
            PRINT #176, "        return obs.call('GetMediaInputStatus', {"
            PRINT #176, "                  'inputName': " + c34 + MediaSource1 + c34
            PRINT #176, "        })"
            PRINT #176, "    })"
            PRINT #176, ".then((data) => {"
            PRINT #176, "    //console.log(`${data.mediaCursor}`);"
            PRINT #176, "    fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", `${data.mediaCursor}`, function (err) {"
            PRINT #176, "        if (err) return console.log(err);"
            PRINT #176, "    })"
            PRINT #176, "})"
            PRINT #176, ".then(() => { obs.disconnect(); clearTimeout(timer3); });"
            CLOSE #176
        ELSE
            OPEN obs_get_media1 FOR OUTPUT AS #176
            PRINT #176, "// This file has been automatically generated"
            PRINT #176, "// Any changes made will be lost"
            PRINT #176, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #176, ""
            PRINT #176, "import OBSWebSocket from 'obs-websocket-js/" + js_Encoding + "'"
            PRINT #176, "var timer3 = setTimeout(function() { obs.disconnect(); }, 2000);"
            PRINT #176, "const obs = new OBSWebSocket();"
            PRINT #176, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
            PRINT #176, ".then(() => {"
            PRINT #176, "        return obs.call('GetMediaInputStatus', {"
            PRINT #176, "                  'inputName': " + c34 + MediaSource1 + c34
            PRINT #176, "        })"
            PRINT #176, "    })"
            PRINT #176, ".then((data) => {"
            PRINT #176, "    console.log(`${data.mediaCursor}`);"
            PRINT #176, "})"
            PRINT #176, ".then(() => { obs.disconnect(); clearTimeout(timer3); });"
            CLOSE #176
        END IF

        IF Nodejs_Access = "fast" THEN
            OPEN obs_get_media2 FOR OUTPUT AS #180
            PRINT #180, "// This file has been automatically generated"
            PRINT #180, "// Any changes made will be lost"
            PRINT #180, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #180, ""
            PRINT #180, "import * as fs from 'fs';"
            PRINT #180, "import OBSWebSocket from 'obs-websocket-js/" + js_Encoding + "'"
            PRINT #180, "var timer4 = setTimeout(function() { obs.disconnect(); }, 2000);"
            PRINT #180, "var media2;"
            PRINT #180, "const obs = new OBSWebSocket();"
            PRINT #180, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
            PRINT #180, ".then(() => {"
            PRINT #180, "        return obs.call('GetMediaInputStatus', {"
            PRINT #180, "                  'inputName': " + c34 + MediaSource1 + c34
            PRINT #180, "        })"
            PRINT #180, "    })"
            PRINT #180, ".then((data) => {"
            PRINT #180, "    //console.log(`${data.mediaCursor}`);"
            PRINT #180, "    media2 = `${data.mediaCursor}`;"
            PRINT #180, "})"
            PRINT #180, ".then(() => {"
            PRINT #180, "        return obs.call('GetMediaInputStatus', {"
            PRINT #180, "                  'inputName': " + c34 + MediaSource2 + c34
            PRINT #180, "        })"
            PRINT #180, "})"
            PRINT #180, ".then((data) => {"
            PRINT #180, "    //console.log(`${data.mediaCursor}`);"
            PRINT #180, "    media2 = media2 + " + c34 + "\n" + c34 + " + `${data.mediaCursor}`;"
            PRINT #180, "    fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", media2, function (err) {"
            PRINT #180, "        if (err) return console.log(err);"
            PRINT #180, "    })"
            PRINT #180, "})"
            PRINT #180, ".then(() => { obs.disconnect(); clearTimeout(timer4); });"
            CLOSE #180
        ELSE
            OPEN obs_get_media2 FOR OUTPUT AS #180
            PRINT #180, "// This file has been automatically generated"
            PRINT #180, "// Any changes made will be lost"
            PRINT #180, "// https://github.com/loopy750/SRT-Stats-Monitor"
            PRINT #180, ""
            PRINT #180, "import OBSWebSocket from 'obs-websocket-js/" + js_Encoding + "'"
            PRINT #180, "var timer4 = setTimeout(function() { obs.disconnect(); }, 2000);"
            PRINT #180, "const obs = new OBSWebSocket();"
            PRINT #180, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
            PRINT #180, ".then(() => {"
            PRINT #180, "        return obs.call('GetMediaInputStatus', {"
            PRINT #180, "                  'inputName': " + c34 + MediaSource1 + c34
            PRINT #180, "        })"
            PRINT #180, "    })"
            PRINT #180, ".then((data) => {"
            PRINT #180, "    console.log(`${data.mediaCursor}`);"
            PRINT #180, "})"
            PRINT #180, ".then(() => {"
            PRINT #180, "        return obs.call('GetMediaInputStatus', {"
            PRINT #180, "                  'inputName': " + c34 + MediaSource2 + c34
            PRINT #180, "        })"
            PRINT #180, "})"
            PRINT #180, ".then((data) => {"
            PRINT #180, "    console.log(`${data.mediaCursor}`);"
            PRINT #180, "})"
            PRINT #180, ".then(() => { obs.disconnect(); clearTimeout(timer4); });"
            CLOSE #180
        END IF

        OPEN obs_check_websocket FOR OUTPUT AS #182
        PRINT #182, "// This file has been automatically generated"
        PRINT #182, "// Any changes made will be lost"
        PRINT #182, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #182, ""
        PRINT #182, "import OBSWebSocket from 'obs-websocket-js/" + js_Encoding + "'"
        PRINT #182, "var timer5 = setTimeout(function() { obs.disconnect(); }, 2000);"
        PRINT #182, "const obs = new OBSWebSocket();"
        PRINT #182, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        PRINT #182, ".then(() => { return obs.call('GetVersion'); })"
        PRINT #182, ".then(name => {"
        PRINT #182, "    console.log(`OK`);"
        PRINT #182, "    console.log(`${name.obsWebSocketVersion}`);"
        PRINT #182, "})"
        PRINT #182, ".then(() => { obs.disconnect(); clearTimeout(timer5); });"
        CLOSE #182

        OPEN obs_get_scene_list FOR OUTPUT AS #184
        PRINT #184, "// This file has been automatically generated"
        PRINT #184, "// Any changes made will be lost"
        PRINT #184, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #184, ""
        PRINT #184, "import OBSWebSocket from 'obs-websocket-js/" + js_Encoding + "'"
        PRINT #184, "var timer6 = setTimeout(function() { obs.disconnect(); }, 2000);"
        PRINT #184, "const obs = new OBSWebSocket();"
        PRINT #184, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        PRINT #184, ".then(() => { return obs.call('GetCurrentProgramScene'); })"
        PRINT #184, ".then(name => { console.log(`${name.currentProgramSceneName}`); })"
        PRINT #184, ".then(() => { return obs.call('GetSceneList'); })"
        PRINT #184, ".then(data => {"
        PRINT #184, "    data.scenes.forEach(scene => {"
        PRINT #184, "        if (scene.sceneName !== data.currentProgramSceneName) {"
        PRINT #184, "            console.log(`${scene.sceneName}`);"
        PRINT #184, "        }"
        PRINT #184, "    });"
        PRINT #184, "})"
        PRINT #184, ".then(() => { obs.disconnect(); clearTimeout(timer6); });"
        CLOSE #184

        OPEN obs_get_media1_scene FOR OUTPUT AS #186
        PRINT #186, "// This file has been automatically generated"
        PRINT #186, "// Any changes made will be lost"
        PRINT #186, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #186, ""
        PRINT #186, "import * as fs from 'fs';"
        PRINT #186, "import OBSWebSocket from 'obs-websocket-js/" + js_Encoding + "'"
        PRINT #186, "const obs = new OBSWebSocket();"
        PRINT #186, "var myTimerFunction;"
        PRINT #186, "var myTimerConnect;"
        PRINT #186, ""
        PRINT #186, "repeatConnect();"
        PRINT #186, ""
        PRINT #186, "async function repeatConnect() {"
        PRINT #186, "    console.log(`Connecting...`);"
        PRINT #186, "    obs.disconnect();"
        PRINT #186, ""
        PRINT #186, "    await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        PRINT #186, "    .then(() => {"
        PRINT #186, "        console.log(`OK`);"
        PRINT #186, "        clearInterval(myTimerConnect);"
        PRINT #186, "        clearTimeout(myTimerConnect);"
        PRINT #186, "        myTimerFunction = setInterval(repeatFunction, 1000);"
        PRINT #186, "    })"
        PRINT #186, "}"
        PRINT #186, ""
        PRINT #186, "async function repeatFunction() {"
        PRINT #186, "    console.clear();"
        PRINT #186, "    return obs.call('GetMediaInputStatus', {"
        PRINT #186, "        'inputName': " + c34 + MediaSource1 + c34
        PRINT #186, "    })"
        PRINT #186, "    .then((data) => {"
        PRINT #186, "        fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", `${data.mediaCursor}`, function (err) {"
        PRINT #186, "            if (err) return console.log(err);"
        PRINT #186, "            console.log(`${data.mediaCursor}`);"
        PRINT #186, "        });"
        PRINT #186, "    })"
        PRINT #186, "    .then(() => { return obs.call('GetCurrentProgramScene'); })"
        PRINT #186, "    .then(name => {"
        PRINT #186, "        fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.currentProgramSceneName}`, function (err) {"
        PRINT #186, "            if (err) return console.log(err);"
        PRINT #186, "            console.log(`${name.currentProgramSceneName}`);"
        PRINT #186, "        })"
        PRINT #186, "    })"
        PRINT #186, "    .then((data) => {"
        PRINT #186, "        clearInterval(myTimerConnect);"
        PRINT #186, "        clearTimeout(myTimerConnect);"
        PRINT #186, "    })"
        PRINT #186, "}"
        PRINT #186, ""
        PRINT #186, "process.on('uncaughtException', function (err) {"
        PRINT #186, "    console.log(`Error`, err);"
        PRINT #186, "    obs.disconnect();"
        PRINT #186, "    clearInterval(myTimerFunction);"
        PRINT #186, "    clearTimeout(myTimerFunction);"
        PRINT #186, "    clearInterval(myTimerConnect);"
        PRINT #186, "    clearTimeout(myTimerConnect);"
        PRINT #186, "    myTimerConnect = setTimeout(repeatConnect, 2000);"
        PRINT #186, "});"
        CLOSE #186

        OPEN obs_get_media2_scene FOR OUTPUT AS #188
        PRINT #188, "// This file has been automatically generated"
        PRINT #188, "// Any changes made will be lost"
        PRINT #188, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #188, ""
        PRINT #188, "import * as fs from 'fs';"
        PRINT #188, "import OBSWebSocket from 'obs-websocket-js/" + js_Encoding + "'"
        PRINT #188, "const obs = new OBSWebSocket();"
        PRINT #188, "var myTimerFunction;"
        PRINT #188, "var myTimerConnect;"
        PRINT #188, "var dataStream1;"
        PRINT #188, "var dataStream2;"
        PRINT #188, ""
        PRINT #188, "repeatConnect();"
        PRINT #188, ""
        PRINT #188, "async function repeatConnect() {"
        PRINT #188, "    console.log(`Connecting...`);"
        PRINT #188, "    obs.disconnect();"
        PRINT #188, ""
        PRINT #188, "    await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        PRINT #188, "    .then(() => {"
        PRINT #188, "        console.log(`OK`);"
        PRINT #188, "        clearInterval(myTimerConnect);"
        PRINT #188, "        clearTimeout(myTimerConnect);"
        PRINT #188, "        myTimerFunction = setInterval(repeatFunction, 1000);"
        PRINT #188, "    })"
        PRINT #188, "}"
        PRINT #188, ""
        PRINT #188, "async function repeatFunction() {"
        PRINT #188, "    console.clear();"
        PRINT #188, "    return obs.call('GetMediaInputStatus', {"
        PRINT #188, "        'inputName': " + c34 + MediaSource1 + c34
        PRINT #188, "    })"
        PRINT #188, "    .then((data) => {"
        PRINT #188, "        dataStream1 = `${data.mediaCursor}` + '\n';"
        PRINT #188, "        console.log(`${data.mediaCursor}`);"
        PRINT #188, "    })"
        PRINT #188, "    .then(() => {"
        PRINT #188, "        return obs.call('GetMediaInputStatus', {"
        PRINT #188, "            'inputName': " + c34 + MediaSource2 + c34
        PRINT #188, "        })"
        PRINT #188, "    })"
        PRINT #188, "    .then((data) => {"
        PRINT #188, "        dataStream2 = dataStream1 + `${data.mediaCursor}`"
        PRINT #188, "        fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", dataStream2, function (err) {"
        PRINT #188, "            if (err) return console.log(err);"
        PRINT #188, "            console.log(`${data.mediaCursor}`);"
        PRINT #188, "        });"
        PRINT #188, "    })"
        PRINT #188, "    .then(() => { return obs.call('GetCurrentProgramScene'); })"
        PRINT #188, "    .then(name => {"
        PRINT #188, "        fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.currentProgramSceneName}`, function (err) {"
        PRINT #188, "            if (err) return console.log(err);"
        PRINT #188, "            console.log(`${name.currentProgramSceneName}`);"
        PRINT #188, "        })"
        PRINT #188, "    })"
        PRINT #188, "    .then((data) => {"
        PRINT #188, "        clearInterval(myTimerConnect);"
        PRINT #188, "        clearTimeout(myTimerConnect);"
        PRINT #188, "    })"
        PRINT #188, "}"
        PRINT #188, ""
        PRINT #188, "process.on('uncaughtException', function (err) {"
        PRINT #188, "    console.log(`Error`, err);"
        PRINT #188, "    obs.disconnect();"
        PRINT #188, "    clearInterval(myTimerFunction);"
        PRINT #188, "    clearTimeout(myTimerFunction);"
        PRINT #188, "    clearInterval(myTimerConnect);"
        PRINT #188, "    clearTimeout(myTimerConnect);"
        PRINT #188, "    myTimerConnect = setTimeout(repeatConnect, 2000);"
        PRINT #188, "});"
        CLOSE #188

    END IF
    IF CheckUpdateOnStartup = "true" AND iniFeatures = 0 THEN
        file224$ = ""
        updateResult$ = ""
        _DELAY 0.05
        ' Set OS variables
        SELECT CASE OS
            CASE "WINDOWS"
                SHELL _HIDE "%ComSpec% /C curl -H " + c34 + "Cache-Control: no-cache" + c34 + " https://raw.githubusercontent.com/loopy750/SRT-Stats-Monitor-Version/master/checkversion.txt > " + c34 + fileCheckVersion + c34 + ""
            CASE "LINUX"
                SHELL _HIDE "curl -H " + c34 + "Cache-Control: no-cache" + c34 + " https://raw.githubusercontent.com/loopy750/SRT-Stats-Monitor-Version/master/checkversion.txt > " + c34 + fileCheckVersion + c34 + ""
        END SELECT
        _DELAY 0.05
        IF _FILEEXISTS(fileCheckVersion) THEN
            OPEN fileCheckVersion FOR INPUT AS #224
            DO UNTIL EOF(224)
                IF LOF(224) = 0 THEN NoKill = 1: EXIT DO ' Overkill with EOF checking, but just being safe
                IF EOF(224) THEN EXIT DO
                LINE INPUT #224, file224$
            LOOP
        END IF
        CLOSE #224
        IF _FILEEXISTS(fileCheckVersion) THEN KILL fileCheckVersion
        updateResult$ = file224$
        IF file224$ <> Ver THEN verCheck$ = "New version is available (v" + _TRIM$(LEFT$(updateResult$, 10)) + ")..."
        IF file224$ = "" OR file224$ = "404: Not Found" THEN verCheck$ = "Unable to check for new version..."
        IF file224$ = Ver THEN verCheck$ = "This is the latest version (v" + _TRIM$(LEFT$(Ver, 10)) + ")..."
    END IF
    iniFeatures = 0

    ' Test #4
    IF ErrorTestRunOnce = 1 THEN
        IF __MultiCameraSwitch = 0 THEN
            IF Scene_OK = "" OR Scene_Fail = "" OR Scene_Intro = "" THEN
                Error_msg = "- Scene names in " + c34 + "config.ini" + c34 + " are empty. Configure to match OBS scene names."
                ErrorDisplay (4)
            END IF
        END IF
    END IF

    ' Test #5
    IF ErrorTestRunOnce = 1 THEN
        IF __MultiCameraSwitch = 1 THEN
            IF titleScene1 = "" OR titleScene2 = "" OR titleScene12 = "" THEN
                _DELAY 1
                Error_msg = "- Scene names in " + c34 + "config.ini" + c34 + " are empty. Configure to match OBS scene names."
                ErrorDisplay (5)
            END IF
        END IF
    END IF

    ' Test #6
    IF ErrorTestRunOnce = 1 THEN

        IF HTTP_Enabled = "true" THEN
            ' curl -s -XPOST -H "Authorization: password" -H "Content-type: application/json" "http://127.0.0.1:4445/call/GetVersion"
            SHELL _HIDE CMD_EXE_HTTP + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetVersion" + c34 + " -o " + c34 + filePrevious_ms + c34
            OPEN filePrevious_ms FOR BINARY AS #128
            JSON = SPACE$(LOF(128))
            GET #128, , JSON
            CLOSE #128
            IF GetKey("obsWebSocketVersion", JSON) = "" THEN
                Error_msg = "- OBS " + c34 + "WebSockets Server" + c34 + " connection failed. Correctly configure " + c34 + "HTTPBindAddress, HTTPBindPort" + c34 + " in " + c34 + "config.ini" + c34 + " and retry." + CHR$(10) + "- If configuration is correct, check OBS Studio is open,  " + c34 + "WebSockets Server" + c34 + " is enabled in OBS Studio, and " + c34 + "obs-websocket-http" + c34 + " is installed."
                ErrorDisplay (6)
            ELSE
                checkWebSocketVersion$ = GetKey("obsWebSocketVersion", JSON)
            END IF
        ELSE
            ' Check for 5.x else fall back to 4.x. If 4.x also fails then error
            websocketVersion = 5

            ' File variables for 5.x
            ' Set OS variables
            obs_check_websocket = config_dir + s + "js" + s + "obs_check_websocket.mjs"
            obs_change_scene = config_dir + s + "js" + s + "obs_change_scene.mjs"
            shell_cmd_1 = CMD_EXE + c34 + obs_change_scene + c34 + " "
            shell_cmd_2 = ""

            SHELL _HIDE CMD_EXE + c34 + obs_check_websocket + c34 + " > " + c34 + filePrevious_ms + c34
            _DELAY 0.05
            IF _FILEEXISTS(filePrevious_ms) THEN
                OPEN filePrevious_ms FOR INPUT AS #90
                IF EOF(90) OR LOF(90) = 0 THEN
                    CLOSE #90
                    ON ERROR GOTO App_Fail
                    IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
                    ON ERROR GOTO 0
                    ' Check for 4.x else error
                    websocketOK = 0
                ELSE
                    websocketOK = 1
                END IF

                IF websocketOK = 1 THEN LINE INPUT #90, file90
                IF file90 <> "OK" THEN
                    CLOSE #90
                    IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
                    ' Check for 4.x else error
                    websocketOK = 0
                ELSE
                    websocketOK = 1
                    IF EOF(90) OR LOF(90) = 0 THEN
                        CLOSE #90
                    ELSE
                        LINE INPUT #90, checkWebSocketVersion$
                        CLOSE #90
                    END IF
                END IF
            END IF

            IF websocketOK = 0 THEN
                websocketVersion = 4

                ' File variables for 4.x
                ' Set OS variables
                obs_check_websocket = config_dir + s + "js" + s + "obs_check_websocket.js"
                obs_change_scene = config_dir + s + "js" + s + "obs_change_scene.js"
                shell_cmd_1 = CMD_EXE + c34 + obs_change_scene + c34 + " "
                shell_cmd_2 = ""

                SHELL _HIDE CMD_EXE + c34 + obs_check_websocket + c34 + " > " + c34 + filePrevious_ms + c34
                _DELAY 0.05
                IF _FILEEXISTS(filePrevious_ms) THEN
                    OPEN filePrevious_ms FOR INPUT AS #90
                    IF EOF(90) OR LOF(90) = 0 THEN
                        CLOSE #90
                        ON ERROR GOTO App_Fail
                        IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
                        ON ERROR GOTO 0
                        websocketOK = 0
                        Error_msg = "- OBS " + c34 + "WebSockets Server" + c34 + " connection failed. Correctly configure " + c34 + "WebsocketAddress, WebsocketPassword" + c34 + " in " + c34 + "config.ini" + c34 + " and retry." + CHR$(10) + "- If configuration is correct, check OBS Studio is open, " + c34 + "WebSockets Server" + c34 + " is enabled in OBS Studio, and " + c34 + "Node.js" + c34 + " is installed."
                        ErrorDisplay (6)
                    ELSE
                        websocketOK = 1
                    END IF

                    LINE INPUT #90, file90
                    IF file90 <> "OK" THEN
                        CLOSE #90
                        IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
                        websocketOK = 0
                        Error_msg = "- OBS " + c34 + "WebSockets Server" + c34 + " connection failed. Correctly configure " + c34 + "WebsocketAddress, WebsocketPassword" + c34 + " in " + c34 + "config.ini" + c34 + " and retry." + CHR$(10) + "- If configuration is correct, check OBS Studio is open, " + c34 + "WebSockets Server" + c34 + " is enabled in OBS Studio, and " + c34 + "Node.js" + c34 + " is installed."
                        ErrorDisplay (6)
                    ELSE
                        websocketOK = 1
                        IF EOF(90) OR LOF(90) = 0 THEN
                            CLOSE #90
                        ELSE
                            LINE INPUT #90, checkWebSocketVersion$
                            CLOSE #90
                        END IF
                    END IF
                END IF
            END IF
            checkWebSocketVersion$ = LEFT$(checkWebSocketVersion$, 20)
            SELECT CASE websocketVersion
                ' Set OS variables
                CASE 5
                    ' 5.x
                    obs_change_scene = config_dir + s + "js" + s + "obs_change_scene.mjs"
                    obs_get_scene = config_dir + s + "js" + s + "obs_get_scene.mjs"
                    obs_get_scene_list = config_dir + s + "js" + s + "obs_get_scene_list.mjs"
                    obs_get_media1 = config_dir + s + "js" + s + "obs_get_media1.mjs"
                    obs_get_media1_scene = config_dir + s + "js" + s + "obs_get_media1_scene.mjs"
                    obs_get_media2 = config_dir + s + "js" + s + "obs_get_media2.mjs"
                    obs_get_media2_scene = config_dir + s + "js" + s + "obs_get_media2_scene.mjs"
                    obs_check_websocket = config_dir + s + "js" + s + "obs_check_websocket.mjs"
                CASE 4
                    ' 4.x
                    obs_change_scene = config_dir + s + "js" + s + "obs_change_scene.js"
                    obs_get_scene = config_dir + s + "js" + s + "obs_get_scene.js"
                    obs_get_scene_list = config_dir + s + "js" + s + "obs_get_scene_list.js"
                    obs_get_media1 = config_dir + s + "js" + s + "obs_get_media1.js"
                    obs_get_media1_scene = config_dir + s + "js" + s + "obs_get_media1_scene.js"
                    obs_get_media2 = config_dir + s + "js" + s + "obs_get_media2.js"
                    obs_get_media2_scene = config_dir + s + "js" + s + "obs_get_media2_scene.js"
                    obs_check_websocket = config_dir + s + "js" + s + "obs_check_websocket.js"
            END SELECT
        END IF

    END IF

    ' Test #7
    IF ErrorTestRunOnce = 1 THEN
        IF __MultiCameraSwitch = 0 THEN

            IF HTTP_Enabled = "true" THEN
                SHELL _HIDE CMD_EXE_HTTP + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + "Media Source\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " > " + c34 + filePrevious_ms + c34
                OPEN filePrevious_ms FOR BINARY AS #128
                JSON = SPACE$(LOF(128))
                GET #128, , JSON
                CLOSE #128
                IF GetKey("mediaCursor", JSON) = "" THEN
                    Error_msg = "- Unable to read " + c34 + "MediaSource1" + c34 + ". Correctly configure " + c34 + "MediaSource1" + c34 + " in " + c34 + "config.ini and retry." + CHR$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSockets version is 4.9.0 or newer."
                    ErrorDisplay (7)
                END IF
            ELSE
                SHELL _HIDE CMD_EXE + c34 + obs_get_media1 + c34 + " > " + c34 + filePrevious_ms + c34
                _DELAY 0.05
                IF _FILEEXISTS(filePrevious_ms) THEN
                    OPEN filePrevious_ms FOR INPUT AS #90
                    IF EOF(90) OR LOF(90) = 0 THEN
                        CLOSE #90
                        IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
                        Error_msg = "- Unable to read " + c34 + "MediaSource1" + c34 + ". Correctly configure " + c34 + "MediaSource1" + c34 + " in " + c34 + "config.ini and retry." + CHR$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSockets version is 4.9.0 or newer."
                        ErrorDisplay (7)
                    END IF

                    ' No more lines to be read, so just close file
                    CLOSE #90
                END IF
            END IF

        END IF
    END IF

    ' Test #8
    IF ErrorTestRunOnce = 1 THEN
        IF __MultiCameraSwitch = 1 THEN

            IF HTTP_Enabled = "true" THEN
                SHELL _HIDE CMD_EXE_HTTP + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + "Media Source\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " > " + c34 + filePrevious_ms + c34
                OPEN filePrevious_ms FOR BINARY AS #128
                JSON = SPACE$(LOF(128))
                GET #128, , JSON
                CLOSE #128
                IF GetKey("mediaCursor", JSON) = "" THEN
                    Error_msg = "- Unable to read " + c34 + "MediaSource1" + c34 + ". Correctly configure " + c34 + "MediaSource1" + c34 + " in " + c34 + "config.ini and retry." + CHR$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSockets version is 4.9.0 or newer."
                    ErrorDisplay (8)
                END IF
                SHELL _HIDE CMD_EXE_HTTP + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + "Media Source 2\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " > " + c34 + filePrevious_ms + c34
                OPEN filePrevious_ms FOR BINARY AS #128
                JSON = SPACE$(LOF(128))
                GET #128, , JSON
                CLOSE #128
                IF GetKey("mediaCursor", JSON) = "" THEN
                    Error_msg = "- Unable to read " + c34 + "MediaSource2" + c34 + ". Correctly configure " + c34 + "MediaSource2" + c34 + " in " + c34 + "config.ini and retry." + CHR$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSockets version is 4.9.0 or newer."
                    ErrorDisplay (8)
                END IF
            ELSE
                IF Nodejs_Access = "fast" THEN
                    'SHELL _HIDE CMD_EXE_FAST + c34 + obs_get_media2 + c34
                    SHELL _HIDE CMD_EXE + c34 + obs_get_media2 + c34 + " > " + c34 + filePrevious_ms + c34
                ELSE
                    SHELL _HIDE CMD_EXE + c34 + obs_get_media2 + c34 + " > " + c34 + filePrevious_ms + c34
                    _DELAY 0.001
                END IF
                _DELAY 0.05
                IF _FILEEXISTS(filePrevious_ms) THEN
                    OPEN filePrevious_ms FOR INPUT AS #90
                    IF EOF(90) OR LOF(90) = 0 THEN
                        CLOSE #90
                        IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
                        Error_msg = "- Unable to read " + c34 + "MediaSource1" + c34 + ". Correctly configure " + c34 + "MediaSource1" + c34 + " in " + c34 + "config.ini and retry." + CHR$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSockets version is 4.9.0 or newer."
                        ErrorDisplay (8)
                    END IF

                    LINE INPUT #90, file90
                    IF EOF(90) OR LOF(90) = 0 THEN
                        CLOSE #90
                        IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
                        Error_msg = "- Unable to read " + c34 + "MediaSource2" + c34 + ". Correctly configure " + c34 + "MediaSource2" + c34 + " in " + c34 + "config.ini and retry." + CHR$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSockets version is 4.9.0 or newer."
                        ErrorDisplay (8)
                    END IF
                    CLOSE #90
                END IF
            END IF

        END IF
    END IF

    ' Test #9
    IF ErrorTestRunOnce = 1 THEN

        IF HTTP_Enabled = "true" THEN
            SHELL _HIDE CMD_EXE_HTTP + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetSceneList" + c34 + " -o " + c34 + filePrevious_ms + c34
            OPEN filePrevious_ms FOR BINARY AS #128
            JSON = SPACE$(LOF(128))
            GET #128, , JSON
            CLOSE #128
            REDIM JSON_Multi(128) AS STRING
            GetAllKey "sceneName", JSON, JSON_Multi()
            Test_Pass_9 = 0
            FOR i_JSON = 1 TO UBOUND(JSON_Multi)
                ' JSON_Multi(i_JSON)
                IF JSON_Multi(i_JSON) = Scene_OK THEN Test_Pass_9 = Test_Pass_9 + 1
                IF JSON_Multi(i_JSON) = Scene_Fail THEN Test_Pass_9 = Test_Pass_9 + 2
                IF JSON_Multi(i_JSON) = Scene_Intro THEN Test_Pass_9 = Test_Pass_9 + 4
                SELECT CASE Test_Pass_9
                    CASE 0: Test_Pass_9_Value = "SceneOK, SceneFail, SceneIntro"
                    CASE 1: Test_Pass_9_Value = "SceneFail, SceneIntro"
                    CASE 2: Test_Pass_9_Value = "SceneIntro, SceneOK"
                    CASE 3: Test_Pass_9_Value = "SceneIntro"
                    CASE 4: Test_Pass_9_Value = "SceneOK, SceneFail"
                    CASE 5: Test_Pass_9_Value = "SceneFail"
                    CASE 6: Test_Pass_9_Value = "SceneOK"
                END SELECT
            NEXT
            REDIM JSON_Multi(10) AS STRING
            IF Test_Pass_9 <> 7 THEN
                Error_msg = "- OBS scenes are missing. Scene names are case-sensitive and cannot be more than eight words." + CHR$(10) + "- Correctly configure scenes " + c34 + Test_Pass_9_Value + c34 + " in " + c34 + "config.ini" + c34 + " and confirm all scenes contain at least one source."
                ErrorDisplay (9)
            END IF
        ELSE
            SHELL _HIDE CMD_EXE + c34 + obs_get_scene_list + c34 + " > " + c34 + filePrevious_ms + c34
            _DELAY 0.05
            IF _FILEEXISTS(filePrevious_ms) THEN
                OPEN filePrevious_ms FOR INPUT AS #90
                IF EOF(90) OR LOF(90) = 0 THEN
                    CLOSE #90
                    ON ERROR GOTO App_Fail
                    IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
                    ON ERROR GOTO 0
                    Error_msg = "- Unable to retrieve OBS scene list. Correctly configure scenes in OBS and confirm they all contain at least one source."
                    ErrorDisplay (9)
                END IF

                Test_Pass_9 = 0
                DO
                    IF NOT EOF(90) THEN LINE INPUT #90, file90
                    IF file90 = Scene_OK THEN Test_Pass_9 = Test_Pass_9 + 1
                    IF file90 = Scene_Fail THEN Test_Pass_9 = Test_Pass_9 + 2
                    IF file90 = Scene_Intro THEN Test_Pass_9 = Test_Pass_9 + 4
                    SELECT CASE Test_Pass_9
                        CASE 0: Test_Pass_9_Value = "SceneOK, SceneFail, SceneIntro"
                        CASE 1: Test_Pass_9_Value = "SceneFail, SceneIntro"
                        CASE 2: Test_Pass_9_Value = "SceneIntro, SceneOK"
                        CASE 3: Test_Pass_9_Value = "SceneIntro"
                        CASE 4: Test_Pass_9_Value = "SceneOK, SceneFail"
                        CASE 5: Test_Pass_9_Value = "SceneFail"
                        CASE 6: Test_Pass_9_Value = "SceneOK"
                    END SELECT
                LOOP UNTIL EOF(90)
                CLOSE #90
                IF Test_Pass_9 <> 7 THEN
                    Error_msg = "- OBS scenes are missing. Scene names are case-sensitive and cannot be more than eight words." + CHR$(10) + "- Correctly configure scenes " + c34 + Test_Pass_9_Value + c34 + " in " + c34 + "config.ini" + c34 + " and confirm all scenes contain at least one source."
                    ErrorDisplay (9)
                END IF
            END IF
        END IF

    END IF

    ' Test #10
    IF ErrorTestRunOnce = 1 THEN
        IF __MultiCameraSwitch = 1 THEN

            IF HTTP_Enabled = "true" THEN
                SHELL _HIDE CMD_EXE_HTTP + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetSceneList" + c34 + " -o " + c34 + filePrevious_ms + c34
                OPEN filePrevious_ms FOR BINARY AS #128
                JSON = SPACE$(LOF(128))
                GET #128, , JSON
                CLOSE #128
                REDIM JSON_Multi(128) AS STRING
                GetAllKey "sceneName", JSON, JSON_Multi()
                Test_Pass_10 = 0
                FOR i_JSON = 1 TO UBOUND(JSON_Multi)
                    ' JSON_Multi(i_JSON)
                    IF JSON_Multi(i_JSON) = titleScene1 THEN Test_Pass_10 = Test_Pass_10 + 1
                    IF JSON_Multi(i_JSON) = titleScene2 THEN Test_Pass_10 = Test_Pass_10 + 2
                    IF JSON_Multi(i_JSON) = titleScene12 THEN Test_Pass_10 = Test_Pass_10 + 4
                    SELECT CASE Test_Pass_10
                        CASE 0: Test_Pass_10_Value = "TitleScene1, TitleScene2, TitleScene12"
                        CASE 1: Test_Pass_10_Value = "TitleScene2, TitleScene12"
                        CASE 2: Test_Pass_10_Value = "TitleScene1, TitleScene12"
                        CASE 3: Test_Pass_10_Value = "TitleScene12"
                        CASE 4: Test_Pass_10_Value = "TitleScene1, TitleScene2"
                        CASE 5: Test_Pass_10_Value = "TitleScene2"
                        CASE 6: Test_Pass_10_Value = "TitleScene1"
                    END SELECT
                NEXT
                REDIM JSON_Multi(10) AS STRING
                IF Test_Pass_10 <> 7 THEN
                    Error_msg = "- OBS scenes are missing. Scene names are case-sensitive and cannot be more than eight words." + CHR$(10) + "- Correctly configure scenes " + c34 + Test_Pass_10_Value + c34 + " in " + c34 + "config.ini" + c34 + " and confirm all scenes contain at least one source."
                    ErrorDisplay (10)
                END IF
            ELSE
                SHELL _HIDE CMD_EXE + c34 + obs_get_scene_list + c34 + " > " + c34 + filePrevious_ms + c34
                _DELAY 0.05
                IF _FILEEXISTS(filePrevious_ms) THEN
                    OPEN filePrevious_ms FOR INPUT AS #90
                    IF EOF(90) OR LOF(90) = 0 THEN
                        CLOSE #90
                        IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
                        Error_msg = "- Unable to retrieve OBS scene list. Correctly configure scenes in OBS and confirm they all contain at least one source."
                        ErrorDisplay (10)
                    END IF

                    Test_Pass_10 = 0
                    DO
                        IF NOT EOF(90) THEN LINE INPUT #90, file90
                        IF file90 = titleScene1 THEN Test_Pass_10 = Test_Pass_10 + 1
                        IF file90 = titleScene2 THEN Test_Pass_10 = Test_Pass_10 + 2
                        IF file90 = titleScene12 THEN Test_Pass_10 = Test_Pass_10 + 4
                        SELECT CASE Test_Pass_10
                            CASE 0: Test_Pass_10_Value = "TitleScene1, TitleScene2, TitleScene12"
                            CASE 1: Test_Pass_10_Value = "TitleScene2, TitleScene12"
                            CASE 2: Test_Pass_10_Value = "TitleScene1, TitleScene12"
                            CASE 3: Test_Pass_10_Value = "TitleScene12"
                            CASE 4: Test_Pass_10_Value = "TitleScene1, TitleScene2"
                            CASE 5: Test_Pass_10_Value = "TitleScene2"
                            CASE 6: Test_Pass_10_Value = "TitleScene1"
                        END SELECT
                    LOOP UNTIL EOF(90)
                    CLOSE #90
                    IF Test_Pass_10 <> 7 THEN
                        Error_msg = "- OBS scenes are missing. Scene names are case-sensitive and cannot be more than eight words." + CHR$(10) + "- Correctly configure scenes " + c34 + Test_Pass_10_Value + c34 + " in " + c34 + "config.ini" + c34 + " and confirm all scenes contain at least one source."
                        ErrorDisplay (10)
                    END IF
                END IF
            END IF

        END IF
    END IF
    ' ---------------------------------------------------------------

    IF Scene_OK = "" OR Scene_Fail = "" OR Scene_Intro = "" OR OBS_URL = "" THEN RefreshDisplayRequest = 1: Error_msg = "- Variable/s for scenes empty, check if " + c34 + config_main + c34 + " exists. (Error: #3)": _DELAY 3

    IF ConnectionsLog THEN statusConnectionsLogToFile ""
    IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Program launched"

    IF __MultiCameraSwitch = 0 THEN
        Scene_Current = Scene_OK
        SHELL _HIDE _DONTWAIT shell_cmd_1 + Scene_OK + shell_cmd_2
    END IF

    IF __MultiCameraSwitch = 1 THEN
        Scene_Current = titleScene12
        SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene12 + shell_cmd_2
    END IF

    _DELAY 0.05
    _TITLE "Loopy SRT Monitor"

    ' Enable Debug window on startup if enabled
    IF VerBeta <> "" OR ForceDebugOnStartup = "true" THEN
        IF ForceDebugOnStartup <> "false" THEN
            Debug = 1
            Control(DebugFrame).Hidden = False
            Control(versionFrame).Hidden = True
            Control(PictureBoxLogoBottom).Hidden = True
            SetRadioButtonValue OptionsMenuDebug
        END IF
    END IF

    ' Update display: ---------------------------------------------------------------
    IF __MultiCameraSwitch = 0 THEN
        Control(Stream1).Hidden = True
        Control(Stream2).Hidden = True
        Control(StreamUptimeLB).Hidden = True
        Control(failLB).Hidden = True
        Control(Uptime_Stream_1LB).Hidden = True
        Control(Timer_Fail_Stream1LB).Hidden = True
        Control(StreamUptimeLB2).Hidden = True
        Control(failLB2).Hidden = True
        Control(Uptime_Stream_2LB).Hidden = True
        Control(Timer_Fail_Stream2LB).Hidden = True
        ' Low bitrate scene for multiple cameras only
        Control(LowBitrateSceneLB).Hidden = True
        Control(Low_Bitrate_StatusLB).Hidden = True
        SetCaption FailCount2LB, ""
        SetCaption Timer_Fail_Count_2LB, ""
        SetCaption FailCount1LB, "DC / Low bitrate"
        SetCaption FailCount2LB, "Low bitrate scene"
        SetCaption Timer_Fail_Count_2LB, "-" ' This is set in TIMER
    ELSE
        ' Stream #1 only
        SetCaption StreamUptimeLB3, ""
        SetCaption StreamFailTimerLB2, ""
        SetCaption Stream_UptimeLB, ""
        SetCaption Stream_Fail_TimerLB, ""
        SetCaption Low_Bitrate_StatusLB, "-" ' This is set in TIMER
    END IF

    Control(DebugFrame).Hidden = True
    ' Debug Temp
    IF Debug_Temp <> "true" THEN
        Control(DebugFrameTemp).Hidden = True
        Control(DebugTemp1LB).Hidden = True
        Control(DebugTemp2LB).Hidden = True
        Control(DebugTemp3LB).Hidden = True
        Control(DebugTemp4LB).Hidden = True
        Control(DebugTemp1LB2).Hidden = True
        Control(DebugTemp2LB2).Hidden = True
        Control(DebugTemp3LB2).Hidden = True
        Control(DebugTemp4LB2).Hidden = True
    ELSE
        Control(Settings).Hidden = True
    END IF
    Control(versionFrame).Hidden = False
    LoadImageMEM Control(PictureBoxLogoBottom), "srt_logo_bottom.png"
    Control(TimerLB).Hidden = True
    Control(TimerSnapshotLB).Hidden = True
    Control(td_displayLB2).Hidden = True
    Control(mouseXLB2).Hidden = True
    Control(mouseYLB2).Hidden = True
    Control(__ERRORLINELB2).Hidden = True
    Control(Debug_TimerLB).Hidden = True
    Control(Debug_Timer_SnapshotLB).Hidden = True
    Control(td_displayLB).Hidden = True
    Control(mouseXLB).Hidden = True
    Control(mouseYLB).Hidden = True
    Control(__ERRORLINELB).Hidden = True
    Control(LowBRTimerLB).Hidden = True
    Control(br_countdownLB).Hidden = True
    Control(MSRateLB).Hidden = True
    Control(MSRateLB2).Hidden = True
    Control(ms_playLB).Hidden = True
    Control(ms_playLB2).Hidden = True
    Control(LBRDelayLB).Hidden = True
    Control(br_delayLB).Hidden = True
    Control(PictureBoxLogoBottom).Hidden = False
    IF VerBeta = "" THEN SetCaption (versionFrame), "v" + Ver ELSE SetCaption (versionFrame), "v" + VerBeta + "beta"
    ' ---------------------------------------------------------------

    t1 = _FREETIMER
    ON TIMER(t1, 1) Timer01
    TIMER(t1) ON
END SUB

SUB __UI_BeforeUpdateDisplay
    ' This event occurs at approximately 60 frames per second.
    ' You can change the update frequency by calling SetFrameRate DesiredRate%
    IF NOT _WINDOWHASFOCUS THEN SetFrameRate 15 ELSE SetFrameRate 30

    IF RefreshDisplayRequest = 1 THEN
        RefreshDisplayRequest = 0
        TIMER(t1) STOP
        CLS , _RGB(1, 100, 200)
        BSOD& = __imageMEM&("face_sad_x.png")
        _PUTIMAGE (25, 46)-(82, 158), BSOD&
        _FREEIMAGE BSOD&
        COLOR _RGB(254, 254, 254), _RGB(1, 100, 200)
        _PRINTSTRING (20, 12 * 18), "Program encountered an error and needs to restart."
        IF INSTR(Error_msg, CHR$(10)) >= 1 THEN
            _PRINTSTRING (20, 14 * 18), LEFT$(Error_msg, INSTR(Error_msg, CHR$(10)) - 1)
            _PRINTSTRING (20, 15 * 18), MID$(Error_msg, INSTR(Error_msg, CHR$(10)) + 1)
        ELSE
            _PRINTSTRING (20, 14 * 18), Error_msg
        END IF
        IF INSTR(Error_msg_2$, CHR$(10)) >= 1 THEN
            _PRINTSTRING (20, 16 * 18), LEFT$(Error_msg_2$, INSTR(Error_msg_2$, CHR$(10)) - 1)
            _PRINTSTRING (20, 17 * 18), MID$(Error_msg_2$, INSTR(Error_msg_2$, CHR$(10)) + 1)
        ELSE
            _PRINTSTRING (20, 16 * 18), Error_msg_2$
        END IF
        _PRINTSTRING (20, 20 * 18), "Program will resume shortly"
        _DISPLAY
        IF NodejsFileSystem = "2" THEN _DELAY 0.05 ELSE _DELAY 10
        Error_msg = ""
        Error_msg_2$ = ""
        CLS , BG
        TIMER(t1) ON
    END IF

    IF Debug = 1 THEN
        mouseX = _MOUSEX
        mouseY = _MOUSEY
        Debug_Timer = TIMER(.001)
        TIMEms Debug_Timer, 0
        SetCaption (Debug_TimerLB), tout + " sec   "
        TIMEms td_display, 1
        SetCaption (td_displayLB), tout + " sec   "
        SetCaption (mouseXLB), LTRIM$(STR$(mouseX + 1)) + "   "
        SetCaption (mouseYLB), LTRIM$(STR$(mouseY + 1)) + "   "
        SetCaption (__ERRORLINELB), LTRIM$(STR$(_ERRORLINE)) + "   "
    END IF

    IF updateDisplay >= 1 THEN
        updateDisplayCounter = updateDisplayCounter + 1
        IF updateDisplayCounter >= 300 THEN
            file224$ = ""
            verCheck$ = ""
            updateResult$ = ""
            updateDisplay = 0
            updateDisplayCounter = 0
            SetCaption StatusLB, ""
        END IF
    END IF

    IF _EXIT THEN
        IF _FILEEXISTS(filePrevious) THEN KILL filePrevious
        IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
        IF _FILEEXISTS(outputBitrateFile) THEN KILL outputBitrateFile
        IF _FILEEXISTS(outputStatusFile) THEN KILL outputStatusFile
        IF _FILEEXISTS(http_media2_File) THEN KILL http_media2_File
        IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Program exit"
        SYSTEM
    END IF

    ProgressCounter = ProgressCounter + 1 ' | / - \ | / - \
    SELECT CASE ProgressCounter
        CASE 1 TO 8
            SetCaption IndicatorLB, "|"
        CASE 9 TO 16
            SetCaption IndicatorLB, "/"
        CASE 17 TO 24
            SetCaption IndicatorLB, "-"
        CASE 25 TO 32
            SetCaption IndicatorLB, "\"
        CASE 33 TO 40
            SetCaption IndicatorLB, "|"
        CASE 41 TO 48
            SetCaption IndicatorLB, "/"
        CASE 49 TO 56
            SetCaption IndicatorLB, "-"
        CASE 57 TO 64
            SetCaption IndicatorLB, "\"
        CASE IS >= 64
            ProgressCounter = 1
    END SELECT

    ' Change mouse cursor for tooltip
    IF Tooltip_Mouse THEN
        mouseX = _MOUSEX
        mouseY = _MOUSEY
        IF mouseX >= 170 AND mouseX <= 250 AND mouseY >= 75 AND mouseY <= 90 THEN Tooltip_Mouse_Active = 1 ELSE Tooltip_Mouse_Active = 0
        IF __MultiCameraSwitch THEN
            IF mouseX >= 300 AND mouseX <= 380 AND mouseY >= 75 AND mouseY <= 90 AND Tooltip_Mouse_Active = 0 THEN Tooltip_Mouse_Active = 1
        END IF
        IF Tooltip_Mouse_Active THEN _MOUSESHOW "LINK" ELSE _MOUSESHOW "DEFAULT"
    END IF
END SUB

SUB __UI_BeforeUnload
    ' If you set __UI_UnloadSignal = False here you can
    ' cancel the user's request to close.

END SUB

SUB __UI_Click (id AS LONG)
    SELECT CASE id
        CASE BitrateLB

        CASE Bitrate_Stream_1LB

        CASE BitrateLB2

        CASE Bitrate_Stream_2LB

        CASE DebugFrameTemp

        CASE DebugTemp1LB

        CASE DebugTemp2LB

        CASE DebugTemp3LB

        CASE DebugTemp4LB

        CASE DebugTemp1LB2

        CASE DebugTemp2LB2

        CASE DebugTemp3LB2

        CASE DebugTemp4LB2

        CASE OptionsMenuRestoreWindowSize
            IF Allow_Resize = "true" THEN
                _DELAY 0.25
                _RESIZE OFF , _SMOOTH
                _DELAY 0.5
                _RESIZE ON , _SMOOTH
                _DELAY 0.25
            END IF

        CASE LBRDelayLB

        CASE br_delayLB

        CASE Stream1LightLB

        CASE StreamLightLB

        CASE Stream2LightLB

        CASE LoopySRTMonitor

        CASE FileMenu

        CASE OptionsMenu

        CASE HelpMenu

        CASE Status

        CASE Settings

        CASE CurrentScene

        CASE DebugFrame

        CASE Stream1

        CASE Stream2

        CASE versionFrame

        CASE FileMenuExit
            IF _FILEEXISTS(filePrevious) THEN KILL filePrevious
            IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
            IF _FILEEXISTS(outputBitrateFile) THEN KILL outputBitrateFile
            IF _FILEEXISTS(outputStatusFile) THEN KILL outputStatusFile
            IF _FILEEXISTS(http_media2_File) THEN KILL http_media2_File
            IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Program exit"
            SYSTEM

        CASE StreamFailTimerLB

        CASE ServerPingLB

        CASE UpdateIntervalLB

        CASE Timer_FailLB

        CASE Timer_Fail_CountLB

        CASE tPingOutLB

        CASE td_updateLB

        CASE StreamFailDelayLB

        CASE MultiCameraSwitchLB

        CASE Stream_Fail_DelayLB

        CASE MultiCameraSwitchStatusLB

        CASE TimerLB

        CASE TimerSnapshotLB

        CASE td_displayLB2

        CASE mouseXLB2

        CASE mouseYLB2

        CASE __ERRORLINELB2

        CASE Debug_TimerLB

        CASE Debug_Timer_SnapshotLB

        CASE td_displayLB

        CASE mouseXLB

        CASE mouseYLB

        CASE __ERRORLINELB

        CASE StreamUptimeLB

        CASE failLB

        CASE Uptime_Stream_1LB

        CASE Timer_Fail_Stream1LB

        CASE Scene_CurrentLB

        CASE PictureBox1

        CASE StreamUptimeLB2

        CASE failLB2

        CASE Uptime_Stream_2LB

        CASE Timer_Fail_Stream2LB

        CASE OptionsMenuAlwaysOnTop
            IF AlwaysOnTop <> 1 THEN
                AlwaysOnTop = 1
                $IF WIN THEN
                    IF OS = "WINDOWS" THEN y& = SetWindowPos&(Myhwnd, -1, 0, 0, 0, 0, &H2 + &H1 + &H40) ' Windows only
                $END IF
                SetRadioButtonValue OptionsMenuAlwaysOnTop
            ELSE
                AlwaysOnTop = 0
                $IF WIN THEN
                    IF OS = "WINDOWS" THEN y& = SetWindowPos&(Myhwnd, -2, 0, 0, 0, 0, &H2 + &H1 + &H40) ' Windows only
                $END IF
                SetRadioButtonValue OptionsMenuAlwaysOnTop
            END IF

        CASE OptionsMenuDebug
            IF Debug <> 1 THEN
                Debug = 1
                Control(DebugFrame).Hidden = False
                Control(versionFrame).Hidden = True
                Control(PictureBoxLogoBottom).Hidden = True
                SetRadioButtonValue OptionsMenuDebug
            ELSE
                Debug = 0
                Control(versionFrame).Hidden = True
                Control(PictureBoxLogoBottom).Hidden = True
                SetRadioButtonValue OptionsMenuDebug
            END IF

        CASE HelpMenuVisitWebsite
            ' Set OS variables
            SELECT CASE OS
                CASE "WINDOWS"
                    SHELL _HIDE _DONTWAIT "%ComSpec% /C START " + c34 + c34 + " /B https://github.com/loopy750/SRT-Stats-Monitor"
                CASE "LINUX"
                    SHELL _HIDE _DONTWAIT "xdg-open https://github.com/loopy750/SRT-Stats-Monitor"
            END SELECT

        CASE HelpMenuCheckForUpdates
            ' Check for new version
            verCheck$ = "Checking for new version..."
            SetCaption StatusLB, verCheck$
            file224$ = ""
            updateResult$ = ""
            _DELAY 0.25
            ' Set OS variables
            SELECT CASE OS
                CASE "WINDOWS"
                    SHELL _HIDE "%ComSpec% /C curl -H " + c34 + "Cache-Control: no-cache" + c34 + " https://raw.githubusercontent.com/loopy750/SRT-Stats-Monitor-Version/master/checkversion.txt > " + c34 + fileCheckVersion + c34 + ""
                CASE "LINUX"
                    SHELL _HIDE "curl -H " + c34 + "Cache-Control: no-cache" + c34 + " https://raw.githubusercontent.com/loopy750/SRT-Stats-Monitor-Version/master/checkversion.txt > " + c34 + fileCheckVersion + c34 + ""
            END SELECT
            _DELAY 0.25
            IF _FILEEXISTS(fileCheckVersion) THEN
                OPEN fileCheckVersion FOR INPUT AS #224
                DO UNTIL EOF(224)
                    IF LOF(224) = 0 THEN NoKill = 1: EXIT DO ' Overkill with EOF checking, but just being safe
                    IF EOF(224) THEN EXIT DO
                    LINE INPUT #224, file224$
                LOOP
            END IF
            CLOSE #224
            IF _FILEEXISTS(fileCheckVersion) THEN KILL fileCheckVersion
            updateResult$ = file224$
            IF file224$ <> Ver THEN verCheck$ = "New version is available (v" + _TRIM$(LEFT$(updateResult$, 10)) + ")..."
            IF file224$ = "" OR file224$ = "404: Not Found" THEN verCheck$ = "Unable to check for new version..."
            IF file224$ = Ver THEN verCheck$ = "This is the latest version (v" + _TRIM$(LEFT$(Ver, 10)) + ")..."
            IF verCheck <> "" THEN updateDisplayCounter = 0

        CASE OptionsMenuFullscreen
            IF FullScreen <> 1 THEN
                FullScreen = 1
                _FULLSCREEN _SQUAREPIXELS , _SMOOTH
                SetRadioButtonValue OptionsMenuFullscreen
            ELSE
                FullScreen = 0
                _FULLSCREEN _OFF
                SetRadioButtonValue OptionsMenuFullscreen
            END IF

        CASE IndicatorLB

        CASE HelpMenuAbout
            IF VerBeta = "" THEN
                IF VerPortable = "false" THEN
                    Answer = MessageBox("Loopy SRT Stats Monitor v" + Ver + " (" + VerDate + ") \nby loopy750\n\nOBS WebSocket version:" + checkWebSocketVersion$ + "\n\nGitHub: https://www.github.com/loopy750", "About", MsgBox_OkOnly + MsgBox_Information)
                ELSE
                    Answer = MessageBox("Loopy SRT Stats Monitor v" + Ver + " (" + VerDate + ") \nPortable version\nby loopy750\n\nOBS WebSocket version:" + checkWebSocketVersion$ + "\n\nGitHub: https://www.github.com/loopy750", "About", MsgBox_OkOnly + MsgBox_Information)
                END IF
            ELSE
                IF VerPortable = "false" THEN
                    Answer = MessageBox("Loopy SRT Stats Monitor v" + VerBeta + "beta (" + VerDate + ") \nby loopy750\n\nOBS WebSocket version: " + checkWebSocketVersion$ + "\n\nGitHub: https://www.github.com/loopy750", "About", MsgBox_OkOnly + MsgBox_Information)
                ELSE
                    Answer = MessageBox("Loopy SRT Stats Monitor v" + VerBeta + "beta (" + VerDate + ") \nPortable version\nby loopy750\n\nOBS WebSocket version: " + checkWebSocketVersion$ + "\n\nGitHub: https://www.github.com/loopy750", "About", MsgBox_OkOnly + MsgBox_Information)
                END IF
            END IF

        CASE StatusLB

        CASE PictureBoxLogoBottom

        CASE StreamUptimeLB3

        CASE StreamFailTimerLB2

        CASE Stream_UptimeLB

        CASE Stream_Fail_TimerLB

        CASE Timer_Fail_Count_2LB

        CASE IPPingLB

        CASE tIPPingOutLB

        CASE FailCount2LB

        CASE FailCount1LB

        CASE LowBRTimerLB

        CASE br_countdownLB

        CASE MSRateLB

        CASE ms_playLB

        CASE LowBitrateSceneLB

        CASE Low_Bitrate_StatusLB

        CASE MSRateLB2

        CASE ms_playLB2

    END SELECT
END SUB

SUB __UI_MouseEnter (id AS LONG)
    SELECT CASE id
        CASE BitrateLB

        CASE Bitrate_Stream_1LB

        CASE BitrateLB2

        CASE Bitrate_Stream_2LB

        CASE DebugFrameTemp

        CASE DebugTemp1LB

        CASE DebugTemp2LB

        CASE DebugTemp3LB

        CASE DebugTemp4LB

        CASE DebugTemp1LB2

        CASE DebugTemp2LB2

        CASE DebugTemp3LB2

        CASE DebugTemp4LB2

        CASE OptionsMenuRestoreWindowSize

        CASE LBRDelayLB

        CASE br_delayLB

        CASE Stream1LightLB

        CASE StreamLightLB

        CASE Stream2LightLB

        CASE OptionsMenuAlwaysOnTop

        CASE LoopySRTMonitor

        CASE FileMenu

        CASE OptionsMenu

        CASE HelpMenu

        CASE Status

        CASE Settings

        CASE CurrentScene

        CASE DebugFrame

        CASE Stream1

        CASE Stream2

        CASE versionFrame

        CASE FileMenuExit

        CASE StreamFailTimerLB

        CASE ServerPingLB

        CASE UpdateIntervalLB

        CASE Timer_FailLB

        CASE Timer_Fail_CountLB

        CASE tPingOutLB

        CASE td_updateLB

        CASE StreamFailDelayLB

        CASE MultiCameraSwitchLB

        CASE Stream_Fail_DelayLB

        CASE MultiCameraSwitchStatusLB

        CASE TimerLB

        CASE TimerSnapshotLB

        CASE td_displayLB2

        CASE mouseXLB2

        CASE mouseYLB2

        CASE __ERRORLINELB2

        CASE Debug_TimerLB

        CASE Debug_Timer_SnapshotLB

        CASE td_displayLB

        CASE mouseXLB

        CASE mouseYLB

        CASE __ERRORLINELB

        CASE StreamUptimeLB

        CASE failLB

        CASE Uptime_Stream_1LB

        CASE Timer_Fail_Stream1LB

        CASE Scene_CurrentLB

        CASE PictureBox1

        CASE StreamUptimeLB2

        CASE failLB2

        CASE Uptime_Stream_2LB

        CASE Timer_Fail_Stream2LB

        CASE OptionsMenuDebug

        CASE HelpMenuVisitWebsite

        CASE HelpMenuCheckForUpdates

        CASE OptionsMenuFullscreen

        CASE IndicatorLB

        CASE HelpMenuAbout

        CASE StatusLB

        CASE PictureBoxLogoBottom

        CASE StreamUptimeLB3

        CASE StreamFailTimerLB2

        CASE Stream_UptimeLB

        CASE Stream_Fail_TimerLB

        CASE Timer_Fail_Count_2LB

        CASE IPPingLB

        CASE tIPPingOutLB

        CASE FailCount2LB

        CASE FailCount1LB

        CASE LowBRTimerLB

        CASE br_countdownLB

        CASE MSRateLB

        CASE ms_playLB

        CASE LowBitrateSceneLB

        CASE Low_Bitrate_StatusLB

        CASE MSRateLB2

        CASE ms_playLB2

    END SELECT
END SUB

SUB __UI_MouseLeave (id AS LONG)
    SELECT CASE id
        CASE BitrateLB

        CASE Bitrate_Stream_1LB

        CASE BitrateLB2

        CASE Bitrate_Stream_2LB

        CASE DebugFrameTemp

        CASE DebugTemp1LB

        CASE DebugTemp2LB

        CASE DebugTemp3LB

        CASE DebugTemp4LB

        CASE DebugTemp1LB2

        CASE DebugTemp2LB2

        CASE DebugTemp3LB2

        CASE DebugTemp4LB2

        CASE OptionsMenuRestoreWindowSize

        CASE LBRDelayLB

        CASE br_delayLB

        CASE Stream1LightLB

        CASE StreamLightLB

        CASE Stream2LightLB

        CASE OptionsMenuAlwaysOnTop

        CASE LoopySRTMonitor

        CASE FileMenu

        CASE OptionsMenu

        CASE HelpMenu

        CASE Status

        CASE Settings

        CASE CurrentScene

        CASE DebugFrame

        CASE Stream1

        CASE Stream2

        CASE versionFrame

        CASE FileMenuExit

        CASE StreamFailTimerLB

        CASE ServerPingLB

        CASE UpdateIntervalLB

        CASE Timer_FailLB

        CASE Timer_Fail_CountLB

        CASE tPingOutLB

        CASE td_updateLB

        CASE StreamFailDelayLB

        CASE MultiCameraSwitchLB

        CASE Stream_Fail_DelayLB

        CASE MultiCameraSwitchStatusLB

        CASE TimerLB

        CASE TimerSnapshotLB

        CASE td_displayLB2

        CASE mouseXLB2

        CASE mouseYLB2

        CASE __ERRORLINELB2

        CASE Debug_TimerLB

        CASE Debug_Timer_SnapshotLB

        CASE td_displayLB

        CASE mouseXLB

        CASE mouseYLB

        CASE __ERRORLINELB

        CASE StreamUptimeLB

        CASE failLB

        CASE Uptime_Stream_1LB

        CASE Timer_Fail_Stream1LB

        CASE Scene_CurrentLB

        CASE PictureBox1

        CASE StreamUptimeLB2

        CASE failLB2

        CASE Uptime_Stream_2LB

        CASE Timer_Fail_Stream2LB

        CASE OptionsMenuDebug

        CASE HelpMenuVisitWebsite

        CASE HelpMenuCheckForUpdates

        CASE OptionsMenuFullscreen

        CASE IndicatorLB

        CASE HelpMenuAbout

        CASE StatusLB

        CASE PictureBoxLogoBottom

        CASE StreamUptimeLB3

        CASE StreamFailTimerLB2

        CASE Stream_UptimeLB

        CASE Stream_Fail_TimerLB

        CASE Timer_Fail_Count_2LB

        CASE IPPingLB

        CASE tIPPingOutLB

        CASE FailCount2LB

        CASE FailCount1LB

        CASE LowBRTimerLB

        CASE br_countdownLB

        CASE MSRateLB

        CASE ms_playLB

        CASE LowBitrateSceneLB

        CASE Low_Bitrate_StatusLB

        CASE MSRateLB2

        CASE ms_playLB2

    END SELECT
END SUB

SUB __UI_FocusIn (id AS LONG)
    SELECT CASE id
        CASE 0
    END SELECT
END SUB

SUB __UI_FocusOut (id AS LONG)
    ' This event occurs right before a control loses focus.
    ' To prevent a control from losing focus, set __UI_KeepFocus = True below.
    SELECT CASE id
        CASE 0
    END SELECT
END SUB

SUB __UI_MouseDown (id AS LONG)
    SELECT CASE id
        CASE BitrateLB

        CASE Bitrate_Stream_1LB

        CASE BitrateLB2

        CASE Bitrate_Stream_2LB

        CASE DebugFrameTemp

        CASE DebugTemp1LB

        CASE DebugTemp2LB

        CASE DebugTemp3LB

        CASE DebugTemp4LB

        CASE DebugTemp1LB2

        CASE DebugTemp2LB2

        CASE DebugTemp3LB2

        CASE DebugTemp4LB2

        CASE OptionsMenuRestoreWindowSize

        CASE LBRDelayLB

        CASE br_delayLB

        CASE Stream1LightLB

        CASE StreamLightLB

        CASE Stream2LightLB

        CASE OptionsMenuAlwaysOnTop

        CASE LoopySRTMonitor

        CASE FileMenu

        CASE OptionsMenu

        CASE HelpMenu

        CASE Status

        CASE Settings

        CASE CurrentScene

        CASE DebugFrame

        CASE Stream1

        CASE Stream2

        CASE versionFrame

        CASE FileMenuExit

        CASE StreamFailTimerLB

        CASE ServerPingLB

        CASE UpdateIntervalLB

        CASE Timer_FailLB

        CASE Timer_Fail_CountLB

        CASE tPingOutLB

        CASE td_updateLB

        CASE StreamFailDelayLB

        CASE MultiCameraSwitchLB

        CASE Stream_Fail_DelayLB

        CASE MultiCameraSwitchStatusLB

        CASE TimerLB

        CASE TimerSnapshotLB

        CASE td_displayLB2

        CASE mouseXLB2

        CASE mouseYLB2

        CASE __ERRORLINELB2

        CASE Debug_TimerLB

        CASE Debug_Timer_SnapshotLB

        CASE td_displayLB

        CASE mouseXLB

        CASE mouseYLB

        CASE __ERRORLINELB

        CASE StreamUptimeLB

        CASE failLB

        CASE Uptime_Stream_1LB

        CASE Timer_Fail_Stream1LB

        CASE Scene_CurrentLB

        CASE PictureBox1

        CASE StreamUptimeLB2

        CASE failLB2

        CASE Uptime_Stream_2LB

        CASE Timer_Fail_Stream2LB

        CASE OptionsMenuDebug

        CASE HelpMenuVisitWebsite

        CASE HelpMenuCheckForUpdates

        CASE OptionsMenuFullscreen

        CASE IndicatorLB

        CASE HelpMenuAbout

        CASE StatusLB

        CASE PictureBoxLogoBottom

        CASE StreamUptimeLB3

        CASE StreamFailTimerLB2

        CASE Stream_UptimeLB

        CASE Stream_Fail_TimerLB

        CASE Timer_Fail_Count_2LB

        CASE IPPingLB

        CASE tIPPingOutLB

        CASE FailCount2LB

        CASE FailCount1LB

        CASE LowBRTimerLB

        CASE br_countdownLB

        CASE MSRateLB

        CASE ms_playLB

        CASE LowBitrateSceneLB

        CASE Low_Bitrate_StatusLB

        CASE MSRateLB2

        CASE ms_playLB2

    END SELECT
END SUB

SUB __UI_MouseUp (id AS LONG)
    SELECT CASE id
        CASE BitrateLB

        CASE Bitrate_Stream_1LB

        CASE BitrateLB2

        CASE Bitrate_Stream_2LB

        CASE DebugFrameTemp

        CASE DebugTemp1LB

        CASE DebugTemp2LB

        CASE DebugTemp3LB

        CASE DebugTemp4LB

        CASE DebugTemp1LB2

        CASE DebugTemp2LB2

        CASE DebugTemp3LB2

        CASE DebugTemp4LB2

        CASE OptionsMenuRestoreWindowSize

        CASE LBRDelayLB

        CASE br_delayLB

        CASE Stream1LightLB

        CASE StreamLightLB

        CASE Stream2LightLB

        CASE OptionsMenuAlwaysOnTop

        CASE LoopySRTMonitor

        CASE FileMenu

        CASE OptionsMenu

        CASE HelpMenu

        CASE Status

        CASE Settings

        CASE CurrentScene

        CASE DebugFrame

        CASE Stream1

        CASE Stream2

        CASE versionFrame

        CASE FileMenuExit

        CASE StreamFailTimerLB

        CASE ServerPingLB

        CASE UpdateIntervalLB

        CASE Timer_FailLB

        CASE Timer_Fail_CountLB

        CASE tPingOutLB

        CASE td_updateLB

        CASE StreamFailDelayLB

        CASE MultiCameraSwitchLB

        CASE Stream_Fail_DelayLB

        CASE MultiCameraSwitchStatusLB

        CASE TimerLB

        CASE TimerSnapshotLB

        CASE td_displayLB2

        CASE mouseXLB2

        CASE mouseYLB2

        CASE __ERRORLINELB2

        CASE Debug_TimerLB

        CASE Debug_Timer_SnapshotLB

        CASE td_displayLB

        CASE mouseXLB

        CASE mouseYLB

        CASE __ERRORLINELB

        CASE StreamUptimeLB

        CASE failLB

        CASE Uptime_Stream_1LB

        CASE Timer_Fail_Stream1LB

        CASE Scene_CurrentLB

        CASE PictureBox1

        CASE StreamUptimeLB2

        CASE failLB2

        CASE Uptime_Stream_2LB

        CASE Timer_Fail_Stream2LB

        CASE OptionsMenuDebug

        CASE HelpMenuVisitWebsite

        CASE HelpMenuCheckForUpdates

        CASE OptionsMenuFullscreen

        CASE IndicatorLB

        CASE HelpMenuAbout

        CASE StatusLB

        CASE PictureBoxLogoBottom

        CASE StreamUptimeLB3

        CASE StreamFailTimerLB2

        CASE Stream_UptimeLB

        CASE Stream_Fail_TimerLB

        CASE Timer_Fail_Count_2LB

        CASE IPPingLB

        CASE tIPPingOutLB

        CASE FailCount2LB

        CASE FailCount1LB

        CASE LowBRTimerLB

        CASE br_countdownLB

        CASE MSRateLB

        CASE ms_playLB

        CASE LowBitrateSceneLB

        CASE Low_Bitrate_StatusLB

        CASE MSRateLB2

        CASE ms_playLB2

    END SELECT
END SUB

SUB __UI_KeyPress (id AS LONG)
    ' When this event is fired, __UI_KeyHit will contain the code of the key hit.
    ' You can change it and even cancel it by making it = 0
    SELECT CASE id
        CASE 0
    END SELECT
END SUB

SUB __UI_TextChanged (id AS LONG)
    SELECT CASE id
        CASE 0
    END SELECT
END SUB

SUB __UI_ValueChanged (id AS LONG)
    SELECT CASE id
        CASE 0
    END SELECT
END SUB

SUB __UI_FormResized

END SUB

' The following code has been manually added after InForm
SUB TIMEms (tout1#, plus)

    TIMER(t1) STOP
    tout = ""
    tout2# = tout1#
    toutint# = FIX(tout2#)
    IF tout1# >= 0 THEN
        toutdec# = (tout2# - toutint#) + 1
        IF plus THEN tout = tout + "+"
    ELSE
        toutdec# = (tout2# - toutint#) - 1
        IF toutint# = 0 THEN tout = tout + "-"
    END IF
    tout = tout + LTRIM$(STR$(toutint#))
    IF tout1# >= 0 THEN tout = tout + "." + MID$(LTRIM$(STR$(toutdec#)), 3, 3) ELSE tout = tout + "." + MID$(LTRIM$(STR$(toutdec#)), 4, 3)
    IF LEN(STR$(toutdec#)) = 5 THEN tout = tout + "0"
    IF LEN(STR$(toutdec#)) = 4 THEN tout = tout + "00"
    IF LEN(STR$(toutdec#)) = 2 THEN tout = tout + "000" ' Output to tout
    TIMER(t1) ON

END SUB

SUB calcbw (bout#, bits)

    TIMER(t1) STOP
    bout = ""
    bout2# = bout#
    boutnodec = 0

    IF bits = 0 THEN
        SELECT CASE bout2#
            CASE IS < 1048576
                boutint# = bout2# / 1024
                boutm$ = "KB"
            CASE IS < 1073741824
                boutint# = bout2# / 1048576
                boutm$ = "MB"
            CASE IS >= 1073741824
                boutint# = bout2# / 1073741824
                boutm$ = "GB"
        END SELECT
        boutdec# = boutint# + 1
        boutint# = FIX(boutint#)
        bout = STR$(boutint#)
        IF boutdec# = FIX(boutdec#) THEN
            boutdec$ = "000"
        ELSE
            boutdec$ = MID$(LTRIM$(STR$(boutdec#)), INSTR(LTRIM$(STR$(boutdec#)), ".") + 1, 3)
        END IF
        IF LEN(LTRIM$(STR$(boutint#))) >= 5 THEN
            boutdec$ = LEFT$(boutdec$, 1)
        ELSE
            IF LEN(boutdec$) = 2 THEN boutdec$ = boutdec$ + "0"
            IF LEN(boutdec$) = 1 THEN boutdec$ = boutdec$ + "00"
            IF LEN(boutdec$) = 0 THEN boutdec$ = boutdec$ + "000"
        END IF
        IF bout# < 1073741824 THEN boutdec$ = LEFT$(boutdec$, 2)
        bout = bout + "." + boutdec$ + " " + boutm$ ' Output to bout
    ELSE
        SELECT CASE bout2#
            CASE IS < 1048576
                boutint# = bout2# / 1024
                boutm$ = "Kb/s"
                boutnodec = 1
            CASE IS < 1073741824
                boutint# = bout2# / 1048576
                boutm$ = "Mb/s"
            CASE IS > 1073741824
                boutint# = bout2# / 1073741824
                boutm$ = "Gb/s"
        END SELECT
        boutdec# = boutint# + 1
        boutint# = FIX(boutint#)
        bout = STR$(boutint#)
        IF boutdec# = FIX(boutdec#) THEN
            boutdec$ = "00"
        ELSE
            boutdec$ = MID$(LTRIM$(STR$(boutdec#)), INSTR(LTRIM$(STR$(boutdec#)), ".") + 1, 2)
        END IF
        IF LEN(LTRIM$(STR$(boutint#))) >= 5 THEN boutdec$ = LEFT$(boutdec$, 1)
        boutdec$ = "." + boutdec$
        IF boutnodec = 1 THEN boutdec$ = ""
        bout = bout + boutdec$ + " " + boutm$ ' Output to bout
    END IF
    TIMER(t1) ON

END SUB

FUNCTION calc_srt$ (convertTime#, includeSec)

    TIMER(t1) STOP
    IF convertTime# > 3596400 THEN convertTime# = 3596400
    t_hr = convertTime# \ 3600
    t_min = (convertTime# - (3600 * t_hr)) \ 60
    t_sec = (convertTime# - (3600 * t_hr)) - (t_min * 60)
    SELECT CASE leadingZero
        CASE 0
            calc_srt$ = LTRIM$(STR$(t_hr)) + "h " + LTRIM$(STR$(t_min)) + "m "
            calc_srt_sec$ = ""
            IF includeSec = 1 THEN calc_srt_sec$ = LTRIM$(STR$(t_sec)) + "s   "
        CASE 1
            IF t_hr < 10 THEN calc_srt_hr_min$ = "0" + LTRIM$(STR$(t_hr)) + "h " ELSE calc_srt_hr_min$ = LTRIM$(STR$(t_hr)) + "h "
            IF t_min < 10 THEN calc_srt_hr_min$ = calc_srt_hr_min$ + "0" + LTRIM$(STR$(t_min)) + "m " ELSE calc_srt$ = calc_srt_hr_min$ + LTRIM$(STR$(t_min)) + "m "
            calc_srt$ = calc_srt_hr_min$
            calc_srt_sec$ = ""
            IF includeSec = 1 THEN IF t_sec < 10 THEN calc_srt_sec$ = "0" + LTRIM$(STR$(t_sec)) + "s   " ELSE calc_srt_sec$ = LTRIM$(STR$(t_sec)) + "s   "
    END SELECT
    TIMER(t1) ON

END FUNCTION

SUB statusOutputToFile (outputMSG$)

    TIMER(t1) STOP
    OPEN outputStatusFile FOR OUTPUT AS #48
    PRINT #48, outputMSG$
    CLOSE #48
    TIMER(t1) ON

END SUB

SUB statusBitrateToFile (outputBR$)

    TIMER(t1) STOP
    OPEN outputBitrateFile FOR OUTPUT AS #56
    PRINT #56, outputBR$
    CLOSE #56
    TIMER(t1) ON

END SUB

SUB statusConnectionsLogToFile (outputCL$)

    TIMER(t1) STOP
    OPEN outputConnectionsLogFile FOR APPEND AS #60
    IF outputCL$ = "" AND LOF(60) THEN
        PRINT #60, outputCL$
    ELSEIF outputCL$ <> "" THEN
        PRINT #60, "[" + DATE$ + "] [" + TIME$ + "] " + outputCL$
    END IF
    CLOSE #60
    TIMER(t1) ON

END SUB

SUB ErrorDisplay (ErrorTestVal)

    IF Error_msg <> "" THEN
        _DELAY 1
        CLS , _RGB(1, 100, 200)

        ' Error 6 message
        IF ErrorTestVal = 6 THEN
            BSOD& = __imageMEM&("is_obs_open.png")
            _PUTIMAGE (195, 27)-(605, 90), BSOD&
            _FREEIMAGE BSOD&
        END IF

        BSOD& = __imageMEM&("face_sad_x.png")
        _PUTIMAGE (25, 46)-(82, 158), BSOD&
        _FREEIMAGE BSOD&
        COLOR _RGB(254, 254, 254), _RGB(1, 100, 200)
        _PRINTSTRING (20, 12 * 18), "> Test #" + _TRIM$(STR$(ErrorTestVal)) + " of 10 failed"
        IF INSTR(Error_msg, CHR$(10)) >= 1 THEN
            _PRINTSTRING (20, 14 * 18), LEFT$(Error_msg, INSTR(Error_msg, CHR$(10)) - 1)
            _PRINTSTRING (20, 15 * 18), MID$(Error_msg, INSTR(Error_msg, CHR$(10)) + 1)
        ELSE
            _PRINTSTRING (20, 14 * 18), Error_msg
        END IF
        _PRINTSTRING (20, 20 * 18), "Program will exit shortly or press any key to exit now..."
        _DISPLAY
        _DELAY 0.5
        FOR Error_Exit = 1 TO 60
            _DELAY 0.5
            IF _EXIT THEN SYSTEM
            IF INKEY$ <> "" THEN SYSTEM
        NEXT
        SYSTEM
    END IF

END SUB

FUNCTION GetKey$ (keyname AS STRING, JSON AS STRING)
    ' Credit to SpriggsySpriggs
    DIM jkey AS STRING
    IF INSTR(JSON, CHR$(34) + keyname + CHR$(34)) THEN
        jkey = MID$(JSON, INSTR(JSON, CHR$(34) + keyname + CHR$(34)) + LEN(keyname))
        jkey = MID$(jkey, INSTR(jkey, ":") + 2)
        IF MID$(jkey, 1, 1) = CHR$(34) THEN
            jkey = MID$(jkey, 2)
        END IF
        jkey = MID$(jkey, 1, INSTR(jkey, CHR$(34)) - 1)
        IF RIGHT$(jkey, 1) = "," THEN
            jkey = MID$(jkey, 1, LEN(jkey) - 1)
        END IF
    ELSE
        GetKey = ""
    END IF
    GetKey = jkey
END FUNCTION

SUB GetAllKey (keyname AS STRING, JSON AS STRING, ParseKey() AS STRING)
    ' Credit to SpriggsySpriggs
    DIM jkey AS STRING
    DIM x_JSON
    DO
        IF INSTR(JSON, CHR$(34) + keyname + CHR$(34)) THEN
            x_JSON = x_JSON + 1
            REDIM _PRESERVE ParseKey(x_JSON) AS STRING
            JSON = MID$(JSON, INSTR(JSON, CHR$(34) + keyname + CHR$(34)) + LEN(keyname))
            jkey = JSON
            jkey = MID$(jkey, INSTR(jkey, ":") + 2)
            IF MID$(jkey, 1, 1) = CHR$(34) THEN
                jkey = MID$(jkey, 2)
            END IF
            jkey = MID$(jkey, 1, INSTR(jkey, CHR$(34)) - 1)
            IF RIGHT$(jkey, 1) = "," THEN
                jkey = MID$(jkey, 1, LEN(jkey) - 1)
            END IF
            ParseKey(x_JSON) = jkey
        END IF
    LOOP UNTIL INSTR(JSON, CHR$(34) + keyname + CHR$(34)) = 0
END SUB

SUB sls_client_connect

    ' Reset SLS data
    SLS_GET_a = "": SLS_GET_a2 = "": SLS_GET_i = 0: SLS_GET_i2 = 0: SLS_GET_i3 = 0: SLS_GET_l = 0: SLS_GET_d = "": sls_stats.xml = "": SLS_Bitrate1 = 0: SLS_Bitrate2 = 0
    SLS_streams_found = 0: SLS_Uptime1 = 0: SLS_Uptime2 = 0: SLS_streams_seek = 0

    SLS_Ping1 = TIMER(.001)
    sls_client = _OPENCLIENT(SLS_Port_Client + SLS_Server_IP)

    IF sls_client = 0 THEN RefreshDisplayRequest = 1: Error_msg$ = "- Unable to connect, check if " + c34 + SLS_Server_IP + ":" + SLS_Server_Port + c34 + " is correct." + CHR$(10) + "- Program is unable to read the SRT /stat URL from its http server. (Error: #4)": _DELAY 3: EXIT SUB

    ON ERROR GOTO App_Fail
    App_Refresh = 1

    PUT #sls_client, , SLS_Header

    SLS_Ping2 = TIMER(.001)
    SLS_PingOut = (SLS_Ping2 - SLS_Ping1)

    ' Connect to SRT Live Server and grab json data
    SLS_Timer_GET = TIMER
    DO
        _DELAY 0.01
        GET #sls_client, , SLS_GET_a2
        SLS_GET_a = SLS_GET_a + SLS_GET_a2
        SLS_GET_i = INSTR(SLS_GET_a, "Content-Length:")
        IF SLS_GET_i THEN
            SLS_GET_i2 = INSTR(SLS_GET_i, SLS_GET_a, SLS_EOL)
            IF SLS_GET_i2 THEN
                SLS_GET_l = VAL(MID$(SLS_GET_a, SLS_GET_i + 15, SLS_GET_i2 - SLS_GET_i - 14))
                SLS_GET_i3 = INSTR(SLS_GET_i2, SLS_GET_a, SLS_EOL + SLS_EOL)
                IF SLS_GET_i3 THEN
                    SLS_GET_i3 = SLS_GET_i3 + 4 'move i3 to start of data
                    IF (LEN(SLS_GET_a) - SLS_GET_i3 + 1) = SLS_GET_l THEN
                        CLOSE sls_client ' CLOSE CLIENT
                        SLS_GET_d = MID$(SLS_GET_a, SLS_GET_i3, SLS_GET_l)
                        EXIT DO
                    END IF ' available data = l
                END IF ' i3
            END IF ' i2
        END IF ' i
    LOOP UNTIL TIMER > SLS_Timer_GET + 3 ' 3 second timeout
    CLOSE sls_client

    ' Store json data in sls_stats.xml
    sls_stats.xml = SLS_GET_d

END SUB

SUB Multi0 (serverType$)

    ' Cancel cooldown if stream has stopped
    ' It's not required for single camera, but it will exit LBR quicker on playback stop
    IF Scene_Current = Scene_LBR AND Timer_Fail_Stream1 >= 1 THEN CooldownLog = 0
    IF SceneLBActive = 0 AND Timer_Fail_Stream1 >= 1 THEN CooldownLog = 0

    MediaSource1TimeLog = MediaSource1TimeMS

    SELECT CASE serverType$
        CASE "SRT"
            ' NodeJSFileSystem selection controls this
            SELECT CASE NodejsFileSystem
                CASE "0"
                    IF HTTP_Enabled = "true" THEN
                        SELECT CASE HTTP_Access
                            CASE "fast"
                                SHELL _HIDE CMD_EXE_HTTP_FAST_GET_MEDIA1
                            CASE ELSE
                                SHELL _HIDE CMD_EXE_HTTP_GET_MEDIA1
                        END SELECT
                    ELSE
                        IF Nodejs_Access = "fast" THEN
                            SHELL _HIDE CMD_EXE_FAST + c34 + obs_get_media1 + c34
                        ELSE
                            SHELL _HIDE CMD_EXE + c34 + obs_get_media1 + c34 + " > " + c34 + filePrevious_ms + c34
                            _DELAY 0.001
                        END IF
                    END IF
                CASE "1"
                    _DEST _CONSOLE
                    IF FullScreen THEN
                        IF HTTP_Enabled = "true" THEN
                            SELECT CASE HTTP_Access
                                CASE "fast"
                                    SHELL _HIDE CMD_EXE_HTTP_FAST_GET_MEDIA1
                                CASE ELSE
                                    SHELL _HIDE CMD_EXE_HTTP_GET_MEDIA1
                            END SELECT
                        ELSE
                            IF Nodejs_Access = "fast" THEN
                                SHELL _HIDE CMD_EXE_FAST + c34 + obs_get_media1 + c34
                            ELSE
                                SHELL _HIDE CMD_EXE + c34 + obs_get_media1 + c34 + " > " + c34 + filePrevious_ms + c34
                                _DELAY 0.001
                            END IF
                        END IF
                    ELSE
                        IF HTTP_Enabled = "true" THEN
                            SELECT CASE HTTP_Access
                                CASE "fast"
                                    SHELL CMD_EXE_HTTP_FAST_GET_MEDIA1
                                CASE ELSE
                                    SHELL CMD_EXE_HTTP_GET_MEDIA1
                            END SELECT
                        ELSE
                            IF Nodejs_Access = "fast" THEN
                                SHELL CMD_EXE_FAST + c34 + obs_get_media1 + c34
                            ELSE
                                SHELL CMD_EXE + c34 + obs_get_media1 + c34 + " > " + c34 + filePrevious_ms + c34
                                _DELAY 0.001
                            END IF
                        END IF
                    END IF
                    _DEST 0
                    _DELAY 0.001
                CASE "2"
                    IF srt_warmup_file_media = 0 THEN
                        srt_warmup_file_media = 1
                        ' Set OS variables
                        SELECT CASE OS
                            CASE "WINDOWS"
                                ' Removed because m/js file creates this: + " > " + c34 + filePrevious_ms + c34
                                SHELL _DONTWAIT "node.exe " + c34 + obs_get_media1_scene + c34
                            CASE "LINUX"
                                ' Removed because m/js file creates this: + " > " + c34 + filePrevious_ms + c34
                                SHELL _DONTWAIT "node " + c34 + obs_get_media1_scene + c34
                        END SELECT
                        _DELAY 1
                        $IF WIN THEN
                            IF OS = "WINDOWS" THEN y& = SetWindowPos&(Myhwnd, -1, 0, 0, 0, 0, &H2 + &H1 + &H40) ' Windows only
                        $END IF
                        _DELAY 3.5
                        $IF WIN THEN
                            IF OS = "WINDOWS" THEN y& = SetWindowPos&(Myhwnd, -2, 0, 0, 0, 0, &H2 + &H1 + &H40) ' Windows only
                        $END IF
                    END IF
            END SELECT

            ON ERROR GOTO App_Fail
            App_Refresh = 1

            IF _FILEEXISTS(filePrevious_ms) THEN

                IF HTTP_Enabled <> "true" THEN ' HTTP

                    OPEN filePrevious_ms FOR INPUT AS #92

                    tmpFileError = 0
                    IF EOF(92) THEN
                        IF NodejsFileSystem = "2" THEN ' There is an increased chance an empty tmp file might be read at any time when the external node.js window is used
                            ' RefreshDisplayRequest not used here
                            Error_msg = "- Unable to read tmp file. (Error: #11)"
                            Error_msg_2$ = ""
                            tmpFileError = 1 ' LBR will be falsely triggered because of an empty tmp file unless corrected
                            tmpFileRestore = 1
                            _DELAY 0.05
                            GOTO LOF92
                        ELSE
                            RefreshDisplayRequest = 1
                            Error_msg = "- Unable to read " + c34 + "SceneOK" + c34 + ", check " + c34 + "config.ini" + c34 + " & OBS to confirm it's correct." + CHR$(10) + "- If OBS is open, check communication is available via Node.js & obs-websocket-js.": Error_msg_2$ = "- If Node.js is installed, check " + c34 + "Restart playback" + c34 + " is disabled in OBS " + c34 + "Media Source" + c34 + "." + CHR$(10) + "- If " + c34 + "Restart playback" + c34 + " is disabled, check OBS WebSockets options are correctly set. (Error: #9)"
                            _DELAY 3
                            GOTO LOF92
                        END IF
                    END IF

                    IF LOF(92) = 0 THEN NoKill = 1: GOTO LOF92 ' Overkill with EOF checking, but just being safe
                    IF EOF(92) THEN GOTO LOF92
                    LINE INPUT #92, file92

                END IF

                RIST_MediaSource1Time = MediaSource1TimeMS ' RIST mode

                IF HTTP_Enabled = "true" THEN ' HTTP
                    OPEN filePrevious_ms FOR BINARY AS #128
                    JSON = SPACE$(LOF(128))
                    GET #128, , JSON
                    CLOSE #128
                    ' No JSON_Multi(0) redmin required
                    GetAllKey "mediaCursor", JSON, JSON_Multi()
                    FOR i_JSON = 1 TO UBOUND(JSON_Multi)
                        ' JSON_Multi(i_JSON)
                    NEXT
                    file92 = JSON_Multi(1)
                END IF

                MediaSource1TimeMS = VAL(file92)

                ' RIST mode
                SELECT CASE RIST_Fail_Mode_1
                    CASE "false"
                        RIST_MediaSource1Time_Count = 0
                    CASE "true"
                        IF MediaSource1TimeMS <> 0 THEN
                            IF RIST_MediaSource1Time = MediaSource1TimeMS THEN
                                RIST_MediaSource1Time_Count = RIST_MediaSource1Time_Count + 1 ' Scene_Fail will be triggered at 5 seconds, the same as SRT timeout
                                IF RIST_MediaSource1Time_Count > 99 THEN RIST_MediaSource1Time_Count = 99 ' No need to have it count up forever
                            ELSE
                                RIST_MediaSource1Time_Count = 0
                            END IF
                        END IF
                END SELECT

                LOF92:
            END IF
            CLOSE #92

            IF NodejsFileSystem = "0" OR NodejsFileSystem = "1" THEN IF NoKill = 1 THEN NoKill = 0 ELSE IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
        CASE "SLS"
            sls_client_connect

            ON ERROR GOTO 0
            App_Refresh = 0

            ' Discover if one or two streams are running
            DO
                SLS_streams_seek = INSTR(SLS_streams_seek + 1, sls_stats.xml, "uptime")
                IF SLS_streams_seek THEN
                    SLS_streams_found = SLS_streams_found + 1
                END IF
            LOOP UNTIL SLS_streams_seek = 0

            SELECT CASE SLS_streams_found
                CASE 1
                    ' If one stream is running and SLS_Publisher1 is the stream, find it here
                    IF MID$(sls_stats.xml, INSTR(sls_stats.xml, "publishers") + 14, LEN(SLS_Publisher1)) = SLS_Publisher1 THEN
                        IF INSTR(sls_stats.xml, SLS_Publisher1) THEN SLS_Bitrate1 = VAL(MID$(sls_stats.xml, (INSTR(sls_stats.xml, SLS_Publisher1) + LEN(SLS_Publisher1)) + 13, 6))
                        IF INSTR(sls_stats.xml, "uptime") THEN SLS_Uptime1 = VAL(MID$(sls_stats.xml, (INSTR(sls_stats.xml, "uptime") + LEN("uptime")) + 2, 6))
                    END IF
                CASE 2
                    ' If two streams are running and SLS_Publisher1 is the second stream, find it here
                    IF MID$(sls_stats.xml, INSTR(sls_stats.xml, SLS_Publisher1), LEN(SLS_Publisher1)) = SLS_Publisher1 THEN
                        SLS_Bitrate1 = VAL(MID$(sls_stats.xml, INSTR(INSTR(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "bitrate") + 9, 6))
                        SLS_Uptime1 = VAL(MID$(sls_stats.xml, INSTR(INSTR(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "uptime") + 8, 6))
                    END IF
            END SELECT
            ' Uptime
            MediaSource1Time = SLS_Uptime1
            MediaSource1TimeMS = SLS_Uptime1 * 1000
            ' Check BitrateFail1 - if bitrate is below fail value, appear to be 0
            IF SLS_Bitrate1 < SLS_BitrateFail1 THEN MediaSource1TimeMS = 0
        CASE "NGINX"
            ''TODO
    END SELECT

    MediaSource1Time = MediaSource1TimeMS / 1000
    ON ERROR GOTO 0
    App_Refresh = 0

    MediaSource1TimeMSOffset = MediaSource1TimeMS - MediaSource1TimeLog
    IF MediaSource1TimeMSOffset < 0 THEN MediaSource1TimeMSOffset = 0

    ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true

    SELECT CASE serverType$
        CASE "SRT"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            IF MediaSource1TimeMSOffset < MediaSourceTimeLB AND Timer_Fail_Stream1 = 0 AND CooldownLog = 0 AND LBR_Delay >= LBR_Delay_Total THEN Multi0_CMD_LBR

            IF MediaSource1TimeMSOffset < MediaSourceTimeLB AND Timer_Fail_Stream1 = 0 THEN
                ' LBR_Delay
                IF LBR_Delay >= LBR_Delay_Total THEN LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: IF CooldownLog > CooldownLogTotal THEN CooldownLog = CooldownLogTotal
                LBR_Delay = LBR_Delay + 1: IF LBR_Delay > LBR_Delay_Total THEN LBR_Delay = LBR_Delay_Total
            END IF
        CASE "SLS"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            IF SLS_Bitrate1 < SLS_BitrateLow1 AND Timer_Fail_Stream1 = 0 AND CooldownLog = 0 AND LBR_Delay >= LBR_Delay_Total THEN Multi0_CMD_LBR

            IF SLS_Bitrate1 < SLS_BitrateLow1 AND Timer_Fail_Stream1 = 0 THEN
                ' LBR_Delay
                IF LBR_Delay >= LBR_Delay_Total THEN LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: IF CooldownLog > CooldownLogTotal THEN CooldownLog = CooldownLogTotal
                LBR_Delay = LBR_Delay + 1: IF LBR_Delay > LBR_Delay_Total THEN LBR_Delay = LBR_Delay_Total
            END IF
        CASE "NGINX"
            ''TODO
    END SELECT

    SELECT CASE serverType$
        CASE "SRT"
            SELECT CASE MediaSource1TimeMSOffset
                CASE 960 TO 1040, 0
                    LBR_Delay = LBR_Delay - 1: IF LBR_Delay <= 0 THEN LBR_Delay = 0
            END SELECT
        CASE "SLS"
            ' Bitrate can be used here. Case 960 - 1040 is invalid.
            SELECT CASE SLS_Bitrate1
                CASE IS > SLS_BitrateLow1, 0
                    LBR_Delay = LBR_Delay - 1: IF LBR_Delay <= 0 THEN LBR_Delay = 0
            END SELECT
        CASE "NGINX"
            ''TODO
    END SELECT

    IF CooldownActive = 1 AND CooldownLog = 0 THEN
        CooldownActive = 0

        ' Restore Scene_OK
        IF SceneLBActive THEN
            IF Scene_Current = Scene_LBR THEN
                Scene_Current = Scene_OK
                SHELL _HIDE _DONTWAIT shell_cmd_1 + Scene_OK + shell_cmd_2
            END IF
        END IF

        IF tmpFileRestore = 1 THEN
            tmpFileRestore = 0
        ELSE
            IF __FileStatusOutput = 1 THEN statusOutputToFile "[FULL BANDWIDTH]:[STREAM] (" + _TRIM$(STR$(CooldownDuration)) + " sec)"
            IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Bandwidth restored for stream, " + _TRIM$(STR$(ConnectionsLog1Count)) + " times (" + _TRIM$(STR$(CooldownDuration)) + " sec)"
        END IF
        ' Reset low bitrate duration seconds count
        CooldownDuration = 0
    END IF

END SUB

SUB Multi0_CMD_LBR
    CooldownActive = 1
    ConnectionsLog1Count = ConnectionsLog1Count + 1
    IF ConnectionsLog1Count > 999 THEN ConnectionsLog1Count = 999

    ' Switch to Low Bandwidth Scene
    IF SceneLBActive THEN
        Scene_Current = Scene_LBR
        SHELL _HIDE _DONTWAIT shell_cmd_1 + Scene_LBR + shell_cmd_2
    END IF

    IF tmpFileError = 0 THEN
        IF __FileStatusOutput = 1 THEN statusOutputToFile "[LOW BANDWIDTH]:[STREAM]"
        IF ConnectionsLog THEN statusConnectionsLogToFile "[WARN] Insufficient bandwidth for stream, " + _TRIM$(STR$(ConnectionsLog1Count)) + " times": CooldownLog = CooldownLogTotal
    END IF
END SUB

SUB Multi1 (serverType AS STRING, serverSelection AS _BYTE)

    ' Cancel cooldown if stream has stopped otherwise things will break
    ' if StreamFailDelay is set lower than CooldownLogTotal
    IF Scene_Current = titleScene1 AND Timer_Fail_Stream1 >= 1 THEN CooldownLog = 0
    IF Scene_Current = titleScene2 AND Timer_Fail_Stream2 >= 1 THEN CooldownLog = 0
    IF Scene_Current = titleScene12 AND Timer_Fail_Stream1 >= 1 THEN CooldownLog = 0
    IF Scene_Current = titleScene12 AND Timer_Fail_Stream2 >= 1 THEN CooldownLog = 0

    IF serverSelection%% = 0 OR serverSelection%% = 1 THEN MediaSource1TimeLog = MediaSource1TimeMS
    IF serverSelection%% = 0 OR serverSelection%% = 2 THEN MediaSource2TimeLog = MediaSource2TimeMS

    SELECT CASE serverType$
        CASE "SRT"
            ' NodeJSFileSystem selection controls this
            SELECT CASE NodejsFileSystem
                CASE "0"
                    IF HTTP_Enabled = "true" THEN
                        SELECT CASE HTTP_Access
                            CASE "fast"
                                SELECT CASE OS
                                    CASE "WINDOWS"
                                        SHELL _HIDE http_media2_File
                                    CASE "LINUX"
                                        SHELL _HIDE CMD_EXE_HTTP_GET_MEDIA2
                                END SELECT
                            CASE ELSE
                                SHELL _HIDE CMD_EXE_HTTP_GET_MEDIA2
                        END SELECT
                    ELSE
                        IF Nodejs_Access = "fast" THEN
                            SHELL _HIDE CMD_EXE_FAST + c34 + obs_get_media2 + c34
                        ELSE
                            SHELL _HIDE CMD_EXE + c34 + obs_get_media2 + c34 + " > " + c34 + filePrevious_ms + c34
                            _DELAY 0.001
                        END IF
                    END IF
                CASE "1"
                    _DEST _CONSOLE
                    IF FullScreen THEN
                        IF HTTP_Enabled = "true" THEN
                            SELECT CASE HTTP_Access
                                CASE "fast"
                                    SHELL _HIDE CMD_EXE_HTTP_GET_MEDIA2
                                CASE ELSE
                                    SHELL _HIDE CMD_EXE_HTTP_GET_MEDIA2
                            END SELECT
                        ELSE
                            IF Nodejs_Access = "fast" THEN
                                SHELL _HIDE CMD_EXE + c34 + obs_get_media2 + c34
                            ELSE
                                SHELL _HIDE CMD_EXE + c34 + obs_get_media2 + c34 + " > " + c34 + filePrevious_ms + c34
                            END IF
                        END IF
                    ELSE
                        IF HTTP_Enabled = "true" THEN
                            SELECT CASE HTTP_Access
                                CASE "fast"
                                    SHELL CMD_EXE_HTTP_GET_MEDIA2
                                CASE ELSE
                                    SHELL CMD_EXE_HTTP_GET_MEDIA2
                            END SELECT
                        ELSE
                            IF Nodejs_Access = "fast" THEN
                                SHELL CMD_EXE + c34 + obs_get_media2 + c34
                            ELSE
                                SHELL CMD_EXE + c34 + obs_get_media2 + c34 + " > " + c34 + filePrevious_ms + c34
                            END IF
                        END IF
                    END IF
                    _DEST 0
                    _DELAY 0.001
                CASE "2"
                    IF srt_warmup_file_media = 0 THEN
                        srt_warmup_file_media = 1
                        ' Set OS variables
                        SELECT CASE OS
                            CASE "WINDOWS"
                                ' Removed because m/js file creates this: + " > " + c34 + filePrevious_ms + c34
                                SHELL _DONTWAIT "node.exe " + c34 + obs_get_media2_scene
                            CASE "LINUX"
                                ' Removed because m/js file creates this: + " > " + c34 + filePrevious_ms + c34
                                SHELL _DONTWAIT "node " + c34 + obs_get_media2_scene
                        END SELECT
                        _DELAY 1
                        $IF WIN THEN
                            IF OS = "WINDOWS" THEN y& = SetWindowPos&(Myhwnd, -1, 0, 0, 0, 0, &H2 + &H1 + &H40) ' Windows only
                        $END IF
                        _DELAY 3.5
                        $IF WIN THEN
                            IF OS = "WINDOWS" THEN y& = SetWindowPos&(Myhwnd, -2, 0, 0, 0, 0, &H2 + &H1 + &H40) ' Windows only
                        $END IF
                    END IF
            END SELECT

            ON ERROR GOTO App_Fail
            App_Refresh = 1
            IF _FILEEXISTS(filePrevious_ms) THEN

                IF HTTP_Enabled <> "true" THEN

                    OPEN filePrevious_ms FOR INPUT AS #92
                    tmpFileError = 0
                    IF EOF(92) THEN
                        IF NodejsFileSystem = "2" THEN ' There is an increased chance an empty tmp file might be read at any time when the external node.js window is used
                            ' RefreshDisplayRequest not used here
                            Error_msg = "- Unable to read tmp file. (Error: #11)"
                            Error_msg_2$ = ""
                            tmpFileError = 1 ' LBR will be falsely triggered because of an empty tmp file unless corrected
                            tmpFileRestore = 1
                            _DELAY 0.05
                            GOTO LOF922
                        ELSE
                            RefreshDisplayRequest = 1
                            Error_msg = "- Unable to read " + c34 + "MediaSource1" + c34 + ", check " + c34 + "config.ini" + c34 + " & OBS to confirm it's correct." + CHR$(10) + "- If OBS is open, check communication is available via Node.js & obs-websocket-js.": Error_msg_2$ = "- If Node.js is installed, check " + c34 + "Restart playback" + c34 + " is disabled in OBS " + c34 + "Media Source" + c34 + "." + CHR$(10) + "- If " + c34 + "Restart playback" + c34 + " is disabled, check OBS WebSockets options are correctly set. (Error: #7)"
                            _DELAY 3
                            GOTO LOF922
                        END IF
                    END IF

                    IF LOF(92) = 0 THEN NoKill = 1: GOTO LOF922 ' Overkill with EOF checking, but just being safe
                    LINE INPUT #92, file92

                END IF

                IF serverSelection%% = 0 OR serverSelection%% = 1 THEN RIST_MediaSource1Time = MediaSource1TimeMS ' RIST mode

                IF HTTP_Enabled = "true" THEN ' HTTP
                    OPEN filePrevious_ms FOR BINARY AS #128
                    JSON = SPACE$(LOF(128))
                    GET #128, , JSON
                    CLOSE #128
                    ' No JSON_Multi(0) redmin required
                    GetAllKey "mediaCursor", JSON, JSON_Multi()
                    FOR i_JSON = 1 TO UBOUND(JSON_Multi)
                        ' JSON_Multi(i_JSON)
                    NEXT
                    file92 = JSON_Multi(1)
                END IF

                IF serverSelection%% = 0 OR serverSelection%% = 1 THEN MediaSource1TimeMS = VAL(file92)

                ' RIST mode
                SELECT CASE RIST_Fail_Mode_1
                    CASE "false"
                        IF serverSelection%% = 0 OR serverSelection%% = 1 THEN RIST_MediaSource1Time_Count = 0
                    CASE "true"
                        IF serverSelection%% = 0 OR serverSelection%% = 1 THEN IF MediaSource1TimeMS <> 0 THEN
                                IF RIST_MediaSource1Time = MediaSource1TimeMS THEN
                                    RIST_MediaSource1Time_Count = RIST_MediaSource1Time_Count + 1 ' Scene_Fail will be triggered at 5 seconds, the same as SRT timeout
                                    IF RIST_MediaSource1Time_Count > 99 THEN RIST_MediaSource1Time_Count = 99 ' No need to have it count up forever
                                ELSE
                                    RIST_MediaSource1Time_Count = 0
                                END IF
                            END IF
                        END IF
                END SELECT

                IF serverSelection%% = 0 OR serverSelection%% = 1 THEN MediaSource1Time = MediaSource1TimeMS / 1000

                IF HTTP_Enabled <> "true" THEN

                    IF EOF(92) THEN RefreshDisplayRequest = 1: Error_msg = "- Unable to read " + c34 + "MediaSource2" + c34 + ", check " + c34 + "config.ini" + c34 + " & OBS to confirm it's correct." + CHR$(10) + "- If OBS is open, check communication is available via Node.js & obs-websocket-js.": Error_msg_2$ = "- If Node.js is installed, check " + c34 + "Restart playback" + c34 + " is disabled in OBS " + c34 + "Media Source" + c34 + "." + CHR$(10) + "- If " + c34 + "Restart playback" + c34 + " is disabled, check OBS WebSockets options are correctly set. (Error: #8)": _DELAY 3: GOTO LOF922
                    LINE INPUT #92, file92

                END IF

                IF serverSelection%% = 0 OR serverSelection%% = 2 THEN RIST_MediaSource2Time = MediaSource2TimeMS ' RIST mode - Source 2

                IF HTTP_Enabled = "true" THEN ' HTTP
                    IF serverSelection%% = 0 OR serverSelection%% = 2 THEN MediaSource2TimeMS = VAL(JSON_Multi(2))
                ELSE
                    IF serverSelection%% = 0 OR serverSelection%% = 2 THEN MediaSource2TimeMS = VAL(file92)
                END IF

                ' RIST mode - Source 2
                SELECT CASE RIST_Fail_Mode_2
                    CASE "false"
                        IF serverSelection%% = 0 OR serverSelection%% = 2 THEN RIST_MediaSource2Time_Count = 0
                    CASE "true"
                        IF serverSelection%% = 0 OR serverSelection%% = 2 THEN
                            IF MediaSource2TimeMS <> 0 THEN
                                IF RIST_MediaSource2Time = MediaSource2TimeMS THEN
                                    RIST_MediaSource2Time_Count = RIST_MediaSource2Time_Count + 1 ' Scene_Fail will be triggered at 5 seconds, the same as SRT timeout
                                    IF RIST_MediaSource2Time_Count > 99 THEN RIST_MediaSource2Time_Count = 99 ' No need to have it count up forever
                                ELSE
                                    RIST_MediaSource2Time_Count = 0
                                END IF
                            END IF
                        END IF
                END SELECT

                IF serverSelection%% = 0 OR serverSelection%% = 2 THEN MediaSource2Time = MediaSource2TimeMS / 1000

                LOF922:
            END IF
            CLOSE #92

            IF NodejsFileSystem = "0" OR NodejsFileSystem = "1" THEN IF NoKill = 1 THEN NoKill = 0 ELSE IF _FILEEXISTS(filePrevious_ms) THEN KILL filePrevious_ms
            ON ERROR GOTO 0
            App_Refresh = 0
        CASE "SLS"
            sls_client_connect

            ON ERROR GOTO 0
            App_Refresh = 0

            ' Discover if one or two streams are running
            DO
                SLS_streams_seek = INSTR(SLS_streams_seek + 1, sls_stats.xml, "uptime")
                IF SLS_streams_seek THEN
                    SLS_streams_found = SLS_streams_found + 1
                END IF
            LOOP UNTIL SLS_streams_seek = 0

            SELECT CASE SLS_streams_found
                CASE 1
                    ' If one stream is running and SLS_Publisher1 is the stream, find it here
                    IF MID$(sls_stats.xml, INSTR(sls_stats.xml, "publishers") + 14, LEN(SLS_Publisher1)) = SLS_Publisher1 THEN
                        IF INSTR(sls_stats.xml, SLS_Publisher1) THEN SLS_Bitrate1 = VAL(MID$(sls_stats.xml, (INSTR(sls_stats.xml, SLS_Publisher1) + LEN(SLS_Publisher1)) + 13, 6))
                        IF INSTR(sls_stats.xml, "uptime") THEN SLS_Uptime1 = VAL(MID$(sls_stats.xml, (INSTR(sls_stats.xml, "uptime") + LEN("uptime")) + 2, 6))
                    END IF
                    ' If one stream is running and SLS_Publisher2 is the stream, find it here
                    IF MID$(sls_stats.xml, INSTR(sls_stats.xml, "publishers") + 14, LEN(SLS_Publisher2)) = SLS_Publisher2 THEN
                        IF INSTR(sls_stats.xml, SLS_Publisher2) THEN SLS_Bitrate2 = VAL(MID$(sls_stats.xml, (INSTR(sls_stats.xml, SLS_Publisher2) + LEN(SLS_Publisher2)) + 13, 6))
                        IF INSTR(sls_stats.xml, "uptime") THEN SLS_Uptime2 = VAL(MID$(sls_stats.xml, (INSTR(sls_stats.xml, "uptime") + LEN("uptime")) + 2, 6))
                    END IF
                CASE 2
                    ' If two streams are running and SLS_Publisher1 is either the first or second stream, find it here
                    IF MID$(sls_stats.xml, INSTR(sls_stats.xml, SLS_Publisher1), LEN(SLS_Publisher1)) = SLS_Publisher1 THEN
                        SLS_Bitrate1 = VAL(MID$(sls_stats.xml, INSTR(INSTR(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "bitrate") + 9, 6))
                        SLS_Uptime1 = VAL(MID$(sls_stats.xml, INSTR(INSTR(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "uptime") + 8, 6))
                    END IF
                    ' If two streams are running and SLS_Publisher2 is either the first or second stream, find it here
                    IF MID$(sls_stats.xml, INSTR(sls_stats.xml, SLS_Publisher2), LEN(SLS_Publisher2)) = SLS_Publisher2 THEN
                        SLS_Bitrate2 = VAL(MID$(sls_stats.xml, INSTR(INSTR(sls_stats.xml, SLS_Publisher2), sls_stats.xml, "bitrate") + 9, 6))
                        SLS_Uptime2 = VAL(MID$(sls_stats.xml, INSTR(INSTR(sls_stats.xml, SLS_Publisher2), sls_stats.xml, "uptime") + 8, 6))
                    END IF
            END SELECT

            ' Uptime
            IF serverSelection%% = 0 OR serverSelection%% = 1 THEN
                MediaSource1Time = SLS_Uptime1
                MediaSource1TimeMS = SLS_Uptime1 * 1000
                ' Check BitrateFail1 - if bitrate is below fail value, appear to be 0
                IF SLS_Bitrate1 < SLS_BitrateFail1 THEN MediaSource1TimeMS = 0
                MediaSource1Time = MediaSource1TimeMS / 1000
            END IF

            IF serverSelection%% = 0 OR serverSelection%% = 2 THEN
                MediaSource2Time = SLS_Uptime2
                MediaSource2TimeMS = SLS_Uptime2 * 1000
                ' Check BitrateFail2 - if bitrate is below fail value, appear to be 0
                IF SLS_Bitrate2 < SLS_BitrateFail2 THEN MediaSource2TimeMS = 0
                MediaSource2Time = MediaSource2TimeMS / 1000
            END IF
        CASE "NGINX"
            ''TODO
    END SELECT

    IF serverSelection%% = 0 OR serverSelection%% = 1 THEN
        MediaSource1TimeMSOffset = MediaSource1TimeMS - MediaSource1TimeLog
        IF MediaSource1TimeMSOffset < 0 THEN MediaSource1TimeMSOffset = 0
    END IF

    IF serverSelection%% = 0 OR serverSelection%% = 2 THEN
        MediaSource2TimeMSOffset = MediaSource2TimeMS - MediaSource2TimeLog
        IF MediaSource2TimeMSOffset < 0 THEN MediaSource2TimeMSOffset = 0
    END IF

    ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true

    SELECT CASE serverType$
        CASE "SRT"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            IF MediaSource1TimeMSOffset < MediaSourceTimeLB AND Timer_Fail_Stream1 = 0 AND CooldownLog = 0 AND LBR_Delay >= LBR_Delay_Total THEN Multi1_CMD_LBR_1

            IF MediaSource1TimeMSOffset < MediaSourceTimeLB AND Timer_Fail_Stream1 = 0 THEN
                ' LBR_Delay
                IF LBR_Delay >= LBR_Delay_Total THEN LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: IF CooldownLog > CooldownLogTotal THEN CooldownLog = CooldownLogTotal
                LBR_Delay_Plus = 1
            END IF

            Multi1_CMD_LBR_2

            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            IF MediaSource2TimeMSOffset < MediaSourceTimeLB AND Timer_Fail_Stream2 = 0 AND CooldownLog = 0 AND LBR_Delay >= LBR_Delay_Total AND Scene2LBInactive = 0 THEN Multi1_CMD_LBR_3

            ' Disable Scene #2 LBR if Scene2LBRDisabled is true
            IF MediaSource2TimeMSOffset < MediaSourceTimeLB AND Timer_Fail_Stream2 = 0 AND Scene2LBInactive = 0 THEN
                ' LBR_Delay
                IF LBR_Delay >= LBR_Delay_Total THEN LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: IF CooldownLog > CooldownLogTotal THEN CooldownLog = CooldownLogTotal
                LBR_Delay_Plus = 1
            END IF

            Multi1_CMD_LBR_4 "SRT"
        CASE "SLS"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            IF SLS_Bitrate1 < SLS_BitrateLow1 AND Timer_Fail_Stream1 = 0 AND CooldownLog = 0 AND LBR_Delay >= LBR_Delay_Total THEN Multi1_CMD_LBR_1

            IF SLS_Bitrate1 < SLS_BitrateLow1 AND Timer_Fail_Stream1 = 0 THEN
                ' LBR_Delay
                IF LBR_Delay >= LBR_Delay_Total THEN LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: IF CooldownLog > CooldownLogTotal THEN CooldownLog = CooldownLogTotal
                LBR_Delay_Plus = 1
            END IF

            Multi1_CMD_LBR_2

            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            IF SLS_Bitrate2 < SLS_BitrateLow2 AND Timer_Fail_Stream2 = 0 AND CooldownLog = 0 AND LBR_Delay >= LBR_Delay_Total THEN Multi1_CMD_LBR_3

            ' Disable Scene #2 LBR if Scene2LBRDisabled is true
            IF SLS_Bitrate2 < SLS_BitrateLow2 AND Timer_Fail_Stream2 = 0 AND Scene2LBInactive = 0 THEN
                ' LBR_Delay
                IF LBR_Delay >= LBR_Delay_Total THEN LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: IF CooldownLog > CooldownLogTotal THEN CooldownLog = CooldownLogTotal
                LBR_Delay_Plus = 1
            END IF

            Multi1_CMD_LBR_4 "SLS"
        CASE "NGINX"
            ''TODO
    END SELECT

END SUB

SUB Multi1_CMD_LBR_1

    CooldownActive = 1
    ConnectionsLog1Count = ConnectionsLog1Count + 1
    IF ConnectionsLog1Count > 999 THEN ConnectionsLog1Count = 999

    ' Switch to Low Bandwidth Scene #1
    ON ERROR GOTO App_Fail
    IF SceneLBActive THEN ' LBR fix Scene #1
        IF _FILEEXISTS(outputLB_Temp1 + "png") THEN NAME outputLB_Temp1 + "png" AS outputLB1 + "png"
        IF _FILEEXISTS(outputLB_Temp1 + "gif") THEN NAME outputLB_Temp1 + "gif" AS outputLB1 + "gif"

        ' Change scene for multi camera
        ' ReturnPreviousScene with SceneLBREnabled will be bugged unless the following code is used
        IF tmpFileError = 0 THEN

            ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=true
            IF streamsUp <> "0" AND __returnPreviousScene = 1 AND __returnPreviousSceneRemember = 1 THEN
                IF RIGHT$(Scene_Current, 4) <> " LBR" THEN ' Only set variable if not a Low Bitrate scene
                    IF streamsUp = "1" AND previousScene = titleScene1 AND Scene_Current <> titleScene1 THEN titleScene1 = previousScene: Scene_Current = titleScene1 ' titleScene1 needs to reflect the manual scene change and be changed
                    IF streamsUp = "12" AND previousScene = titleScene12 AND Scene_Current <> titleScene12 THEN titleScene12 = previousScene: Scene_Current = titleScene12 ' titleScene12 needs to reflect the manual scene change and be changed
                END IF
            END IF

            ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
            IF streamsUp <> "0" AND __returnPreviousScene = 1 AND __returnPreviousSceneRemember = 0 THEN
                IF RIGHT$(Scene_Current, 4) <> " LBR" AND RIGHT$(previousScene, 4) <> " LBR" THEN ' Only set variable if not a Low Bitrate scene
                    ' titleScene1 cannot be changed so previousScene is used to change to LBR scene
                    ' this section changes to LBR scene but does not change back
                    IF streamsUp = "1" THEN SRR = 1: titleScene1 = previousScene: Scene_Current = titleScene1 ' For LBR title temp
                    IF streamsUp = "12" THEN SRR = 1: titleScene12 = previousScene: Scene_Current = titleScene12 ' For LBR title temp
                END IF
            END IF

            ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
            IF SRR = 1 THEN
                SHELL _HIDE _DONTWAIT shell_cmd_1 + previousScene + " LBR" + shell_cmd_2
                SRR = 0
            ELSE
                ' These two lines were the only code prior to LBR fix
                IF Scene_Current = titleScene1 THEN SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene1 + " LBR" + shell_cmd_2
                IF Scene_Current = titleScene12 THEN SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene12 + " LBR" + shell_cmd_2
            END IF

        END IF

    END IF
    ON ERROR GOTO 0

    IF tmpFileError = 0 THEN
        IF __FileStatusOutput = 1 THEN statusOutputToFile "[LOW BANDWIDTH]:[CAMERA #1]"
        IF ConnectionsLog THEN statusConnectionsLogToFile "[WARN] Insufficient bandwidth for stream #1, " + _TRIM$(STR$(ConnectionsLog1Count)) + " times": CooldownLog = CooldownLogTotal
    END IF

END SUB

SUB Multi1_CMD_LBR_2

    IF CooldownActive = 1 AND CooldownLog = 0 THEN
        CooldownActive = 0

        ' Switch to Low Bandwidth Scene #1 end
        ON ERROR GOTO App_Fail
        IF SceneLBActive THEN ' LBR fix Scene #1 end
            IF _FILEEXISTS(outputLB1 + "png") THEN NAME outputLB1 + "png" AS outputLB_Temp1 + "png"
            IF _FILEEXISTS(outputLB1 + "gif") THEN NAME outputLB1 + "gif" AS outputLB_Temp1 + "gif"

            ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
            IF streamsUp <> "0" AND __returnPreviousScene = 1 AND __returnPreviousSceneRemember = 0 THEN
                IF RIGHT$(Scene_Current, 4) = " LBR" OR RIGHT$(previousScene, 4) = " LBR" THEN
                    ' titleScene1 cannot be changed so previousScene is used to change to LBR scene

                    IF streamsUp = "1" THEN
                        IF previousScene <> titleScene1 OR Scene_Current <> titleScene1 THEN
                            SRR = 1
                        END IF
                    END IF

                    IF streamsUp = "12" THEN
                        IF previousScene <> titleScene12 OR Scene_Current <> titleScene12 THEN
                            SRR = 1
                        END IF
                    END IF

                END IF
            END IF

            IF SRR = 1 THEN ' previousScene is current scene name so " LBR" needs to be removed from the end
                IF RIGHT$(previousScene, 4) = " LBR" THEN SHELL _HIDE _DONTWAIT shell_cmd_1 + MID$(previousScene, 1, LEN(previousScene) - 4) + shell_cmd_2
                ' titleScene change should not be permanent when ReturnPreviousSceneRemember=false, so use titleScene Temp to revert
                titleScene1 = titleScene1Temp: titleScene2 = titleScene2Temp: titleScene12 = titleScene12Temp
                SRR = 0
            ELSE
                ' Change scene for multi camera
                ' These two lines were the only code prior to LBR fix
                IF Scene_Current = titleScene1 THEN SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene1 + shell_cmd_2
                IF Scene_Current = titleScene12 THEN SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene12 + shell_cmd_2
            END IF

        END IF
        ON ERROR GOTO 0

        IF tmpFileRestore = 1 THEN
            tmpFileRestore = 0
        ELSE
            IF __FileStatusOutput = 1 THEN statusOutputToFile "[FULL BANDWIDTH]:[CAMERA #1] (" + _TRIM$(STR$(CooldownDuration)) + " sec)"
            IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Bandwidth restored for stream #1, " + _TRIM$(STR$(ConnectionsLog1Count)) + " times (" + _TRIM$(STR$(CooldownDuration)) + " sec)"
        END IF
        ' Reset low bitrate duration seconds count
        CooldownDuration = 0
    END IF

END SUB

SUB Multi1_CMD_LBR_3

    CooldownActive = 2
    ConnectionsLog2Count = ConnectionsLog2Count + 1
    IF ConnectionsLog2Count > 999 THEN ConnectionsLog2Count = 999

    ' Switch to Low Bandwidth Scene #2
    ON ERROR GOTO App_Fail
    IF SceneLBActive THEN ' LBR fix Scene #2
        IF _FILEEXISTS(outputLB_Temp2 + "png") THEN NAME outputLB_Temp2 + "png" AS outputLB2 + "png"
        IF _FILEEXISTS(outputLB_Temp2 + "gif") THEN NAME outputLB_Temp2 + "gif" AS outputLB2 + "gif"

        ' Change scene for multi camera
        ' Disable Scene #2 LBR if Scene2LBRDisabled is true

        ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=true
        IF streamsUp <> "0" AND __returnPreviousScene = 1 AND __returnPreviousSceneRemember = 1 THEN
            IF RIGHT$(Scene_Current, 4) <> " LBR" THEN ' Only set variable if not a Low Bitrate scene
                IF streamsUp = "2" AND previousScene = titleScene2 AND Scene_Current <> titleScene2 THEN titleScene2 = previousScene: Scene_Current = titleScene2 ' titleScene2 needs to reflect the manual scene change and be changed
                IF streamsUp = "12" AND previousScene = titleScene12 AND Scene_Current <> titleScene12 THEN titleScene12 = previousScene: Scene_Current = titleScene12 ' titleScene12 needs to reflect the manual scene change and be changed
            END IF
        END IF


        ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
        IF streamsUp <> "0" AND __returnPreviousScene = 1 AND __returnPreviousSceneRemember = 0 THEN
            IF RIGHT$(Scene_Current, 4) <> " LBR" AND RIGHT$(previousScene, 4) <> " LBR" THEN ' Only set variable if not a Low Bitrate scene
                ' titleScene2 cannot be changed so previousScene is used to change to LBR scene
                ' this section changes to LBR scene but does not change back
                IF streamsUp = "2" THEN SRR = 1: titleScene2 = previousScene: Scene_Current = titleScene2 ' For LBR title temp
                IF streamsUp = "12" THEN SRR = 1: titleScene12 = previousScene: Scene_Current = titleScene12 ' For LBR title temp
            END IF
        END IF


        ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
        IF SRR = 1 THEN
            SHELL _HIDE _DONTWAIT shell_cmd_1 + previousScene + " LBR" + shell_cmd_2
            SRR = 0
        ELSE
            ' These two lines were the only code prior to LBR fix
            IF Scene_Current = titleScene2 THEN SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene2 + " LBR" + shell_cmd_2
            IF Scene_Current = titleScene12 THEN SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene12 + " LBR" + shell_cmd_2
        END IF

    END IF
    ON ERROR GOTO 0

    IF tmpFileError = 0 THEN
        IF __FileStatusOutput = 1 THEN statusOutputToFile "[LOW BANDWIDTH]:[CAMERA #2]"
        IF ConnectionsLog THEN statusConnectionsLogToFile "[WARN] Insufficient bandwidth for stream #2, " + _TRIM$(STR$(ConnectionsLog2Count)) + " times": CooldownLog = CooldownLogTotal
    END IF

END SUB

SUB Multi1_CMD_LBR_4 (serverType AS STRING)

    IF Timer_Fail_Stream1 = 0 AND Timer_Fail_Stream2 = 0 THEN

        ' LBR_Delay streams 1+2

        SELECT CASE serverType$
            CASE "SRT"
                SELECT CASE MediaSource1TimeMSOffset
                    CASE 960 TO 1040, 0
                        LBR_Delay_Minus = 1
                END SELECT
                SELECT CASE MediaSource2TimeMSOffset
                    CASE 960 TO 1040, 0
                        LBR_Delay_Minus = 1
                END SELECT
            CASE "SLS"
                ' Bitrate can be used here. Case 960 - 1040 is invalid.
                SELECT CASE SLS_Bitrate1
                    CASE IS > SLS_BitrateLow1, 0
                        LBR_Delay_Minus = 1
                END SELECT
                ' Bitrate can be used here. Case 960 - 1040 is invalid.
                SELECT CASE SLS_Bitrate2
                    CASE IS > SLS_BitrateLow2, 0
                        LBR_Delay_Minus = 1
                END SELECT
            CASE "NGINX"
                ''TODO
        END SELECT


        IF LBR_Delay_Plus = 1 THEN
            LBR_Delay = LBR_Delay + 1: IF LBR_Delay > LBR_Delay_Total THEN LBR_Delay = LBR_Delay_Total
        ELSEIF LBR_Delay_Minus = 1 THEN
            LBR_Delay = LBR_Delay - 1: IF LBR_Delay <= 0 THEN LBR_Delay = 0
        END IF


    ELSE

        ' LBR_Delay stream 1 or 2


        SELECT CASE serverType$
            CASE "SRT"
                IF Timer_Fail_Stream1 = 0 THEN
                    SELECT CASE MediaSource1TimeMSOffset
                        CASE 960 TO 1040, 0
                            LBR_Delay_Minus = 1
                    END SELECT
                END IF

                IF Timer_Fail_Stream2 = 0 THEN
                    SELECT CASE MediaSource2TimeMSOffset
                        CASE 960 TO 1040, 0
                            LBR_Delay_Minus = 1
                    END SELECT
                END IF
            CASE "SLS"
                ' Bitrate can be used here. Case 960 - 1040 is invalid.
                IF Timer_Fail_Stream1 = 0 THEN
                    SELECT CASE SLS_Bitrate1
                        CASE IS > SLS_BitrateLow1, 0
                            LBR_Delay_Minus = 1
                    END SELECT
                END IF
                ' Bitrate can be used here. Case 960 - 1040 is invalid.
                IF Timer_Fail_Stream2 = 0 THEN
                    SELECT CASE SLS_Bitrate2
                        CASE IS > SLS_BitrateLow2, 0
                            LBR_Delay_Minus = 1
                    END SELECT
                END IF
            CASE "NGINX"
                ''TODO
        END SELECT

        IF LBR_Delay_Plus = 1 THEN LBR_Delay = LBR_Delay + 1: IF LBR_Delay > LBR_Delay_Total THEN LBR_Delay = LBR_Delay_Total
        IF LBR_Delay_Minus = 1 THEN LBR_Delay = LBR_Delay - 1: IF LBR_Delay <= 0 THEN LBR_Delay = 0

    END IF


    LBR_Delay_Minus = 0
    LBR_Delay_Plus = 0


    IF CooldownActive = 2 AND CooldownLog = 0 THEN
        CooldownActive = 0

        ' Switch to Low Bandwidth Scene #2 end
        ON ERROR GOTO App_Fail
        IF SceneLBActive THEN ' LBR fix Scene #2 end
            IF _FILEEXISTS(outputLB2 + "png") THEN NAME outputLB2 + "png" AS outputLB_Temp2 + "png"
            IF _FILEEXISTS(outputLB2 + "gif") THEN NAME outputLB2 + "gif" AS outputLB_Temp2 + "gif"

            ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
            IF streamsUp <> "0" AND __returnPreviousScene = 1 AND __returnPreviousSceneRemember = 0 THEN
                IF RIGHT$(Scene_Current, 4) = " LBR" OR RIGHT$(previousScene, 4) = " LBR" THEN
                    ' titleScene1 cannot be changed so previousScene is used to change to LBR scene

                    IF streamsUp = "2" THEN
                        IF previousScene <> titleScene2 OR Scene_Current <> titleScene2 THEN
                            SRR = 1
                        END IF
                    END IF

                    IF streamsUp = "12" THEN
                        IF previousScene <> titleScene12 OR Scene_Current <> titleScene12 THEN
                            SRR = 1
                        END IF
                    END IF

                END IF
            END IF

            IF SRR = 1 THEN ' previousScene is current scene name so " LBR" needs to be removed from the end
                IF RIGHT$(previousScene, 4) = " LBR" THEN SHELL _HIDE _DONTWAIT shell_cmd_1 + MID$(previousScene, 1, LEN(previousScene) - 4) + shell_cmd_2
                ' titleScene change should not be permanent when ReturnPreviousSceneRemember=false, so use titleScene Temp to revert
                titleScene1 = titleScene1Temp: titleScene2 = titleScene2Temp: titleScene12 = titleScene12Temp
                SRR = 0
            ELSE
                ' Change scene for multi camera
                ' These two lines were the only code prior to LBR fix
                IF Scene_Current = titleScene2 THEN SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene2 + shell_cmd_2
                IF Scene_Current = titleScene12 THEN SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene12 + shell_cmd_2
            END IF

        END IF
        ON ERROR GOTO 0

        IF tmpFileRestore = 1 THEN
            tmpFileRestore = 0
        ELSE
            IF __FileStatusOutput = 1 THEN statusOutputToFile "[FULL BANDWIDTH]:[CAMERA #2] (" + _TRIM$(STR$(CooldownDuration)) + " sec)"
            IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Bandwidth restored for stream #2, " + _TRIM$(STR$(ConnectionsLog1Count)) + " times (" + _TRIM$(STR$(CooldownDuration)) + " sec)"
        END IF
        ' Reset low bitrate duration seconds count
        CooldownDuration = 0
    END IF

END SUB

SUB Timer01
    ' Timer01: ------------------------------------------------------------------------------------------------------------------------------
    td_update = TIMER(.001) - timer1
    timer1 = TIMER(.001)

    'SetCaption DebugTemp1LB, "Scene_Current"
    'SetCaption DebugTemp1LB2, Scene_Current
    'SetCaption DebugTemp2LB, "previousScene"
    'SetCaption DebugTemp2LB2, Scene_Current
    'SetCaption DebugTemp3LB, "titleScene1"
    'SetCaption DebugTemp3LB2, titleScene1
    'SetCaption DebugTemp4LB, "titleScene2"
    'SetCaption DebugTemp4LB2, titleScene2

    CooldownLog = CooldownLog - 1
    IF CooldownLog < 0 THEN CooldownLog = 0

    IF _DIREXISTS(config_dir) THEN IF NOT _DIREXISTS(temp_dir) THEN MKDIR temp_dir

    tPing1 = TIMER(.001)

    ' Count how many seconds stream has been running at low bitrate
    IF CooldownLog THEN CooldownDuration = CooldownDuration + 1
    IF CooldownDuration > 32400 THEN CooldownDuration = 32400

    ' Get Media Source times (1 stream) ------------------------------------------------------------------------------------------------------------------------------
    IF __MultiCameraSwitch = 0 THEN

        IF SLS_1_Enabled = "false" THEN Multi0 "SRT"
        IF SLS_1_Enabled = "true" THEN Multi0 "SLS"

    END IF

    IF __MultiCameraSwitch = 1 THEN
        ' Get Media Source times (2 streams) ------------------------------------------------------------------------------------------------------------------------------

        IF SLS_1_Enabled = "false" AND SLS_2_Enabled = "false" THEN Multi1 "SRT", 0
        IF SLS_1_Enabled = "false" AND SLS_2_Enabled = "true" THEN Multi1 "SRT", 1: Multi1 "SLS", 2
        IF SLS_1_Enabled = "true" AND SLS_2_Enabled = "false" THEN Multi1 "SLS", 1: Multi1 "SRT", 2
        IF SLS_1_Enabled = "true" AND SLS_2_Enabled = "true" THEN Multi1 "SLS", 0

    END IF

    ' Debug: MS rate
    MediaSourceTimeMSOffsetDisplay = INT((MediaSource1TimeMSOffset) / 10) * 10
    IF MediaSourceTimeMSOffsetDisplay > 960 AND MediaSourceTimeMSOffsetDisplay < 1040 THEN MediaSourceTimeMSOffsetDisplay = 1000
    IF MediaSourceTimeMSOffsetDisplay > 99999 THEN MediaSourceTimeMSOffsetDisplay = 99999

    MediaSource2TimeMSOffsetDisplay = INT((MediaSource2TimeMSOffset) / 10) * 10
    IF MediaSource2TimeMSOffsetDisplay > 960 AND MediaSource2TimeMSOffsetDisplay < 1040 THEN MediaSource2TimeMSOffsetDisplay = 1000
    IF MediaSource2TimeMSOffsetDisplay > 99999 THEN MediaSource2TimeMSOffsetDisplay = 99999

    tPing2 = TIMER(.001)
    tPingOut = (tPing2 - tPing1)

    IF Deny_Ping <> "true" AND SLS_Active <> 1 THEN
        tPingTimer = tPingTimer + 1
        IF tPingTimer >= 10 THEN
            tPingTimer = 0
            ON ERROR GOTO App_Fail
            tIPPing1 = TIMER(.001)
            network_client = _OPENCLIENT("TCP/IP:" + MID$(OBS_URL, INSTR(OBS_URL, ":") + 1) + ":" + LEFT$(OBS_URL, INSTR(OBS_URL, ":") - 1))
            CLOSE network_client
            tIPPing2 = TIMER(.001)
            tIPPingOut = (tIPPing2 - tIPPing1)
            ON ERROR GOTO 0
        END IF
    END IF

    IF Timer_Failed = 1 THEN Timer_Failed = 0: ToolTip(Timer_Fail_CountLB) = "Last Failed: " + TIME$: Tooltip_Mouse = 1
    IF Timer_Failed1 = 1 THEN Timer_Failed1 = 0: ToolTip(Timer_Fail_CountLB) = "Last Failed: " + TIME$: Tooltip_Mouse = 1
    IF Timer_Failed2 = 1 THEN Timer_Failed2 = 0: ToolTip(Timer_Fail_Count_2LB) = "Last Failed: " + TIME$: Tooltip_Mouse = 1

    IF MediaSource1Time <> 0 OR MediaSource2Time <> 0 AND RIST_MediaSource1Time_Count <= 4 AND RIST_MediaSource2Time_Count <= 4 THEN Timer_Fail = 0 ' SRT ' RIST mode

    IF MediaSource1Time = 0 AND MediaSource2Time = 0 AND srt_warmup = 1 THEN Timer_Fail = Timer_Fail + 1 ' SRT
    IF Timer_Fail > 32400 THEN Timer_Fail = 32400

    ' Fail icon
    IF Timer_Fail >= Stream_Fail_Delay THEN
        Control(Timer_FailLB).ForeColor = RED_FAIL
    ELSE
        IF Timer_Fail >= 1 THEN
            Control(Timer_FailLB).ForeColor = RED_WARNING
            SD = 1
            _TITLE "Stream Down! - Loopy SRT Monitor"
            iconStatus& = __imageMEM&("icon-x-16.png")
            IF iconStatus& < -1 THEN
                _ICON iconStatus&
                _FREEIMAGE iconStatus&
            END IF
        ELSE Control(Timer_FailLB).ForeColor = GREEN_OK
        END IF
    END IF
    SetCaption (Timer_FailLB), calc_srt$(Timer_Fail, 1) + calc_srt_sec$

    ' OK icon
    IF Timer_Fail = 0 AND SD = 1 THEN
        SD = 0
        IF ERR = 0 THEN
            _TITLE "Loopy SRT Monitor"
            $EXEICON:'.\icon.ico'
        END IF
    END IF

    IF __MultiCameraSwitch = 0 THEN

        IF Timer_Fail_Count >= 1 THEN Control(Timer_Fail_CountLB).ForeColor = RED_WARNING ELSE Control(Timer_Fail_CountLB).ForeColor = GREEN_OK
        IF Timer_Fail_Count = 1 AND ConnectionsLog1Count = 1 THEN
            SetCaption (Timer_Fail_CountLB), LTRIM$(STR$(Timer_Fail_Count)) + "   /   " + LTRIM$(STR$(ConnectionsLog1Count)) + "  time"
        ELSE
            SetCaption (Timer_Fail_CountLB), LTRIM$(STR$(Timer_Fail_Count)) + "   /   " + LTRIM$(STR$(ConnectionsLog1Count)) + "  times"
        END IF

        Control(Stream1LightLB).Hidden = True
        Control(Stream2LightLB).Hidden = True
        IF MediaSource1Time <= 1 THEN
            Control(StreamLightLB).ForeColor = _RGB32(252, 20, 10)
            SetCaption (StreamLightLB), "____________________________________"
        ELSE
            Control(StreamLightLB).ForeColor = _RGB32(18, 245, 20)
            SetCaption (StreamLightLB), "_____________________________________"
        END IF

    ELSE

        IF Timer_Fail_Count1 >= 1 THEN Control(Timer_Fail_CountLB).ForeColor = RED_WARNING ELSE Control(Timer_Fail_CountLB).ForeColor = GREEN_OK
        IF Timer_Fail_Count1 = 1 AND ConnectionsLog1Count = 1 THEN
            SetCaption (Timer_Fail_CountLB), LTRIM$(STR$(Timer_Fail_Count1)) + "   /   " + LTRIM$(STR$(ConnectionsLog1Count)) + "  time"
        ELSE
            SetCaption (Timer_Fail_CountLB), LTRIM$(STR$(Timer_Fail_Count1)) + "   /   " + LTRIM$(STR$(ConnectionsLog1Count)) + "  times"
        END IF

        IF Timer_Fail_Count2 >= 1 THEN Control(Timer_Fail_Count_2LB).ForeColor = RED_WARNING ELSE Control(Timer_Fail_Count_2LB).ForeColor = GREEN_OK
        IF Timer_Fail_Count2 = 1 AND ConnectionsLog2Count = 1 THEN
            SetCaption (Timer_Fail_Count_2LB), LTRIM$(STR$(Timer_Fail_Count2)) + "   /   " + LTRIM$(STR$(ConnectionsLog2Count)) + "  time"
        ELSE
            SetCaption (Timer_Fail_Count_2LB), LTRIM$(STR$(Timer_Fail_Count2)) + "   /   " + LTRIM$(STR$(ConnectionsLog2Count)) + "  times"
        END IF

    END IF

    ' Display IP ping or SRT Live Server ping
    IF SLS_Active = 0 THEN TIMEms tIPPingOut, 0 ELSE TIMEms SLS_PingOut, 0
    IF VAL(tout) >= .3 THEN Control(tIPPingOutLB).ForeColor = RED_WARNING ELSE Control(tIPPingOutLB).ForeColor = GREEN_OK
    SELECT CASE SLS_Active
        CASE 0
            IF ConnectionsLog AND VAL(tout) >= .25 AND CooldownLog = 0 THEN statusConnectionsLogToFile "[WARN] IP ping exceeding 250ms": CooldownLog = CooldownLogTotal
        CASE 1
            IF ConnectionsLog AND VAL(tout) >= .35 AND CooldownLog = 0 THEN statusConnectionsLogToFile "[WARN] SLS ping exceeding 350ms": CooldownLog = CooldownLogTotal
    END SELECT
    SetCaption (tIPPingOutLB), LTRIM$(STR$(VAL(tout) * 1000)) + " ms"

    TIMEms tPingOut, 0
    IF VAL(tout) >= .35 THEN Control(tPingOutLB).ForeColor = RED_WARNING ELSE Control(tPingOutLB).ForeColor = GREEN_OK
    IF ConnectionsLog AND VAL(tout) >= .5 AND CooldownLog = 0 THEN statusConnectionsLogToFile "[WARN] WebSocket ping exceeding 500ms": CooldownLog = CooldownLogTotal
    IF VAL(tout) >= .5 AND CooldownLog = 0 THEN SetCaption StatusLB, "WebSocket ping too high, try another " + c34 + "NodejsFileSystem" + c34 + " if this persists...": updateDisplay = 1 ' Display error if WebSocket ping is too high
    SetCaption (tPingOutLB), LTRIM$(STR$(VAL(tout) * 1000)) + " ms"

    ' SRT Live Server
    IF SLS_Active = 1 AND __MultiCameraSwitch = 0 THEN
        IF SLS_Bitrate1 > SLS_BitrateLow1 THEN Control(MultiCameraSwitchStatusLB).ForeColor = GREEN_OK ELSE Control(MultiCameraSwitchStatusLB).ForeColor = RED_WARNING
        IF SLS_Bitrate1 < SLS_BitrateFail1 OR SLS_Bitrate1 = 0 THEN Control(MultiCameraSwitchStatusLB).ForeColor = RED_FAIL
        SELECT CASE SLS_Bitrate1
            CASE 0 TO 99
                IF SLS_Kbps_Precision <> "nerd" THEN SetCaption MultiCameraSwitchStatusLB, _TRIM$(STR$(INT(SLS_Bitrate1 / 100))) + " Kbps" ELSE SetCaption MultiCameraSwitchStatusLB, _TRIM$(STR$(INT(SLS_Bitrate1))) + " Kbps"
            CASE IS >= 100
                IF SLS_Kbps_Precision <> "nerd" THEN SetCaption MultiCameraSwitchStatusLB, _TRIM$(STR$(INT(SLS_Bitrate1 / 100))) + "00 Kbps" ELSE SetCaption MultiCameraSwitchStatusLB, _TRIM$(STR$(INT(SLS_Bitrate1))) + " Kbps"
        END SELECT
    END IF
    IF SLS_Active = 1 AND MultiCameraSwitch = "true" THEN
        IF SLS_Bitrate1 > SLS_BitrateLow1 THEN Control(Bitrate_Stream_1LB).ForeColor = GREEN_OK ELSE Control(Bitrate_Stream_1LB).ForeColor = RED_WARNING
        IF SLS_Bitrate2 > SLS_BitrateLow2 THEN Control(Bitrate_Stream_2LB).ForeColor = GREEN_OK ELSE Control(Bitrate_Stream_2LB).ForeColor = RED_WARNING
        IF SLS_Bitrate1 < SLS_BitrateFail1 OR SLS_Bitrate1 = 0 THEN Control(Bitrate_Stream_1LB).ForeColor = RED_FAIL: IF SLS_Bitrate2 < SLS_BitrateFail1 OR SLS_Bitrate2 = 0 THEN Control(Bitrate_Stream_2LB).ForeColor = RED_FAIL
        SELECT CASE SLS_Bitrate1
            CASE 0 TO 99
                IF SLS_Kbps_Precision <> "nerd" THEN SetCaption Bitrate_Stream_1LB, _TRIM$(STR$(INT(SLS_Bitrate1 / 100))) + " Kbps" ELSE SetCaption Bitrate_Stream_1LB, _TRIM$(STR$(INT(SLS_Bitrate1))) + " Kbps"
            CASE IS >= 100
                IF SLS_Kbps_Precision <> "nerd" THEN SetCaption Bitrate_Stream_1LB, _TRIM$(STR$(INT(SLS_Bitrate1 / 100))) + "00 Kbps" ELSE SetCaption Bitrate_Stream_1LB, _TRIM$(STR$(INT(SLS_Bitrate1))) + " Kbps"
        END SELECT
        SELECT CASE SLS_Bitrate2
            CASE 0 TO 99
                IF SLS_Kbps_Precision <> "nerd" THEN SetCaption Bitrate_Stream_2LB, _TRIM$(STR$(INT(SLS_Bitrate2 / 100))) + " Kbps" ELSE SetCaption Bitrate_Stream_2LB, _TRIM$(STR$(INT(SLS_Bitrate2))) + " Kbps"
            CASE IS >= 100
                IF SLS_Kbps_Precision <> "nerd" THEN SetCaption Bitrate_Stream_2LB, _TRIM$(STR$(INT(SLS_Bitrate2 / 100))) + "00 Kbps" ELSE SetCaption Bitrate_Stream_2LB, _TRIM$(STR$(INT(SLS_Bitrate2))) + " Kbps"
        END SELECT
    END IF

    IF srt_warmup = 0 THEN
        Control(td_updateLB).ForeColor = GREEN_OK
        SetCaption (td_updateLB), "1.000 sec " ' Fake time displayed on startup just for 1 second
    END IF

    IF srt_warmup = 1 THEN
        IF td_update <= 0.001 THEN td_update = 0.001
        IF td_update >= 9.999 THEN td_update = 9.999
        IF td_update <= 0.989 OR td_update >= 1.011 THEN Control(td_updateLB).ForeColor = RED_WARNING ELSE Control(td_updateLB).ForeColor = GREEN_OK
        TIMEms td_update, 0
        SetCaption (td_updateLB), tout + " sec "
    END IF

    ' Temporarily disable LBR if update interval is too high
    IF srt_warmup = 1 AND SceneLBActive_Temp_Disable >= 1 THEN
        SceneLBActive_Temp_Disable = SceneLBActive_Temp_Disable + 1
        SceneLBActive_Temp_Disable_Display = " (" + _TRIM$(STR$(61 - SceneLBActive_Temp_Disable)) + "s)"
        IF SceneLBActive_Temp_Disable > 61 THEN SceneLBActive_Temp_Disable = 0: SceneLBActive_Temp_Disable_Display = "": SceneLBActive = 1 ' Number of seconds to disable LBR
    END IF
    IF CooldownLog = 0 AND srt_warmup = 1 AND td_update > 1.1 AND SceneLBActive = 1 AND SceneLBActive_Temp_Disable = 0 AND srt_warmup_LB = 0 THEN
        SceneLBActive_Temp_Disable = 1
        SceneLBActive = 0
        SetCaption StatusLB, "Update interval too high, LBR temporarily disabled...": updateDisplay = 1 ' Display error if update interval too high
    END IF
    IF CooldownLog = 0 AND srt_warmup = 1 AND td_update > 1.1 AND SceneLBActive = 0 AND SceneLBActive_Temp_Disable >= 1 THEN
        SceneLBActive_Temp_Disable = 1
        SetCaption StatusLB, "Update interval too high, LBR temporarily disabled...": updateDisplay = 1 ' Display error if update interval too high
    END IF

    SetCaption (Stream_Fail_DelayLB), calc_srt$(Stream_Fail_Delay, 1) + calc_srt_sec$
    IF Timer_Fail AND MediaSource1Time = 0 AND MediaSource2Time = 0 THEN Control(Scene_CurrentLB).ForeColor = RED_FAIL ELSE Control(Scene_CurrentLB).ForeColor = GREEN_SCENE_OK
    IF SLS_Active = 0 AND __MultiCameraSwitch = 0 THEN SetCaption (MultiCameraSwitchStatusLB), "Disabled"

    IF Timer_Fail_Stream1 THEN SetCaption (Stream1), "Stream #1 (Offline)": Control(Stream1).ForeColor = RED_FAIL ELSE SetCaption (Stream1), "Stream #1": Control(Stream1).ForeColor = GREEN_STREAM_OK
    IF Timer_Fail_Stream2 THEN SetCaption (Stream2), "Stream #2 (Offline)": Control(Stream2).ForeColor = RED_FAIL ELSE SetCaption (Stream2), "Stream #2": Control(Stream2).ForeColor = GREEN_STREAM_OK

    IF __MultiCameraSwitch = 1 THEN
        SetCaption (MultiCameraSwitchStatusLB), "Enabled"
        SetCaption (Scene_CurrentLB), LEFT$(previousSceneDisplay, 20)

        ' temp1_stream1 variables
        IF srt_warmup = 1 THEN Timer_Fail_Stream1 = Timer_Fail_Stream1 + 1
        IF MediaSource1Time <> 0 AND RIST_MediaSource1Time_Count <= 4 THEN Timer_Fail_Stream1 = 0: Timer_Fail = 0 ' SRT ' RIST mode
        IF Timer_Fail_Stream1 > 32400 THEN Timer_Fail_Stream1 = 32400
        IF Timer_Fail_Output1 > 32400 THEN Timer_Fail_Output1 = 32400

        ' temp1_stream2 variables
        IF srt_warmup = 1 THEN Timer_Fail_Stream2 = Timer_Fail_Stream2 + 1
        IF MediaSource2Time <> 0 AND RIST_MediaSource2Time_Count <= 4 THEN Timer_Fail_Stream2 = 0: Timer_Fail = 0 ' SRT ' RIST mode
        IF Timer_Fail_Stream2 > 32400 THEN Timer_Fail_Stream2 = 32400
        IF Timer_Fail_Output2 > 32400 THEN Timer_Fail_Output2 = 32400

        IF Timer_Fail_Stream1 >= Stream_Fail_Delay THEN Control(Timer_Fail_Stream1LB).ForeColor = RED_FAIL ELSE IF Timer_Fail_Stream1 >= 1 THEN Control(Timer_Fail_Stream1LB).ForeColor = RED_WARNING ELSE Control(Timer_Fail_Stream1LB).ForeColor = GREEN_OK
        IF __FileStatusOutput = 1 OR ConnectionsLog = 1 THEN IF Timer_Fail_Stream1 >= 1 THEN Timer_Fail_Output1 = Timer_Fail_Stream1
        SetCaption (Timer_Fail_Stream1LB), calc_srt$(Timer_Fail_Stream1, 1) + calc_srt_sec$

        IF Timer_Fail_Stream2 >= Stream_Fail_Delay THEN Control(Timer_Fail_Stream2LB).ForeColor = RED_FAIL ELSE IF Timer_Fail_Stream2 >= 1 THEN Control(Timer_Fail_Stream2LB).ForeColor = RED_WARNING ELSE Control(Timer_Fail_Stream2LB).ForeColor = GREEN_OK
        IF __FileStatusOutput = 1 OR ConnectionsLog = 1 THEN IF Timer_Fail_Stream2 >= 1 THEN Timer_Fail_Output2 = Timer_Fail_Stream2
        SetCaption (Timer_Fail_Stream2LB), calc_srt$(Timer_Fail_Stream2, 1) + calc_srt_sec$

        IF MediaSource1Time <= 2 THEN Control(Uptime_Stream_1LB).ForeColor = RED_FAIL ELSE IF MediaSource1Time >= 3 AND MediaSource1Time < 10 THEN Control(Uptime_Stream_1LB).ForeColor = RED_WARNING ELSE Control(Uptime_Stream_1LB).ForeColor = GREEN_OK
        SetCaption (Uptime_Stream_1LB), calc_srt$(MediaSource1Time, 1) + calc_srt_sec$ ' SRT
        IF MediaSource2Time <= 2 THEN Control(Uptime_Stream_2LB).ForeColor = RED_FAIL ELSE IF MediaSource2Time >= 3 AND MediaSource2Time < 10 THEN Control(Uptime_Stream_2LB).ForeColor = RED_WARNING ELSE Control(Uptime_Stream_2LB).ForeColor = GREEN_OK
        SetCaption (Uptime_Stream_2LB), calc_srt$(MediaSource2Time, 1) + calc_srt_sec$ ' SRT

        Control(StreamLightLB).Hidden = True
        IF MediaSource1Time <= 1 THEN
            Control(Stream1LightLB).ForeColor = _RGB32(252, 20, 10)
            SetCaption (Stream1LightLB), "____________________________________"
        ELSE
            Control(Stream1LightLB).ForeColor = _RGB32(18, 245, 20)
            SetCaption (Stream1LightLB), "_____________________________________"
        END IF
        IF MediaSource2Time <= 1 THEN
            Control(Stream2LightLB).ForeColor = _RGB32(252, 20, 10)
            SetCaption (Stream2LightLB), "____________________________________"
        ELSE
            Control(Stream2LightLB).ForeColor = _RGB32(18, 245, 20)
            SetCaption (Stream2LightLB), "_____________________________________"
        END IF

        IF Timer_Fail_Stream1 = 2 AND CooldownStartup = 0 THEN
            Timer_Fail_Count1 = Timer_Fail_Count1 + 1
            Timer_Failed1 = 1
            IF Timer_Fail_Count1 > 999 THEN Timer_Fail_Count1 = 999
        END IF

        IF Timer_Fail_Stream2 = 2 AND CooldownStartup = 0 THEN
            Timer_Fail_Count2 = Timer_Fail_Count2 + 1
            Timer_Failed2 = 1
            IF Timer_Fail_Count2 > 999 THEN Timer_Fail_Count2 = 999
        END IF
    ELSE
        SetCaption (Scene_CurrentLB), LEFT$(Scene_Current, 20)

        ' Stream #1 only
        IF srt_warmup = 1 THEN Timer_Fail_Stream1 = Timer_Fail_Stream1 + 1
        IF MediaSource1Time <> 0 AND RIST_MediaSource1Time_Count <= 4 THEN Timer_Fail_Stream1 = 0: Timer_Fail = 0 ' SRT ' RIST mode
        IF Timer_Fail_Stream1 > 32400 THEN Timer_Fail_Stream1 = 32400
        IF Timer_Fail_Output1 > 32400 THEN Timer_Fail_Output1 = 32400

        IF MediaSource1Time <= 3 THEN Control(Stream_UptimeLB).ForeColor = RED_FAIL ELSE IF MediaSource1Time > 3 AND MediaSource1Time < 10 THEN Control(Stream_UptimeLB).ForeColor = RED_WARNING ELSE Control(Stream_UptimeLB).ForeColor = GREEN_OK
        SetCaption (Stream_UptimeLB), calc_srt$(MediaSource1Time, 1) + calc_srt_sec$ ' SRT
        IF Timer_Fail_Stream1 >= Stream_Fail_Delay THEN Control(Stream_Fail_TimerLB).ForeColor = RED_FAIL ELSE IF Timer_Fail_Stream1 >= 1 THEN Control(Stream_Fail_TimerLB).ForeColor = RED_WARNING ELSE Control(Stream_Fail_TimerLB).ForeColor = GREEN_OK
        IF __FileStatusOutput = 1 OR ConnectionsLog = 1 THEN IF Timer_Fail_Stream1 >= 1 THEN Timer_Fail_Output1 = Timer_Fail_Stream1
        SetCaption (Stream_Fail_TimerLB), calc_srt$(Timer_Fail_Stream1, 1) + calc_srt_sec$
    END IF

    IF Scene_OK = "" OR Scene_Fail = "" OR Scene_Intro = "" THEN RefreshDisplayRequest = 1: Error_msg = "- Variable/s for scenes empty, check if " + c34 + config_main + c34 + " exists. (Error: #5)": _DELAY 3

    IF Timer_Fail >= 1 AND Exe_OK = 1 AND streamsUp <> "0" THEN
        LoadImageMEM Control(PictureBox1), "tick_warning.png"
    ELSEIF Timer_Fail = 0 AND Exe_OK = 1 THEN
        LoadImageMEM Control(PictureBox1), "tick.png"
    END IF


    IF __MultiCameraSwitch = 0 THEN
        IF SceneLBActive THEN SetCaption Timer_Fail_Count_2LB, "Enabled" ELSE SetCaption Timer_Fail_Count_2LB, "Disabled" + SceneLBActive_Temp_Disable_Display ' Displayed same time as others and not "IF __MultiCameraSwitch" above
    ELSE
        IF SceneLBActive THEN SetCaption Low_Bitrate_StatusLB, "Enabled" ELSE SetCaption Low_Bitrate_StatusLB, "Disabled" + SceneLBActive_Temp_Disable_Display ' Displayed same time as others and not "IF __MultiCameraSwitch" above
    END IF


    ' Update Display: ---------------------------------------------------------------
    ' Debug
    IF Debug = 0 THEN
        Control(DebugFrame).Hidden = True
        Control(versionFrame).Hidden = False
        Control(TimerLB).Hidden = True
        Control(TimerSnapshotLB).Hidden = True
        Control(td_displayLB2).Hidden = True
        Control(mouseXLB2).Hidden = True
        Control(mouseYLB2).Hidden = True
        Control(__ERRORLINELB2).Hidden = True
        Control(Debug_TimerLB).Hidden = True
        Control(Debug_Timer_SnapshotLB).Hidden = True
        Control(td_displayLB).Hidden = True
        Control(mouseXLB).Hidden = True
        Control(mouseYLB).Hidden = True
        Control(__ERRORLINELB).Hidden = True
        Control(LowBRTimerLB).Hidden = True
        Control(br_countdownLB).Hidden = True
        Control(MSRateLB).Hidden = True
        Control(MSRateLB2).Hidden = True
        Control(ms_playLB).Hidden = True
        Control(ms_playLB2).Hidden = True
        Control(LBRDelayLB).Hidden = True
        Control(br_delayLB).Hidden = True
        Control(PictureBoxLogoBottom).Hidden = False
        SetCaption Debug_TimerLB, "-"
        SetCaption Debug_Timer_SnapshotLB, "-"
        SetCaption td_displayLB, "-"
        SetCaption mouseXLB, "-"
        SetCaption mouseYLB, "-"
        SetCaption __ERRORLINELB, "-"
        SetCaption TimerLB, "-" ' TIMER
        SetCaption TimerSnapshotLB, "-"
        SetCaption td_displayLB2, "-"
        SetCaption mouseXLB2, "-"
        SetCaption mouseYLB2, "-"
        SetCaption __ERRORLINELB2, "-"
        SetCaption ms_playLB, "-"
        SetCaption ms_playLB2, "-"
        SetCaption br_countdownLB, "-"

        ' Debug Temp
        IF Debug_Temp = "true" THEN
            Control(DebugFrameTemp).Hidden = True
            Control(DebugTemp1LB).Hidden = True
            Control(DebugTemp2LB).Hidden = True
            Control(DebugTemp3LB).Hidden = True
            Control(DebugTemp4LB).Hidden = True
            Control(DebugTemp1LB2).Hidden = True
            Control(DebugTemp2LB2).Hidden = True
            Control(DebugTemp3LB2).Hidden = True
            Control(DebugTemp4LB2).Hidden = True
            Control(Settings).Hidden = False
        END IF

    ELSEIF Debug = 1 THEN
        Control(DebugFrame).Hidden = False
        Control(versionFrame).Hidden = True
        Control(TimerLB).Hidden = False
        Control(TimerSnapshotLB).Hidden = False
        Control(td_displayLB2).Hidden = False
        Control(mouseXLB2).Hidden = False
        Control(mouseYLB2).Hidden = False
        Control(__ERRORLINELB2).Hidden = False
        Control(Debug_TimerLB).Hidden = False
        Control(Debug_Timer_SnapshotLB).Hidden = False
        Control(td_displayLB).Hidden = False
        Control(mouseXLB).Hidden = False
        Control(mouseYLB).Hidden = False
        Control(__ERRORLINELB).Hidden = False
        Control(LowBRTimerLB).Hidden = False
        Control(ms_playLB).Hidden = False
        Control(ms_playLB2).Hidden = False
        Control(br_countdownLB).Hidden = False
        Control(MSRateLB).Hidden = False
        Control(MSRateLB2).Hidden = False
        Control(LBRDelayLB).Hidden = False
        Control(br_delayLB).Hidden = False
        Control(PictureBoxLogoBottom).Hidden = True

        ' Debug Temp
        IF Debug_Temp = "true" THEN
            Control(DebugFrameTemp).Hidden = False
            Control(DebugTemp1LB).Hidden = False
            Control(DebugTemp2LB).Hidden = False
            Control(DebugTemp3LB).Hidden = False
            Control(DebugTemp4LB).Hidden = False
            Control(DebugTemp1LB2).Hidden = False
            Control(DebugTemp2LB2).Hidden = False
            Control(DebugTemp3LB2).Hidden = False
            Control(DebugTemp4LB2).Hidden = False
            Control(Settings).Hidden = True
        END IF

        SetCaption TimerLB, "TIMER" ' TIMER
        SetCaption TimerSnapshotLB, "TIMER (snapshot)"
        SetCaption td_displayLB2, "td_display"
        SetCaption LBRDelayLB, "LBR Del"
        SetCaption mouseXLB2, "mouseX"
        SetCaption mouseYLB2, "mouseY"
        SetCaption __ERRORLINELB2, "_ERRORLINE"
        TIMEms Debug_Timer, 0
        SetCaption (Debug_Timer_SnapshotLB), tout + " sec "
        ' MS rate
        SetCaption ms_playLB, _TRIM$(STR$((MediaSourceTimeMSOffsetDisplay))) + " ms "
        SetCaption ms_playLB2, _TRIM$(STR$((MediaSource2TimeMSOffsetDisplay))) + " ms "
        SetCaption br_countdownLB, _TRIM$(STR$(CooldownLog)) + " sec "
        SetCaption br_delayLB, _TRIM$(STR$(LBR_Delay)) + " sec "

    END IF

    IF verCheck$ <> "" THEN
        SetCaption StatusLB, verCheck$
        updateDisplay = 1
    END IF
    ' ---------------------------------------------------------------

    ' Get OBS scene: ---------------------------------------------------------------
    GetOBSScene:
    IF Scene_Bypass <> Scene_Bypass_Check AND Scene_Bypass_2 <> Scene_Bypass_Check AND Scene_Bypass_3 <> Scene_Bypass_Check AND Scene_Bypass_4 <> Scene_Bypass_Check AND Scene_Bypass_5 <> Scene_Bypass_Check AND Scene_Bypass_6 <> Scene_Bypass_Check AND Scene_Bypass_7 <> Scene_Bypass_Check AND Scene_Bypass_8 <> Scene_Bypass_Check AND Scene_Bypass_9 <> Scene_Bypass_Check THEN
        returnPreviousSceneTime = returnPreviousSceneTime + 1
        IF returnPreviousSceneTime > 2 THEN
            ' Output Kbps to file
            IF __FileStatusOutput = 1 THEN
                ON ERROR GOTO App_Fail
                App_Refresh = 1
                OPEN outputKbpsFile1 FOR OUTPUT AS #200
                SELECT CASE SLS_Bitrate1
                    CASE 0 TO 99
                        IF SLS_Kbps_Precision <> "nerd" THEN PRINT #200, _TRIM$(STR$(INT(SLS_Bitrate1 / 100))) ELSE PRINT #200, _TRIM$(STR$(INT(SLS_Bitrate1)))
                    CASE IS >= 100
                        IF SLS_Kbps_Precision <> "nerd" THEN PRINT #200, _TRIM$(STR$(INT(SLS_Bitrate1 / 100))) + "00" ELSE PRINT #200, _TRIM$(STR$(INT(SLS_Bitrate1)))
                END SELECT
                CLOSE 200
                OPEN outputKbpsFile2 FOR OUTPUT AS #204
                SELECT CASE SLS_Bitrate2
                    CASE 0 TO 99
                        IF SLS_Kbps_Precision <> "nerd" THEN PRINT #204, _TRIM$(STR$(INT(SLS_Bitrate2 / 100))) ELSE PRINT #204, _TRIM$(STR$(INT(SLS_Bitrate2)))
                    CASE IS >= 100
                        IF SLS_Kbps_Precision <> "nerd" THEN PRINT #204, _TRIM$(STR$(INT(SLS_Bitrate2 / 100))) + "00" ELSE PRINT #204, _TRIM$(STR$(INT(SLS_Bitrate2)))
                END SELECT
                CLOSE 204
                ON ERROR GOTO 0
                App_Refresh = 0
            END IF
            returnPreviousSceneTime = 1
        ELSE
            GOTO Exit_returnPreviousSceneCheck
        END IF
        returnFirstCheck = 1

        ' NodeJSFileSystem selection controls this
        SELECT CASE NodejsFileSystem
            CASE "0"
                IF HTTP_Enabled = "true" THEN
                    SELECT CASE HTTP_Access
                        CASE "fast"
                            SHELL _HIDE CMD_EXE_HTTP_FAST_GET_SCENE
                        CASE ELSE
                            SHELL _HIDE CMD_EXE_HTTP_GET_SCENE
                    END SELECT
                ELSE
                    IF Nodejs_Access = "fast" THEN
                        SHELL _HIDE CMD_EXE_FAST + c34 + obs_get_scene + c34
                    ELSE
                        SHELL _HIDE CMD_EXE + c34 + obs_get_scene + c34 + " > " + c34 + filePrevious + c34
                        _DELAY 0.001
                    END IF
                END IF
            CASE "1"
                _DEST _CONSOLE
                IF FullScreen THEN
                    IF HTTP_Enabled = "true" THEN
                        SELECT CASE HTTP_Access
                            CASE "fast"
                                SHELL _HIDE CMD_EXE_HTTP_FAST_GET_SCENE
                            CASE ELSE
                                SHELL _HIDE CMD_EXE_HTTP_GET_SCENE
                        END SELECT
                    ELSE
                        IF Nodejs_Access = "fast" THEN
                            SHELL _HIDE CMD_EXE + c34 + obs_get_scene + c34
                        ELSE
                            SHELL _HIDE CMD_EXE + c34 + obs_get_scene + c34 + " > " + c34 + filePrevious + c34
                        END IF
                    END IF
                ELSE
                    IF HTTP_Enabled = "true" THEN
                        SELECT CASE HTTP_Access
                            CASE "fast"
                                SHELL CMD_EXE_HTTP_FAST_GET_SCENE
                            CASE ELSE
                                SHELL CMD_EXE_HTTP_GET_SCENE
                        END SELECT
                    ELSE
                        IF Nodejs_Access = "fast" THEN
                            SHELL CMD_EXE + c34 + obs_get_scene + c34
                        ELSE
                            SHELL CMD_EXE + c34 + obs_get_scene + c34 + " > " + c34 + filePrevious + c34
                        END IF
                    END IF
                END IF
                _DEST 0
                _DELAY 0.001
            CASE "2"
                IF srt_warmup_file_scene = 0 THEN
                    srt_warmup_file_scene = 1
                    ' No need to load another node.exe here because the .js file checks scene
                    $IF WIN THEN
                        IF OS = "WINDOWS" THEN y& = SetWindowPos&(Myhwnd, -1, 0, 0, 0, 0, &H2 + &H1 + &H40) ' Windows only
                    $END IF
                    _DELAY 3.5
                    $IF WIN THEN
                        IF OS = "WINDOWS" THEN y& = SetWindowPos&(Myhwnd, -2, 0, 0, 0, 0, &H2 + &H1 + &H40) ' Windows only
                    $END IF
                END IF
        END SELECT

        ON ERROR GOTO App_Fail
        App_Refresh = 1

        IF HTTP_Enabled <> "true" THEN ' HTTP

            IF _FILEEXISTS(filePrevious) THEN
                OPEN filePrevious FOR INPUT AS #96
                ' LOCK #96
                DO UNTIL EOF(96)
                    IF LOF(96) = 0 THEN NoKill = 1: EXIT DO ' Overkill with EOF checking, but just being safe
                    IF EOF(96) THEN EXIT DO
                    LINE INPUT #96, file96
                    Scene_Bypass_Check = file96
                    IF streamsUp <> "0" THEN previousScene = file96
                    previousSceneDisplay = file96
                    EXIT DO ' Output to previousScene
                LOOP
            END IF

        END IF

        IF HTTP_Enabled = "true" THEN ' HTTP

            OPEN filePrevious FOR BINARY AS #128
            JSON = SPACE$(LOF(128))
            GET #128, , JSON
            CLOSE #128
            file96 = GetKey("currentProgramSceneName", JSON)
            Scene_Bypass_Check = file96
            IF streamsUp <> "0" THEN previousScene = file96
            previousSceneDisplay = file96

        END IF

        IF __MultiCameraSwitch = 1 THEN SetCaption (Scene_CurrentLB), LEFT$(previousSceneDisplay, 20) ' Update scene name faster for multi-camera-switch

    ELSE

        IF Scene_Bypass <> "none" OR Scene_Bypass_2 <> "none" OR Scene_Bypass_3 <> "none" OR Scene_Bypass_4 <> "none" OR Scene_Bypass_5 <> "none" OR Scene_Bypass_6 <> "none" OR Scene_Bypass_7 <> "none" OR Scene_Bypass_8 <> "none" OR Scene_Bypass_9 <> "none" THEN

            SELECT CASE NodejsFileSystem
                CASE "0"
                    IF HTTP_Enabled = "true" THEN
                        SELECT CASE HTTP_Access
                            CASE "fast"
                                SHELL _HIDE CMD_EXE_HTTP_FAST_GET_SCENE
                            CASE ELSE
                                SHELL _HIDE CMD_EXE_HTTP_GET_SCENE
                        END SELECT
                    ELSE
                        IF Nodejs_Access = "fast" THEN
                            SHELL _HIDE CMD_EXE_FAST + c34 + obs_get_scene + c34
                        ELSE
                            SHELL _HIDE CMD_EXE + c34 + obs_get_scene + c34 + " > " + c34 + filePrevious + c34
                            _DELAY 0.001
                        END IF

                    END IF
                CASE "1"
                    _DEST _CONSOLE
                    IF FullScreen THEN
                        IF HTTP_Enabled = "true" THEN
                            SELECT CASE HTTP_Access
                                CASE "fast"
                                    SHELL _HIDE CMD_EXE_HTTP_FAST_GET_SCENE
                                CASE ELSE
                                    SHELL _HIDE CMD_EXE_HTTP_GET_SCENE
                            END SELECT
                        ELSE
                            IF Nodejs_Access = "fast" THEN
                                SHELL _HIDE CMD_EXE + c34 + obs_get_scene + c34
                            ELSE
                                SHELL _HIDE CMD_EXE + c34 + obs_get_scene + c34 + " > " + c34 + filePrevious + c34
                                _DELAY 0.001
                            END IF
                        END IF
                    ELSE
                        IF HTTP_Enabled = "true" THEN
                            SELECT CASE HTTP_Access
                                CASE "fast"
                                    SHELL CMD_EXE_HTTP_FAST_GET_SCENE
                                CASE ELSE
                                    SHELL CMD_EXE_HTTP_GET_SCENE
                            END SELECT
                        ELSE
                            IF Nodejs_Access = "fast" THEN
                                SHELL CMD_EXE + c34 + obs_get_scene + c34
                            ELSE
                                SHELL CMD_EXE + c34 + obs_get_scene + c34 + " > " + c34 + filePrevious + c34
                                _DELAY 0.001
                            END IF
                        END IF
                    END IF
                    _DEST 0
                    _DELAY 0.001
            END SELECT

            ON ERROR GOTO App_Fail
            App_Refresh = 1

            IF HTTP_Enabled <> "true" THEN ' HTTP

                IF _FILEEXISTS(filePrevious) THEN
                    OPEN filePrevious FOR INPUT AS #96
                    ' LOCK #96
                    DO UNTIL EOF(96)
                        IF LOF(96) = 0 THEN NoKill = 1: EXIT DO ' Overkill with EOF checking, but just being safe
                        IF EOF(96) THEN EXIT DO
                        LINE INPUT #96, file96
                        Scene_Bypass_Check = file96
                        '
                        '
                        EXIT DO ' Output to previousScene
                    LOOP
                END IF

            END IF

            IF HTTP_Enabled = "true" THEN ' HTTP

                OPEN filePrevious FOR BINARY AS #128
                JSON = SPACE$(LOF(128))
                GET #128, , JSON
                CLOSE #128
                file96 = GetKey("currentProgramSceneName", JSON)
                Scene_Bypass_Check = file96
                '
                '

            END IF

        END IF

    END IF
    CLOSE #96

    IF NoKill = 1 THEN NoKill = 0 ELSE IF _FILEEXISTS(filePrevious) THEN KILL filePrevious

    ON ERROR GOTO 0
    App_Refresh = 0

    ' Check if any of the 9 bypass scenes equal the current scene
    IF Scene_Bypass_Check <> "none" THEN ' In case user has scene name labelled "none", which will break the program
        IF Scene_Bypass = Scene_Bypass_Check OR Scene_Bypass_2 = Scene_Bypass_Check OR Scene_Bypass_3 = Scene_Bypass_Check OR Scene_Bypass_4 = Scene_Bypass_Check OR Scene_Bypass_5 = Scene_Bypass_Check OR Scene_Bypass_6 = Scene_Bypass_Check OR Scene_Bypass_7 = Scene_Bypass_Check OR Scene_Bypass_8 = Scene_Bypass_Check OR Scene_Bypass_9 = Scene_Bypass_Check THEN
            SetCaption (Scene_CurrentLB), "[ PAUSE ]"
            IF Scene_Bypass_Log = 0 THEN
                Scene_Bypass_Log = 1
                IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM PAUSED]"
                IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Stream manually paused"
            END IF
            _DELAY 1
            GOTO GetOBSScene
        END IF
    END IF

    Exit_returnPreviousSceneCheck:
    ' ---------------------------------------------------------------

    Scene_Bypass_Log = 0

    ' Execute Stream OK
    IF __MultiCameraSwitch = 0 THEN
        IF MediaSource1Time <> 0 AND RIST_MediaSource1Time_Count <= 4 THEN ' SRT ' RIST mode
            Timer_Fail = 0
            IF CooldownLog = 0 THEN Scene_Current = Scene_OK
            IF Exe_Fail = 1 THEN
                Exe_Fail = 0
                Exe_OK = 1
                LoadImageMEM Control(PictureBox1), "tick.png"
                SHELL _HIDE _DONTWAIT shell_cmd_1 + Scene_OK + shell_cmd_2
                _DELAY 0.033
                IF Timer_Fail_Output1 = 0 THEN Timer_Fail_Output1_Str = "-" ELSE Timer_Fail_Output1_Str = STR$(Timer_Fail_Output1)
                IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP] (" + _TRIM$(Timer_Fail_Output1_Str) + " sec)"
                IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Now online stream (" + _TRIM$(Timer_Fail_Output1_Str) + " sec)"
                Timer_Fail_Stream1 = 0
            END IF
        ELSE
            IF Timer_Fail >= Stream_Fail_Delay OR RIST_MediaSource1Time_Count >= 5 THEN ' RIST mode ' Scene_Fail triggered at 5 seconds, the same as SRT timeout
                IF Exe_OK = 1 THEN
                    Exe_OK = 0
                    Exe_Fail = 1
                    LoadImageMEM Control(PictureBox1), "cross.png"
                    IF Exe_Fail_First = 0 THEN
                        Exe_Fail_First = 1
                        Scene_Current = Scene_Intro
                        SHELL _HIDE _DONTWAIT shell_cmd_1 + Scene_Intro + shell_cmd_2
                        _DELAY 0.033
                    ELSE
                        Scene_Current = Scene_Fail
                        SHELL _HIDE _DONTWAIT shell_cmd_1 + Scene_Fail + shell_cmd_2
                        _DELAY 0.033
                        IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM DOWN]"
                        IF ConnectionsLog THEN statusConnectionsLogToFile "[WARN] No bandwidth for stream, " + _TRIM$(STR$(ConnectionsLog1Count)) + " times"
                        Timer_Fail_Count = Timer_Fail_Count + 1
                        Timer_Failed = 1
                        IF Timer_Fail_Count > 999 THEN Timer_Fail_Count = 999
                    END IF
                END IF
            END IF
        END IF
        IF __MultiCameraSwitch = 1 THEN SetCaption (Scene_CurrentLB), LEFT$(previousSceneDisplay, 20) ELSE SetCaption (Scene_CurrentLB), LEFT$(Scene_Current, 20)
    END IF

    IF streamsUp <> "0" THEN lastStreamUp = streamsUp

    ' Only set variable if not a Low Bitrate scene
    IF RIGHT$(previousScene, 4) <> " LBR" THEN
        IF streamsUp <> "0" AND __returnPreviousSceneRemember = 1 THEN
            IF streamsUp = "1" THEN titleScene1 = previousScene
            IF streamsUp = "2" THEN titleScene2 = previousScene
            IF streamsUp = "12" THEN titleScene12 = previousScene
        END IF
    END IF

    IF __MultiCameraSwitch = 1 THEN
        IF Timer_Fail_Stream1 = 0 AND Timer_Fail_Stream2 >= Stream_Fail_Delay THEN
            IF streamsUp <> "1" THEN
                IF previousScene <> titleScene1 AND streamsUp = "0" AND __returnPreviousScene = 1 THEN ' __returnPreviousScene added for ReturnPreviousSceneRemember=false
                    IF lastStreamUp <> "1" THEN previousScene = titleScene1
                    Scene_Current = previousScene
                    SHELL _HIDE _DONTWAIT shell_cmd_1 + previousScene + shell_cmd_2
                    _DELAY 0.033
                    IF Timer_Fail_Output1 = 0 THEN Timer_Fail_Output1_Str = "-" ELSE Timer_Fail_Output1_Str = STR$(Timer_Fail_Output1)
                    IF Timer_Fail_Output2 = 0 THEN Timer_Fail_Output2_Str = "-" ELSE Timer_Fail_Output2_Str = STR$(Timer_Fail_Output2)
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[CAMERA #1 UP]:[CAMERA #2 DOWN] (" + _TRIM$(Timer_Fail_Output1_Str) + " sec)"
                    IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Now online stream #1, now down stream #2 (" + _TRIM$(Timer_Fail_Output1_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                ELSE ' ReturnPreviousSceneRemember=false
                    Scene_Current = titleScene1
                    SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene1 + shell_cmd_2
                    _DELAY 0.033
                    IF Timer_Fail_Output1 = 0 THEN Timer_Fail_Output1_Str = "-" ELSE Timer_Fail_Output1_Str = STR$(Timer_Fail_Output1)
                    IF Timer_Fail_Output2 = 0 THEN Timer_Fail_Output2_Str = "-" ELSE Timer_Fail_Output2_Str = STR$(Timer_Fail_Output2)
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[CAMERA #1 UP] (" + _TRIM$(Timer_Fail_Output1_Str) + " sec)"
                    IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Now online stream #1 (" + _TRIM$(Timer_Fail_Output1_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                END IF
            END IF
            streamsUp = "1"
        END IF

        IF Timer_Fail_Stream1 >= Stream_Fail_Delay AND Timer_Fail_Stream2 = 0 THEN
            IF streamsUp <> "2" THEN
                IF previousScene <> titleScene2 AND streamsUp = "0" AND __returnPreviousScene = 1 THEN
                    IF lastStreamUp <> "2" THEN previousScene = titleScene2
                    Scene_Current = previousScene
                    SHELL _HIDE _DONTWAIT shell_cmd_1 + previousScene + shell_cmd_2
                    _DELAY 0.033
                    IF Timer_Fail_Output1 = 0 THEN Timer_Fail_Output1_Str = "-" ELSE Timer_Fail_Output1_Str = STR$(Timer_Fail_Output1)
                    IF Timer_Fail_Output2 = 0 THEN Timer_Fail_Output2_Str = "-" ELSE Timer_Fail_Output2_Str = STR$(Timer_Fail_Output2)
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[CAMERA #2 UP]:[CAMERA #1 DOWN] (" + _TRIM$(Timer_Fail_Output2_Str) + " sec)"
                    IF ConnectionsLog THEN statusConnectionsLogToFile "[WARN] Now down stream #1, now online stream #2 (" + _TRIM$(Timer_Fail_Output2_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                ELSE ' ReturnPreviousSceneRemember=false
                    Scene_Current = titleScene2
                    SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene2 + shell_cmd_2
                    _DELAY 0.033
                    IF Timer_Fail_Output1 = 0 THEN Timer_Fail_Output1_Str = "-" ELSE Timer_Fail_Output1_Str = STR$(Timer_Fail_Output1)
                    IF Timer_Fail_Output2 = 0 THEN Timer_Fail_Output2_Str = "-" ELSE Timer_Fail_Output2_Str = STR$(Timer_Fail_Output2)
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[CAMERA #2 UP] (" + _TRIM$(Timer_Fail_Output2_Str) + " sec)"
                    IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Now online stream #2 (" + _TRIM$(Timer_Fail_Output2_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                END IF
            END IF
            streamsUp = "2"
        END IF

        IF Timer_Fail_Stream1 = 0 AND Timer_Fail_Stream2 = 0 THEN
            IF streamsUp <> "12" THEN
                IF previousScene <> titleScene12 AND streamsUp = "0" AND __returnPreviousScene = 1 THEN
                    IF lastStreamUp <> "12" THEN previousScene = titleScene12
                    Scene_Current = previousScene
                    SHELL _HIDE _DONTWAIT shell_cmd_1 + previousScene + shell_cmd_2
                    _DELAY 0.033
                    IF Timer_Fail_Output1 = 0 THEN Timer_Fail_Output1_Str = "-" ELSE Timer_Fail_Output1_Str = STR$(Timer_Fail_Output1)
                    IF Timer_Fail_Output2 = 0 THEN Timer_Fail_Output2_Str = "-" ELSE Timer_Fail_Output2_Str = STR$(Timer_Fail_Output2)
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[ALL CAMERAS UP] (" + _TRIM$(Timer_Fail_Output1_Str) + " sec):(" + _TRIM$(Timer_Fail_Output2_Str) + " sec)"
                    IF ConnectionsLog THEN statusConnectionsLogToFile "[INFO] Now online stream #1, now online stream #2 (" + _TRIM$(Timer_Fail_Output1_Str) + " sec):(" + _TRIM$(Timer_Fail_Output2_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                ELSE ' ReturnPreviousSceneRemember=false
                    ' CooldownLog = CooldownLogTotal
                    Scene_Current = titleScene12
                    IF CooldownLog AND CooldownStartup = 0 THEN
                        SELECT CASE SceneLBActive
                            CASE 0
                                SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene12 + shell_cmd_2
                            CASE 1
                                SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene12 + " LBR" + shell_cmd_2
                        END SELECT
                    ELSE
                        SHELL _HIDE _DONTWAIT shell_cmd_1 + titleScene12 + shell_cmd_2
                    END IF
                    _DELAY 0.033
                    IF Timer_Fail_Output1 = 0 THEN Timer_Fail_Output1_Str = "-" ELSE Timer_Fail_Output1_Str = STR$(Timer_Fail_Output1)
                    IF Timer_Fail_Output2 = 0 THEN Timer_Fail_Output2_Str = "-" ELSE Timer_Fail_Output2_Str = STR$(Timer_Fail_Output2)
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[ALL CAMERAS UP] (" + _TRIM$(Timer_Fail_Output1_Str) + " sec):(" + _TRIM$(Timer_Fail_Output2_Str) + " sec)"
                    IF ConnectionsLog AND CooldownLog = 0 THEN statusConnectionsLogToFile "[INFO] Now online stream #1, now online stream #2 (" + _TRIM$(Timer_Fail_Output1_Str) + " sec):(" + _TRIM$(Timer_Fail_Output2_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                END IF
            END IF
            streamsUp = "12"
        END IF

        IF Timer_Fail_Stream1 >= Stream_Fail_Delay AND Timer_Fail_Stream2 >= Stream_Fail_Delay THEN
            IF streamsUp <> "0" THEN
                streamsUp = "0"
                LoadImageMEM Control(PictureBox1), "cross.png"
                IF Exe_Fail_First = 0 THEN
                    Exe_Fail_First = 1
                    Scene_Current = Scene_Intro
                    SHELL _HIDE _DONTWAIT shell_cmd_1 + Scene_Intro + shell_cmd_2
                    _DELAY 0.033
                ELSE
                    Scene_Current = Scene_Fail
                    SHELL _HIDE _DONTWAIT shell_cmd_1 + Scene_Fail + shell_cmd_2
                    _DELAY 0.033
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM DOWN]:[ALL CAMERAS DOWN]"
                    IF ConnectionsLog THEN statusConnectionsLogToFile "[WARN] No bandwidth for stream #1, no bandwidth for stream #2"
                    Timer_Fail_Count = Timer_Fail_Count + 1
                    Timer_Failed = 1
                    IF Timer_Fail_Count > 999 THEN Timer_Fail_Count = 999
                END IF
            END IF
        END IF
    END IF

    IF srt_warmup = 1 AND returnFirstCheck = 1 AND __MultiCameraSwitch = 1 AND previousSceneDisplay = "" THEN RefreshDisplayRequest = 1: Error_msg = "- Variable/s for scenes empty, check if OBS is open." + CHR$(10) + "- If OBS is open, check communication is available via Node.js or obs-websocket-http.": Error_msg_2$ = "- If Node.js is selected, check OBS WebSockets options are correctly set. (Error: #6)": _DELAY 3

    IF Exe_Fail_First = 0 THEN
        Timer_Fail_First = Timer_Fail_First + 1
        IF (Stream_Fail_Delay + 3) - Timer_Fail_First <= 0 THEN Exe_Fail_First = 1
    END IF

    IF Exe_Fail_First_Stream1 = 0 THEN
        Timer_Fail_First_Stream1 = Timer_Fail_First_Stream1 + 1
        IF (Stream_Fail_Delay + 3) - Timer_Fail_First_Stream1 <= 0 THEN Exe_Fail_First_Stream1 = 1
    END IF

    IF Exe_Fail_First_Stream2 = 0 THEN
        Timer_Fail_First_Stream2 = Timer_Fail_First_Stream2 + 1
        IF (Stream_Fail_Delay + 3) - Timer_Fail_First_Stream2 <= 0 THEN Exe_Fail_First_Stream2 = 1
    END IF

    IF Refresh_Request = 1 THEN
        Refresh_Request = 0
        RefreshDisplayRequest = 1
    END IF

    CooldownStartup = CooldownStartup - 1
    IF CooldownStartup < 0 THEN CooldownStartup = 0

    IF srt_warmup_LB >= 1 THEN srt_warmup_LB = srt_warmup_LB - 1

    IF srt_warmup = 0 THEN
        srt_warmup = 1
        IF Allow_Resize = "true" THEN
            _RESIZE ON , _SMOOTH
            _DELAY 0.25
        END IF
        ON ERROR GOTO App_Fail
        network_client = _OPENCLIENT("TCP/IP:" + MID$(OBS_URL, INSTR(OBS_URL, ":") + 1) + ":" + LEFT$(OBS_URL, INSTR(OBS_URL, ":") - 1))
        CLOSE network_client
        ON ERROR GOTO 0
    END IF

    IF ErrorTestRunOnce = 1 THEN ErrorTestRunOnce = 0

    td_display = TIMER(.001) - timer1
END SUB

'$INCLUDE:'InForm\InForm.ui'

