': This program uses
': InForm - GUI library for QB64 - v1.3
': Fellippe Heitor, 2016-2020 - fellippe@qb64.org - @fellippeheitor
': https://github.com/FellippeHeitor/InForm
'-----------------------------------------------------------

': Controls' IDs: ------------------------------------------------------------------
OPTION _EXPLICIT
DIM SHARED LoopySRTMonitor AS LONG
DIM SHARED FileMenu AS LONG
DIM SHARED OptionsMenu AS LONG
DIM SHARED HelpMenu AS LONG
DIM SHARED SRT AS LONG
DIM SHARED Status AS LONG
DIM SHARED Settings AS LONG
DIM SHARED CurrentScene AS LONG
DIM SHARED DebugFrame AS LONG
DIM SHARED Stream1 AS LONG
DIM SHARED Stream2 AS LONG
DIM SHARED versionFrame AS LONG
DIM SHARED FileMenuExit AS LONG
DIM SHARED RMTPLB AS LONG
DIM SHARED clientsLB AS LONG
DIM SHARED VideoLB AS LONG
DIM SHARED AudioLB AS LONG
DIM SHARED InBytesLB AS LONG
DIM SHARED OutBytesLB AS LONG
DIM SHARED InBitssLB AS LONG
DIM SHARED OutBitssLB AS LONG
DIM SHARED TimeLB AS LONG
DIM SHARED rtmp_nacceptedLB AS LONG
DIM SHARED rtmp_codec_nclientsLB AS LONG
DIM SHARED rtmp_codec_videoLB AS LONG
DIM SHARED rtmp_codec_audioLB AS LONG
DIM SHARED rtmp_bytes_inLB AS LONG
DIM SHARED rtmp_bytes_outLB AS LONG
DIM SHARED rtmp_bw_inLB AS LONG
DIM SHARED rtmp_bw_outLB AS LONG
DIM SHARED rtmp_uptimeLB AS LONG
DIM SHARED InBytesDifferenceLB AS LONG
DIM SHARED StreamFailTimerLB AS LONG
DIM SHARED FailCountLB AS LONG
DIM SHARED ServerPingLB AS LONG
DIM SHARED UpdateIntervalLB AS LONG
DIM SHARED Kb_DiffLB AS LONG
DIM SHARED Timer_FailLB AS LONG
DIM SHARED Timer_Fail_CountLB AS LONG
DIM SHARED tPingOutLB AS LONG
DIM SHARED td_updateLB AS LONG
DIM SHARED BandwidthThresholdLB AS LONG
DIM SHARED StreamFailDelayLB AS LONG
DIM SHARED MultiCameraSwitchLB AS LONG
DIM SHARED Bandwidth_ThresholdLB AS LONG
DIM SHARED Stream_Fail_DelayLB AS LONG
DIM SHARED MultiCameraSwitchStatusLB AS LONG
DIM SHARED TimerLB AS LONG
DIM SHARED TimerSnapshotLB AS LONG
DIM SHARED td_displayVarLB AS LONG
DIM SHARED mouseXVarLB AS LONG
DIM SHARED mouseYVarLB AS LONG
DIM SHARED __ERRORLINEVarLB AS LONG
DIM SHARED Debug_TimerLB AS LONG
DIM SHARED Debug_Timer_SnapshotLB AS LONG
DIM SHARED td_displayLB AS LONG
DIM SHARED mouseXLB AS LONG
DIM SHARED mouseYLB AS LONG
DIM SHARED __ERRORLINELB AS LONG
DIM SHARED InBytesLB2 AS LONG
DIM SHARED InBytesDifferenceLB2 AS LONG
DIM SHARED failLB AS LONG
DIM SHARED multiStream1LB AS LONG
DIM SHARED Kb_Diff_stream1LB AS LONG
DIM SHARED Timer_Fail_Stream1LB AS LONG
DIM SHARED Scene_CurrentLB AS LONG
DIM SHARED PictureBox1 AS LONG
DIM SHARED InBytesLB3 AS LONG
DIM SHARED InBytesDifferenceLB3 AS LONG
DIM SHARED failLB2 AS LONG
DIM SHARED multiStream2LB AS LONG
DIM SHARED Kb_Diff_stream2LB AS LONG
DIM SHARED Timer_Fail_Stream2LB AS LONG
DIM SHARED OptionsMenuDebug AS LONG
DIM SHARED HelpMenuVisitWebsite AS LONG
DIM SHARED HelpMenuCheckForUpdates AS LONG
DIM SHARED OptionsMenuFullscreen AS LONG
DIM SHARED IndicatorLB AS LONG
DIM SHARED HelpMenuAbout AS LONG
DIM SHARED StatusLB AS LONG
DIM SHARED PictureBoxLogoBottom AS LONG
DIM SHARED OBSRemoteLB AS LONG
DIM SHARED OBS_RemoteLB AS LONG

'InForm v1.3 or newer required else this section gets removed (InForm_Deleted.bas)
DEFINT A-Z
COMMON SHARED Error_Display AS STRING
COMMON SHARED Error_msg AS STRING
COMMON SHARED Ver AS STRING
COMMON SHARED VerDate AS STRING
COMMON SHARED bout AS STRING
COMMON SHARED tout AS STRING
COMMON SHARED BG_Count AS LONG
COMMON SHARED ConnErr
COMMON SHARED Refresh_Request
COMMON SHARED RefreshDisplayRequest
COMMON SHARED rtmp_uptime#
COMMON SHARED ba&
COMMON SHARED winstyle&
COMMON SHARED timerFree
COMMON SHARED BG AS DOUBLE
COMMON SHARED BG_New AS DOUBLE
COMMON SHARED BGA AS DOUBLE
COMMON SHARED __BGA AS _BYTE
COMMON SHARED SpaceLength AS INTEGER
COMMON SHARED ProgressCounter AS INTEGER
COMMON SHARED updateResult AS STRING
COMMON SHARED updateDisplay AS INTEGER
COMMON SHARED updateDisplayCounter AS INTEGER
COMMON SHARED verCheck AS STRING
COMMON SHARED CheckUpdateOnStartup AS STRING
COMMON SHARED file224 AS STRING
COMMON SHARED __FileStatusOutput AS _BYTE
COMMON SHARED FileStatusOutput AS STRING
COMMON SHARED outputBitrateFile AS STRING
COMMON SHARED outputStatusFile AS STRING
COMMON SHARED iniFeatures AS _BYTE
COMMON SHARED Debug AS _BYTE
COMMON SHARED q
COMMON SHARED Timer_Failed AS _BYTE
COMMON SHARED WebsocketMethod AS STRING
COMMON SHARED MediaSource1 AS STRING
COMMON SHARED MediaSource2 AS STRING
COMMON SHARED MediaSource1Time AS LONG
COMMON SHARED MediaSource2Time AS LONG
COMMON SHARED c34 AS STRING

COMMON SHARED image_data() AS _UNSIGNED LONG
COMMON SHARED Scene_OK AS STRING
COMMON SHARED Scene_Fail AS STRING
COMMON SHARED Scene_Intro AS STRING
COMMON SHARED URL AS STRING
COMMON SHARED Port AS STRING
COMMON SHARED OBS_URL AS STRING
COMMON SHARED OBS_PW AS STRING
COMMON SHARED urlStream1 AS STRING
COMMON SHARED urlStream2 AS STRING
COMMON SHARED titleScene1 AS STRING
COMMON SHARED titleScene2 AS STRING
COMMON SHARED titleScene12 AS STRING
COMMON SHARED returnPreviousScene AS STRING
COMMON SHARED shell_obscommand_1 AS STRING
COMMON SHARED shell_obscommand_2 AS STRING
COMMON SHARED shell_nodejs_1 AS STRING
COMMON SHARED shell_nodejs_2 AS STRING

COMMON SHARED config_dir AS STRING
COMMON SHARED obscommand_dir AS STRING
COMMON SHARED nodejs_dir AS STRING
COMMON SHARED temp_dir AS STRING
COMMON SHARED config_main AS STRING
COMMON SHARED obs_change_scene AS STRING
COMMON SHARED obs_get_scene AS STRING
COMMON SHARED obs_get_media1 AS STRING
COMMON SHARED obs_get_media2 AS STRING
COMMON SHARED filePrevious AS STRING
COMMON SHARED fileStat AS STRING
COMMON SHARED fileCheckVersion AS STRING
COMMON SHARED obscommand_file AS STRING

COMMON SHARED Exe_OK AS _BYTE
COMMON SHARED Exe_Fail AS _BYTE
COMMON SHARED Exe_Fail_First AS _BYTE
COMMON SHARED Exe_Fail_First_Stream1 AS _BYTE
COMMON SHARED Exe_Fail_First_Stream2 AS _BYTE

COMMON SHARED __MultiCameraSwitch AS _BYTE

'Tooltips
COMMON SHARED rtmp_codec_video_level$
COMMON SHARED rtmp_codec_video_profile$
COMMON SHARED rtmp_codec_audio_channels$
COMMON SHARED rtmp_codec_audio_samplerate$
COMMON SHARED rtmp_codec_audio_profile$
COMMON SHARED rtmp_codec_video_width$
COMMON SHARED rtmp_codec_video_height$
COMMON SHARED rtmp_codec_video_resolution$
COMMON SHARED rtmp_codec_version$
COMMON SHARED rtmp_codec_rtmp_version$

'Timer01
COMMON SHARED mouseX
COMMON SHARED mouseY
COMMON SHARED Timer_Fail AS INTEGER
COMMON SHARED Timer_Fail_Count AS INTEGER
COMMON SHARED Timer_Fail_Stream1 AS INTEGER
COMMON SHARED Timer_Fail_Stream2 AS INTEGER
COMMON SHARED FullScreen AS _BYTE
COMMON SHARED BG
COMMON SHARED srt_warmup AS _BYTE
COMMON SHARED Port_Client$
COMMON SHARED td_update#
COMMON SHARED timer1#
COMMON SHARED Debug_Timer#
COMMON SHARED __returnPreviousScene
COMMON SHARED returnPreviousSceneTime AS _BYTE
COMMON SHARED returnFirstCheck
COMMON SHARED filePrevious
COMMON SHARED PUT_Refresh
COMMON SHARED NoKill
COMMON SHARED file92$
COMMON SHARED file96$
COMMON SHARED findSceneName
COMMON SHARED findSceneName2
COMMON SHARED streamsUp$
COMMON SHARED previousScene$
COMMON SHARED previousSceneDisplay$
COMMON SHARED rtmp_naccepted$
COMMON SHARED rtmp_bytes_in$
COMMON SHARED rtmp_bytes_out$
COMMON SHARED rtmp_bw_in$
COMMON SHARED rtmp_bw_out$
COMMON SHARED rtmp_codec_video$
COMMON SHARED rtmp_codec_audio$
COMMON SHARED rtmp_codec_nclients$
COMMON SHARED rtmp_codec_nclients#
COMMON SHARED rtmp_codec_nclients_temp#
COMMON SHARED a$
COMMON SHARED a2$
COMMON SHARED d$
COMMON SHARED I
COMMON SHARED i2
COMMON SHARED i3
COMMON SHARED stats_rtmp.xml$
COMMON SHARED tPing1#
COMMON SHARED client
COMMON SHARED tPing2#
COMMON SHARED tPingOut#
COMMON SHARED EOL$
COMMON SHARED Timer_GET!
COMMON SHARED __MultiCameraSwitch
COMMON SHARED Stream%
COMMON SHARED multiStream1#
COMMON SHARED multiStream2#
COMMON SHARED pos_xml_m&
COMMON SHARED Kb_Diff#
COMMON SHARED Bandwidth_Threshold
COMMON SHARED rtmp_bytes_in#
COMMON SHARED rtmp_bytes_in_temp1#
COMMON SHARED rtmp_bytes_in_temp2#
COMMON SHARED Stream_Fail_Delay
COMMON SHARED SD
COMMON SHARED Kb_Diff_stream1#
COMMON SHARED multiStream1_temp1#
COMMON SHARED multiStream1_temp2#
COMMON SHARED Kb_Diff_stream2#
COMMON SHARED multiStream2_temp1#
COMMON SHARED multiStream2_temp2#
COMMON SHARED Scene_OK
COMMON SHARED Scene_Fail
COMMON SHARED Scene_Intro
COMMON SHARED Exe_OK
COMMON SHARED Scene_Current$
COMMON SHARED Exe_Fail
COMMON SHARED lastStreamUp$
COMMON SHARED returnPreviousSceneRemember
COMMON SHARED titleScene1
COMMON SHARED titleScene2
COMMON SHARED titleScene12
COMMON SHARED OBS_URL
COMMON SHARED OBS_PW
COMMON SHARED Exe_Fail_First
COMMON SHARED Timer_Fail_First
COMMON SHARED Timer_Fail_First_Stream1
COMMON SHARED Exe_Fail_First_Stream1
COMMON SHARED Exe_Fail_First_Stream2
COMMON SHARED Timer_Fail_First_Stream
COMMON SHARED Timer_Fail_First_Stream2
COMMON SHARED td_display#

'Misc
COMMON SHARED FGwin AS LONG
COMMON SHARED file4_var AS STRING
COMMON SHARED file4_val AS STRING
COMMON SHARED BSOD AS LONG
COMMON SHARED OptionsMenuAlwaysOnTop AS INTEGER
COMMON SHARED AlwaysOnTop AS INTEGER
COMMON SHARED Myhwnd AS _UNSIGNED LONG
COMMON SHARED y AS LONG
COMMON SHARED HWND_TOPMOST AS LONG
COMMON SHARED SWP_NOMOVE AS LONG
COMMON SHARED SWP_NOSIZE AS LONG
COMMON SHARED SWP_SHOWWINDOW AS LONG
COMMON SHARED HWND_BOTTOM AS LONG
COMMON SHARED SWP_NOACTIVATE AS LONG
COMMON SHARED About AS INTEGER
COMMON SHARED Answer AS INTEGER
COMMON SHARED Pt AS LONG
COMMON SHARED x2 AS INTEGER
COMMON SHARED Px AS INTEGER
COMMON SHARED Py AS INTEGER
COMMON SHARED NULL AS INTEGER
COMMON SHARED xHeader1 AS STRING
COMMON SHARED xHeader2 AS STRING
COMMON SHARED xHeader3 AS STRING
COMMON SHARED xHeader4 AS STRING
COMMON SHARED xHeader5 AS STRING
COMMON SHARED xHeader6 AS STRING
COMMON SHARED xHeader7 AS STRING
COMMON SHARED xHeader8 AS STRING
COMMON SHARED xHeader9 AS STRING
COMMON SHARED x AS STRING
COMMON SHARED l AS INTEGER
COMMON SHARED rtmp_naccepted AS DOUBLE
COMMON SHARED rtmp_bytes_out AS DOUBLE
COMMON SHARED rtmp_bw_in AS DOUBLE
COMMON SHARED rtmp_bw_out AS DOUBLE

'OnLoad
COMMON SHARED config_dir
COMMON SHARED config_main
COMMON SHARED URL
COMMON SHARED Port
COMMON SHARED fileStat
COMMON SHARED Desktop_Width_Position
COMMON SHARED Desktop_Height_Position
COMMON SHARED file4$
COMMON SHARED EqualFound
COMMON SHARED MultiCameraSwitch$
COMMON SHARED urlStream1
COMMON SHARED urlStream2
COMMON SHARED returnPreviousScene
COMMON SHARED returnPreviousSceneRemember$


'SUB Indicators
COMMON SHARED AliveIndicator!
COMMON SHARED __BGA
COMMON SHARED BGA
COMMON SHARED aioffsetX
COMMON SHARED aioffsetY

'SUB TIMEms
COMMON SHARED tout
COMMON SHARED tout#
COMMON SHARED tout2#
COMMON SHARED toutint#
COMMON SHARED toutdec#
COMMON SHARED plus

'SUB calcbw
COMMON SHARED bout
COMMON SHARED bout2#
COMMON SHARED bout#
COMMON SHARED boutnodec
COMMON SHARED bits
COMMON SHARED boutint#
COMMON SHARED boutm$
COMMON SHARED boutdec#
COMMON SHARED boutdec$

'FUNC calc_srt$
COMMON SHARED convertTime#
COMMON SHARED includeSec
COMMON SHARED t_hr
COMMON SHARED t_min
COMMON SHARED t_sec

COMMON SHARED RED_WARNING AS _UNSIGNED LONG
COMMON SHARED RED_FAIL AS _UNSIGNED LONG
COMMON SHARED GREEN_OK AS _UNSIGNED LONG

RED_WARNING = _RGB32(205, 64, 32)
RED_FAIL = _RGB32(255, 32, 16)
GREEN_OK = _RGB32(123, 151, 163)

q = _EXIT

PUT_Fail:
IF ERR THEN CLS: _PRINTSTRING (20, 30), "ERR, _ERRORLINE:" + STR$(ERR) + "," + STR$(_ERRORLINE): _AUTODISPLAY: _DELAY 3: IF PUT_Refresh = 1 THEN PUT_Refresh = 0: Refresh_Request = 1: RESUME NEXT ELSE RESUME NEXT
'END (InForm_Deleted.bas)

': External modules: ---------------------------------------------------------------
'$INCLUDE:'InForm\InForm.ui'
'$INCLUDE:'InForm\xp.uitheme'
'$INCLUDE:'loopy_srt_monitor.frm'

': Event procedures: ---------------------------------------------------------------
': External modules: ---------------------------------------------------------------
'$INCLUDE:'loopy_srt_monitor_light.frm'
'$INCLUDE:'image.png.MEM'
': ---------------------------------------------------------------------------------
SUB __UI_BeforeInit
    $VERSIONINFO:CompanyName=loopy750
    $VERSIONINFO:ProductName=Loopy SRT Monitor
    $VERSIONINFO:Comments=Monitor SRT Streams
    $VERSIONINFO:FileDescription=Loopy SRT Monitor
    $VERSIONINFO:FILEVERSION#=0,9,0,0
    $VERSIONINFO:PRODUCTVERSION#=0,9,0,0
    $CHECKING:ON
    $RESIZE:OFF
    IF ERR = 0 THEN
        $EXEICON:'.\icon.ico'
        _TITLE "Loopy SRT Monitor - loopy750"
    END IF
    Ver = "0.9.0"
    VerDate = "05/21"

    'Always on top : ------------------------------------------------------------------
    CONST HWND_TOPMOST%& = -1
    CONST SWP_NOSIZE%& = &H1
    CONST SWP_NOMOVE%& = &H2
    CONST SWP_SHOWWINDOW%& = &H40

    DECLARE DYNAMIC LIBRARY "user32"
        FUNCTION SetWindowPos& (BYVAL hWnd AS LONG, BYVAL hWndInsertAfter AS _OFFSET, BYVAL X AS INTEGER, BYVAL Y AS INTEGER, BYVAL cx AS INTEGER, BYVAL cy AS INTEGER, BYVAL uFlags AS _OFFSET)
        FUNCTION GetForegroundWindow& 'find currently focused process handle
    END DECLARE

    'DIM Myhwnd AS _UNSIGNED LONG 'Commented until Always on top can work
    'Myhwnd = _WINDOWHANDLE

    FGwin& = GetForegroundWindow&
    '----------------------------------------------------------------------------------
END SUB

SUB __UI_OnLoad
    'SRT
    SetCaption rtmp_nacceptedLB, "-"
    SetCaption rtmp_codec_nclientsLB, "-"
    SetCaption rtmp_codec_videoLB, "-"
    SetCaption rtmp_codec_audioLB, "-"
    SetCaption rtmp_bytes_inLB, "-"
    SetCaption rtmp_bytes_outLB, "-"
    SetCaption rtmp_bw_inLB, "-"
    SetCaption rtmp_bw_outLB, "-"
    SetCaption rtmp_uptimeLB, "-"
    'Status
    SetCaption Kb_DiffLB, "-"
    SetCaption Timer_FailLB, "-"
    SetCaption Timer_Fail_CountLB, "-"
    SetCaption tPingOutLB, "-"
    SetCaption td_updateLB, "-"
    'Settings
    SetCaption Bandwidth_ThresholdLB, "-"
    SetCaption Stream_Fail_DelayLB, "-"
    SetCaption MultiCameraSwitchStatusLB, "-"
    SetCaption OBS_RemoteLB, "-"
    'Stream #1
    SetCaption multiStream1LB, "-"
    SetCaption Kb_Diff_stream1LB, "-"
    SetCaption Timer_Fail_Stream1LB, "-"
    'Stream #2
    SetCaption multiStream2LB, "-"
    SetCaption Kb_Diff_stream2LB, "-"
    SetCaption Timer_Fail_Stream2LB, "-"
    'Current Scene
    SetCaption Scene_CurrentLB, "-"
    'Debug
    SetCaption Debug_TimerLB, "-"
    SetCaption Debug_Timer_SnapshotLB, "-"
    SetCaption td_displayLB, "-"
    SetCaption mouseXLB, "-"
    SetCaption mouseYLB, "-"
    SetCaption __ERRORLINELB, "-"
    'Debug titles
    SetCaption TimerLB, "-"
    SetCaption TimerSnapshotLB, "-"
    SetCaption td_displayVarLB, "-"
    SetCaption mouseXVarLB, "-"
    SetCaption mouseYVarLB, "-"
    SetCaption __ERRORLINEVarLB, "-"

    'Variables
    c34 = CHR$(34)
    BG = _RGB(32, 32, 32)
    Exe_OK = 1
    URL = "127.0.0.1"
    Port = "8080"
    fileStat = "stat"

    'File variables
    config_dir = _DIR$("documents") + "Loopy SRT Monitor"
    obscommand_dir = _DIR$("documents") + "Loopy SRT Monitor\OBSCommand"
    nodejs_dir = _DIR$("documents") + "Loopy SRT Monitor\js"
    temp_dir = _DIR$("documents") + "Loopy SRT Monitor\Temp"
    config_main = config_dir + "\config.ini"
    obs_change_scene = config_dir + "\js\obs_change_scene.js"
    obs_get_scene = config_dir + "\js\obs_get_scene.js"
    obs_get_media1 = config_dir + "\js\obs_get_media1.js"
    obs_get_media2 = config_dir + "\js\obs_get_media2.js"
    obscommand_file = obscommand_dir + "\OBSCommand.exe"
    filePrevious = temp_dir + "\returnPreviousScene.tmp"
    fileCheckVersion = temp_dir + "\checkversion.txt"
    outputBitrateFile = temp_dir + "\outputBitrate.txt"
    outputStatusFile = temp_dir + "\outputStatus.txt"

    IF _DIREXISTS(config_dir) THEN IF NOT _DIREXISTS(temp_dir) THEN MKDIR temp_dir
    IF _FILEEXISTS(filePrevious) THEN KILL filePrevious
    _ALLOWFULLSCREEN OFF
    RANDOMIZE TIMER

    'Check config
    Bandwidth_Threshold = 25
    Stream_Fail_Delay = 10
    Desktop_Width_Position = 160
    Desktop_Height_Position = 100
    IF NOT _FILEEXISTS(config_main) THEN RefreshDisplayRequest = 1: Error_msg$ = "- Unable to read config file in the " + c34 + "Documents\Loopy SRT Monitor" + c34 + " folder" + CHR$(10) + "- File " + c34 + config_main + c34 + " cannot be accessed, check if it exists. (#1)": _DELAY 3
    IF _FILEEXISTS(config_main) THEN
        OPEN config_main FOR INPUT AS #4 'Basic INI management, nothing fancy needed
        DO
            LINE INPUT #4, file4$
            IF LEFT$(file4$, 1) <> "#" AND LEFT$(file4$, 1) <> ";" AND LEFT$(file4$, 1) <> "" THEN
                EqualFound = INSTR(file4$, "=")
                IF EqualFound THEN
                    file4_var$ = LEFT$(file4$, INSTR(file4$, "=") - 1)
                    file4_val$ = MID$(file4$, INSTR(file4$, "=") + 1)
                    file4_var$ = LCASE$(file4_var$)
                    'IF file4_var$ = "bandwidththreshold" THEN Bandwidth_Threshold = VAL(file4_val$)
                    IF file4_var$ = "streamfaildelay" THEN Stream_Fail_Delay = VAL(file4_val$)
                    IF file4_var$ = "xwindow" THEN Desktop_Width_Position = VAL(file4_val$)
                    IF file4_var$ = "ywindow" THEN Desktop_Height_Position = VAL(file4_val$)
                    IF file4_var$ = "sceneok" THEN Scene_OK = file4_val$
                    IF file4_var$ = "scenefail" THEN Scene_Fail = file4_val$
                    IF file4_var$ = "sceneintro" THEN Scene_Intro = file4_val$
                    'IF file4_var$ = "serverip" THEN URL = file4_val$
                    'IF file4_var$ = "serverport" THEN Port = file4_val$
                    IF file4_var$ = "mediasource1" THEN MediaSource1 = file4_val$
                    IF file4_var$ = "mediasource2" THEN MediaSource2 = file4_val$
                    IF file4_var$ = "websocketaddress" THEN OBS_URL = file4_val$
                    IF file4_var$ = "websocketpassword" THEN OBS_PW = file4_val$
                    'IF file4_var$ = "websocketmethod" THEN WebsocketMethod = file4_val$
                    IF file4_var$ = "filestatusoutput" THEN FileStatusOutput = file4_val$
                    IF file4_var$ = "checkupdateonstartup" THEN CheckUpdateOnStartup = file4_val$
                    IF file4_var$ = "multicameraswitch" THEN MultiCameraSwitch$ = file4_val$
                    'IF file4_var$ = "urlstream1" THEN urlStream1 = file4_val$
                    'IF file4_var$ = "urlstream2" THEN urlStream2 = file4_val$
                    IF file4_var$ = "titlescene1" THEN titleScene1 = file4_val$
                    IF file4_var$ = "titlescene2" THEN titleScene2 = file4_val$
                    IF file4_var$ = "titlescene12" THEN titleScene12 = file4_val$
                    IF file4_var$ = "returnpreviousscene" THEN returnPreviousScene = file4_val$
                    IF file4_var$ = "returnprevioussceneremember" THEN returnPreviousSceneRemember$ = file4_val$
                END IF
            END IF
        LOOP UNTIL EOF(4)
        CLOSE #4

        IF Scene_OK = "" OR Scene_Fail = "" OR Scene_Intro = "" OR OBS_URL = "" OR OBS_PW = "" OR FileStatusOutput = "" OR CheckUpdateOnStartup = "" OR MultiCameraSwitch$ = "" OR titleScene1 = "" OR titleScene2 = "" OR titleScene12 = "" OR returnPreviousScene = "" OR returnPreviousSceneRemember$ = "" THEN verCheck$ = "Settings missing in 'config.ini' file, check 'readme.txt'...": iniFeatures = 1

        IF Bandwidth_Threshold < 0 THEN
            Bandwidth_Threshold = 0
        ELSEIF Bandwidth_Threshold > 9999 THEN Bandwidth_Threshold = 9999
        END IF

        IF Stream_Fail_Delay < 3 THEN
            Stream_Fail_Delay = 3
        ELSEIF Stream_Fail_Delay > 99 THEN Stream_Fail_Delay = 99
        END IF

        IF Desktop_Width_Position < -(_DESKTOPWIDTH * 4) THEN Desktop_Width_Position = -(_DESKTOPWIDTH * 4)
        IF Desktop_Width_Position > (_DESKTOPWIDTH * 4) THEN Desktop_Width_Position = (_DESKTOPWIDTH * 4)
        IF Desktop_Width_Position < -9999 THEN Desktop_Width_Position = -9999

        IF Desktop_Height_Position < -(_DESKTOPHEIGHT * 4) THEN Desktop_Height_Position = -(_DESKTOPHEIGHT * 4)
        IF Desktop_Height_Position > (_DESKTOPHEIGHT * 4) THEN Desktop_Height_Position = (_DESKTOPHEIGHT * 4)
        IF Desktop_Height_Position < -9999 THEN Desktop_Height_Position = -9999

        IF Desktop_Width_Position < -9999 AND Desktop_Height_Position = -9999 THEN
        ELSE
            _SCREENMOVE Desktop_Width_Position, Desktop_Height_Position
        END IF
    END IF
    IF MultiCameraSwitch$ = "true" THEN __MultiCameraSwitch = 1 ELSE __MultiCameraSwitch = 0
    IF returnPreviousScene = "true" THEN __returnPreviousScene = 1 ELSE __returnPreviousScene = 0
    IF FileStatusOutput = "true" THEN __FileStatusOutput = 1 ELSE __FileStatusOutput = 0
    IF returnPreviousSceneRemember$ = "true" THEN returnPreviousSceneRemember = 1 ELSE returnPreviousSceneRemember = 0
    IF __MultiCameraSwitch = 0 THEN __returnPreviousScene = 0: returnPreviousSceneRemember = 0
    WebsocketMethod = "nodejs"
    IF WebsocketMethod <> "nodejs" THEN WebsocketMethod = "obscommand"

    IF WebsocketMethod = "nodejs" AND NOT _DIREXISTS(nodejs_dir) THEN
        Error_msg$ = "- Folder " + c34 + nodejs_dir + c34 + " cannot be accessed, check if it exists. (#2)"
    ELSEIF WebsocketMethod = "obscommand" AND NOT _DIREXISTS(obscommand_dir) THEN
        Error_msg$ = "- Folder " + c34 + obscommand_dir + c34 + " cannot be accessed, check if it exists. (#2)"
    END IF
    IF Error_msg$ <> "" THEN
        _DELAY 1
        CLS , _RGB(1, 120, 220)
        BSOD& = __imageMEM&("face_sad_x.png")
        _PUTIMAGE (50, 50)-(107, 162), BSOD&
        _FREEIMAGE BSOD&
        COLOR _RGB(254, 254, 254), _RGB(1, 120, 220)
        _PRINTSTRING (37, 12 * 18), "Program encountered an error and needs to restart."
        IF INSTR(Error_msg$, CHR$(10)) >= 1 THEN
            _PRINTSTRING (37, 14 * 18), LEFT$(Error_msg$, INSTR(Error_msg$, CHR$(10)) - 1)
            _PRINTSTRING (37, 15 * 18), MID$(Error_msg$, INSTR(Error_msg$, CHR$(10)) + 1)
        ELSE
            _PRINTSTRING (37, 14 * 18), Error_msg$
        END IF
        _PRINTSTRING (37, 22 * 18), "Program will exit shortly"
        _DISPLAY
        _DELAY 15
        SYSTEM
    END IF

    shell_obscommand_1 = "%ComSpec% /C " + c34 + c34 + obscommand_file + c34 + " /server=" + OBS_URL + " /password=" + OBS_PW + " /scene=" + c34
    shell_obscommand_2 = c34 + c34
    shell_nodejs_1 = "%ComSpec% /C node.exe " + c34 + obs_change_scene + c34 + " "
    shell_nodejs_2 = ""

    IF WebsocketMethod = "nodejs" THEN
        OPEN obs_change_scene FOR OUTPUT AS #64
        PRINT #64, "// This file has been automatically generated"
        PRINT #64, "// Any changes made will be lost"
        PRINT #64, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #64, "const OBSWebSocket = require('obs-websocket-js');"
        PRINT #64, "const obs = new OBSWebSocket();"
        PRINT #64, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        PRINT #64, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
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
        PRINT #64, "            // console.log(`${scene.name}`);"
        PRINT #64, "            obs.send('SetCurrentScene', {"
        PRINT #64, "                'scene-name': sceneName_1 + sceneName_2 + sceneName_3 + sceneName_4 + sceneName_5 + sceneName_6 + sceneName_7 + sceneName_8"
        PRINT #64, "            });"
        PRINT #64, "        }"
        PRINT #64, "    });"
        PRINT #64, "})"
        PRINT #64, ".then(() => { obs.disconnect(); });"
        CLOSE #64

        OPEN obs_get_scene FOR OUTPUT AS #72
        PRINT #72, "// This file has been automatically generated"
        PRINT #72, "// Any changes made will be lost"
        PRINT #72, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #72, "const OBSWebSocket = require('obs-websocket-js');"
        PRINT #72, "const obs = new OBSWebSocket();"
        PRINT #72, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        PRINT #72, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        PRINT #72, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        PRINT #72, ".then(() => { return obs.send('GetCurrentScene'); })"
        PRINT #72, ".then(data => { data.sources.forEach(sources => {"
        PRINT #72, "            console.log(`${data.name}`);"
        PRINT #72, "    });"
        PRINT #72, "})"
        PRINT #72, ".then(() => { obs.disconnect(); });"
        CLOSE #72

        OPEN obs_get_media1 FOR OUTPUT AS #72
        PRINT #72, "// This file has been automatically generated"
        PRINT #72, "// Any changes made will be lost"
        PRINT #72, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #72, "const OBSWebSocket = require('obs-websocket-js');"
        PRINT #72, "const obs = new OBSWebSocket();"
        PRINT #72, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        PRINT #72, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        PRINT #72, "var timer1 = setTimeout(function() { obs.disconnect(); }, 3000);"
        PRINT #72, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"

        PRINT #72, ".then(() => {"
        PRINT #72, "        return obs.send('GetMediaTime', {"
        PRINT #72, "                  'sourceName': " + c34 + MediaSource1 + c34
        PRINT #72, "         })"
        PRINT #72, "    })"
        PRINT #72, ".then((data) => {"
        PRINT #72, "    console.log(`${data.timestamp}`);"
        PRINT #72, "})"

        PRINT #72, ".then(() => { obs.disconnect(); clearTimeout(timer1); });"
        CLOSE #72

        OPEN obs_get_media2 FOR OUTPUT AS #72
        PRINT #72, "// This file has been automatically generated"
        PRINT #72, "// Any changes made will be lost"
        PRINT #72, "// https://github.com/loopy750/SRT-Stats-Monitor"
        PRINT #72, "const OBSWebSocket = require('obs-websocket-js');"
        PRINT #72, "const obs = new OBSWebSocket();"
        PRINT #72, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        PRINT #72, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        PRINT #72, "var timer1 = setTimeout(function() { obs.disconnect(); }, 3000);"
        PRINT #72, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"

        PRINT #72, ".then(() => {"
        PRINT #72, "        return obs.send('GetMediaTime', {"
        PRINT #72, "                  'sourceName': " + c34 + MediaSource1 + c34
        PRINT #72, "        })"
        PRINT #72, "    })"
        PRINT #72, ".then((data) => {"
        PRINT #72, "    console.log(`${data.timestamp}`);"
        PRINT #72, "})"
        PRINT #72, ".then(() => {"
        PRINT #72, "        return obs.send('GetMediaTime', {"
        PRINT #72, "                  'sourceName': " + c34 + MediaSource2 + c34
        PRINT #72, "        })"
        PRINT #72, "})"
        PRINT #72, ".then((data) => {"
        PRINT #72, "    console.log(`${data.timestamp}`);"
        PRINT #72, "})"

        PRINT #72, ".then(() => { obs.disconnect(); clearTimeout(timer1); });"
        CLOSE #72
    END IF

    IF CheckUpdateOnStartup = "true" AND iniFeatures = 0 THEN
        file224$ = ""
        updateResult$ = ""
        _DELAY .25
        SHELL _HIDE "%ComSpec% /C curl -H " + c34 + "Cache-Control: no-cache" + c34 + " https://raw.githubusercontent.com/loopy750/SRT-Stats-Monitor-Version/master/checkversion.txt > " + c34 + fileCheckVersion + c34 + ""
        _DELAY .25
        IF _FILEEXISTS(fileCheckVersion) THEN
            OPEN fileCheckVersion FOR INPUT AS #224
            DO UNTIL EOF(224)
                IF LOF(224) = 0 THEN NoKill = 1: EXIT DO 'Overkill with EOF checking, but just being safe
                IF EOF(224) THEN EXIT DO
                LINE INPUT #224, file224$
            LOOP
        END IF
        CLOSE #224
        IF _FILEEXISTS(fileCheckVersion) THEN KILL fileCheckVersion
        updateResult$ = file224$
        IF file224$ <> Ver THEN verCheck$ = "A new version is available..."
        IF file224$ = "" OR file224$ = "404: Not Found" THEN verCheck$ = "Unable to check for new version..."
        IF file224$ = Ver THEN verCheck$ = "You are using the latest version..."
    END IF

    iniFeatures = 0

    'Port_Client$ = "TCP/IP:" + Port + ":"

    IF Scene_OK = "" OR Scene_Fail = "" OR Scene_Intro = "" OR URL = "" OR Port = "" OR OBS_URL = "" THEN RefreshDisplayRequest = 1: Error_msg$ = "- Variable/s for scenes empty, check if " + c34 + config_main + c34 + " exists. (#3)": _DELAY 3

    IF __MultiCameraSwitch = 0 THEN
        Scene_Current$ = Scene_OK
        SELECT CASE WebsocketMethod
            CASE "nodejs"
                SHELL _DONTWAIT _HIDE shell_nodejs_1 + Scene_OK
            CASE "obscommand"
                SHELL _DONTWAIT _HIDE shell_obscommand_1 + Scene_OK + shell_obscommand_2
        END SELECT
    END IF

    IF __MultiCameraSwitch = 1 THEN
        Scene_Current$ = titleScene12
        SELECT CASE WebsocketMethod
            CASE "nodejs"
                SHELL _DONTWAIT _HIDE shell_nodejs_1 + titleScene12
            CASE "obscommand"
                SHELL _DONTWAIT _HIDE shell_obscommand_1 + titleScene12 + shell_obscommand_2
        END SELECT
    END IF

    _DELAY .25
    _TITLE "Loopy SRT Monitor"

    IF __MultiCameraSwitch = 0 THEN
        Control(Stream1).Hidden = True
        Control(Stream2).Hidden = True
        Control(InBytesLB2).Hidden = True
        Control(InBytesDifferenceLB2).Hidden = True
        Control(failLB).Hidden = True
        Control(multiStream1LB).Hidden = True
        Control(Kb_Diff_stream1LB).Hidden = True
        Control(Timer_Fail_Stream1LB).Hidden = True
        Control(InBytesLB3).Hidden = True
        Control(InBytesDifferenceLB3).Hidden = True
        Control(failLB2).Hidden = True
        Control(multiStream2LB).Hidden = True
        Control(Kb_Diff_stream2LB).Hidden = True
        Control(Timer_Fail_Stream2LB).Hidden = True
    END IF

    Control(DebugFrame).Hidden = True
    Control(versionFrame).Hidden = False
    LoadImageMEM Control(PictureBoxLogoBottom), "srt_logo_bottom.png"
    Control(TimerLB).Hidden = True
    Control(TimerSnapshotLB).Hidden = True
    Control(td_displayVarLB).Hidden = True
    Control(mouseXVarLB).Hidden = True
    Control(mouseYVarLB).Hidden = True
    Control(__ERRORLINEVarLB).Hidden = True
    Control(Debug_TimerLB).Hidden = True
    Control(Debug_Timer_SnapshotLB).Hidden = True
    Control(td_displayLB).Hidden = True
    Control(mouseXLB).Hidden = True
    Control(mouseYLB).Hidden = True
    Control(__ERRORLINELB).Hidden = True
    Control(PictureBoxLogoBottom).Hidden = False
    SetCaption (versionFrame), "v" + Ver

    ON TIMER(1) Timer01
    TIMER ON
END SUB

SUB __UI_BeforeUpdateDisplay
    'This event occurs at approximately 30 frames per second.
    'You can change the update frequency by calling SetFrameRate DesiredRate%

    'BeforeUpdateDisplay ----------------------------------------------------------------------------------------------------------------------------------------------------
    IF NOT _WINDOWHASFOCUS THEN SetFrameRate 15 ELSE SetFrameRate 30

    IF RefreshDisplayRequest = 1 THEN
        RefreshDisplayRequest = 0
        TIMER STOP
        CLS , _RGB(1, 120, 220)
        BSOD& = __imageMEM&("face_sad_x.png")
        _PUTIMAGE (50, 50)-(107, 162), BSOD&
        _FREEIMAGE BSOD&
        COLOR _RGB(254, 254, 254), _RGB(1, 120, 220)
        _PRINTSTRING (37, 12 * 18), "Program encountered an error and needs to restart."
        IF INSTR(Error_msg$, CHR$(10)) >= 1 THEN
            _PRINTSTRING (37, 14 * 18), LEFT$(Error_msg$, INSTR(Error_msg$, CHR$(10)) - 1)
            _PRINTSTRING (37, 15 * 18), MID$(Error_msg$, INSTR(Error_msg$, CHR$(10)) + 1)
        ELSE
            _PRINTSTRING (37, 14 * 18), Error_msg$
        END IF
        _PRINTSTRING (37, 22 * 18), "Program will resume shortly"
        _DISPLAY
        _DELAY 10
        CLS , BG
        TIMER ON
    END IF

    IF Debug = 1 THEN
        mouseX = _MOUSEX
        mouseY = _MOUSEY
        Debug_Timer# = TIMER(.001)
        TIMEms Debug_Timer#, 0
        SetCaption (Debug_TimerLB), tout + " sec   "
        TIMEms td_display#, 1
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
        IF _FILEEXISTS(outputBitrateFile) THEN KILL outputBitrateFile
        IF _FILEEXISTS(outputStatusFile) THEN KILL outputStatusFile
        SYSTEM
    END IF

    ProgressCounter = ProgressCounter + 1 '| / - \ | / - \
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
    '------------------------------------------------------------------------------------------------------------------------------------------------------------------------

END SUB

SUB __UI_BeforeUnload
    'If you set __UI_UnloadSignal = False here you can
    'cancel the user's request to close.

END SUB

SUB __UI_Click (id AS LONG)
    SELECT CASE id
        CASE LoopySRTMonitor

        CASE FileMenu

        CASE OptionsMenu

        CASE HelpMenu

        CASE SRT

        CASE Status

        CASE Settings

        CASE CurrentScene

        CASE DebugFrame

        CASE Stream1

        CASE Stream2

        CASE versionFrame

        CASE FileMenuExit
            IF _FILEEXISTS(filePrevious) THEN KILL filePrevious
            IF _FILEEXISTS(outputBitrateFile) THEN KILL outputBitrateFile
            IF _FILEEXISTS(outputStatusFile) THEN KILL outputStatusFile
            SYSTEM

        CASE RMTPLB

        CASE clientsLB

        CASE VideoLB

        CASE AudioLB

        CASE InBytesLB

        CASE OutBytesLB

        CASE InBitssLB

        CASE OutBitssLB

        CASE TimeLB

        CASE rtmp_nacceptedLB

        CASE rtmp_codec_nclientsLB

        CASE rtmp_codec_videoLB

        CASE rtmp_codec_audioLB

        CASE rtmp_bytes_inLB

        CASE rtmp_bytes_outLB

        CASE rtmp_bw_inLB

        CASE rtmp_bw_outLB

        CASE rtmp_uptimeLB

        CASE InBytesDifferenceLB

        CASE StreamFailTimerLB

        CASE FailCountLB

        CASE ServerPingLB

        CASE UpdateIntervalLB

        CASE Kb_DiffLB

        CASE Timer_FailLB

        CASE Timer_Fail_CountLB

        CASE tPingOutLB

        CASE td_updateLB

        CASE BandwidthThresholdLB

        CASE StreamFailDelayLB

        CASE MultiCameraSwitchLB

        CASE Bandwidth_ThresholdLB

        CASE Stream_Fail_DelayLB

        CASE MultiCameraSwitchStatusLB

        CASE TimerLB

        CASE TimerSnapshotLB

        CASE td_displayVarLB

        CASE mouseXVarLB

        CASE mouseYVarLB

        CASE __ERRORLINEVarLB

        CASE Debug_TimerLB

        CASE Debug_Timer_SnapshotLB

        CASE td_displayLB

        CASE mouseXLB

        CASE mouseYLB

        CASE __ERRORLINELB

        CASE InBytesLB2

        CASE InBytesDifferenceLB2

        CASE failLB

        CASE multiStream1LB

        CASE Kb_Diff_stream1LB

        CASE Timer_Fail_Stream1LB

        CASE Scene_CurrentLB

        CASE PictureBox1

        CASE InBytesLB3

        CASE InBytesDifferenceLB3

        CASE failLB2

        CASE multiStream2LB

        CASE Kb_Diff_stream2LB

        CASE Timer_Fail_Stream2LB

        CASE OptionsMenuAlwaysOnTop
            IF AlwaysOnTop <> 1 THEN
                AlwaysOnTop = 1
                FGwin& = GetForegroundWindow&: IF Myhwnd <> FGwin& THEN y& = SetWindowPos&(Myhwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE + SWP_SHOWWINDOW)
            ELSE
                AlwaysOnTop = 0
                FGwin& = GetForegroundWindow&: IF Myhwnd <> FGwin& THEN y& = SetWindowPos&(Myhwnd, HWND_BOTTOM, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE + SWP_NOACTIVATE)
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
            SHELL _DONTWAIT _HIDE "%ComSpec% /C START " + c34 + c34 + " /B https://github.com/loopy750/SRT-Stats-Monitor"

        CASE HelpMenuCheckForUpdates
            verCheck$ = "Checking for new version..."
            SetCaption StatusLB, verCheck$
            file224$ = ""
            updateResult$ = ""
            _DELAY .25
            SHELL _HIDE "%ComSpec% /C curl -H " + c34 + "Cache-Control: no-cache" + c34 + " https://raw.githubusercontent.com/loopy750/SRT-Stats-Monitor-Version/master/checkversion.txt > " + c34 + fileCheckVersion + c34 + ""
            _DELAY .25
            IF _FILEEXISTS(fileCheckVersion) THEN
                OPEN fileCheckVersion FOR INPUT AS #224
                DO UNTIL EOF(224)
                    IF LOF(224) = 0 THEN NoKill = 1: EXIT DO 'Overkill with EOF checking, but just being safe
                    IF EOF(224) THEN EXIT DO
                    LINE INPUT #224, file224$
                LOOP
            END IF
            CLOSE #224
            IF _FILEEXISTS(fileCheckVersion) THEN KILL fileCheckVersion
            updateResult$ = file224$
            IF file224$ <> Ver THEN verCheck$ = "A new version is available..."
            IF file224$ = "" OR file224$ = "404: Not Found" THEN verCheck$ = "Unable to check for new version..."
            IF file224$ = Ver THEN verCheck$ = "You are using the latest version..."
            IF verCheck <> "" THEN updateDisplayCounter = 0

        CASE OptionsMenuFullscreen
            IF FullScreen <> 1 THEN
                FullScreen = 1
                _FULLSCREEN _SQUAREPIXELS , _SMOOTH
            ELSE
                FullScreen = 0
                _FULLSCREEN _OFF
            END IF

        CASE IndicatorLB

        CASE HelpMenuAbout
            Answer = MessageBox("Loopy SRT Stats Monitor v" + Ver + " (" + VerDate + ") \nby loopy750\n\nGitHub: https://www.github.com/loopy750", "About", MsgBox_OkOnly + MsgBox_Information)

        CASE StatusLB

        CASE PictureBoxLogoBottom

        CASE OBSRemoteLB

        CASE OBS_RemoteLB

    END SELECT
END SUB

SUB __UI_MouseEnter (id AS LONG)
    SELECT CASE id
        CASE LoopySRTMonitor

        CASE FileMenu

        CASE OptionsMenu

        CASE HelpMenu

        CASE SRT

        CASE Status

        CASE Settings

        CASE CurrentScene

        CASE DebugFrame

        CASE Stream1

        CASE Stream2

        CASE versionFrame

        CASE FileMenuExit

        CASE RMTPLB

        CASE clientsLB

        CASE VideoLB

        CASE AudioLB

        CASE InBytesLB

        CASE OutBytesLB

        CASE InBitssLB

        CASE OutBitssLB

        CASE TimeLB

        CASE rtmp_nacceptedLB

        CASE rtmp_codec_nclientsLB

        CASE rtmp_codec_videoLB

        CASE rtmp_codec_audioLB

        CASE rtmp_bytes_inLB

        CASE rtmp_bytes_outLB

        CASE rtmp_bw_inLB

        CASE rtmp_bw_outLB

        CASE rtmp_uptimeLB

        CASE InBytesDifferenceLB

        CASE StreamFailTimerLB

        CASE FailCountLB

        CASE ServerPingLB

        CASE UpdateIntervalLB

        CASE Kb_DiffLB

        CASE Timer_FailLB

        CASE Timer_Fail_CountLB

        CASE tPingOutLB

        CASE td_updateLB

        CASE BandwidthThresholdLB

        CASE StreamFailDelayLB

        CASE MultiCameraSwitchLB

        CASE Bandwidth_ThresholdLB

        CASE Stream_Fail_DelayLB

        CASE MultiCameraSwitchStatusLB

        CASE TimerLB

        CASE TimerSnapshotLB

        CASE td_displayVarLB

        CASE mouseXVarLB

        CASE mouseYVarLB

        CASE __ERRORLINEVarLB

        CASE Debug_TimerLB

        CASE Debug_Timer_SnapshotLB

        CASE td_displayLB

        CASE mouseXLB

        CASE mouseYLB

        CASE __ERRORLINELB

        CASE InBytesLB2

        CASE InBytesDifferenceLB2

        CASE failLB

        CASE multiStream1LB

        CASE Kb_Diff_stream1LB

        CASE Timer_Fail_Stream1LB

        CASE Scene_CurrentLB

        CASE PictureBox1

        CASE InBytesLB3

        CASE InBytesDifferenceLB3

        CASE failLB2

        CASE multiStream2LB

        CASE Kb_Diff_stream2LB

        CASE Timer_Fail_Stream2LB

        CASE OptionsMenuDebug

        CASE HelpMenuVisitWebsite

        CASE HelpMenuCheckForUpdates

        CASE OptionsMenuFullscreen

        CASE IndicatorLB

        CASE HelpMenuAbout

        CASE StatusLB

        CASE PictureBoxLogoBottom

        CASE OBSRemoteLB

        CASE OBS_RemoteLB

    END SELECT
END SUB

SUB __UI_MouseLeave (id AS LONG)
    SELECT CASE id
        CASE LoopySRTMonitor

        CASE FileMenu

        CASE OptionsMenu

        CASE HelpMenu

        CASE SRT

        CASE Status

        CASE Settings

        CASE CurrentScene

        CASE DebugFrame

        CASE Stream1

        CASE Stream2

        CASE versionFrame

        CASE FileMenuExit

        CASE RMTPLB

        CASE clientsLB

        CASE VideoLB

        CASE AudioLB

        CASE InBytesLB

        CASE OutBytesLB

        CASE InBitssLB

        CASE OutBitssLB

        CASE TimeLB

        CASE rtmp_nacceptedLB

        CASE rtmp_codec_nclientsLB

        CASE rtmp_codec_videoLB

        CASE rtmp_codec_audioLB

        CASE rtmp_bytes_inLB

        CASE rtmp_bytes_outLB

        CASE rtmp_bw_inLB

        CASE rtmp_bw_outLB

        CASE rtmp_uptimeLB

        CASE InBytesDifferenceLB

        CASE StreamFailTimerLB

        CASE FailCountLB

        CASE ServerPingLB

        CASE UpdateIntervalLB

        CASE Kb_DiffLB

        CASE Timer_FailLB

        CASE Timer_Fail_CountLB

        CASE tPingOutLB

        CASE td_updateLB

        CASE BandwidthThresholdLB

        CASE StreamFailDelayLB

        CASE MultiCameraSwitchLB

        CASE Bandwidth_ThresholdLB

        CASE Stream_Fail_DelayLB

        CASE MultiCameraSwitchStatusLB

        CASE TimerLB

        CASE TimerSnapshotLB

        CASE td_displayVarLB

        CASE mouseXVarLB

        CASE mouseYVarLB

        CASE __ERRORLINEVarLB

        CASE Debug_TimerLB

        CASE Debug_Timer_SnapshotLB

        CASE td_displayLB

        CASE mouseXLB

        CASE mouseYLB

        CASE __ERRORLINELB

        CASE InBytesLB2

        CASE InBytesDifferenceLB2

        CASE failLB

        CASE multiStream1LB

        CASE Kb_Diff_stream1LB

        CASE Timer_Fail_Stream1LB

        CASE Scene_CurrentLB

        CASE PictureBox1

        CASE InBytesLB3

        CASE InBytesDifferenceLB3

        CASE failLB2

        CASE multiStream2LB

        CASE Kb_Diff_stream2LB

        CASE Timer_Fail_Stream2LB

        CASE OptionsMenuDebug

        CASE HelpMenuVisitWebsite

        CASE HelpMenuCheckForUpdates

        CASE OptionsMenuFullscreen

        CASE IndicatorLB

        CASE HelpMenuAbout

        CASE StatusLB

        CASE PictureBoxLogoBottom

        CASE OBSRemoteLB

        CASE OBS_RemoteLB

    END SELECT
END SUB

SUB __UI_FocusIn (id AS LONG)
    SELECT CASE id
        CASE 0
    END SELECT
END SUB

SUB __UI_FocusOut (id AS LONG)
    'This event occurs right before a control loses focus.
    'To prevent a control from losing focus, set __UI_KeepFocus = True below.
    SELECT CASE id
        CASE 0
    END SELECT
END SUB

SUB __UI_MouseDown (id AS LONG)
    SELECT CASE id
        CASE LoopySRTMonitor

        CASE FileMenu

        CASE OptionsMenu

        CASE HelpMenu

        CASE SRT

        CASE Status

        CASE Settings

        CASE CurrentScene

        CASE DebugFrame

        CASE Stream1

        CASE Stream2

        CASE versionFrame

        CASE FileMenuExit

        CASE RMTPLB

        CASE clientsLB

        CASE VideoLB

        CASE AudioLB

        CASE InBytesLB

        CASE OutBytesLB

        CASE InBitssLB

        CASE OutBitssLB

        CASE TimeLB

        CASE rtmp_nacceptedLB

        CASE rtmp_codec_nclientsLB

        CASE rtmp_codec_videoLB

        CASE rtmp_codec_audioLB

        CASE rtmp_bytes_inLB

        CASE rtmp_bytes_outLB

        CASE rtmp_bw_inLB

        CASE rtmp_bw_outLB

        CASE rtmp_uptimeLB

        CASE InBytesDifferenceLB

        CASE StreamFailTimerLB

        CASE FailCountLB

        CASE ServerPingLB

        CASE UpdateIntervalLB

        CASE Kb_DiffLB

        CASE Timer_FailLB

        CASE Timer_Fail_CountLB

        CASE tPingOutLB

        CASE td_updateLB

        CASE BandwidthThresholdLB

        CASE StreamFailDelayLB

        CASE MultiCameraSwitchLB

        CASE Bandwidth_ThresholdLB

        CASE Stream_Fail_DelayLB

        CASE MultiCameraSwitchStatusLB

        CASE TimerLB

        CASE TimerSnapshotLB

        CASE td_displayVarLB

        CASE mouseXVarLB

        CASE mouseYVarLB

        CASE __ERRORLINEVarLB

        CASE Debug_TimerLB

        CASE Debug_Timer_SnapshotLB

        CASE td_displayLB

        CASE mouseXLB

        CASE mouseYLB

        CASE __ERRORLINELB

        CASE InBytesLB2

        CASE InBytesDifferenceLB2

        CASE failLB

        CASE multiStream1LB

        CASE Kb_Diff_stream1LB

        CASE Timer_Fail_Stream1LB

        CASE Scene_CurrentLB

        CASE PictureBox1

        CASE InBytesLB3

        CASE InBytesDifferenceLB3

        CASE failLB2

        CASE multiStream2LB

        CASE Kb_Diff_stream2LB

        CASE Timer_Fail_Stream2LB

        CASE OptionsMenuDebug

        CASE HelpMenuVisitWebsite

        CASE HelpMenuCheckForUpdates

        CASE OptionsMenuFullscreen

        CASE IndicatorLB

        CASE HelpMenuAbout

        CASE StatusLB

        CASE PictureBoxLogoBottom

        CASE OBSRemoteLB

        CASE OBS_RemoteLB

    END SELECT
END SUB

SUB __UI_MouseUp (id AS LONG)
    SELECT CASE id
        CASE LoopySRTMonitor

        CASE FileMenu

        CASE OptionsMenu

        CASE HelpMenu

        CASE SRT

        CASE Status

        CASE Settings

        CASE CurrentScene

        CASE DebugFrame

        CASE Stream1

        CASE Stream2

        CASE versionFrame

        CASE FileMenuExit

        CASE RMTPLB

        CASE clientsLB

        CASE VideoLB

        CASE AudioLB

        CASE InBytesLB

        CASE OutBytesLB

        CASE InBitssLB

        CASE OutBitssLB

        CASE TimeLB

        CASE rtmp_nacceptedLB

        CASE rtmp_codec_nclientsLB

        CASE rtmp_codec_videoLB

        CASE rtmp_codec_audioLB

        CASE rtmp_bytes_inLB

        CASE rtmp_bytes_outLB

        CASE rtmp_bw_inLB

        CASE rtmp_bw_outLB

        CASE rtmp_uptimeLB

        CASE InBytesDifferenceLB

        CASE StreamFailTimerLB

        CASE FailCountLB

        CASE ServerPingLB

        CASE UpdateIntervalLB

        CASE Kb_DiffLB

        CASE Timer_FailLB

        CASE Timer_Fail_CountLB

        CASE tPingOutLB

        CASE td_updateLB

        CASE BandwidthThresholdLB

        CASE StreamFailDelayLB

        CASE MultiCameraSwitchLB

        CASE Bandwidth_ThresholdLB

        CASE Stream_Fail_DelayLB

        CASE MultiCameraSwitchStatusLB

        CASE TimerLB

        CASE TimerSnapshotLB

        CASE td_displayVarLB

        CASE mouseXVarLB

        CASE mouseYVarLB

        CASE __ERRORLINEVarLB

        CASE Debug_TimerLB

        CASE Debug_Timer_SnapshotLB

        CASE td_displayLB

        CASE mouseXLB

        CASE mouseYLB

        CASE __ERRORLINELB

        CASE InBytesLB2

        CASE InBytesDifferenceLB2

        CASE failLB

        CASE multiStream1LB

        CASE Kb_Diff_stream1LB

        CASE Timer_Fail_Stream1LB

        CASE Scene_CurrentLB

        CASE PictureBox1

        CASE InBytesLB3

        CASE InBytesDifferenceLB3

        CASE failLB2

        CASE multiStream2LB

        CASE Kb_Diff_stream2LB

        CASE Timer_Fail_Stream2LB

        CASE OptionsMenuDebug

        CASE HelpMenuVisitWebsite

        CASE HelpMenuCheckForUpdates

        CASE OptionsMenuFullscreen

        CASE IndicatorLB

        CASE HelpMenuAbout

        CASE StatusLB

        CASE PictureBoxLogoBottom

        CASE OBSRemoteLB

        CASE OBS_RemoteLB

    END SELECT
END SUB

SUB __UI_KeyPress (id AS LONG)
    'When this event is fired, __UI_KeyHit will contain the code of the key hit.
    'You can change it and even cancel it by making it = 0
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

SUB TIMEms (tout#, plus)

    TIMER STOP
    tout = ""
    tout2# = tout#
    toutint# = FIX(tout2#)
    IF tout# >= 0 THEN
        toutdec# = (tout2# - toutint#) + 1
        IF plus THEN tout = tout + "+"
    ELSE
        toutdec# = (tout2# - toutint#) - 1
        IF toutint# = 0 THEN tout = tout + "-"
    END IF
    tout = tout + LTRIM$(STR$(toutint#))
    IF tout# >= 0 THEN tout = tout + "." + MID$(LTRIM$(STR$(toutdec#)), 3, 3) ELSE tout = tout + "." + MID$(LTRIM$(STR$(toutdec#)), 4, 3)
    IF LEN(STR$(toutdec#)) = 5 THEN tout = tout + "0"
    IF LEN(STR$(toutdec#)) = 4 THEN tout = tout + "00"
    IF LEN(STR$(toutdec#)) = 2 THEN tout = tout + "000" 'Output to tout
    TIMER ON

END SUB

SUB calcbw (bout#, bits)

    TIMER STOP
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
        bout = bout + "." + boutdec$ + " " + boutm$ 'Output to bout
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
        bout = bout + boutdec$ + " " + boutm$ 'Output to bout
    END IF
    TIMER ON

END SUB

FUNCTION calc_srt$ (convertTime#, includeSec)

    TIMER STOP
    IF convertTime# > 3596400 THEN convertTime# = 3596400
    t_hr = convertTime# \ 3600
    t_min = (convertTime# - (3600 * t_hr)) \ 60
    t_sec = (convertTime# - (3600 * t_hr)) - (t_min * 60)
    calc_srt$ = LTRIM$(STR$(t_hr)) + "h " + LTRIM$(STR$(t_min)) + "m "
    IF includeSec = 1 THEN calc_srt$ = calc_srt$ + LTRIM$(STR$(t_sec)) + "s   "
    TIMER ON

END FUNCTION

SUB statusOutputToFile (outputMSG$)

    TIMER STOP
    OPEN outputStatusFile FOR OUTPUT AS #48
    PRINT #48, outputMSG$
    CLOSE #48
    TIMER ON

END SUB

SUB statusBitrateToFile (outputBR$)

    TIMER STOP
    OPEN outputBitrateFile FOR OUTPUT AS #56
    PRINT #56, outputBR$
    CLOSE #56
    TIMER ON

END SUB

SUB Timer01
    'Timer01 ----------------------------------------------------------------------------------------------------------------------------------------------------------------
    td_update# = TIMER(.001) - timer1#
    timer1# = TIMER(.001)

    'Debug moved down from here ---------------------------------------------------------------------------------------------------------------------------------------------------
    'Get OBS scene moved down from here -------------------------------------------------------------------------------------------------------------------------------------------

    IF _DIREXISTS(config_dir) THEN IF NOT _DIREXISTS(temp_dir) THEN MKDIR temp_dir

    SELECT CASE WebsocketMethod
        CASE "nodejs"
            SetCaption OBS_RemoteLB, "Node.js"
        CASE "obscommand"
            SetCaption OBS_RemoteLB, "OBSCommand"
        CASE ELSE
            WebsocketMethod = "obscommand"
    END SELECT

    rtmp_naccepted$ = "": rtmp_bytes_in$ = "": rtmp_bytes_out$ = "": rtmp_bw_in$ = "": rtmp_bw_out$ = "": rtmp_codec_video$ = "": rtmp_codec_audio$ = "": rtmp_codec_nclients$ = ""
    rtmp_codec_nclients# = 0: rtmp_codec_nclients_temp# = 0
    a$ = "": a2$ = "": d$ = "": I = 0: i2 = 0: i3 = 0: stats_rtmp.xml$ = ""

    tPing1# = TIMER(.001)
    'client = _OPENCLIENT(Port_Client$ + URL)






    IF __MultiCameraSwitch = 0 THEN

        'Get Media Source times -------------------------
        SELECT CASE WebsocketMethod
            CASE "nodejs"
                SHELL _HIDE "%ComSpec% /C node.exe " + c34 + obs_get_media1 + c34 + " > " + c34 + filePrevious + c34
            CASE "obscommand"
                SHELL _HIDE "%ComSpec% /C " + c34 + c34 + obscommand_file + c34 + " /server=" + OBS_URL + " /password=" + OBS_PW + " /command=GetCurrentScene > " + c34 + filePrevious + c34 + c34
        END SELECT
        _DELAY .01
        ON ERROR GOTO PUT_Fail
        PUT_Refresh = 1
        IF _FILEEXISTS(filePrevious) THEN
            OPEN filePrevious FOR INPUT AS #92
            IF LOF(92) = 0 THEN NoKill = 1: GOTO LOF92 'Overkill with EOF checking, but just being safe
            IF EOF(92) THEN GOTO LOF92
            LINE INPUT #92, file92$
            MediaSource1Time = VAL(file92$) / 1000
            LOF92:
        END IF
        CLOSE #92

        IF NoKill = 1 THEN NoKill = 0 ELSE IF _FILEEXISTS(filePrevious) THEN KILL filePrevious
        ON ERROR GOTO 0
        PUT_Refresh = 0

    END IF



    IF __MultiCameraSwitch = 1 THEN

        'Get Media Source times -------------------------
        SELECT CASE WebsocketMethod
            CASE "nodejs"
                SHELL _HIDE "%ComSpec% /C node.exe " + c34 + obs_get_media2 + c34 + " > " + c34 + filePrevious + c34
            CASE "obscommand"
                SHELL _HIDE "%ComSpec% /C " + c34 + c34 + obscommand_file + c34 + " /server=" + OBS_URL + " /password=" + OBS_PW + " /command=GetCurrentScene > " + c34 + filePrevious + c34 + c34
        END SELECT
        _DELAY .01
        ON ERROR GOTO PUT_Fail
        PUT_Refresh = 1
        IF _FILEEXISTS(filePrevious) THEN
            OPEN filePrevious FOR INPUT AS #92
            IF LOF(92) = 0 THEN NoKill = 1: GOTO LOF922 'Overkill with EOF checking, but just being safe
            IF EOF(92) THEN GOTO LOF922
            LINE INPUT #92, file92$
            MediaSource1Time = VAL(file92$) / 1000
            IF EOF(92) THEN GOTO LOF922
            LINE INPUT #92, file92$
            MediaSource2Time = VAL(file92$) / 1000
            LOF922:
        END IF
        CLOSE #92

        IF NoKill = 1 THEN NoKill = 0 ELSE IF _FILEEXISTS(filePrevious) THEN KILL filePrevious
        ON ERROR GOTO 0
        PUT_Refresh = 0

    END IF




    tPing2# = TIMER(.001)
    tPingOut# = (tPing2# - tPing1#)












    'PUT_Fail moved from here ----------

    URL_OK:
    IF INSTR(stats_rtmp.xml$, "<uptime>") THEN rtmp_uptime# = VAL(MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "<uptime>") + 8, 16))
    IF INSTR(stats_rtmp.xml$, "<naccepted>") THEN rtmp_naccepted# = VAL(MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "<naccepted>") + 11, 16))
    IF INSTR(stats_rtmp.xml$, "<bytes_in>") THEN rtmp_bytes_in# = VAL(MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "<bytes_in>") + 10, 16))
    IF INSTR(stats_rtmp.xml$, "<bytes_out>") THEN rtmp_bytes_out# = VAL(MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "<bytes_out>") + 11, 16))
    IF INSTR(stats_rtmp.xml$, "<bw_in>") THEN rtmp_bw_in# = VAL(MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "<bw_in>") + 7, 16))
    IF INSTR(stats_rtmp.xml$, "<bw_out>") THEN rtmp_bw_out# = VAL(MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "<bw_out>") + 8, 16))
    IF INSTR(stats_rtmp.xml$, "</frame_rate><codec>") THEN rtmp_codec_video$ = MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "</frame_rate><codec>") + 20, 4)
    IF INSTR(stats_rtmp.xml$, "<audio><codec>") THEN rtmp_codec_audio$ = MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "<audio><codec>") + 14, 3)

    rtmp_codec_video_level$ = ""
    rtmp_codec_video_profile$ = ""
    rtmp_codec_audio_channels$ = ""
    rtmp_codec_audio_samplerate$ = ""
    rtmp_codec_audio_profile$ = ""
    rtmp_codec_video_width$ = ""
    rtmp_codec_video_height$ = ""
    rtmp_codec_video_resolution$ = ""

    'Tooltips - RTMP
    IF INSTR(stats_rtmp.xml$, "<nginx_version>") THEN rtmp_codec_version$ = MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "<nginx_version>") + 15, 10)
    rtmp_codec_version$ = LEFT$(rtmp_codec_version$, INSTR(rtmp_codec_version$, "<") - 1)
    IF INSTR(stats_rtmp.xml$, "<nginx_rtmp_version>") THEN rtmp_codec_rtmp_version$ = MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "<nginx_rtmp_version>") + 20, 10)
    rtmp_codec_rtmp_version$ = LEFT$(rtmp_codec_rtmp_version$, INSTR(rtmp_codec_rtmp_version$, "<") - 1)
    'Tooltips - Video
    IF INSTR(stats_rtmp.xml$, "</compat><level>") THEN rtmp_codec_video_level$ = MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "</compat><level>") + 16, 6)
    rtmp_codec_video_level$ = LEFT$(rtmp_codec_video_level$, INSTR(rtmp_codec_video_level$, "<") - 1)
    IF INSTR(stats_rtmp.xml$, "</codec><profile>") THEN rtmp_codec_video_profile$ = MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "</codec><profile>") + 17, 10)
    rtmp_codec_video_profile$ = LEFT$(rtmp_codec_video_profile$, INSTR(rtmp_codec_video_profile$, "<") - 1)
    IF INSTR(stats_rtmp.xml$, "<video><width>") THEN rtmp_codec_video_width$ = STR$(VAL(MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "<video><width>") + 14, 6)))
    IF INSTR(stats_rtmp.xml$, "</width><height>") THEN rtmp_codec_video_height$ = STR$(VAL(MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "</width><height>") + 16, 6)))
    IF rtmp_codec_video_width$ <> "" THEN rtmp_codec_video_resolution$ = _TRIM$(rtmp_codec_video_width$) + "x" + _TRIM$(rtmp_codec_video_height$)
    'Tooltips - Audio
    IF INSTR((INSTR(stats_rtmp.xml$, "</codec><profile>") + 1), stats_rtmp.xml$, "</codec><profile>") THEN rtmp_codec_audio_profile$ = MID$(stats_rtmp.xml$, INSTR((INSTR(stats_rtmp.xml$, "</codec><profile>") + 1), stats_rtmp.xml$, "</codec><profile>") + 17, 10)
    rtmp_codec_audio_profile$ = LEFT$(rtmp_codec_audio_profile$, INSTR(rtmp_codec_audio_profile$, "<") - 1)
    IF INSTR(stats_rtmp.xml$, "</profile><channels>") THEN rtmp_codec_audio_channels$ = STR$(VAL(MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "</profile><channels>") + 20, 1)))
    IF INSTR(stats_rtmp.xml$, "</channels><sample_rate>") THEN rtmp_codec_audio_samplerate$ = STR$(VAL(MID$(stats_rtmp.xml$, INSTR(stats_rtmp.xml$, "</channels><sample_rate>") + 24, 6)))

    'Dirty fix
    IF rtmp_codec_video_profile$ = "LC" OR rtmp_codec_video_profile$ = "MP3" THEN rtmp_codec_audio_profile$ = rtmp_codec_video_profile$: rtmp_codec_video_profile$ = ""
    IF rtmp_codec_audio_profile$ = "Baseline" OR rtmp_codec_audio_profile$ = "Main" OR rtmp_codec_audio_profile$ = "High" THEN rtmp_codec_video_profile$ = rtmp_codec_audio_profile$: rtmp_codec_audio_profile$ = ""

    'ToolTip(rtmp_codec_audioLB) = "Profile: " + rtmp_codec_audio_profile$ + "\nChannels: " + _TRIM$(rtmp_codec_audio_channels$) + "\nSample rate: " + _TRIM$(rtmp_codec_audio_samplerate$) + "\n"
    'ToolTip(rtmp_codec_videoLB) = "Resolution: " + rtmp_codec_video_resolution$ + "\nProfile: " + rtmp_codec_video_profile$ + "\nLevel: " + _TRIM$(rtmp_codec_video_level$) + "\n"
    'ToolTip(tPingOutLB) = "URL: " + URL + "\nPort: " + Port$ + "\n"

    'ToolTip(RMTPLB) = "SRT Version: " + rtmp_codec_version$ + "\nSRT Version: " + rtmp_codec_rtmp_version$ + "\n"
    'ToolTip(rtmp_nacceptedLB) = "SRT Version: " + rtmp_codec_version$ + "\nSRT Version: " + rtmp_codec_rtmp_version$ + "\n"
    IF Timer_Failed = 1 THEN Timer_Failed = 0: ToolTip(Timer_Fail_CountLB) = "Last Failed: " + TIME$

    IF __MultiCameraSwitch = 1 THEN
        Stream% = 0
        Stream% = INSTR(Stream% + 1, stats_rtmp.xml$, "<name>" + urlStream1 + "</name>")
        Stream% = INSTR(Stream% + 1, stats_rtmp.xml$, CHR$(13) + CHR$(10))
        Stream% = INSTR(Stream% + 1, stats_rtmp.xml$, CHR$(13) + CHR$(10))
        multiStream1# = VAL(MID$(stats_rtmp.xml$, Stream% + 12, 16))
        Stream% = INSTR(Stream% + 1, stats_rtmp.xml$, "<name>" + urlStream2 + "</name>")
        Stream% = INSTR(Stream% + 1, stats_rtmp.xml$, CHR$(13) + CHR$(10))
        Stream% = INSTR(Stream% + 1, stats_rtmp.xml$, CHR$(13) + CHR$(10))
        multiStream2# = VAL(MID$(stats_rtmp.xml$, Stream% + 12, 16))
    END IF

    rtmp_codec_nclients# = 0
    rtmp_codec_nclients_temp# = 0
    DO
        pos_xml_m& = INSTR(pos_xml_m& + 1, stats_rtmp.xml$, "<nclients>")
        rtmp_codec_nclients_temp# = VAL(MID$(stats_rtmp.xml$, pos_xml_m& + 10, 16))
        IF rtmp_codec_nclients_temp# > rtmp_codec_nclients# THEN rtmp_codec_nclients# = rtmp_codec_nclients_temp#
    LOOP UNTIL pos_xml_m& = 0

    'temp1 variables
    IF srt_warmup = 0 THEN Kb_Diff# = (Bandwidth_Threshold + 1)
    IF rtmp_bytes_in# = 0 THEN rtmp_bytes_in# = 1
    rtmp_bytes_in_temp1# = rtmp_bytes_in#
    IF rtmp_bytes_in_temp1# >= 1 AND rtmp_bytes_in_temp2# >= 1 THEN
        Kb_Diff# = INT((rtmp_bytes_in_temp1# - rtmp_bytes_in_temp2#) / 128)
    END IF

    'IF Kb_Diff# >= Bandwidth_Threshold THEN Timer_Fail = 0
    IF MediaSource1Time <> 0 OR MediaSource2Time <> 0 THEN Timer_Fail = 0 'SRT

    IF MediaSource1Time = 0 AND MediaSource2Time = 0 AND srt_warmup = 1 THEN Timer_Fail = Timer_Fail + 1 'SRT
    'IF Kb_Diff# <= Bandwidth_Threshold AND srt_warmup = 1 THEN Timer_Fail = Timer_Fail + 1
    IF Timer_Fail > 20999 THEN Timer_Fail = 20999

    SetCaption (rtmp_nacceptedLB), "Acc:" + STR$(rtmp_naccepted#)
    SetCaption (rtmp_codec_nclientsLB), LTRIM$(STR$(rtmp_codec_nclients#))
    IF rtmp_codec_video$ <> "" THEN SetCaption (rtmp_codec_videoLB), rtmp_codec_video$ ELSE SetCaption rtmp_codec_videoLB, "-"
    IF rtmp_codec_audio$ <> "" THEN SetCaption (rtmp_codec_audioLB), rtmp_codec_audio$ ELSE SetCaption rtmp_codec_audioLB, "-"
    calcbw rtmp_bytes_in#, 0
    SetCaption (rtmp_bytes_inLB), LTRIM$(bout)
    calcbw rtmp_bytes_out#, 0
    SetCaption (rtmp_bytes_outLB), LTRIM$(bout)
    calcbw rtmp_bw_in#, 1
    SetCaption (rtmp_bw_inLB), LTRIM$(bout)
    calcbw rtmp_bw_out#, 1
    SetCaption (rtmp_bw_outLB), LTRIM$(bout)
    SetCaption (rtmp_uptimeLB), calc_srt$(rtmp_uptime#, 0)

    IF Timer_Fail >= Stream_Fail_Delay THEN Control(Kb_DiffLB).ForeColor = RED_FAIL ELSE IF Kb_Diff# <= Bandwidth_Threshold THEN Control(Kb_DiffLB).ForeColor = RED_WARNING ELSE Control(Kb_DiffLB).ForeColor = GREEN_OK
    SetCaption (Kb_DiffLB), LTRIM$(STR$(Kb_Diff#)) + " Kb/s"

    IF Timer_Fail >= Stream_Fail_Delay THEN Control(Timer_FailLB).ForeColor = RED_FAIL ELSE IF Timer_Fail >= 1 THEN Control(Timer_FailLB).ForeColor = RED_WARNING: SD = 1: _TITLE "Stream Down!" ELSE Control(Timer_FailLB).ForeColor = GREEN_OK
    SetCaption (Timer_FailLB), calc_srt$(Timer_Fail, 1)

    IF Timer_Fail = 0 AND SD = 1 THEN SD = 0: _TITLE "Loopy SRT Monitor"

    IF Timer_Fail_Count >= 1 THEN Control(Timer_Fail_CountLB).ForeColor = RED_WARNING ELSE Control(Timer_Fail_CountLB).ForeColor = GREEN_OK
    IF Timer_Fail_Count <> 1 THEN SetCaption (Timer_Fail_CountLB), LTRIM$(STR$(Timer_Fail_Count)) + " times" ELSE SetCaption (Timer_Fail_CountLB), LTRIM$(STR$(Timer_Fail_Count)) + " time"

    TIMEms tPingOut#, 0
    IF VAL(tout) >= .25 THEN Control(tPingOutLB).ForeColor = RED_WARNING ELSE Control(tPingOutLB).ForeColor = GREEN_OK
    SetCaption (tPingOutLB), LTRIM$(STR$(VAL(tout) * 1000)) + "ms"

    IF srt_warmup = 1 THEN
        IF td_update# <= 0.001 THEN td_update# = 0.001
        IF td_update# >= 9.999 THEN td_update# = 9.999
        IF td_update# <= 0.989 OR td_update# >= 1.011 THEN Control(td_updateLB).ForeColor = RED_WARNING ELSE Control(td_updateLB).ForeColor = GREEN_OK
        TIMEms td_update#, 0
        SetCaption (td_updateLB), tout + " sec "
    END IF

    SetCaption (Bandwidth_ThresholdLB), LTRIM$(STR$(Bandwidth_Threshold)) + " Kb/s"
    SetCaption (Stream_Fail_DelayLB), calc_srt$(Stream_Fail_Delay, 1)
    IF __MultiCameraSwitch = 0 THEN SetCaption (MultiCameraSwitchStatusLB), "Disabled" ELSE SetCaption (MultiCameraSwitchStatusLB), "Enabled"
    IF __returnPreviousScene = 1 THEN SetCaption (Scene_CurrentLB), LEFT$(previousSceneDisplay$, 20) ELSE SetCaption (Scene_CurrentLB), LEFT$(Scene_Current$, 20)

    IF __MultiCameraSwitch = 1 THEN
        'temp1_stream1 variables
        IF srt_warmup = 0 THEN Kb_Diff_stream1# = (Bandwidth_Threshold + 1)
        IF multiStream1# = 0 THEN multiStream1# = 1
        multiStream1_temp1# = multiStream1#
        IF multiStream1_temp1# >= 1 AND multiStream1_temp2# >= 1 THEN
            Kb_Diff_stream1# = INT((multiStream1_temp1# - multiStream1_temp2#) / 128)
        END IF

        IF Kb_Diff_stream1# >= Bandwidth_Threshold THEN Timer_Fail_Stream1 = 0
        IF Kb_Diff_stream1# <= Bandwidth_Threshold AND srt_warmup = 1 THEN Timer_Fail_Stream1 = Timer_Fail_Stream1 + 1
        IF MediaSource1Time <> 0 THEN Timer_Fail_Stream1 = 0: Timer_Fail = 0 'SRT
        IF Timer_Fail_Stream1 > 19999 THEN Timer_Fail_Stream1 = 19999

        'temp1_stream2 variables
        IF srt_warmup = 0 THEN Kb_Diff_stream2# = (Bandwidth_Threshold + 1)
        IF multiStream2# = 0 THEN multiStream2# = 1
        multiStream2_temp1# = multiStream2#
        IF multiStream2_temp1# >= 1 AND rtmp_bytes_in_temp2# >= 1 THEN
            Kb_Diff_stream2# = INT((multiStream2_temp1# - multiStream2_temp2#) / 128)
        END IF

        IF Kb_Diff_stream2# >= Bandwidth_Threshold THEN Timer_Fail_Stream2 = 0
        IF Kb_Diff_stream2# <= Bandwidth_Threshold AND srt_warmup = 1 THEN Timer_Fail_Stream2 = Timer_Fail_Stream2 + 1
        IF MediaSource2Time <> 0 THEN Timer_Fail_Stream2 = 0: Timer_Fail = 0 'SRT
        IF Timer_Fail_Stream2 > 19999 THEN Timer_Fail_Stream2 = 19999

        calcbw multiStream1#, 0
        SetCaption (multiStream1LB), LTRIM$(bout)

        IF Kb_Diff_stream1# < 0 THEN Kb_Diff_stream1# = 0 'Dirty fix for now

        IF Timer_Fail_Stream1 >= Stream_Fail_Delay THEN Control(Kb_Diff_stream1LB).ForeColor = RED_FAIL ELSE IF Kb_Diff_stream1# <= Bandwidth_Threshold THEN Control(Kb_Diff_stream1LB).ForeColor = RED_WARNING ELSE Control(Kb_Diff_stream1LB).ForeColor = GREEN_OK
        SetCaption (Kb_Diff_stream1LB), LTRIM$(STR$(Kb_Diff_stream1#)) + " Kb/s"

        IF Timer_Fail_Stream1 >= Stream_Fail_Delay THEN Control(Timer_Fail_Stream1LB).ForeColor = RED_FAIL ELSE IF Timer_Fail_Stream1 >= 1 THEN Control(Timer_Fail_Stream1LB).ForeColor = RED_WARNING ELSE Control(Timer_Fail_Stream1LB).ForeColor = GREEN_OK
        SetCaption (Timer_Fail_Stream1LB), calc_srt$(Timer_Fail_Stream1, 1)

        calcbw multiStream2#, 0
        SetCaption (multiStream2LB), LTRIM$(bout)

        IF Kb_Diff_stream2# < 0 THEN Kb_Diff_stream2# = 0 'Dirty fix for now

        IF Timer_Fail_Stream2 >= Stream_Fail_Delay THEN Control(Kb_Diff_stream2LB).ForeColor = RED_FAIL ELSE IF Kb_Diff_stream2# <= Bandwidth_Threshold THEN Control(Kb_Diff_stream2LB).ForeColor = RED_WARNING ELSE Control(Kb_Diff_stream2LB).ForeColor = GREEN_OK
        SetCaption (Kb_Diff_stream2LB), LTRIM$(STR$(Kb_Diff_stream2#)) + " Kb/s"

        IF Timer_Fail_Stream2 >= Stream_Fail_Delay THEN Control(Timer_Fail_Stream2LB).ForeColor = RED_FAIL ELSE IF Timer_Fail_Stream2 >= 1 THEN Control(Timer_Fail_Stream2LB).ForeColor = RED_WARNING ELSE Control(Timer_Fail_Stream2LB).ForeColor = GREEN_OK
        SetCaption (Timer_Fail_Stream2LB), calc_srt$(Timer_Fail_Stream2, 1)
    END IF

    IF Scene_OK = "" OR Scene_Fail = "" OR Scene_Intro = "" THEN RefreshDisplayRequest = 1: Error_msg$ = "- Variable/s for scenes empty, check if " + c34 + config_main + c34 + " exists. (#5)": _DELAY 3

    IF Timer_Fail >= 1 AND Exe_OK = 1 AND streamsUp$ <> "0" THEN
        LoadImageMEM Control(PictureBox1), "tick_warning.png"
    ELSEIF Timer_Fail = 0 AND Exe_OK = 1 THEN
        LoadImageMEM Control(PictureBox1), "tick.png"
    END IF

    'Debug ---
    IF Debug = 0 THEN
        Control(DebugFrame).Hidden = True
        Control(versionFrame).Hidden = False
        Control(TimerLB).Hidden = True
        Control(TimerSnapshotLB).Hidden = True
        Control(td_displayVarLB).Hidden = True
        Control(mouseXVarLB).Hidden = True
        Control(mouseYVarLB).Hidden = True
        Control(__ERRORLINEVarLB).Hidden = True
        Control(Debug_TimerLB).Hidden = True
        Control(Debug_Timer_SnapshotLB).Hidden = True
        Control(td_displayLB).Hidden = True
        Control(mouseXLB).Hidden = True
        Control(mouseYLB).Hidden = True
        Control(__ERRORLINELB).Hidden = True
        Control(PictureBoxLogoBottom).Hidden = False
        SetCaption Debug_TimerLB, "-"
        SetCaption Debug_Timer_SnapshotLB, "-"
        SetCaption td_displayLB, "-"
        SetCaption mouseXLB, "-"
        SetCaption mouseYLB, "-"
        SetCaption __ERRORLINELB, "-"
        SetCaption TimerLB, "-" 'TIMER
        SetCaption TimerSnapshotLB, "-"
        SetCaption td_displayVarLB, "-"
        SetCaption mouseXVarLB, "-"
        SetCaption mouseYVarLB, "-"
        SetCaption __ERRORLINEVarLB, "-"
    ELSEIF Debug = 1 THEN
        Control(DebugFrame).Hidden = False
        Control(versionFrame).Hidden = True
        Control(TimerLB).Hidden = False
        Control(TimerSnapshotLB).Hidden = False
        Control(td_displayVarLB).Hidden = False
        Control(mouseXVarLB).Hidden = False
        Control(mouseYVarLB).Hidden = False
        Control(__ERRORLINEVarLB).Hidden = False
        Control(Debug_TimerLB).Hidden = False
        Control(Debug_Timer_SnapshotLB).Hidden = False
        Control(td_displayLB).Hidden = False
        Control(mouseXLB).Hidden = False
        Control(mouseYLB).Hidden = False
        Control(__ERRORLINELB).Hidden = False
        Control(PictureBoxLogoBottom).Hidden = True
        SetCaption TimerLB, "TIMER" 'TIMER
        SetCaption TimerSnapshotLB, "TIMER (snapshot)"
        SetCaption td_displayVarLB, "td_display var"
        SetCaption mouseXVarLB, "mouseX var"
        SetCaption mouseYVarLB, "mouseY var"
        SetCaption __ERRORLINEVarLB, "_ERRORLINE var"
        TIMEms Debug_Timer#, 0
        SetCaption (Debug_Timer_SnapshotLB), tout + " sec "
    END IF



    'Remove RTMP stats
    'SRT
    Control(rtmp_nacceptedLB).Hidden = True
    Control(rtmp_codec_nclientsLB).Hidden = True
    Control(rtmp_codec_videoLB).Hidden = True
    Control(rtmp_codec_audioLB).Hidden = True
    Control(rtmp_bytes_inLB).Hidden = True
    Control(rtmp_bytes_outLB).Hidden = True
    Control(rtmp_bw_inLB).Hidden = True
    Control(rtmp_bw_outLB).Hidden = True
    Control(rtmp_uptimeLB).Hidden = True
    Control(Kb_DiffLB).Hidden = True
    Control(Bandwidth_ThresholdLB).Hidden = True
    Control(OBS_RemoteLB).Hidden = True
    Control(multiStream1LB).Hidden = True
    Control(Kb_Diff_stream1LB).Hidden = True
    Control(multiStream2LB).Hidden = True
    Control(Kb_Diff_stream2LB).Hidden = True
    SetCaption (ServerPingLB), "MS ping"
    SetCaption (RMTPLB), ""
    SetCaption (clientsLB), ""
    SetCaption (VideoLB), ""
    SetCaption (AudioLB), ""
    SetCaption (InBytesLB), ""
    SetCaption (OutBytesLB), ""
    SetCaption (InBitssLB), ""
    SetCaption (OutBitssLB), ""
    SetCaption (TimeLB), ""
    SetCaption (InBytesDifferenceLB), ""
    SetCaption (BandwidthThresholdLB), ""
    SetCaption (OBSRemoteLB), ""
    SetCaption (InBytesLB2), ""
    SetCaption (InBytesDifferenceLB2), ""
    SetCaption (InBytesLB3), ""
    SetCaption (InBytesDifferenceLB3), ""



    IF verCheck$ <> "" THEN
        SetCaption StatusLB, verCheck$
        updateDisplay = 1
    END IF
    '---------

    'Get OBS scene -------------------------
    IF __returnPreviousScene = 1 THEN
        returnPreviousSceneTime = returnPreviousSceneTime + 1
        IF returnPreviousSceneTime > 2 THEN returnPreviousSceneTime = 1 ELSE GOTO Exit_returnPreviousSceneCheck
        returnFirstCheck = 1
        SELECT CASE WebsocketMethod
            CASE "nodejs"
                SHELL _HIDE "%ComSpec% /C node.exe " + c34 + obs_get_scene + c34 + " > " + c34 + filePrevious + c34
            CASE "obscommand"
                SHELL _HIDE "%ComSpec% /C " + c34 + c34 + obscommand_file + c34 + " /server=" + OBS_URL + " /password=" + OBS_PW + " /command=GetCurrentScene > " + c34 + filePrevious + c34 + c34
        END SELECT
        _DELAY .01
        ON ERROR GOTO PUT_Fail
        PUT_Refresh = 1
        IF _FILEEXISTS(filePrevious) THEN
            OPEN filePrevious FOR INPUT AS #96
            'LOCK #96
            DO UNTIL EOF(96)
                IF LOF(96) = 0 THEN NoKill = 1: EXIT DO 'Overkill with EOF checking, but just being safe
                IF EOF(96) THEN EXIT DO
                LINE INPUT #96, file96$
                SELECT CASE WebsocketMethod
                    CASE "nodejs"
                        IF streamsUp$ <> "0" THEN previousScene$ = file96$
                        previousSceneDisplay$ = file96$
                        EXIT DO 'Output to previousScene$
                    CASE "obscommand"
                        findSceneName = INSTR(file96$, "  " + c34 + "name" + c34 + ": " + c34)
                        IF findSceneName THEN
                            findSceneName2 = INSTR(findSceneName + 11, file96$, c34)
                            IF streamsUp$ <> "0" THEN previousScene$ = MID$(file96$, findSceneName + 11, findSceneName2 - 12)
                            previousSceneDisplay$ = MID$(file96$, findSceneName + 11, findSceneName2 - 12)
                            EXIT DO 'Output to previousScene$
                        END IF
                END SELECT
            LOOP
        END IF
    END IF
    CLOSE #96

    IF NoKill = 1 THEN NoKill = 0 ELSE IF _FILEEXISTS(filePrevious) THEN KILL filePrevious
    ON ERROR GOTO 0
    PUT_Refresh = 0






    Exit_returnPreviousSceneCheck:
    '---------------------------------------
    'IF __FileStatusOutput = 1 THEN statusBitrateToFile "Bitrate: (#1: " + _TRIM$(STR$(Kb_Diff_stream1#)) + " Kb/s) (#2: " + _TRIM$(STR$(Kb_Diff_stream2#)) + " Kb/s)"

    'Execute Stream OK
    IF __MultiCameraSwitch = 0 THEN
        IF MediaSource1Time <> 0 THEN 'SRT
            'IF Kb_Diff# >= Bandwidth_Threshold THEN
            Timer_Fail = 0
            Scene_Current$ = Scene_OK
            IF Exe_Fail = 1 THEN
                Exe_Fail = 0
                Exe_OK = 1
                LoadImageMEM Control(PictureBox1), "tick.png"
                SELECT CASE WebsocketMethod
                    CASE "nodejs"
                        SHELL _DONTWAIT _HIDE shell_nodejs_1 + Scene_OK
                    CASE "obscommand"
                        SHELL _DONTWAIT _HIDE shell_obscommand_1 + Scene_OK + shell_obscommand_2
                END SELECT
                _DELAY .1
                IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]"
            END IF
        ELSE
            IF Timer_Fail >= Stream_Fail_Delay THEN
                IF Exe_OK = 1 THEN
                    Exe_OK = 0
                    Exe_Fail = 1
                    LoadImageMEM Control(PictureBox1), "cross.png"
                    IF Exe_Fail_First = 0 THEN
                        Exe_Fail_First = 1
                        Scene_Current$ = Scene_Intro
                        SELECT CASE WebsocketMethod
                            CASE "nodejs"
                                SHELL _DONTWAIT _HIDE shell_nodejs_1 + Scene_Intro
                            CASE "obscommand"
                                SHELL _DONTWAIT _HIDE shell_obscommand_1 + Scene_Intro + shell_obscommand_2
                        END SELECT
                        _DELAY .1
                    ELSE
                        Scene_Current$ = Scene_Fail
                        SELECT CASE WebsocketMethod
                            CASE "nodejs"
                                SHELL _DONTWAIT _HIDE shell_nodejs_1 + Scene_Fail
                            CASE "obscommand"
                                SHELL _DONTWAIT _HIDE shell_obscommand_1 + Scene_Fail + shell_obscommand_2
                        END SELECT
                        _DELAY .1
                        IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM DOWN]"
                        Timer_Fail_Count = Timer_Fail_Count + 1
                        Timer_Failed = 1
                        IF Timer_Fail_Count > 999 THEN Timer_Fail_Count = 999
                    END IF
                END IF
            END IF
        END IF
    END IF

    IF streamsUp$ <> "0" THEN lastStreamUp$ = streamsUp$

    IF streamsUp$ <> "0" AND returnPreviousSceneRemember = 1 THEN
        IF streamsUp$ = "1" THEN titleScene1 = previousScene$
        IF streamsUp$ = "2" THEN titleScene2 = previousScene$
        IF streamsUp$ = "12" THEN titleScene12 = previousScene$
    END IF

    IF __MultiCameraSwitch = 1 THEN
        IF Timer_Fail_Stream1 = 0 AND Timer_Fail_Stream2 >= Stream_Fail_Delay THEN
            IF streamsUp$ <> "1" THEN
                IF previousScene$ <> titleScene1 AND streamsUp$ = "0" THEN
                    IF lastStreamUp$ <> "1" THEN previousScene$ = titleScene1
                    Scene_Current$ = previousScene$
                    SELECT CASE WebsocketMethod
                        CASE "nodejs"
                            SHELL _DONTWAIT _HIDE shell_nodejs_1 + previousScene$
                        CASE "obscommand"
                            SHELL _DONTWAIT _HIDE shell_obscommand_1 + previousScene$ + shell_obscommand_2
                    END SELECT
                    _DELAY .1
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[CAMERA #1 UP]:[CAMERA #2 DOWN]"
                ELSE
                    Scene_Current$ = titleScene1
                    SELECT CASE WebsocketMethod
                        CASE "nodejs"
                            SHELL _DONTWAIT _HIDE shell_nodejs_1 + titleScene1
                        CASE "obscommand"
                            SHELL _DONTWAIT _HIDE shell_obscommand_1 + titleScene1 + shell_obscommand_2
                    END SELECT
                    _DELAY .1
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[CAMERA #1 UP]"
                END IF
            END IF
            streamsUp$ = "1"
        END IF

        IF Timer_Fail_Stream1 >= Stream_Fail_Delay AND Timer_Fail_Stream2 = 0 THEN
            IF streamsUp$ <> "2" THEN
                IF previousScene$ <> titleScene2 AND streamsUp$ = "0" THEN
                    IF lastStreamUp$ <> "2" THEN previousScene$ = titleScene2
                    Scene_Current$ = previousScene$
                    SELECT CASE WebsocketMethod
                        CASE "nodejs"
                            SHELL _DONTWAIT _HIDE shell_nodejs_1 + previousScene$
                        CASE "obscommand"
                            SHELL _DONTWAIT _HIDE shell_obscommand_1 + previousScene$ + shell_obscommand_2
                    END SELECT
                    _DELAY .1
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[CAMERA #2 UP]:[CAMERA #1 DOWN]"
                ELSE
                    Scene_Current$ = titleScene2
                    SELECT CASE WebsocketMethod
                        CASE "nodejs"
                            SHELL _DONTWAIT _HIDE shell_nodejs_1 + titleScene2
                        CASE "obscommand"
                            SHELL _DONTWAIT _HIDE shell_obscommand_1 + titleScene2 + shell_obscommand_2
                    END SELECT
                    _DELAY .1
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[CAMERA #2 UP]"
                END IF
            END IF
            streamsUp$ = "2"
        END IF

        IF Timer_Fail_Stream1 = 0 AND Timer_Fail_Stream2 = 0 THEN
            IF streamsUp$ <> "12" THEN
                IF previousScene$ <> titleScene12 AND streamsUp$ = "0" THEN
                    IF lastStreamUp$ <> "12" THEN previousScene$ = titleScene12
                    Scene_Current$ = previousScene$
                    SELECT CASE WebsocketMethod
                        CASE "nodejs"
                            SHELL _DONTWAIT _HIDE shell_nodejs_1 + previousScene$
                        CASE "obscommand"
                            SHELL _DONTWAIT _HIDE shell_obscommand_1 + previousScene$ + shell_obscommand_2
                    END SELECT
                    _DELAY .1
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[ALL CAMERAS UP]"
                ELSE
                    Scene_Current$ = titleScene12
                    SELECT CASE WebsocketMethod
                        CASE "nodejs"
                            SHELL _DONTWAIT _HIDE shell_nodejs_1 + titleScene12
                        CASE "obscommand"
                            SHELL _DONTWAIT _HIDE shell_obscommand_1 + titleScene12 + shell_obscommand_2
                    END SELECT
                    _DELAY .1
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM UP]:[ALL CAMERAS UP]"
                END IF
            END IF
            streamsUp$ = "12"
        END IF

        IF Timer_Fail_Stream1 >= Stream_Fail_Delay AND Timer_Fail_Stream2 >= Stream_Fail_Delay THEN
            IF streamsUp$ <> "0" THEN
                streamsUp$ = "0"
                LoadImageMEM Control(PictureBox1), "cross.png"
                IF Exe_Fail_First = 0 THEN
                    Exe_Fail_First = 1
                    Scene_Current$ = Scene_Intro
                    SELECT CASE WebsocketMethod
                        CASE "nodejs"
                            SHELL _DONTWAIT _HIDE shell_nodejs_1 + Scene_Intro
                        CASE "obscommand"
                            SHELL _DONTWAIT _HIDE shell_obscommand_1 + Scene_Intro + shell_obscommand_2
                    END SELECT
                    _DELAY .1
                ELSE
                    Scene_Current$ = Scene_Fail
                    SELECT CASE WebsocketMethod
                        CASE "nodejs"
                            SHELL _DONTWAIT _HIDE shell_nodejs_1 + Scene_Fail
                        CASE "obscommand"
                            SHELL _DONTWAIT _HIDE shell_obscommand_1 + Scene_Fail + shell_obscommand_2
                    END SELECT
                    _DELAY .1
                    IF __FileStatusOutput = 1 THEN statusOutputToFile "[STREAM DOWN]:[ALL CAMERAS DOWN]"
                    Timer_Fail_Count = Timer_Fail_Count + 1
                    Timer_Failed = 1
                    IF Timer_Fail_Count > 999 THEN Timer_Fail_Count = 999
                END IF
            END IF
        END IF
    END IF

    IF srt_warmup = 1 AND returnFirstCheck = 1 AND __MultiCameraSwitch = 1 AND previousSceneDisplay$ = "" THEN RefreshDisplayRequest = 1: Error_msg$ = "- Variable/s for scenes empty, check if OBS is open." + CHR$(10) + "- If OBS is open, check communication is available via Node.js. (#6)": _DELAY 3

    'temp2 variables
    rtmp_bytes_in_temp2# = rtmp_bytes_in#

    'temp_stream1 & temp_stream2 variables
    multiStream1_temp2# = multiStream1#
    multiStream2_temp2# = multiStream2#

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

    IF srt_warmup = 0 THEN srt_warmup = 1

    td_display# = TIMER(.001) - timer1#
END SUB

