': This program uses
': InForm - GUI library for QB64 - v1.3
': Fellippe Heitor, 2016-2021 - fellippe@qb64.org - @fellippeheitor
': https://github.com/FellippeHeitor/InForm
'-----------------------------------------------------------

': Controls' IDs: ------------------------------------------------------------------
Option _Explicit
Dim Shared LoopySRTMonitor As Long
Dim Shared FileMenu As Long
Dim Shared OptionsMenu As Long
Dim Shared HelpMenu As Long
Dim Shared Status As Long
Dim Shared Settings As Long
Dim Shared CurrentScene As Long
Dim Shared DebugFrame As Long
Dim Shared Stream1 As Long
Dim Shared Stream2 As Long
Dim Shared versionFrame As Long
Dim Shared FileMenuExit As Long
Dim Shared StreamFailTimerLB As Long
Dim Shared ServerPingLB As Long
Dim Shared UpdateIntervalLB As Long
Dim Shared Timer_FailLB As Long
Dim Shared Timer_Fail_CountLB As Long
Dim Shared tPingOutLB As Long
Dim Shared td_updateLB As Long
Dim Shared StreamFailDelayLB As Long
Dim Shared MultiCameraSwitchLB As Long
Dim Shared Stream_Fail_DelayLB As Long
Dim Shared MultiCameraSwitchStatusLB As Long
Dim Shared TimerLB As Long
Dim Shared TimerSnapshotLB As Long
Dim Shared td_displayLB2 As Long
Dim Shared mouseXLB2 As Long
Dim Shared mouseYLB2 As Long
Dim Shared __ERRORLINELB2 As Long
Dim Shared Debug_TimerLB As Long
Dim Shared Debug_Timer_SnapshotLB As Long
Dim Shared td_displayLB As Long
Dim Shared mouseXLB As Long
Dim Shared mouseYLB As Long
Dim Shared __ERRORLINELB As Long
Dim Shared StreamUptimeLB As Long
Dim Shared failLB As Long
Dim Shared Uptime_Stream_1LB As Long
Dim Shared Timer_Fail_Stream1LB As Long
Dim Shared Scene_CurrentLB As Long
Dim Shared PictureBox1 As Long
Dim Shared StreamUptimeLB2 As Long
Dim Shared failLB2 As Long
Dim Shared Uptime_Stream_2LB As Long
Dim Shared Timer_Fail_Stream2LB As Long
Dim Shared OptionsMenuRestoreWindowSize As Long
Dim Shared OptionsMenuFullscreen As Long
Dim Shared OptionsMenuDebug As Long
Dim Shared HelpMenuVisitWebsite As Long
Dim Shared HelpMenuCheckForUpdates As Long
Dim Shared IndicatorLB As Long
Dim Shared HelpMenuAbout As Long
Dim Shared StatusLB As Long
Dim Shared PictureBoxLogoBottom As Long
Dim Shared StreamUptimeLB3 As Long
Dim Shared StreamFailTimerLB2 As Long
Dim Shared Stream_UptimeLB As Long
Dim Shared Stream_Fail_TimerLB As Long
Dim Shared Timer_Fail_Count_2LB As Long
Dim Shared IPPingLB As Long
Dim Shared tIPPingOutLB As Long
Dim Shared FailCount1LB As Long
Dim Shared FailCount2LB As Long
Dim Shared LowBRTimerLB As Long
Dim Shared br_countdownLB As Long
Dim Shared MSRateLB As Long
Dim Shared ms_playLB As Long
Dim Shared LowBitrateSceneLB As Long
Dim Shared Low_Bitrate_StatusLB As Long
Dim Shared MSRateLB2 As Long
Dim Shared ms_playLB2 As Long
Dim Shared OptionsMenuAlwaysOnTop As Long
Dim Shared Stream1LightLB As Long
Dim Shared Stream2LightLB As Long
Dim Shared StreamLightLB As Long
Dim Shared LBRDelayLB As Long
Dim Shared br_delayLB As Long
Dim Shared DebugFrameTemp As Long
Dim Shared DebugTemp1LB As Long
Dim Shared DebugTemp2LB As Long
Dim Shared DebugTemp3LB As Long
Dim Shared DebugTemp4LB As Long
Dim Shared DebugTemp1LB2 As Long
Dim Shared DebugTemp2LB2 As Long
Dim Shared DebugTemp3LB2 As Long
Dim Shared DebugTemp4LB2 As Long
Dim Shared BitrateLB As Long
Dim Shared Bitrate_Stream_1LB As Long
Dim Shared BitrateLB2 As Long
Dim Shared Bitrate_Stream_2LB As Long

' Added after InForm entry - BEGIN
DefInt A-Z
Common Shared Error_msg As String
Common Shared Error_msg_2 As String
Common Shared Error_msg_3 As String
Common Shared Ver As String
Common Shared VerBeta As String
Common Shared VerDate As String
Common Shared VerPortable As String
Common Shared bout As String
Common Shared tout As String
Common Shared tout_2 As String '                        TIMEms optional second variable (v1.1.0)
Common Shared Refresh_Request As Integer
Common Shared RefreshDisplayRequest As Integer
Common Shared ProgressCounter As Integer
Common Shared updateResult As String
Common Shared updateDisplay As Integer
Common Shared updateDisplayCounter As Integer
Common Shared verCheck As String
Common Shared CheckUpdateOnStartup As String
Common Shared file224 As String
Common Shared FileStatusOutput As String
Common Shared __FileStatusOutput As _Byte
Common Shared outputBitrateFile As String
Common Shared bitrateOutput As String
Common Shared bitrateOutput1Display As String
Common Shared bitrateOutput2Display As String
Common Shared outputStatusFile As String
Common Shared outputConnectionsLogFile As String
Common Shared outputKbpsFile1 As String
Common Shared outputKbpsFile2 As String
Common Shared outputLB1 As String
Common Shared outputLB2 As String
Common Shared outputLB_Temp1 As String
Common Shared outputLB_Temp2 As String
Common Shared iniFeatures As _Byte
Common Shared Debug As _Byte
Common Shared Tooltip_Mouse As _Byte
Common Shared Tooltip_Mouse_Active As _Byte
Common Shared q As Integer
Common Shared Timer_Failed As _Byte
Common Shared Timer_Failed1 As _Byte
Common Shared Timer_Failed2 As _Byte
Common Shared MediaSource1 As String
Common Shared MediaSource2 As String
Common Shared MediaSource1Time As Long
Common Shared MediaSource2Time As Long
Common Shared MediaSource1TimeMS As Long
Common Shared MediaSource2TimeMS As Long
Common Shared MediaSource1TimeMSOffset As Long
Common Shared MediaSource2TimeMSOffset As Long
Common Shared MediaSourceTimeMSOffsetDisplay As Long
Common Shared MediaSource2TimeMSOffsetDisplay As Long
Common Shared MediaSource1TimeLog As Long
Common Shared MediaSource2TimeLog As Long
Common Shared MediaSourceTimeLB As Long
Common Shared c10 As String
Common Shared c34 As String
Common Shared ErrorTestRunOnce As Integer
Common Shared ErrorTestVal As Integer
Common Shared Error_Exit As Integer
Common Shared Test_Pass_9 As Integer
Common Shared Test_Pass_9_Value As String
Common Shared Test_Pass_10 As Integer
Common Shared Test_Pass_10_Value As String
Common Shared ConnectionsLog As Integer
Common Shared ConnectionsLog1Count As Integer
Common Shared ConnectionsLog2Count As Integer
Common Shared CooldownLog As Integer
Common Shared CooldownLogTotal As Integer
Common Shared CooldownLogWarn As Integer
Common Shared CooldownStartup As Integer
Common Shared CooldownActive As Integer
Common Shared SceneLBActive As Integer
Common Shared SceneLBActive_Temp_Disable As Integer
Common Shared SceneLBActive_Temp_Disable_Display As String
Common Shared srt_warmup_LB As _Byte
Common Shared Scene2LBInactive As Integer
Common Shared CMD_EXE As String
Common Shared CMD_EXE_FAST As String
Common Shared tFileFound As Double
Common Shared SettingsMissing As _Byte
Common Shared tmpFileRestore As _Byte
Common Shared t1 As Single
Common Shared LBR_Delay As Integer
Common Shared LBR_Delay_Minus As Integer
Common Shared LBR_Delay_Plus As Integer
Common Shared LBR_Delay_Total As Integer
Common Shared Scene_LBR_Delay_Total As String
Common Shared LoopySRTMonitorTheme As String
Common Shared Theme_C1 As Long
Common Shared Theme_C2 As Long
Common Shared Allow_Resize As String
Common Shared Server_Display1 As String
Common Shared Server_Display2 As String
Common Shared Server_1 As String
Common Shared Server_2 As String
Common Shared Server_Ping_Display_1 As String
Common Shared Server_Ping_Display_2 As String

' HTTP OpenClient
Common Shared HTTP_Header As String
Common Shared HTTP_Data As String
Common Shared http_client As Single
Common Shared HTTP_Port_Client As String
Common Shared HTTP_Communication As String
Common Shared HTTP_Communication_Native As _Byte
Common Shared HTTP_Server_KeepAlive As String
Common Shared http_connect_timer As Integer

' HTTP OpenClient Get
Common Shared HTTP_Timer_GET As Single
Common Shared HTTP_GET_a As String
Common Shared HTTP_GET_a2 As String
Common Shared HTTP_GET_i As Single
Common Shared HTTP_GET_i2 As Single
Common Shared HTTP_GET_i3 As Single
Common Shared HTTP_GET_l As Single
Common Shared HTTP_GET_d As String
Common Shared HTTP_GET_d_2 As String
Common Shared GetCurrentProgramScene.tmp As String '    Current scene
Common Shared GetMediaInputStatus.tmp As String '       Scene 1
Common Shared GetMediaInputStatus2.tmp As String '      Scene 1+2
Common Shared GetVersion.tmp As String

' RIST mode
Common Shared RIST_Fail_Mode_1 As String
Common Shared RIST_Fail_Mode_2 As String
Common Shared RIST_MediaSource1Time As Double
Common Shared RIST_MediaSource1Time_Count As Double
Common Shared RIST_MediaSource2Time As Double
Common Shared RIST_MediaSource2Time_Count As Double
Common Shared __RIST_Fail_Mode_1 As _Byte
Common Shared __RIST_Fail_Mode_2 As _Byte

' SRT Live Server
Common Shared SLS_1_Enabled As String '                 SLS1Enabled=true
Common Shared SLS_2_Enabled As String '                 SLS2Enabled=true
Common Shared SLS_Server_IP As String '                 ServerIP=127.0.0.1
Common Shared SLS_Server_IP_2 As String '               ServerIP=127.0.0.1 ' SLS 2nd IP
Common Shared SLS_Server_Port As String '               ServerPort=8181
Common Shared SLS_Server_Port_2 As String '             ServerPort=8181    ' SLS 2nd IP
Common Shared SLS_Stats As String '                     ServerStats=stats
Common Shared SLS_Stats_2 As String '                   ServerStats=stats  ' SLS 2nd IP
Common Shared SLS_Publisher1 As String '                ServerPublisher1=live/stream/stream1
Common Shared SLS_Publisher2 As String '                ServerPublisher1=live/stream/stream2
Common Shared SLS_BitrateLow1 As Single '               BitrateLow1=800
Common Shared SLS_BitrateLow2 As Single '               BitrateLow2=800
Common Shared SLS_BitrateFail1 As Single '              BitratFail1=400
Common Shared SLS_BitrateFail2 As Single '              BitrateFail2=400
Common Shared __SLS_1_Enabled As _Byte
Common Shared __SLS_2_Enabled As _Byte
Common Shared SLS_Ping1 As Double
Common Shared SLS_Ping1_2 As Double '                   SLS 2nd IP
Common Shared SLS_Ping2 As Double
Common Shared SLS_Ping2_2 As Double '                   SLS 2nd IP
Common Shared SLS_PingOut As Double
Common Shared SLS_PingOut_2 As Double '                 SLS 2nd IP
Common Shared SLS_Port_Client As String
Common Shared SLS_Port_Client_2 As String '             SLS 2nd IP
Common Shared SLS_EOL As String
Common Shared SLS_Header As String
Common Shared SLS_Header_2 As String '                  SLS 2nd IP
Common Shared SLS_Timer_GET As Single
Common Shared SLS_GET_a As String
Common Shared SLS_GET_a2 As String
Common Shared SLS_GET_i As Single
Common Shared SLS_GET_i2 As Single
Common Shared SLS_GET_i3 As Single
Common Shared SLS_GET_l As Single
Common Shared SLS_GET_d As String
Common Shared SLS_GET_d_2 As String '                   SLS 2nd IP
Common Shared SLS_Bitrate1 As Single
Common Shared SLS_Bitrate2 As Single
Common Shared sls_client As Single
Common Shared sls_client_2 As Single '                  SLS 2nd IP
Common Shared sls_stats.xml As String
Common Shared sls_stats_2.xml As String '               SLS 2nd IP
Common Shared SLS_streams_seek As Integer
Common Shared SLS_streams_found As Integer
Common Shared SLS_Uptime1 As Long
Common Shared SLS_Uptime2 As Long
Common Shared SLS_Active As _Byte
Common Shared SLS_2_Active As _Byte '                   SLS 2nd IP
Common Shared Stream_Title_1 As String '                SLS 2nd IP
Common Shared Stream_Title_2 As String '                SLS 2nd IP
Common Shared BELABOX_1_Found As Integer '              BELABOX
Common Shared BELABOX_2_Found As Integer '              BELABOX
Common Shared BELABOX_1_Uptime As Long '                BELABOX
Common Shared BELABOX_2_Uptime As Long '                BELABOX
Common Shared BELABOX_1_Offline As Integer '            BELABOX
Common Shared BELABOX_2_Offline As Integer '            BELABOX
Common Shared Server_Dummy_Time As Long
Common Shared sls_stats_dummy.xml As String
Common Shared sls_connect_timer_1 As Integer
Common Shared sls_connect_timer_2 As Integer
Common Shared OpenClient_Interval_1 As Integer
Common Shared OpenClient_Interval_2 As Integer
Common Shared KeepAlive_BELABOX_Default As Integer
Common Shared KeepAlive_SLS_Default As Integer
Common Shared SLS_Server_KeepAlive1 As Integer
Common Shared SLS_Server_KeepAlive2 As Integer

' Restreamer (v1.1.1)
Common Shared RESTREAMER_1_Enabled As String '          RESTREAMER1Enabled=true
Common Shared RESTREAMER_2_Enabled As String '          RESTREAMER2Enabled=true
Common Shared RESTREAMER_Server_IP As String '          ServerIP=127.0.0.1
Common Shared RESTREAMER_Server_Port As String '        ServerPort=8080
Common Shared RESTREAMER_Port_Client As String
Common Shared RESTREAMER_EOL As String
Common Shared RESTREAMER_Header As String
Common Shared RESTREAMER_Stats As String '              ServerStats=srt,rtmp
Common Shared RESTREAMER_Data As String
Common Shared RESTREAMER_Username As String
Common Shared RESTREAMER_Password As String
Common Shared RESTREAMER_ID_1 As String
Common Shared RESTREAMER_ID_2 As String
Common Shared RESTREAMER_Timer_GET As Single
Common Shared RESTREAMER_GET_a As String
Common Shared RESTREAMER_GET_a2 As String
Common Shared RESTREAMER_GET_i As Single
Common Shared RESTREAMER_GET_i2 As Single
Common Shared RESTREAMER_GET_i3 As Single
Common Shared RESTREAMER_GET_l As Single
Common Shared RESTREAMER_GET_d As String
Common Shared RESTREAMER_Bitrate1 As Single
Common Shared RESTREAMER_Bitrate2 As Single
Common Shared restreamer_client As Single
Common Shared restreamer_stats.xml As String
Common Shared RESTREAMER_streams_seek As Integer
Common Shared RESTREAMER_streams_found As Integer
Common Shared RESTREAMER_Uptime1 As Long
Common Shared RESTREAMER_Uptime2 As Long
Common Shared RESTREAMER_Active As _Byte
Common Shared restreamer_token.xml As String

Common Shared restreamer_connect_timer As Integer
Common Shared RESTREAMER_Server_KeepAlive As Integer
Common Shared KeepAlive_RESTREAMER_Default As Integer
Common Shared RESTREAMER_Ping1 As Double
Common Shared RESTREAMER_Ping2 As Double
Common Shared RESTREAMER_PingOut As Double
Common Shared RESTREAMER_BitrateLow1 As Single '        BitrateLow1=800
Common Shared RESTREAMER_BitrateLow2 As Single '        BitrateLow2=800
Common Shared RESTREAMER_BitrateFail1 As Single '       BitratFail1=400
Common Shared RESTREAMER_BitrateFail2 As Single '       BitrateFail2=400
Common Shared __RESTREAMER_1_Enabled As _Byte
Common Shared __RESTREAMER_2_Enabled As _Byte
Common Shared OpenClient_Interval_RESTREAMER As Integer

' NGINX RTMP Server
Dim Shared i_XML
Dim Shared XML As String
ReDim Shared XML_Multi(10) As String
Common Shared RTMP_1_Enabled As String '                RTMP1Enabled=true
Common Shared RTMP_2_Enabled As String '                RTMP2Enabled=true
Common Shared RTMP_Server_IP As String '                ServerIP=127.0.0.1
Common Shared RTMP_Server_Port As String '              ServerPort=8181
Common Shared RTMP_Stats As String '                    ServerStats=stats
Common Shared RTMP_Publisher1 As String '               ServerPublisher1=live/stream/stream1
Common Shared RTMP_Publisher2 As String '               ServerPublisher1=live/stream/stream2
Common Shared RTMP_BitrateLow1 As Single '              BitrateLow1=800
Common Shared RTMP_BitrateLow2 As Single '              BitrateLow2=800
Common Shared RTMP_BitrateFail1 As Single '             BitratFail1=400
Common Shared RTMP_BitrateFail2 As Single '             BitrateFail2=400
Common Shared __RTMP_1_Enabled As _Byte
Common Shared __RTMP_2_Enabled As _Byte
Common Shared RTMP_Ping1 As Double
Common Shared RTMP_Ping2 As Double
Common Shared RTMP_PingOut As Double
Common Shared RTMP_Port_Client As String
Common Shared RTMP_EOL As String
Common Shared RTMP_Header As String
Common Shared RTMP_Timer_GET As Single
Common Shared RTMP_GET_a As String
Common Shared RTMP_GET_a2 As String
Common Shared RTMP_GET_i As Single
Common Shared RTMP_GET_i2 As Single
Common Shared RTMP_GET_i3 As Single
Common Shared RTMP_GET_l As Single
Common Shared RTMP_GET_d As String
Common Shared RTMP_Bitrate1 As Single
Common Shared RTMP_Bitrate2 As Single
Common Shared rtmp_client As Single
Common Shared rtmp_stats.xml As String
Common Shared rtmp_stats.xml_XML As String
Common Shared RTMP_streams_seek As Integer
Common Shared RTMP_streams_found As Integer
Common Shared RTMP_Uptime1 As Double
Common Shared RTMP_Uptime2 As Double
Common Shared RTMP_Uptime1_XML As String
Common Shared RTMP_Uptime2_XML As String
Common Shared RTMP_Active As _Byte
Common Shared RTMP_Kbps_Precision As String
Common Shared RTMP_Width1 As Integer
Common Shared RTMP_Height1 As Integer
Common Shared RTMP_Width2 As Integer
Common Shared RTMP_Height2 As Integer
Common Shared rtmp_connect_timer As Integer
Common Shared RTMP_Server_KeepAlive As Integer
Common Shared OpenClient_Interval_RTMP As Integer
Common Shared KeepAlive_RTMP_Server_Default As Integer
Common Shared RTMP_Bytes_In As Double
Common Shared RTMP_Bytes_In_Temp1 As Double
Common Shared RTMP_Bytes_In_Temp2 As Double
Common Shared multiStream1_Temp1 As Double
Common Shared multiStream1_Temp2 As Double
Common Shared multiStream2_Temp1 As Double
Common Shared multiStream2_Temp2 As Double
Common Shared multiStream1 As Double
Common Shared multiStream2 As Double

' obs-websocket-http
Dim Shared i_JSON
Dim Shared JSON As String
ReDim Shared JSON_Multi(10) As String
Common Shared HTTP_Bind_Port As String
Common Shared HTTP_Bind_Address As String
Common Shared HTTP_Auth_Key As String
Common Shared HTTP_Enabled As _Byte
Common Shared HTTP_File As String
Common Shared HTTP_Filename As String
Common Shared http_Delay As Double
Common Shared http_media2_File As String

' obs-websocket-http CMD
Common Shared CMD_EXE_HTTP As String
Common Shared CMD_EXE_HTTP_FAST As String
Common Shared CMD_EXE_HTTP_FAST_GET_SCENE As String
Common Shared CMD_EXE_HTTP_FAST_GET_MEDIA1 As String
Common Shared CMD_EXE_HTTP_GET_SCENE As String
Common Shared CMD_EXE_HTTP_GET_MEDIA2 As String

Common Shared Scene_OK As String
Common Shared Scene_LBR As String
Common Shared Scene_LBR_Enabled As String
Common Shared Scene2_LBR_Disabled As String
Common Shared Scene_Fail As String
Common Shared Scene_Intro As String
Common Shared Scene_Bypass As String
Common Shared Scene_Bypass_2 As String
Common Shared Scene_Bypass_3 As String
Common Shared Scene_Bypass_4 As String
Common Shared Scene_Bypass_5 As String
Common Shared Scene_Bypass_6 As String
Common Shared Scene_Bypass_7 As String
Common Shared Scene_Bypass_8 As String
Common Shared Scene_Bypass_9 As String
Common Shared Scene_Bypass_Check As String
Common Shared Scene_Bypass_Log As Integer
Common Shared OBS_URL As String
Common Shared OBS_PW As String
Common Shared OBS_Connection As String
Common Shared titleScene1 As String
Common Shared titleScene2 As String
Common Shared titleScene12 As String
Common Shared titleScene1Temp As String
Common Shared titleScene2Temp As String
Common Shared titleScene12Temp As String
Common Shared returnPreviousScene As String
Common Shared shell_cmd_1 As String
Common Shared shell_cmd_2 As String
Common Shared ConnectionsLog_Check As String
Common Shared PingLogTimer As Double
Common Shared segment_LBR As _Byte
Common Shared Scene_Disabled As String

Common Shared config_dir As String
Common Shared nodejs_dir As String
Common Shared temp_dir As String
Common Shared config_main As String
Common Shared obs_change_scene As String
Common Shared obs_get_scene As String
Common Shared obs_get_scene_list As String
Common Shared obs_get_media1 As String
Common Shared obs_get_media1_scene As String
Common Shared obs_get_media2 As String
Common Shared obs_get_media2_scene As String
Common Shared obs_check_websocket As String
Common Shared websocketOK As _Byte
Common Shared websocketVersion As _Byte
Common Shared checkWebSocketVersion As String
Common Shared filePrevious As String
Common Shared filePrevious_ms As String
Common Shared fileCheckVersion As String

' Forward slash file location
Common Shared s As String
Common Shared sr As String
Common Shared sreplace As String
Common Shared new As String
Common Shared strReplace As String
Common Shared p As Long
Common Shared filePrevious_fs As String
Common Shared filePrevious_ms_fs As String

Common Shared Exe_OK As _Byte
Common Shared Exe_Fail As _Byte
Common Shared Exe_Fail_First As _Byte
Common Shared Exe_Fail_First_Stream1 As _Byte
Common Shared Exe_Fail_First_Stream2 As _Byte

' Fail icon
Common Shared iconStatus As Long

' Timers
Common Shared CooldownDuration As Long
Common Shared Timer_Fail As Long
Common Shared Timer_Fail_Stream1 As Long
Common Shared Timer_Fail_Stream2 As Long
Common Shared Timer_Fail_Output1 As Long
Common Shared Timer_Fail_Output2 As Long
Common Shared Timer_Limit As Long

' Timer01
Common Shared mouseX As Integer
Common Shared mouseY As Integer
Common Shared Timer_Fail_Count As Integer
Common Shared Timer_Fail_Count1 As Integer
Common Shared Timer_Fail_Count2 As Integer
Common Shared Timer_Fail_Output1_Str As String
Common Shared Timer_Fail_Output2_Str As String
Common Shared FullScreen As _Byte
Common Shared BG As Long
Common Shared srt_warmup As _Byte
Common Shared srt_warmup_file_media As _Byte
Common Shared srt_warmup_file_scene As _Byte
Common Shared td_update As Double
Common Shared timer1 As Double
Common Shared Debug_Timer As Double
Common Shared __returnPreviousScene As _Byte
Common Shared __returnPreviousSceneRemember As _Byte
Common Shared __MultiCameraSwitch As _Byte
Common Shared returnPreviousSceneTime As _Byte
Common Shared SRR As _Byte
Common Shared returnFirstCheck As Integer
Common Shared App_Refresh As _Byte
Common Shared NoKill As Integer
Common Shared file90 As String
Common Shared file92 As String
Common Shared file96 As String
Common Shared streamsUp As String
Common Shared previousScene As String
Common Shared previousSceneDisplay As String
Common Shared tPing1 As Double
Common Shared network_client As Single
Common Shared tPing2 As Double
Common Shared tPingOut As Double
Common Shared tIPPing1 As Double
Common Shared tIPPing2 As Double
Common Shared tIPPingOut As Double
Common Shared tPingTimer As Integer
Common Shared Stream_Fail_Delay As Integer
Common Shared Stream_Down_Icon As Integer
Common Shared Scene_Current As String
Common Shared lastStreamUp As String
Common Shared Timer_Fail_First As Integer
Common Shared Timer_Fail_First_Stream1 As Integer
Common Shared Timer_Fail_First_Stream2 As Integer
Common Shared td_display As Double

' UNDOCUMENTED
Common Shared MediaSourceTime As String
Common Shared CooldownTotal As String
Common Shared ForceDebugOnStartup As String
Common Shared Debug_Temp As String
Common Shared Deny_Ping As String
Common Shared SLS_Kbps_Precision As String
Common Shared Leading_Zero As String
Common Shared PingLog As String
Common Shared FastStart As String
Common Shared HTTP_Auto_Open As String
Common Shared Dummy_Server As String

' Misc
Common Shared file4_var As String
Common Shared file4_val As String
Common Shared BSOD As Long
Common Shared AlwaysOnTop As Integer
Common Shared Answer As Integer
Common Shared NULL As Integer

' OnLoad
Common Shared Desktop_Width_Position As Integer
Common Shared Desktop_Height_Position As Integer
Common Shared file4 As String
Common Shared EqualFound As Integer
Common Shared MultiCameraSwitch As String
Common Shared returnPreviousSceneRemember As String

Common Shared serverType As String
Common Shared serverSelection As _Byte

' SUB TIMEms
Common Shared tout1#
Common Shared tout2#
Common Shared toutint#
Common Shared toutdec#
Common Shared plus

' SUB calcbw
Common Shared bout
Common Shared bout2#
Common Shared bout#
Common Shared boutnodec
Common Shared bits
Common Shared boutint#
Common Shared boutm$
Common Shared boutdec#
Common Shared boutdec$

' FUNC calc_srt$
Common Shared calc_srt_sec$
Common Shared calc_srt_hr_min$
Common Shared convertTime#
Common Shared includeSec
Common Shared leadingZero
Common Shared t_hr
Common Shared t_min
Common Shared t_sec

Common Shared RED_WARNING As _Unsigned Long
Common Shared RED_FAIL As _Unsigned Long
Common Shared GREEN_OK As _Unsigned Long
Common Shared GREEN_SCENE_OK As _Unsigned Long
Common Shared GREEN_STREAM_OK As _Unsigned Long

' Linux only
Common Shared DIR_documents As String
Common Shared OS As String

' Always on top
Dim Shared Myhwnd As Long
$If WIN Then
    Dim Shared y& ' Windows only
$End If

$If VERSION < 3.5.0 Then
        $ERROR Requires at least QB64 v3.5.0
$End If

' Set variables on load: ---------------------------------------------------------------

' Linux only
If Mid$(_OS$, 2, 5) = "LINUX" Then OS = "LINUX" Else OS = "WINDOWS"

' macOS only
If Mid$(_OS$, 2, 5) = "MACOS" Then OS = "LINUX"

' Set OS variables
If OS = "LINUX" Then s = "/" Else s = "\"

' Darker text in light mode for improved visibility
If Not InStr(Command$, "-light") Then
    RED_WARNING = _RGB32(160, 64, 48)
    RED_FAIL = _RGB32(255, 48, 32)
    GREEN_OK = _RGB32(120, 192, 164)
    GREEN_SCENE_OK = _RGB32(155, 255, 240)
    GREEN_STREAM_OK = _RGB32(64, 252, 48)
Else
    RED_WARNING = _RGB32(192, 60, 28)
    RED_FAIL = _RGB32(240, 28, 12)
    GREEN_OK = _RGB32(80, 118, 120)
    GREEN_SCENE_OK = _RGB32(64, 128, 120)
    GREEN_STREAM_OK = _RGB32(32, 164, 24)
End If

' Default program settings
'Const FALSE = 0 '           Located in file "InForm\InForm.bi", line 328
'Const TRUE = Not FALSE '    Located in file "InForm\InForm.bi", line 328
q = _Exit
c10 = Chr$(10)
c34 = Chr$(34)
DIR_documents = _CWD$
SLS_EOL = Chr$(13) + Chr$(10)
RTMP_EOL = Chr$(13) + Chr$(10)
RESTREAMER_EOL = Chr$(13) + Chr$(10)
BG = _RGB(32, 32, 32)
Exe_OK = 1
websocketVersion = 5
checkWebSocketVersion = "unknown"
websocketOK = 0
srt_warmup_LB = 10
BELABOX_1_Uptime = 0 ' BELABOX
BELABOX_2_Uptime = 0 ' BELABOX
Timer_Limit = 35996400

' Default config settings
SLS_Stats = "stats" '                                                               Temp settings - config.ini can override
SLS_Server_Port = "8181"
SLS_Server_IP = "127.0.0.1": SLS_Port_Client = "TCP/IP:" + SLS_Server_Port + ":"
SLS_Publisher1 = "publish/live/stream1"
SLS_Publisher2 = "publish/live/stream2"
OpenClient_Interval_1 = 5
OpenClient_Interval_2 = 5
KeepAlive_BELABOX_Default = 30
KeepAlive_SLS_Default = 5
KeepAlive_RTMP_Server_Default = 30
KeepAlive_RESTREAMER_Default = 5
Stream_Fail_Delay = 8
' ---------------------------------------------------------------

' Error handling when enabled takes place here
App_Fail:
If Err Then Cls: _PrintString (30, 32), "ERR, _ERRORLINE:" + Str$(Err) + "," + Str$(_ErrorLine): _AutoDisplay: _Delay 5: If App_Refresh = 1 Then App_Refresh = 0: Refresh_Request = 1: Resume Next Else Resume Next
' Added after InForm entry - END

': External modules: ---------------------------------------------------------------
'$INCLUDE:'InForm\InForm.bi'
'$INCLUDE:'InForm\xp.uitheme'
'$INCLUDE:'loopy_srt_monitor.frm'

': Event procedures: ---------------------------------------------------------------
'$INCLUDE:'loopy_srt_monitor_light.frm'
'$INCLUDE:'image.png.MEM'
Sub __UI_BeforeInit
    $VersionInfo:CompanyName=loopy750
    $VersionInfo:ProductName=Loopy SRT Monitor
    $VersionInfo:Comments=Monitor SRT Streams
    $VersionInfo:FileDescription=Loopy SRT Monitor
    $VersionInfo:FILEVERSION#=1,1,1,0
    $VersionInfo:ProductVersion=1,1,1,0
    $VersionInfo:LegalCopyright=loopy750
    $VersionInfo:OriginalFilename=loopy_srt_monitor.exe
    $Checking:On
    '$EXEICON moved but still parsed on launch

    _Title "Loopy SRT Monitor - loopy750"
    Ver = "1.1.0"
    VerBeta = "1.1.1"
    VerDate = "03/23"
    VerPortable = "false"
End Sub

Sub __UI_OnLoad
    ' Always on top: ------------------------------------------------------------------
    ' Windows only
    $If WIN Then
        Declare Dynamic Library "user32"
            Function SetWindowPos& (ByVal hWnd As Long, Byval hWndInsertAfter As _Offset, Byval X As Integer, Byval Y As Integer, Byval cx As Integer, Byval cy As Integer, Byval uFlags As _Offset)
        End Declare
    $End If
    Myhwnd = _WindowHandle
    ' ----------------------------------------------------------------------------------

    ' Update display: ---------------------------------------------------------------
    SetCaption Timer_FailLB, "-"
    SetCaption Timer_Fail_CountLB, "-"
    SetCaption Timer_Fail_Count_2LB, "-"
    SetCaption tPingOutLB, "-"
    SetCaption tIPPingOutLB, "-"
    SetCaption td_updateLB, "-"
    SetCaption Stream_Fail_DelayLB, "-" '           Settings
    SetCaption MultiCameraSwitchStatusLB, "-"
    SetCaption Uptime_Stream_1LB, "-" '             Stream #1
    SetCaption Timer_Fail_Stream1LB, "-" '          Stream #2
    SetCaption Uptime_Stream_2LB, "-"
    SetCaption Timer_Fail_Stream2LB, "-"
    SetCaption Scene_CurrentLB, "-" '               Current Scene
    SetCaption Low_Bitrate_StatusLB, "-" '          Low bitrate multiple cameras
    SetCaption Debug_TimerLB, "-" '                 Debug
    SetCaption Debug_Timer_SnapshotLB, "-"
    SetCaption td_displayLB, "-"
    SetCaption mouseXLB, "-"
    SetCaption mouseYLB, "-"
    SetCaption __ERRORLINELB, "-"
    SetCaption TimerLB, "-" '                       Debug titles
    SetCaption TimerSnapshotLB, "-"
    SetCaption td_displayLB2, "-"
    SetCaption mouseXLB2, "-"
    SetCaption mouseYLB2, "-"
    SetCaption __ERRORLINELB2, "-"
    SetCaption Stream_UptimeLB, "-" '               Stream #1 only
    SetCaption Stream_Fail_TimerLB, "-"
    ' ---------------------------------------------------------------

    ' File variables: ---------------------------------------------------------------
    ' Set OS variables
    Select Case OS
        Case "WINDOWS"
            config_dir = _Dir$("documents") + "Loopy SRT Monitor"
            nodejs_dir = _Dir$("documents") + "Loopy SRT Monitor\js"
            temp_dir = _Dir$("documents") + "Loopy SRT Monitor\Temp"
        Case "LINUX"
            config_dir = DIR_documents + ""
            nodejs_dir = DIR_documents + "/js"
            temp_dir = DIR_documents + "/Temp"
    End Select
    If OS = "WINDOWS" And VerPortable = "true" Then
        config_dir = DIR_documents + ""
        nodejs_dir = DIR_documents + "\js"
        temp_dir = DIR_documents + "\Temp"
    End If
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
    p = InStr(sr$, sreplace$)
    While p
        strReplace$ = Mid$(strReplace$, 1, p - 1) + new$ + Mid$(strReplace$, p + Len(sreplace$))
        p = InStr(p + Len(new$), strReplace$, sreplace$)
    Wend
    filePrevious_fs = strReplace$

    ' Convert forward slash to backslash for filePrevious_ms_fs
    sr$ = filePrevious_ms
    strReplace$ = sr$
    p = InStr(sr$, sreplace$)
    While p
        strReplace$ = Mid$(strReplace$, 1, p - 1) + new$ + Mid$(strReplace$, p + Len(sreplace$))
        p = InStr(p + Len(new$), strReplace$, sreplace$)
    Wend
    filePrevious_ms_fs = strReplace$

    On Error GoTo App_Fail
    _Delay 0.03
    If VerBeta <> "" Then _Title "Loopy SRT Monitor v" + VerBeta + "beta" Else _Title "Loopy SRT Monitor v" + Ver
    If _DirExists(config_dir) Then If Not _DirExists(temp_dir) Then MkDir temp_dir
    If _FileExists(filePrevious) Then Kill filePrevious
    If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
    _AllowFullScreen Off
    Randomize Timer
    ErrorTestRunOnce = TRUE

    ' Set font for error screen
    On Error GoTo App_Fail
    ' Set OS variables
    Select Case OS
        Case "WINDOWS"
            If _FileExists(Environ$("SYSTEMROOT") + "\fonts\seguisb.ttf") Then _Font _LoadFont(Environ$("SYSTEMROOT") + "\fonts\seguisb.ttf", 12)
        Case "LINUX"
            If _FileExists("seguisb.ttf") Then _Font _LoadFont("seguisb.ttf", 12)
    End Select
    On Error GoTo 0

    ' Perform tests before program can continue: ---------------------------------------------------------------
    ' Check config
    ' Test #2
    If ErrorTestRunOnce Then
        If Not _FileExists(config_main) Then
            Error_msg = "- Unable to read config file in the " + c34 + "Documents\Loopy SRT Monitor" + c34 + " folder" + Chr$(10) + "- File " + c34 + config_main + c34 + " cannot be found."
            ErrorDisplay (2)
        End If
    End If

    If Not _FileExists(config_main) Then RefreshDisplayRequest = TRUE: Error_msg = "- Unable to read config file in the " + c34 + "Documents\Loopy SRT Monitor" + c34 + " folder" + Chr$(10) + "- File " + c34 + config_main + c34 + " cannot be accessed, check if it exists. (Error: #1)": _Delay 3
    If _FileExists(config_main) Then
        Open config_main For Input As #4 ' Basic INI management, nothing fancy needed
        If EOF(4) Then RefreshDisplayRequest = TRUE: Error_msg = "- Unable to read config file in the " + c34 + "Documents\Loopy SRT Monitor" + c34 + " folder" + Chr$(10) + "- File " + c34 + config_main + c34 + " cannot be accessed, check if it exists. (Error: #10)": _Delay 3
        Do
            If Not EOF(4) Then Line Input #4, file4
            If Left$(file4, 1) <> "#" And Left$(file4, 1) <> ";" And Left$(file4, 1) <> "" Then
                EqualFound = InStr(file4, "=")
                If EqualFound Then
                    file4_var$ = Left$(file4, InStr(file4, "=") - 1)
                    file4_val$ = Mid$(file4, InStr(file4, "=") + 1)
                    file4_var$ = LCase$(file4_var$)
                    If file4_var$ = "streamfaildelay" Then Stream_Fail_Delay = Val(file4_val$)
                    If file4_var$ = "xwindow" Then Desktop_Width_Position = Val(file4_val$)
                    If file4_var$ = "ywindow" Then Desktop_Height_Position = Val(file4_val$)
                    If file4_var$ = "xwindowposition" Then Desktop_Width_Position = Val(file4_val$)
                    If file4_var$ = "ywindowposition" Then Desktop_Height_Position = Val(file4_val$)
                    If file4_var$ = "sceneok" Then Scene_OK = file4_val$
                    If file4_var$ = "scenefail" Then Scene_Fail = file4_val$
                    If file4_var$ = "sceneintro" Then Scene_Intro = file4_val$
                    If file4_var$ = "scenebypass" Then Scene_Bypass = file4_val$
                    If file4_var$ = "scenebypass2" Then Scene_Bypass_2 = file4_val$
                    If file4_var$ = "scenebypass3" Then Scene_Bypass_3 = file4_val$
                    If file4_var$ = "scenebypass4" Then Scene_Bypass_4 = file4_val$
                    If file4_var$ = "scenebypass5" Then Scene_Bypass_5 = file4_val$
                    If file4_var$ = "scenebypass6" Then Scene_Bypass_6 = file4_val$
                    If file4_var$ = "scenebypass7" Then Scene_Bypass_7 = file4_val$
                    If file4_var$ = "scenebypass8" Then Scene_Bypass_8 = file4_val$
                    If file4_var$ = "scenebypass9" Then Scene_Bypass_9 = file4_val$
                    If file4_var$ = "mediasource1" Then MediaSource1 = file4_val$
                    If file4_var$ = "mediasource2" Then MediaSource2 = file4_val$
                    If file4_var$ = "websocketaddress" Then OBS_URL = file4_val$
                    If file4_var$ = "websocketpassword" Then OBS_PW = file4_val$
                    If file4_var$ = "websocketconnection" Then OBS_Connection = file4_val$
                    If file4_var$ = "filestatusoutput" Then FileStatusOutput = file4_val$
                    If file4_var$ = "connectionslog" Then ConnectionsLog_Check = file4_val$
                    If file4_var$ = "scenelbrenabled" Then Scene_LBR_Enabled = file4_val$
                    If file4_var$ = "scenelbrdelay" Then Scene_LBR_Delay_Total = file4_val$
                    If file4_var$ = "scene2lbrdisabled" Then Scene2_LBR_Disabled = file4_val$
                    If file4_var$ = "ristfailmode1" Then RIST_Fail_Mode_1 = file4_val$ ' RIST mode
                    If file4_var$ = "ristfailmode2" Then RIST_Fail_Mode_2 = file4_val$ ' RIST mode - Source 2
                    If file4_var$ = "colortheme" Then LoopySRTMonitorTheme = file4_val$
                    If file4_var$ = "allowresize" Then Allow_Resize = file4_val$
                    If file4_var$ = "checkupdateonstartup" Then CheckUpdateOnStartup = file4_val$
                    If file4_var$ = "multicameraswitch" Then MultiCameraSwitch = file4_val$
                    If file4_var$ = "titlescene1" Then titleScene1 = file4_val$
                    If file4_var$ = "titlescene2" Then titleScene2 = file4_val$
                    If file4_var$ = "titlescene12" Then titleScene12 = file4_val$
                    If file4_var$ = "returnpreviousscene" Then returnPreviousScene = file4_val$
                    If file4_var$ = "returnprevioussceneremember" Then returnPreviousSceneRemember = file4_val$
                    If file4_var$ = "httpcommunication" Then HTTP_Communication = file4_val$ ' HTTP (v1.1.0)
                    If file4_var$ = "httpbindaddress" Then HTTP_Bind_Address = file4_val$ '                         obs-websocket-http settings
                    If file4_var$ = "httpbindport" Then HTTP_Bind_Port = file4_val$
                    If file4_var$ = "httpauthkey" Then HTTP_Auth_Key = Left$(file4_val$, 256)
                    If file4_var$ = "rtmp1enabled" Then RTMP_1_Enabled = file4_val$ '                               NGINX RTMP server settings
                    If file4_var$ = "rtmp2enabled" Then RTMP_2_Enabled = file4_val$
                    If file4_var$ = "rtmpserverip" Then RTMP_Server_IP = file4_val$
                    If file4_var$ = "rtmpserverport" Then RTMP_Server_Port = file4_val$
                    If file4_var$ = "rtmpserverstats" Then RTMP_Stats = file4_val$
                    If file4_var$ = "rtmpserverkeepalive" Then RTMP_Server_KeepAlive = Val(file4_val$)
                    If file4_var$ = "rtmpserverpublisher1" Then RTMP_Publisher1 = file4_val$
                    If file4_var$ = "rtmpserverpublisher2" Then RTMP_Publisher2 = file4_val$
                    If file4_var$ = "rtmpbitratelow1" Then RTMP_BitrateLow1 = Val(file4_val$)
                    If file4_var$ = "rtmpbitratelow2" Then RTMP_BitrateLow2 = Val(file4_val$)
                    If file4_var$ = "rtmpbitratefail1" Then RTMP_BitrateFail1 = Val(file4_val$)
                    If file4_var$ = "rtmpbitratefail2" Then RTMP_BitrateFail2 = Val(file4_val$)
                    If file4_var$ = "sls1enabled" Then SLS_1_Enabled = file4_val$ '                                 SRT Live server settings
                    If file4_var$ = "sls2enabled" Then SLS_2_Enabled = file4_val$
                    If file4_var$ = "slsserverip" Then SLS_Server_IP = file4_val$ ' Backwards compatibility
                    If file4_var$ = "slsserverip1" Then SLS_Server_IP = file4_val$
                    If file4_var$ = "slsserverip2" Then SLS_Server_IP_2 = file4_val$ ' SLS 2nd IP
                    If file4_var$ = "slsserverport" Then SLS_Server_Port = file4_val$ ' Backwards compatibility
                    If file4_var$ = "slsserverport1" Then SLS_Server_Port = file4_val$
                    If file4_var$ = "slsserverport2" Then SLS_Server_Port_2 = file4_val$ ' SLS 2nd IP
                    If file4_var$ = "slsserverstats" Then SLS_Stats = file4_val$ ' Backwards compatibility
                    If file4_var$ = "slsserverstats1" Then SLS_Stats = file4_val$
                    If file4_var$ = "slsserverstats2" Then SLS_Stats_2 = file4_val$ ' SLS 2nd IP
                    If file4_var$ = "slsserverpublisher1" Then SLS_Publisher1 = file4_val$
                    If file4_var$ = "slsserverpublisher2" Then SLS_Publisher2 = file4_val$
                    If file4_var$ = "slsserverkeepalive1" Then SLS_Server_KeepAlive1 = Val(file4_val$)
                    If file4_var$ = "slsserverkeepalive2" Then SLS_Server_KeepAlive2 = Val(file4_val$)
                    If file4_var$ = "slsbitratelow1" Then SLS_BitrateLow1 = Val(file4_val$)
                    If file4_var$ = "slsbitratelow2" Then SLS_BitrateLow2 = Val(file4_val$)
                    If file4_var$ = "slsbitratefail1" Then SLS_BitrateFail1 = Val(file4_val$)
                    If file4_var$ = "slsbitratefail2" Then SLS_BitrateFail2 = Val(file4_val$)
                    If file4_var$ = "restreamer1enabled" Then RESTREAMER_1_Enabled = file4_val$ '                    Restreamer server settings
                    If file4_var$ = "restreamer2enabled" Then RESTREAMER_2_Enabled = file4_val$
                    If file4_var$ = "restreamerusername" Then RESTREAMER_Username = file4_val$
                    If file4_var$ = "restreamerpassword" Then RESTREAMER_Password = file4_val$
                    If file4_var$ = "restreamerserverip" Then RESTREAMER_Server_IP = file4_val$
                    If file4_var$ = "restreamerserverport" Then RESTREAMER_Server_Port = file4_val$
                    If file4_var$ = "restreamerstats" Then RESTREAMER_Stats = file4_val$
                    If file4_var$ = "restreamerserverkeepalive" Then RESTREAMER_Server_KeepAlive = Val(file4_val$)
                    If file4_var$ = "restreamerid1" Then RESTREAMER_ID_1 = file4_val$
                    If file4_var$ = "restreamerid2" Then RESTREAMER_ID_2 = file4_val$
                    If file4_var$ = "restreamerbitratelow1" Then RESTREAMER_BitrateLow1 = Val(file4_val$)
                    If file4_var$ = "restreamerbitratelow2" Then RESTREAMER_BitrateLow2 = Val(file4_val$)
                    If file4_var$ = "restreamerbitratefail1" Then RESTREAMER_BitrateFail1 = Val(file4_val$)
                    If file4_var$ = "restreamerbitratefail2" Then RESTREAMER_BitrateFail2 = Val(file4_val$)
                    If file4_var$ = "mediasourcetime" Then MediaSourceTime = file4_val$ '                           UNDOCUMENTED settings
                    If file4_var$ = "cooldowntotal" Then CooldownTotal = file4_val$
                    If file4_var$ = "forcedebugonstartup" Then ForceDebugOnStartup = file4_val$
                    If file4_var$ = "debugtemp" Then Debug_Temp = file4_val$ ' For coding only
                    If file4_var$ = "denyping" Then Deny_Ping = file4_val$
                    If file4_var$ = "kbpsprecision" Then SLS_Kbps_Precision = file4_val$
                    If file4_var$ = "leadingzero" Then Leading_Zero = file4_val$
                    If file4_var$ = "pinglog" Then PingLog = file4_val$
                    If file4_var$ = "faststart" Then FastStart = file4_val$
                    If file4_var$ = "httpautoopen" Then HTTP_Auto_Open = file4_val$ ' For coding only
                    If file4_var$ = "scenedisabled" Then Scene_Disabled = file4_val$
                    If file4_var$ = "dummyserver" Then Dummy_Server = file4_val$ ' For coding only
                End If
            End If
        Loop Until EOF(4)
        Close #4

        '---------------------------------------------------------------
        'v1.1.0
        '------
        'SLSServerIP2=127.0.0.1
        'SLSServerPort2=8181
        'SLSServerStats2=stats
        'RTMPServerKeepAlive=Default
        'SLSServerKeepAlive1=Default
        'SLSServerKeepAlive2=Default
        'HTTPCommunication=native
        '
        'DEPRECIATED
        'NodejsFileSystem=0
        'NodejsAccess=fast
        'jsEncoding=json
        '
        'UNDOCUMENTED
        '------------
        'MediaSourceTime=800
        'CooldownTotal=8
        'ForceDebugOnStartup=false
        'DebugTemp=false
        'DenyPing=false
        'KbpsPrecision=false
        'LeadingZero=false
        'PingLog=false
        'FastStart=false
        'HTTPAutoOpen=true
        'SceneDisabled=false
        'DummyServer=
        '---------------------------------------------------------------
        'Depreciated `config`
        'NodejsFileSystem, jsEncoding, HTTPAccess, NodejsAccess
        '
        'Depreciated `string`
        'js_Encoding, HTTP_Access, CMD_EXE_HTTP_GET_MEDIA1, Nodejs_Access
        '
        'Depreciated `_BYTE`
        'tmpFileError
        '---------------------------------------------------------------


        ' Set config variables ------------------------------------------------------------------------------------------------------------------------------

        ' Set "WebSocketConnection" and "HTTPCommunication"
        If OBS_Connection = "" Then HTTP_Enabled = FALSE Else HTTP_Enabled = TRUE '                     Assume older version if WebSocketConnection does not exist and use obs-websocket-js by default for backwards compatibility
        If OBS_Connection = "http" Or OBS_Connection = "obs-websocket-http" Then HTTP_Enabled = TRUE
        If OBS_Connection = "js" Or OBS_Connection = "obs-websocket-js" Then HTTP_Enabled = FALSE
        If HTTP_Communication = "" And HTTP_Enabled Then HTTP_Communication = "native" '                New HTTP default is "native"
        If Not HTTP_Enabled Then HTTP_Communication = "curl" '                                          curl must be used for obs-websocket-js
        If HTTP_Communication <> "native" Then HTTP_Communication = "curl"
        If HTTP_Communication = "native" Then HTTP_Communication_Native = TRUE Else HTTP_Communication_Native = FALSE
        If HTTP_Enabled Then SetCaption ServerPingLB, "HTTP ping" Else HTTP_Enabled = FALSE ' HTTP

        ' Automatically open obs-websocket-http if it's located in the same folder
        If HTTP_Enabled And HTTP_Auto_Open <> "false" Then
            If _FileExists(config_dir + "\obs-websocket-http-v1-Windows.exe") Then HTTP_File = config_dir + "\obs-websocket-http-v1-Windows.exe": HTTP_Filename = "obs-websocket-http-v1-Windows.exe"
            If _FileExists(config_dir + "\obs-websocket-http-v2-Windows.exe") Then HTTP_File = config_dir + "\obs-websocket-http-v2-Windows.exe": HTTP_Filename = "obs-websocket-http-v2-Windows.exe"
            If _FileExists(config_dir + "\obs-websocket-http-Windows.exe") Then HTTP_File = config_dir + "\obs-websocket-http-Windows.exe": HTTP_Filename = "obs-websocket-http-Windows.exe"
            If _FileExists(config_dir + "\obs-websocket-http.exe") Then HTTP_File = config_dir + "\obs-websocket-http.exe": HTTP_Filename = "obs-websocket-http.exe"
            ' Automatically open obs-websocket-http
            If OS = "WINDOWS" And _FileExists(HTTP_File) Then
                If _DirExists(config_dir) And VerPortable = "false" Then ChDir config_dir ' obs-websocket-http cannot read program's "config.ini" unless started from its directory
                Shell "%ComSpec% /C START " + c34 + c34 + " /MIN " + "taskkill /IM " + c34 + HTTP_Filename + c34 + " /F"
                If FastStart <> "true" Then _Delay 1 Else _Delay .5
                Shell _DontWait "%ComSpec% /C START " + c34 + c34 + " /MIN " + c34 + HTTP_File
                'If HTTP_Auth_Key = "" Then Shell _DontWait "%ComSpec% /C START " + c34 + c34 + " /MIN " + c34 + HTTP_File + c34 + " --ws_url ws://" + OBS_URL + " --ws_password " + OBS_PW Else Shell _DontWait "%ComSpec% /C START " + c34 + c34 + " /MIN " + c34 + HTTP_File + c34 + " --ws_url ws://" + OBS_URL + " --ws_password " + OBS_PW + " --http_auth_key " + HTTP_Auth_Key
            End If
        End If

        If Not HTTP_Enabled Then

            ' Test #1
            If ErrorTestRunOnce Then
                If Not _DirExists(nodejs_dir) Then
                    Error_msg = "- Folder " + c34 + nodejs_dir + c34 + " cannot be accessed, check if it exists."
                    ErrorDisplay (1)
                End If
            End If

            ' Test #3
            If ErrorTestRunOnce Then
                ' Set OS variables
                Select Case OS
                    Case "WINDOWS"
                        If Not _DirExists(nodejs_dir + "\node_modules\obs-websocket-js") And Not _DirExists(nodejs_dir + "\obs-websocket-js") Then
                            Error_msg = "- " + c34 + "obs-websocket-js" + c34 + " not found, check if it exists in " + c34 + "\js\node_modules\obs-websocket-js" + c34 + " folder." + Chr$(10) + "- Install node.js from https://nodejs.org/ and then run " + c34 + "install.cmd" + c34 + " in the " + c34 + "Documents\Loopy SRT Monitor" + c34 + " folder."
                            ErrorDisplay (3)
                        End If
                    Case "LINUX"
                        If Not _DirExists(nodejs_dir + "/node_modules/obs-websocket-js") And Not _DirExists(nodejs_dir + "/obs-websocket-js") Then
                            Error_msg = "- " + c34 + "obs-websocket-js" + c34 + " not found, check if it exists in " + c34 + "/js/node_modules/obs-websocket-js" + c34 + " folder." + Chr$(10) + "- Install node.js from Terminal."
                            ErrorDisplay (3)
                        End If
                End Select
            End If

        End If

        ' Check for missing variables
        Select Case ""
            Case Scene_OK: SettingsMissing = TRUE
            Case Scene_Fail: SettingsMissing = TRUE
            Case Scene_Intro: SettingsMissing = TRUE
            Case Scene_Bypass: SettingsMissing = TRUE
            Case OBS_URL: SettingsMissing = TRUE
            Case OBS_PW: SettingsMissing = TRUE
            Case FileStatusOutput: SettingsMissing = TRUE
            Case ConnectionsLog_Check: SettingsMissing = TRUE
            Case Scene_LBR_Enabled: SettingsMissing = TRUE
            Case Scene_LBR_Delay_Total: SettingsMissing = TRUE
            Case Scene2_LBR_Disabled: SettingsMissing = TRUE
            Case RIST_Fail_Mode_1: SettingsMissing = TRUE ' RIST mode
            Case RIST_Fail_Mode_2: SettingsMissing = TRUE ' RIST mode - Source 2
            Case LoopySRTMonitorTheme: SettingsMissing = TRUE
            Case Allow_Resize: SettingsMissing = TRUE
            Case CheckUpdateOnStartup: SettingsMissing = TRUE
            Case MultiCameraSwitch: SettingsMissing = TRUE
            Case titleScene1: SettingsMissing = TRUE
            Case titleScene2: SettingsMissing = TRUE
            Case titleScene12: SettingsMissing = TRUE
            Case returnPreviousScene: SettingsMissing = TRUE
            Case returnPreviousSceneRemember: SettingsMissing = TRUE
            Case SLS_1_Enabled: SettingsMissing = TRUE ' SRT Live Server
            Case SLS_2_Enabled: SettingsMissing = TRUE
            Case SLS_Server_IP: SettingsMissing = TRUE
            Case SLS_Server_Port: SettingsMissing = TRUE
            Case SLS_Stats: SettingsMissing = TRUE
            Case SLS_Publisher1: SettingsMissing = TRUE
            Case SLS_Publisher2: SettingsMissing = TRUE
            Case Str$(SLS_BitrateLow1): SettingsMissing = TRUE
            Case Str$(SLS_BitrateLow2): SettingsMissing = TRUE
            Case Str$(SLS_BitrateFail1): SettingsMissing = TRUE
            Case Str$(SLS_BitrateFail2): SettingsMissing = TRUE
        End Select

        If SettingsMissing Then
            verCheck$ = "Settings missing in 'config.ini' file, check 'readme.txt'..."
            iniFeatures = TRUE
        End If

        If Scene_Bypass = "" Then Scene_Bypass = "none"
        If Scene_Bypass_2 = "" Then Scene_Bypass_2 = "none"
        If Scene_Bypass_3 = "" Then Scene_Bypass_3 = "none"
        If Scene_Bypass_4 = "" Then Scene_Bypass_4 = "none"
        If Scene_Bypass_5 = "" Then Scene_Bypass_5 = "none"
        If Scene_Bypass_6 = "" Then Scene_Bypass_6 = "none"
        If Scene_Bypass_7 = "" Then Scene_Bypass_7 = "none"
        If Scene_Bypass_8 = "" Then Scene_Bypass_8 = "none"
        If Scene_Bypass_9 = "" Then Scene_Bypass_9 = "none"

        If RIST_Fail_Mode_1 = "true" Then __RIST_Fail_Mode_1 = TRUE Else __RIST_Fail_Mode_1 = FALSE
        If RIST_Fail_Mode_2 = "true" Then __RIST_Fail_Mode_2 = TRUE Else __RIST_Fail_Mode_2 = FALSE

        If Leading_Zero = "true" Then leadingZero = TRUE
        If SLS_Kbps_Precision = "true" Then SLS_Kbps_Precision = "nerd"

        If SLS_Server_KeepAlive1 <> 0 Then
            If SLS_Server_KeepAlive1 < 1 Then SLS_Server_KeepAlive1 = 1
            If SLS_Server_KeepAlive1 > 60 Then SLS_Server_KeepAlive1 = 60
        End If
        If SLS_Server_KeepAlive2 <> 0 Then
            If SLS_Server_KeepAlive2 < 1 Then SLS_Server_KeepAlive2 = 1
            If SLS_Server_KeepAlive2 > 60 Then SLS_Server_KeepAlive2 = 60
        End If

        If RTMP_Server_KeepAlive <> 0 Then
            If RTMP_Server_KeepAlive < 1 Then RTMP_Server_KeepAlive = 1
            If RTMP_Server_KeepAlive > 60 Then RTMP_Server_KeepAlive = 60
        End If

        If RESTREAMER_Server_KeepAlive <> 0 Then
            If SLS_Server_KeepAlive1 < 1 Then SLS_Server_KeepAlive1 = 1
            If SLS_Server_KeepAlive1 > 60 Then SLS_Server_KeepAlive1 = 60
        End If

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

        ' SLS IP #2 will cause an error if values are empty
        If SLS_Server_IP_2 = "" Then SLS_Server_IP_2 = SLS_Server_IP
        If SLS_Server_Port_2 = "" Then SLS_Server_Port_2 = SLS_Server_Port
        If SLS_Stats_2 = "" Then SLS_Stats_2 = SLS_Stats

        ' SLS 2nd IP
        If MultiCameraSwitch = "true" And SLS_2_Enabled = "true" Then
            If SLS_Server_IP <> SLS_Server_IP_2 Then SLS_2_Active = TRUE
            If SLS_Server_Port <> SLS_Server_Port_2 Then SLS_2_Active = TRUE
        End If

        If MultiCameraSwitch = "true" And SLS_2_Enabled = "true" And SLS_1_Enabled = "false" Then SLS_2_Active = TRUE ' Fix when using SLS #2 only (v1.1.1)

        If SLS_2_Active And SLS_1_Enabled = "true" Then Stream_Title_1 = "Server" Else Stream_Title_1 = "Stream" ' SLS 2nd IP
        If SLS_2_Active And SLS_2_Enabled = "true" Then Stream_Title_2 = "Server" Else Stream_Title_2 = "Stream" ' SLS 2nd IP

        If Timer_Fail_Stream1 Then SetCaption (Stream1), Stream_Title_1 + " #1" + Server_Display1 + " ": Control(Stream1).ForeColor = RED_FAIL Else SetCaption (Stream1), Stream_Title_1 + " #1" + Server_Display1: Control(Stream1).ForeColor = GREEN_STREAM_OK
        If Timer_Fail_Stream2 Then SetCaption (Stream2), Stream_Title_2 + " #2" + Server_Display2 + " ": Control(Stream2).ForeColor = RED_FAIL Else SetCaption (Stream2), Stream_Title_2 + " #2" + Server_Display2: Control(Stream2).ForeColor = GREEN_STREAM_OK

        ' SLS 2nd IP
        If SLS_2_Active Then
            SLS_Header_2 = ""
            SLS_Header_2 = SLS_Header_2 + "GET /" + SLS_Stats_2 + " HTTP/1.1" + SLS_EOL
            SLS_Header_2 = SLS_Header_2 + "Cache-Control: no-cache" + SLS_EOL
            SLS_Header_2 = SLS_Header_2 + "Pragma: no-cache" + SLS_EOL
            SLS_Header_2 = SLS_Header_2 + "User-Agent: Wget/1.19.1 (linux-gnu)" + SLS_EOL
            SLS_Header_2 = SLS_Header_2 + "Accept: */*" + SLS_EOL
            SLS_Header_2 = SLS_Header_2 + "Accept-Encoding: identity" + SLS_EOL
            SLS_Header_2 = SLS_Header_2 + "Host: " + SLS_Server_IP_2 + ":" + SLS_Server_Port_2 + SLS_EOL
            SLS_Header_2 = SLS_Header_2 + "Connection: Keep-Alive" + SLS_EOL
            SLS_Header_2 = SLS_Header_2 + SLS_EOL

            SLS_Port_Client_2 = "TCP/IP:" + SLS_Server_Port_2 + ":"
        End If

        ' NGINX RTMP Server
        RTMP_Header = ""
        RTMP_Header = RTMP_Header + "GET /" + RTMP_Stats + " HTTP/1.1" + RTMP_EOL
        RTMP_Header = RTMP_Header + "Cache-Control: no-cache" + RTMP_EOL
        RTMP_Header = RTMP_Header + "Pragma: no-cache" + RTMP_EOL
        RTMP_Header = RTMP_Header + "User-Agent: Wget/1.20.3 (mingw32)" + RTMP_EOL
        RTMP_Header = RTMP_Header + "Accept: */*" + RTMP_EOL
        RTMP_Header = RTMP_Header + "Accept-Encoding: identity" + RTMP_EOL
        RTMP_Header = RTMP_Header + "Host: " + RTMP_Server_IP + ":" + RTMP_Server_Port + RTMP_EOL
        RTMP_Header = RTMP_Header + "Connection: Keep-Alive" + RTMP_EOL
        RTMP_Header = RTMP_Header + RTMP_EOL

        RTMP_Port_Client = "TCP/IP:" + RTMP_Server_Port + ":"

        If MultiCameraSwitch = "true" Then
            __MultiCameraSwitch = TRUE
        Else
            MultiCameraSwitch = "false"
            __MultiCameraSwitch = FALSE
        End If

        ' Set true and false
        If SLS_1_Enabled <> "true" Then SLS_1_Enabled = "false"
        If SLS_2_Enabled <> "true" Then SLS_2_Enabled = "false"
        If SLS_1_Enabled = "true" Then RTMP_1_Enabled = "false"
        If SLS_2_Enabled = "true" Then RTMP_2_Enabled = "false"
        If RTMP_1_Enabled <> "true" Then RTMP_1_Enabled = "false"
        If RTMP_2_Enabled <> "true" Then RTMP_2_Enabled = "false"
        If RTMP_1_Enabled = "true" Then SLS_1_Enabled = "false"
        If RTMP_2_Enabled = "true" Then SLS_2_Enabled = "false"

        ' SRT Live Server
        If SLS_1_Enabled = "true" And SLS_2_Enabled = "true" Then RTMP_Active = FALSE: RTMP_1_Enabled = "false": RTMP_2_Enabled = "false": RESTREAMER_1_Enabled = "false": RESTREAMER_2_Enabled = "false"

        ' NGINX RTMP Server
        If RTMP_1_Enabled = "true" And RTMP_2_Enabled = "true" Then SLS_Active = FALSE: SLS_1_Enabled = "false": SLS_2_Enabled = "false"
        If Not __MultiCameraSwitch Then SLS_2_Enabled = "false": RTMP_2_Enabled = "false"
        If SLS_1_Enabled = "true" Or SLS_2_Enabled = "true" Then SLS_Active = TRUE
        If RTMP_1_Enabled = "true" Or RTMP_2_Enabled = "true" Then RTMP_Active = TRUE: RTMP_Kbps_Precision = SLS_Kbps_Precision

        ' RESTREAMER Server
        If RESTREAMER_1_Enabled = "true" And SLS_1_Enabled = "true" Then RESTREAMER_1_Enabled = "false"
        If RESTREAMER_2_Enabled = "true" And SLS_2_Enabled = "true" Then RESTREAMER_2_Enabled = "false"
        If RESTREAMER_1_Enabled = "true" And RTMP_1_Enabled = "true" Then RESTREAMER_1_Enabled = "false"
        If RESTREAMER_2_Enabled = "true" And RTMP_1_Enabled = "true" Then RESTREAMER_2_Enabled = "false"
        If RESTREAMER_1_Enabled = "true" Or RESTREAMER_2_Enabled = "true" Then RESTREAMER_Active = TRUE

        RESTREAMER_Port_Client = "TCP/IP:" + RESTREAMER_Server_Port + ":"

        ' Set SLS, RTMP and RESTREAMER variables
        If SLS_1_Enabled = "true" Then __SLS_1_Enabled = TRUE Else __SLS_1_Enabled = FALSE
        If RTMP_1_Enabled = "true" Then __RTMP_1_Enabled = TRUE Else __RTMP_1_Enabled = FALSE
        If RTMP_2_Enabled = "true" Then __RTMP_2_Enabled = TRUE Else __RTMP_2_Enabled = FALSE
        If SLS_2_Enabled = "true" Then __SLS_2_Enabled = TRUE Else __SLS_2_Enabled = FALSE
        If RESTREAMER_1_Enabled = "true" Then __RESTREAMER_1_Enabled = TRUE Else __RESTREAMER_1_Enabled = FALSE
        If RESTREAMER_2_Enabled = "true" Then __RESTREAMER_2_Enabled = TRUE Else __RESTREAMER_2_Enabled = FALSE

        ' SRT Live Server ---------------------------------------------
        If SLS_Active Then
            SetCaption IPPingLB, "SLS ping" ' Start with displaying "SLS ping" and will change if BELABOX server is detected
            SetCaption Bitrate_Stream_1LB, "-"
            SetCaption Bitrate_Stream_2LB, "-"
        ElseIf RTMP_Active Then
            SetCaption IPPingLB, "NGINX ping"
            SetCaption Bitrate_Stream_1LB, "-"
            SetCaption Bitrate_Stream_2LB, "-"
        ElseIf RESTREAMER_Active Then
            SetCaption IPPingLB, "RESTREAMER ping"
            SetCaption Bitrate_Stream_1LB, "-"
            SetCaption Bitrate_Stream_2LB, "-"
        End If

        If Not __MultiCameraSwitch Then
            If SLS_Active Or RTMP_Active Or RESTREAMER_Active Then
                SetCaption MultiCameraSwitchLB, "Bitrate"
            End If
        End If

        ' Adjust SRT data position because of no bitrate information
        If __MultiCameraSwitch Then

            If __SLS_1_Enabled Or __RTMP_1_Enabled Or __RESTREAMER_1_Enabled Then
                If Not __SLS_2_Enabled And Not __RTMP_2_Enabled And Not __RESTREAMER_2_Enabled Then
                    Control(StreamUptimeLB).Top = 254
                    Control(Uptime_Stream_1LB).Top = 254
                    Control(failLB).Top = 278
                    Control(Timer_Fail_Stream1LB).Top = 278
                    Control(BitrateLB2).Hidden = TRUE
                    Control(Bitrate_Stream_2LB).Hidden = TRUE
                End If
            End If

            If __SLS_2_Enabled Or __RTMP_2_Enabled Or __RESTREAMER_2_Enabled Then
                If Not __SLS_1_Enabled And Not __RTMP_1_Enabled And Not __RESTREAMER_1_Enabled Then
                    Control(StreamUptimeLB2).Top = 254
                    Control(Uptime_Stream_2LB).Top = 254
                    Control(failLB2).Top = 278
                    Control(Timer_Fail_Stream2LB).Top = 278
                    Control(BitrateLB).Hidden = TRUE
                    Control(Bitrate_Stream_1LB).Hidden = TRUE
                End If
            End If

            If __SLS_1_Enabled And __SLS_2_Enabled Or __RTMP_1_Enabled And __RTMP_2_Enabled Or __RESTREAMER_1_Enabled And __RESTREAMER_2_Enabled Or SLS_Active And RTMP_Active Or SLS_Active And RESTREAMER_Active Or RTMP_Active And RESTREAMER_Active Then
                Control(StreamUptimeLB).Top = 254
                Control(Uptime_Stream_1LB).Top = 254
                Control(failLB).Top = 278
                Control(Timer_Fail_Stream1LB).Top = 278
                Control(StreamUptimeLB2).Top = 254
                Control(Uptime_Stream_2LB).Top = 254
                Control(failLB2).Top = 278
                Control(Timer_Fail_Stream2LB).Top = 278
            End If

            If Not SLS_Active And Not RTMP_Active And Not RESTREAMER_Active Then
                Control(BitrateLB).Hidden = TRUE
                Control(Bitrate_Stream_1LB).Hidden = TRUE
                Control(BitrateLB2).Hidden = TRUE
                Control(Bitrate_Stream_2LB).Hidden = TRUE
            End If

        Else

            Control(BitrateLB).Hidden = TRUE
            Control(Bitrate_Stream_1LB).Hidden = TRUE
            Control(BitrateLB2).Hidden = TRUE
            Control(Bitrate_Stream_2LB).Hidden = TRUE

        End If
        ' SRT Live Server ---------------------------------------------

        Scene_LBR = Scene_OK + " LBR"
        _Resize Off , _Smooth
        If Allow_Resize <> "true" Then
            Allow_Resize = "false"
            Control(OptionsMenuRestoreWindowSize).Hidden = TRUE
        Else
            ' Resize will be enabled regardless
            $Resize:Smooth
        End If

        ' Set variables for low bitrate detection
        CooldownStartup = 10
        If ConnectionsLog_Check = "true" Then ConnectionsLog = TRUE Else ConnectionsLog = FALSE
        If PingLog <> "true" Then PingLog = "false": If Not ConnectionsLog Then PingLog = "false"
        CooldownLogTotal = 8
        MediaSourceTimeLB = 800
        LBR_Delay_Total = Val(Scene_LBR_Delay_Total)
        If LBR_Delay_Total < 0 Then LBR_Delay_Total = 0
        If LBR_Delay_Total > 10 Then LBR_Delay_Total = 10

        ' UNDOCUMENTED
        If MediaSourceTime <> "" Then MediaSourceTimeLB = Val(MediaSourceTime)
        If CooldownTotal <> "" Then CooldownLogTotal = Val(CooldownTotal)
        If MediaSourceTimeLB < 100 Then MediaSourceTimeLB = 100
        If MediaSourceTimeLB > 950 Then MediaSourceTimeLB = 950
        If CooldownLogTotal < 3 Then CooldownLogTotal = 3
        If CooldownLogTotal > 15 Then CooldownLogTotal = 15

        ' Set theme if selected
        If InStr(Command$, "-light") = 0 Then
            LoopySRTMonitorTheme = LCase$(LoopySRTMonitorTheme)
            If LoopySRTMonitorTheme = "obs" Or LoopySRTMonitorTheme = "yami" Or LoopySRTMonitorTheme = "acri1" Or LoopySRTMonitorTheme = "acri2" Or LoopySRTMonitorTheme = "rachni" Or LoopySRTMonitorTheme = "grey" Or LoopySRTMonitorTheme = "gray" Then
                Select Case LoopySRTMonitorTheme
                    Case "obs"
                        Theme_C1 = _RGB32(58, 57, 58)
                        Theme_C2 = _RGB32(31, 30, 31)
                    Case "yami"
                        Theme_C1 = _RGB32(43, 46, 56)
                        Theme_C2 = _RGB32(31, 33, 42)
                    Case "grey"
                        Theme_C1 = _RGB32(47, 47, 47)
                        Theme_C2 = _RGB32(33, 33, 33)
                    Case "gray"
                        Theme_C1 = _RGB32(47, 47, 47)
                        Theme_C2 = _RGB32(33, 33, 33)
                    Case "acri1"
                        Theme_C1 = _RGB32(24, 24, 25)
                        Theme_C2 = _RGB32(24, 24, 25)
                    Case "acri2"
                        Theme_C1 = _RGB32(24, 24, 25)
                        Theme_C2 = _RGB32(19, 26, 48)
                    Case "rachni"
                        Theme_C1 = _RGB32(49, 54, 59)
                        Theme_C2 = _RGB32(35, 38, 41)
                End Select
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
            End If
        End If

        ' Set OS variables
        Select Case OS
            Case "WINDOWS"
                CMD_EXE = "%ComSpec% /C node.exe "
                CMD_EXE_FAST = "node.exe "
                CMD_EXE_HTTP = "%ComSpec% /C curl.exe -s -XPOST -H " + c34 + "Authorization: " + HTTP_Auth_Key + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " "
                CMD_EXE_HTTP_FAST = "curl.exe -s -XPOST -H " + c34 + "Authorization: " + HTTP_Auth_Key + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " "
            Case "LINUX"
                CMD_EXE = "node "
                CMD_EXE_FAST = "node "
                CMD_EXE_HTTP = "curl -s -XPOST -H " + c34 + "Authorization: " + OBS_PW + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " "
                CMD_EXE_HTTP_FAST = "curl -s -XPOST -H " + c34 + "Authorization: " + OBS_PW + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " "
        End Select
        ' HTTP for all OS's
        CMD_EXE_HTTP_FAST_GET_SCENE = CMD_EXE_HTTP_FAST + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetCurrentProgramScene" + c34 + " -o " + c34 + filePrevious + c34
        CMD_EXE_HTTP_FAST_GET_MEDIA1 = CMD_EXE_HTTP_FAST + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + MediaSource1 + "\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " -o " + c34 + filePrevious_ms + c34
        CMD_EXE_HTTP_GET_SCENE = CMD_EXE_HTTP + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetCurrentProgramScene" + c34 + " -o " + c34 + filePrevious + c34
        CMD_EXE_HTTP_GET_MEDIA2 = CMD_EXE_HTTP + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + MediaSource1 + "\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " > " + c34 + filePrevious_ms + c34 + " && curl -s -XPOST -H " + c34 + "Authorization: " + OBS_PW + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " -d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + MediaSource2 + "\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " >> " + c34 + filePrevious_ms + c34
        If OS = "WINDOWS" And Not HTTP_Communication_Native Then
            Open http_media2_File For Output As #192
            Print #192, "@" + CMD_EXE_HTTP_FAST + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + MediaSource1 + "\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " > " + c34 + filePrevious_ms + c34 + " && curl -s -XPOST -H " + c34 + "Authorization: " + OBS_PW + c34 + " -H " + c34 + "Content-type: application/json" + c34 + " -d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + MediaSource2 + "\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " >> " + c34 + filePrevious_ms + c34
            Close #192
        End If

        CooldownLog = CooldownLogTotal

        ' Used for LBR and ReturnPreviousSceneRemember=false
        titleScene1Temp = titleScene1
        titleScene2Temp = titleScene2
        titleScene12Temp = titleScene12

        If Desktop_Width_Position < -(_DesktopWidth * 4) Then Desktop_Width_Position = -(_DesktopWidth * 4)
        If Desktop_Width_Position > (_DesktopWidth * 4) Then Desktop_Width_Position = (_DesktopWidth * 4)
        If Desktop_Width_Position < -9999 Then Desktop_Width_Position = -9999

        If Desktop_Height_Position < -(_DesktopHeight * 4) Then Desktop_Height_Position = -(_DesktopHeight * 4)
        If Desktop_Height_Position > (_DesktopHeight * 4) Then Desktop_Height_Position = (_DesktopHeight * 4)
        If Desktop_Height_Position < -9999 Then Desktop_Height_Position = -9999

        If Desktop_Width_Position < -9999 And Desktop_Height_Position = -9999 Then
        Else
            If Desktop_Width_Position = -1 And Desktop_Height_Position = -1 Then _ScreenMove _Middle Else _ScreenMove Desktop_Width_Position, Desktop_Height_Position
        End If
    End If
    ' Delay program if using HTTP to allow time for HTTP to connect to OBS WebSocket
    If FastStart <> "true" Then
        If OS = "WINDOWS" And _FileExists(HTTP_File) Then
            _Delay 1.5
            For http_Delay = 0 To 250000000
            Next
        End If
    End If

    If returnPreviousScene = "true" Then __returnPreviousScene = TRUE Else __returnPreviousScene = FALSE
    If FileStatusOutput = "true" Then __FileStatusOutput = TRUE Else __FileStatusOutput = FALSE
    If returnPreviousSceneRemember = "true" Then __returnPreviousSceneRemember = TRUE Else __returnPreviousSceneRemember = FALSE
    If Not __MultiCameraSwitch Then __returnPreviousScene = FALSE: __returnPreviousSceneRemember = FALSE ' multi-camera-switch options disabled if not required

    ' LBR enabled if required
    If Scene_LBR_Enabled = "true" Then SceneLBActive = TRUE
    ' Disable Scene #2 LBR if Scene2LBRDisabled is true
    If Scene2_LBR_Disabled = "true" Then Scene2LBInactive = TRUE

    If Not SceneLBActive Then
        If Stream_Fail_Delay < 3 Then
            Stream_Fail_Delay = 3
        ElseIf Stream_Fail_Delay > 99 Then Stream_Fail_Delay = 99
        End If
    Else
        If Stream_Fail_Delay < 5 And __returnPreviousScene Then
            Stream_Fail_Delay = 5
        ElseIf Stream_Fail_Delay > 99 Then Stream_Fail_Delay = 99
        End If
    End If

    If Not HTTP_Enabled Then If Not _DirExists(nodejs_dir) Then Error_msg = "- Folder " + c34 + nodejs_dir + c34 + " cannot be accessed, check if it exists. (Error: #2)"
    ' ErrorDisplay
    If Error_msg <> "" Then
        _Delay 1
        Cls , _RGB(1, 100, 200)
        BSOD& = __imageMEM&("face_sad_x.png")
        _PutImage (25, 46)-(82, 158), BSOD&
        _FreeImage BSOD&
        Color _RGB(254, 254, 254), _RGB(1, 100, 200)
        _PrintString (20, 12 * 18), "Program encountered an error and needs to restart."
        If InStr(Error_msg, Chr$(10)) >= 1 Then
            _PrintString (20, 14 * 18), Left$(Error_msg, InStr(Error_msg, Chr$(10)) - 1)
            _PrintString (20, 15 * 18), Mid$(Error_msg, InStr(Error_msg, Chr$(10)) + 1)
        Else
            _PrintString (20, 14 * 18), Error_msg
        End If
        _PrintString (20, 20 * 18), "Program will exit shortly or press any key to exit now..."
        _Display
        _Delay 1
        If InKey$ <> "" Then System
        _Delay 1
        If InKey$ <> "" Then System
        _Delay 3
        If InKey$ <> "" Then System
        _Delay 3
        If InKey$ <> "" Then System
        _Delay 5
        If InKey$ <> "" Then System
        _Delay 5
        System
    End If

    If HTTP_Enabled Then ' HTTP
        shell_cmd_1 = CMD_EXE_HTTP_FAST + "-d " + c34 + "{\" + c34 + "sceneName\" + c34 + ": \" + c34
        shell_cmd_2 = "\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/emit/SetCurrentProgramScene" + c34
    Else
        shell_cmd_1 = CMD_EXE + c34 + obs_change_scene + c34 + " "
        shell_cmd_2 = ""
    End If

    On Error GoTo App_Fail
    If __FileStatusOutput Then
        Open outputKbpsFile1 For Output As #200
        Print #200, "0"
        Close 200
        Open outputKbpsFile2 For Output As #204
        Print #204, "0"
        Close 204
    End If
    On Error GoTo 0

    If Not HTTP_Enabled Then

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
        Open obs_change_scene For Output As #64
        Print #64, "// This file has been automatically generated"
        Print #64, "// Any changes made will be lost"
        Print #64, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #64, ""
        Print #64, "const OBSWebSocket = require('obs-websocket-js');"
        Print #64, "const obs = new OBSWebSocket();"
        Print #64, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        Print #64, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        Print #64, "var timer1 = setTimeout(function() { obs.disconnect(); }, 3000);"
        Print #64, "var sceneName_1 = process.argv[2];"
        Print #64, "var sceneName_2 = process.argv[3];"
        Print #64, "var sceneName_3 = process.argv[4];"
        Print #64, "var sceneName_4 = process.argv[5];"
        Print #64, "var sceneName_5 = process.argv[6];"
        Print #64, "var sceneName_6 = process.argv[7];"
        Print #64, "var sceneName_7 = process.argv[8];"
        Print #64, "var sceneName_8 = process.argv[9];"
        Print #64, "if (sceneName_2 === undefined) { var sceneName_2 = '' } else { var sceneName_1 = sceneName_1 + " + c34 + " " + c34 + " }"
        Print #64, "if (sceneName_3 === undefined) { var sceneName_3 = '' } else { var sceneName_2 = sceneName_2 + " + c34 + " " + c34 + " }"
        Print #64, "if (sceneName_4 === undefined) { var sceneName_4 = '' } else { var sceneName_3 = sceneName_3 + " + c34 + " " + c34 + " }"
        Print #64, "if (sceneName_5 === undefined) { var sceneName_5 = '' } else { var sceneName_4 = sceneName_4 + " + c34 + " " + c34 + " }"
        Print #64, "if (sceneName_6 === undefined) { var sceneName_6 = '' } else { var sceneName_5 = sceneName_5 + " + c34 + " " + c34 + " }"
        Print #64, "if (sceneName_7 === undefined) { var sceneName_7 = '' } else { var sceneName_6 = sceneName_6 + " + c34 + " " + c34 + " }"
        Print #64, "if (sceneName_8 === undefined) { var sceneName_8 = '' } else { var sceneName_7 = sceneName_7 + " + c34 + " " + c34 + " }"
        Print #64, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        Print #64, ".then(() => { return obs.send('GetSceneList'); })"
        Print #64, ".then(data => { data.scenes.forEach(scene => {"
        Print #64, "        if (scene.name !== data.currentScene) {"
        Print #64, "            obs.send('SetCurrentScene', {"
        Print #64, "                'scene-name': sceneName_1 + sceneName_2 + sceneName_3 + sceneName_4 + sceneName_5 + sceneName_6 + sceneName_7 + sceneName_8"
        Print #64, "            });"
        Print #64, "        }"
        Print #64, "    });"
        Print #64, "})"
        Print #64, ".then(() => { obs.disconnect(); clearTimeout(timer1); });"
        Close #64

        Open obs_get_scene For Output As #72
        Print #72, "// This file has been automatically generated"
        Print #72, "// Any changes made will be lost"
        Print #72, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #72, ""
        Print #72, "const fs = require('fs');"
        Print #72, "const OBSWebSocket = require('obs-websocket-js');"
        Print #72, "const obs = new OBSWebSocket();"
        Print #72, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        Print #72, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        Print #72, "var timer2 = setTimeout(function() { obs.disconnect(); }, 3000);"
        Print #72, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        Print #72, ".then(() => { return obs.send('GetCurrentScene'); })"
        Print #72, ".then(name => { //console.log(`${name.name}`);"
        Print #72, "fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.name}`, function (err) {"
        Print #72, "    if (err) return console.log(err);"
        Print #72, "}); })"
        Print #72, ".then(() => { obs.disconnect(); clearTimeout(timer2); });"
        Close #72

        Open obs_get_media1 For Output As #76
        Print #76, "// This file has been automatically generated"
        Print #76, "// Any changes made will be lost"
        Print #76, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #76, ""
        Print #76, "const fs = require('fs');"
        Print #76, "const OBSWebSocket = require('obs-websocket-js');"
        Print #76, "const obs = new OBSWebSocket();"
        Print #76, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        Print #76, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        Print #76, "var timer3 = setTimeout(function() { obs.disconnect(); }, 3000);"
        Print #76, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        Print #76, ".then(() => {"
        Print #76, "        return obs.send('GetMediaTime', {"
        Print #76, "                  'sourceName': " + c34 + MediaSource1 + c34
        Print #76, "        })"
        Print #76, "    })"
        Print #76, ".then((data) => {"
        Print #76, "    //console.log(`${data.timestamp}`);"
        Print #76, "    fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", `${data.timestamp}`, function (err) {"
        Print #76, "        if (err) return console.log(err);"
        Print #76, "    })"
        Print #76, "})"
        Print #76, ".then(() => { obs.disconnect(); clearTimeout(timer3); });"
        Close #76

        Open obs_get_media2 For Output As #80
        Print #80, "// This file has been automatically generated"
        Print #80, "// Any changes made will be lost"
        Print #80, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #80, ""
        Print #80, "const fs = require('fs');"
        Print #80, "const OBSWebSocket = require('obs-websocket-js');"
        Print #80, "const obs = new OBSWebSocket();"
        Print #80, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        Print #80, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        Print #80, "var timer4 = setTimeout(function() { obs.disconnect(); }, 3000);"
        Print #80, "var media2;"
        Print #80, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        Print #80, ".then(() => {"
        Print #80, "        return obs.send('GetMediaTime', {"
        Print #80, "                  'sourceName': " + c34 + MediaSource1 + c34
        Print #80, "        })"
        Print #80, "    })"
        Print #80, ".then((data) => {"
        Print #80, "    //console.log(`${data.timestamp}`);"
        Print #80, "    media2 = `${data.timestamp}`;"
        Print #80, "})"
        Print #80, ".then(() => {"
        Print #80, "        return obs.send('GetMediaTime', {"
        Print #80, "                  'sourceName': " + c34 + MediaSource2 + c34
        Print #80, "        })"
        Print #80, "})"
        Print #80, ".then((data) => {"
        Print #80, "    //console.log(`${data.timestamp}`);"
        Print #80, "    media2 = media2 + " + c34 + "\n" + c34 + " + `${data.timestamp}`;"
        Print #80, "    fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", media2, function (err) {"
        Print #80, "        if (err) return console.log(err);"
        Print #80, "    })"
        Print #80, "})"
        Print #80, ".then(() => { obs.disconnect(); clearTimeout(timer4); });"
        Close #80

        Open obs_check_websocket For Output As #82
        Print #82, "// This file has been automatically generated"
        Print #82, "// Any changes made will be lost"
        Print #82, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #82, ""
        Print #82, "const OBSWebSocket = require('obs-websocket-js');"
        Print #82, "const obs = new OBSWebSocket();"
        Print #82, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        Print #82, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        Print #82, "var timer5 = setTimeout(function() { obs.disconnect(); }, 3000);"
        Print #82, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        Print #82, ".then(() => { return obs.send('GetVersion'); })"
        Print #82, ".then(name => {"
        Print #82, "    console.log(`OK`);"
        Print #82, "    console.log(`${name.obsWebsocketVersion}`);"
        Print #82, "})"
        Print #82, ".then(() => { obs.disconnect(); clearTimeout(timer5); });"
        Close #82

        Open obs_get_scene_list For Output As #84
        Print #84, "// This file has been automatically generated"
        Print #84, "// Any changes made will be lost"
        Print #84, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #84, ""
        Print #84, "const OBSWebSocket = require('obs-websocket-js');"
        Print #84, "const obs = new OBSWebSocket();"
        Print #84, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        Print #84, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        Print #84, "var timer6 = setTimeout(function() { obs.disconnect(); }, 3000);"
        Print #84, "obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        Print #84, ".then(() => { return obs.send('GetCurrentScene'); })"
        Print #84, ".then(name => { console.log(`${name.name}`); })"
        Print #84, ".then(() => { return obs.send('GetSceneList'); })"
        Print #84, ".then(data => {"
        Print #84, "    data.scenes.forEach(scene => {"
        Print #84, "        if (scene.name !== data.currentScene) {"
        Print #84, "            console.log(`${scene.name}`);"
        Print #84, "        }"
        Print #84, "    });"
        Print #84, "})"
        Print #84, ".then(() => { obs.disconnect(); clearTimeout(timer6); });"
        Close #84

        Open obs_get_media1_scene For Output As #86
        Print #86, "// This file has been automatically generated"
        Print #86, "// Any changes made will be lost"
        Print #86, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #86, ""
        Print #86, "const fs = require('fs');"
        Print #86, "const OBSWebSocket = require('obs-websocket-js');"
        Print #86, "const obs = new OBSWebSocket();"
        Print #86, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        Print #86, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        Print #86, "var myTimerFunction;"
        Print #86, "var myTimerConnect;"
        Print #86, ""
        Print #86, "repeatConnect();"
        Print #86, ""
        Print #86, "async function repeatConnect() {"
        Print #86, "    console.log(`Connecting...`);"
        Print #86, "    obs.disconnect();"
        Print #86, ""
        Print #86, "    obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        Print #86, "    .then(() => {"
        Print #86, "        console.log(`OK`);"
        Print #86, "        clearInterval(myTimerConnect);"
        Print #86, "        clearTimeout(myTimerConnect);"
        Print #86, "        myTimerFunction = setInterval(repeatFunction, 1000);"
        Print #86, "    })"
        Print #86, "}"
        Print #86, ""
        Print #86, "async function repeatFunction() {"
        Print #86, "    console.clear();"
        Print #86, "    return obs.send('GetMediaTime', {"
        Print #86, "        'sourceName': " + c34 + MediaSource1 + c34
        Print #86, "    })"
        Print #86, "    .then((data) => {"
        Print #86, "        fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", `${data.timestamp}`, function (err) {"
        Print #86, "            if (err) return console.log(err);"
        Print #86, "            console.log(`${data.timestamp}`);"
        Print #86, "        });"
        Print #86, "    })"
        Print #86, "    .then(() => { return obs.send('GetCurrentScene'); })"
        Print #86, "    .then(name => {"
        Print #86, "        fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.name}`, function (err) {"
        Print #86, "            if (err) return console.log(err);"
        Print #86, "            console.log(`${name.name}`);"
        Print #86, "        })"
        Print #86, "    })"
        Print #86, "    .then((data) => {"
        Print #86, "        clearInterval(myTimerConnect);"
        Print #86, "        clearTimeout(myTimerConnect);"
        Print #86, "    })"
        Print #86, "}"
        Print #86, ""
        Print #86, "process.on('uncaughtException', function (err) {"
        Print #86, "    console.log(`Error`, err);"
        Print #86, "    obs.disconnect();"
        Print #86, "    clearInterval(myTimerFunction);"
        Print #86, "    clearTimeout(myTimerFunction);"
        Print #86, "    clearInterval(myTimerConnect);"
        Print #86, "    clearTimeout(myTimerConnect);"
        Print #86, "    myTimerConnect = setTimeout(repeatConnect, 2000);"
        Print #86, "});"
        Close #86

        Open obs_get_media2_scene For Output As #88
        Print #88, "// This file has been automatically generated"
        Print #88, "// Any changes made will be lost"
        Print #88, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #88, ""
        Print #88, "const fs = require('fs');"
        Print #88, "const OBSWebSocket = require('obs-websocket-js');"
        Print #88, "const obs = new OBSWebSocket();"
        Print #88, "const WebsocketAddress = " + c34 + OBS_URL + c34 + ";"
        Print #88, "const WebsocketPassword = " + c34 + OBS_PW + c34 + ";"
        Print #88, "var myTimerFunction;"
        Print #88, "var myTimerConnect;"
        Print #88, "var dataStream1;"
        Print #88, "var dataStream2;"
        Print #88, ""
        Print #88, "repeatConnect();"
        Print #88, ""
        Print #88, "async function repeatConnect() {"
        Print #88, "    console.log(`Connecting...`);"
        Print #88, "    obs.disconnect();"
        Print #88, ""
        Print #88, "    obs.connect({ address: WebsocketAddress, password: WebsocketPassword })"
        Print #88, "    .then(() => {"
        Print #88, "        console.log(`OK`);"
        Print #88, "        clearInterval(myTimerConnect);"
        Print #88, "        clearTimeout(myTimerConnect);"
        Print #88, "        myTimerFunction = setInterval(repeatFunction, 1000);"
        Print #88, "    })"
        Print #88, "}"
        Print #88, ""
        Print #88, "async function repeatFunction() {"
        Print #88, "    console.clear();"
        Print #88, "    return obs.send('GetMediaTime', {"
        Print #88, "        'sourceName': " + c34 + MediaSource1 + c34
        Print #88, "    })"
        Print #88, "    .then((data) => {"
        Print #88, "        dataStream1 = `${data.timestamp}` + '\n';"
        Print #88, "        console.log(`${data.timestamp}`);"
        Print #88, "    })"
        Print #88, "    .then(() => {"
        Print #88, "        return obs.send('GetMediaTime', {"
        Print #88, "            'sourceName': " + c34 + MediaSource2 + c34
        Print #88, "        })"
        Print #88, "    })"
        Print #88, "    .then((data) => {"
        Print #88, "        dataStream2 = dataStream1 + `${data.timestamp}`"
        Print #88, "        fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", dataStream2, function (err) {"
        Print #88, "            if (err) return console.log(err);"
        Print #88, "            console.log(`${data.timestamp}`);"
        Print #88, "        });"
        Print #88, "    })"
        Print #88, "    .then(() => { return obs.send('GetCurrentScene'); })"
        Print #88, "    .then(name => {"
        Print #88, "        fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.name}`, function (err) {"
        Print #88, "            if (err) return console.log(err);"
        Print #88, "            console.log(`${name.name}`);"
        Print #88, "        })"
        Print #88, "    })"
        Print #88, "    .then((data) => {"
        Print #88, "        clearInterval(myTimerConnect);"
        Print #88, "        clearTimeout(myTimerConnect);"
        Print #88, "    })"
        Print #88, "}"
        Print #88, ""
        Print #88, "process.on('uncaughtException', function (err) {"
        Print #88, "    console.log(`Error`, err);"
        Print #88, "    obs.disconnect();"
        Print #88, "    clearInterval(myTimerFunction);"
        Print #88, "    clearTimeout(myTimerFunction);"
        Print #88, "    clearInterval(myTimerConnect);"
        Print #88, "    clearTimeout(myTimerConnect);"
        Print #88, "    myTimerConnect = setTimeout(repeatConnect, 2000);"
        Print #88, "});"
        Close #88

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
        Open obs_change_scene For Output As #164
        Print #164, "// This file has been automatically generated"
        Print #164, "// Any changes made will be lost"
        Print #164, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #164, ""
        Print #164, "import OBSWebSocket from 'obs-websocket-js/json'"
        Print #164, "var timer1 = setTimeout(function() { obs.disconnect(); }, 2000);"
        Print #164, "var sceneName_1 = process.argv[2];"
        Print #164, "var sceneName_2 = process.argv[3];"
        Print #164, "var sceneName_3 = process.argv[4];"
        Print #164, "var sceneName_4 = process.argv[5];"
        Print #164, "var sceneName_5 = process.argv[6];"
        Print #164, "var sceneName_6 = process.argv[7];"
        Print #164, "var sceneName_7 = process.argv[8];"
        Print #164, "var sceneName_8 = process.argv[9];"
        Print #164, "if (sceneName_2 === undefined) { var sceneName_2 = '' } else { var sceneName_1 = sceneName_1 + " + c34 + " " + c34 + " }"
        Print #164, "if (sceneName_3 === undefined) { var sceneName_3 = '' } else { var sceneName_2 = sceneName_2 + " + c34 + " " + c34 + " }"
        Print #164, "if (sceneName_4 === undefined) { var sceneName_4 = '' } else { var sceneName_3 = sceneName_3 + " + c34 + " " + c34 + " }"
        Print #164, "if (sceneName_5 === undefined) { var sceneName_5 = '' } else { var sceneName_4 = sceneName_4 + " + c34 + " " + c34 + " }"
        Print #164, "if (sceneName_6 === undefined) { var sceneName_6 = '' } else { var sceneName_5 = sceneName_5 + " + c34 + " " + c34 + " }"
        Print #164, "if (sceneName_7 === undefined) { var sceneName_7 = '' } else { var sceneName_6 = sceneName_6 + " + c34 + " " + c34 + " }"
        Print #164, "if (sceneName_8 === undefined) { var sceneName_8 = '' } else { var sceneName_7 = sceneName_7 + " + c34 + " " + c34 + " }"
        Print #164, "const obs = new OBSWebSocket();"
        Print #164, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        Print #164, ".then(() => { return obs.call('GetSceneList'); })"
        Print #164, ".then(data => { data.scenes.forEach(scene => {"
        Print #164, "        if (scene.sceneName !== data.currentProgramSceneName) {"
        Print #164, "            obs.call('SetCurrentProgramScene', {"
        Print #164, "                'sceneName': sceneName_1 + sceneName_2 + sceneName_3 + sceneName_4 + sceneName_5 + sceneName_6 + sceneName_7 + sceneName_8"
        Print #164, "            });"
        Print #164, "        }"
        Print #164, "    });"
        Print #164, "})"
        Print #164, ".then(() => { obs.disconnect(); clearTimeout(timer1); });"
        Close #164

        Open obs_get_scene For Output As #172
        Print #172, "// This file has been automatically generated"
        Print #172, "// Any changes made will be lost"
        Print #172, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #172, ""
        Print #172, "import * as fs from 'fs';"
        Print #172, "import OBSWebSocket from 'obs-websocket-js/json'"
        Print #172, "var timer2 = setTimeout(function() { obs.disconnect(); }, 2000);"
        Print #172, "const obs = new OBSWebSocket();"
        Print #172, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        Print #172, ".then(() => { return obs.call('GetCurrentProgramScene'); })"
        Print #172, ".then(name => { //console.log(`${name.currentProgramSceneName}`);"
        Print #172, "fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.currentProgramSceneName}`, function (err) {"
        Print #172, "    if (err) return console.log(err);"
        Print #172, "}); })"
        Print #172, ".then(() => { obs.disconnect(); clearTimeout(timer2); });"
        Close #172

        Open obs_get_media1 For Output As #176
        Print #176, "// This file has been automatically generated"
        Print #176, "// Any changes made will be lost"
        Print #176, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #176, ""
        Print #176, "import * as fs from 'fs';"
        Print #176, "import OBSWebSocket from 'obs-websocket-js/json'"
        Print #176, "var timer3 = setTimeout(function() { obs.disconnect(); }, 2000);"
        Print #176, "const obs = new OBSWebSocket();"
        Print #176, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        Print #176, ".then(() => {"
        Print #176, "        return obs.call('GetMediaInputStatus', {"
        Print #176, "                  'inputName': " + c34 + MediaSource1 + c34
        Print #176, "        })"
        Print #176, "    })"
        Print #176, ".then((data) => {"
        Print #176, "    //console.log(`${data.mediaCursor}`);"
        Print #176, "    fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", `${data.mediaCursor}`, function (err) {"
        Print #176, "        if (err) return console.log(err);"
        Print #176, "    })"
        Print #176, "})"
        Print #176, ".then(() => { obs.disconnect(); clearTimeout(timer3); });"
        Close #176

        Open obs_get_media2 For Output As #180
        Print #180, "// This file has been automatically generated"
        Print #180, "// Any changes made will be lost"
        Print #180, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #180, ""
        Print #180, "import * as fs from 'fs';"
        Print #180, "import OBSWebSocket from 'obs-websocket-js/json'"
        Print #180, "var timer4 = setTimeout(function() { obs.disconnect(); }, 2000);"
        Print #180, "var media2;"
        Print #180, "const obs = new OBSWebSocket();"
        Print #180, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        Print #180, ".then(() => {"
        Print #180, "        return obs.call('GetMediaInputStatus', {"
        Print #180, "                  'inputName': " + c34 + MediaSource1 + c34
        Print #180, "        })"
        Print #180, "    })"
        Print #180, ".then((data) => {"
        Print #180, "    //console.log(`${data.mediaCursor}`);"
        Print #180, "    media2 = `${data.mediaCursor}`;"
        Print #180, "})"
        Print #180, ".then(() => {"
        Print #180, "        return obs.call('GetMediaInputStatus', {"
        Print #180, "                  'inputName': " + c34 + MediaSource2 + c34
        Print #180, "        })"
        Print #180, "})"
        Print #180, ".then((data) => {"
        Print #180, "    //console.log(`${data.mediaCursor}`);"
        Print #180, "    media2 = media2 + " + c34 + "\n" + c34 + " + `${data.mediaCursor}`;"
        Print #180, "    fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", media2, function (err) {"
        Print #180, "        if (err) return console.log(err);"
        Print #180, "    })"
        Print #180, "})"
        Print #180, ".then(() => { obs.disconnect(); clearTimeout(timer4); });"
        Close #180

        Open obs_check_websocket For Output As #182
        Print #182, "// This file has been automatically generated"
        Print #182, "// Any changes made will be lost"
        Print #182, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #182, ""
        Print #182, "import OBSWebSocket from 'obs-websocket-js/json'"
        Print #182, "var timer5 = setTimeout(function() { obs.disconnect(); }, 2000);"
        Print #182, "const obs = new OBSWebSocket();"
        Print #182, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        Print #182, ".then(() => { return obs.call('GetVersion'); })"
        Print #182, ".then(name => {"
        Print #182, "    console.log(`OK`);"
        Print #182, "    console.log(`${name.obsWebSocketVersion}`);"
        Print #182, "})"
        Print #182, ".then(() => { obs.disconnect(); clearTimeout(timer5); });"
        Close #182

        Open obs_get_scene_list For Output As #184
        Print #184, "// This file has been automatically generated"
        Print #184, "// Any changes made will be lost"
        Print #184, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #184, ""
        Print #184, "import OBSWebSocket from 'obs-websocket-js/json'"
        Print #184, "var timer6 = setTimeout(function() { obs.disconnect(); }, 2000);"
        Print #184, "const obs = new OBSWebSocket();"
        Print #184, "await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        Print #184, ".then(() => { return obs.call('GetCurrentProgramScene'); })"
        Print #184, ".then(name => { console.log(`${name.currentProgramSceneName}`); })"
        Print #184, ".then(() => { return obs.call('GetSceneList'); })"
        Print #184, ".then(data => {"
        Print #184, "    data.scenes.forEach(scene => {"
        Print #184, "        if (scene.sceneName !== data.currentProgramSceneName) {"
        Print #184, "            console.log(`${scene.sceneName}`);"
        Print #184, "        }"
        Print #184, "    });"
        Print #184, "})"
        Print #184, ".then(() => { obs.disconnect(); clearTimeout(timer6); });"
        Close #184

        Open obs_get_media1_scene For Output As #186
        Print #186, "// This file has been automatically generated"
        Print #186, "// Any changes made will be lost"
        Print #186, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #186, ""
        Print #186, "import * as fs from 'fs';"
        Print #186, "import OBSWebSocket from 'obs-websocket-js/json'"
        Print #186, "const obs = new OBSWebSocket();"
        Print #186, "var myTimerFunction;"
        Print #186, "var myTimerConnect;"
        Print #186, ""
        Print #186, "repeatConnect();"
        Print #186, ""
        Print #186, "async function repeatConnect() {"
        Print #186, "    console.log(`Connecting...`);"
        Print #186, "    obs.disconnect();"
        Print #186, ""
        Print #186, "    await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        Print #186, "    .then(() => {"
        Print #186, "        console.log(`OK`);"
        Print #186, "        clearInterval(myTimerConnect);"
        Print #186, "        clearTimeout(myTimerConnect);"
        Print #186, "        myTimerFunction = setInterval(repeatFunction, 1000);"
        Print #186, "    })"
        Print #186, "}"
        Print #186, ""
        Print #186, "async function repeatFunction() {"
        Print #186, "    console.clear();"
        Print #186, "    return obs.call('GetMediaInputStatus', {"
        Print #186, "        'inputName': " + c34 + MediaSource1 + c34
        Print #186, "    })"
        Print #186, "    .then((data) => {"
        Print #186, "        fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", `${data.mediaCursor}`, function (err) {"
        Print #186, "            if (err) return console.log(err);"
        Print #186, "            console.log(`${data.mediaCursor}`);"
        Print #186, "        });"
        Print #186, "    })"
        Print #186, "    .then(() => { return obs.call('GetCurrentProgramScene'); })"
        Print #186, "    .then(name => {"
        Print #186, "        fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.currentProgramSceneName}`, function (err) {"
        Print #186, "            if (err) return console.log(err);"
        Print #186, "            console.log(`${name.currentProgramSceneName}`);"
        Print #186, "        })"
        Print #186, "    })"
        Print #186, "    .then((data) => {"
        Print #186, "        clearInterval(myTimerConnect);"
        Print #186, "        clearTimeout(myTimerConnect);"
        Print #186, "    })"
        Print #186, "}"
        Print #186, ""
        Print #186, "process.on('uncaughtException', function (err) {"
        Print #186, "    console.log(`Error`, err);"
        Print #186, "    obs.disconnect();"
        Print #186, "    clearInterval(myTimerFunction);"
        Print #186, "    clearTimeout(myTimerFunction);"
        Print #186, "    clearInterval(myTimerConnect);"
        Print #186, "    clearTimeout(myTimerConnect);"
        Print #186, "    myTimerConnect = setTimeout(repeatConnect, 2000);"
        Print #186, "});"
        Close #186

        Open obs_get_media2_scene For Output As #188
        Print #188, "// This file has been automatically generated"
        Print #188, "// Any changes made will be lost"
        Print #188, "// https://github.com/loopy750/SRT-Stats-Monitor"
        Print #188, ""
        Print #188, "import * as fs from 'fs';"
        Print #188, "import OBSWebSocket from 'obs-websocket-js/json'"
        Print #188, "const obs = new OBSWebSocket();"
        Print #188, "var myTimerFunction;"
        Print #188, "var myTimerConnect;"
        Print #188, "var dataStream1;"
        Print #188, "var dataStream2;"
        Print #188, ""
        Print #188, "repeatConnect();"
        Print #188, ""
        Print #188, "async function repeatConnect() {"
        Print #188, "    console.log(`Connecting...`);"
        Print #188, "    obs.disconnect();"
        Print #188, ""
        Print #188, "    await obs.connect('ws://" + OBS_URL + "', '" + OBS_PW + "')"
        Print #188, "    .then(() => {"
        Print #188, "        console.log(`OK`);"
        Print #188, "        clearInterval(myTimerConnect);"
        Print #188, "        clearTimeout(myTimerConnect);"
        Print #188, "        myTimerFunction = setInterval(repeatFunction, 1000);"
        Print #188, "    })"
        Print #188, "}"
        Print #188, ""
        Print #188, "async function repeatFunction() {"
        Print #188, "    console.clear();"
        Print #188, "    return obs.call('GetMediaInputStatus', {"
        Print #188, "        'inputName': " + c34 + MediaSource1 + c34
        Print #188, "    })"
        Print #188, "    .then((data) => {"
        Print #188, "        dataStream1 = `${data.mediaCursor}` + '\n';"
        Print #188, "        console.log(`${data.mediaCursor}`);"
        Print #188, "    })"
        Print #188, "    .then(() => {"
        Print #188, "        return obs.call('GetMediaInputStatus', {"
        Print #188, "            'inputName': " + c34 + MediaSource2 + c34
        Print #188, "        })"
        Print #188, "    })"
        Print #188, "    .then((data) => {"
        Print #188, "        dataStream2 = dataStream1 + `${data.mediaCursor}`"
        Print #188, "        fs.writeFile(" + c34 + filePrevious_ms_fs + c34 + ", dataStream2, function (err) {"
        Print #188, "            if (err) return console.log(err);"
        Print #188, "            console.log(`${data.mediaCursor}`);"
        Print #188, "        });"
        Print #188, "    })"
        Print #188, "    .then(() => { return obs.call('GetCurrentProgramScene'); })"
        Print #188, "    .then(name => {"
        Print #188, "        fs.writeFile(" + c34 + filePrevious_fs + c34 + ", `${name.currentProgramSceneName}`, function (err) {"
        Print #188, "            if (err) return console.log(err);"
        Print #188, "            console.log(`${name.currentProgramSceneName}`);"
        Print #188, "        })"
        Print #188, "    })"
        Print #188, "    .then((data) => {"
        Print #188, "        clearInterval(myTimerConnect);"
        Print #188, "        clearTimeout(myTimerConnect);"
        Print #188, "    })"
        Print #188, "}"
        Print #188, ""
        Print #188, "process.on('uncaughtException', function (err) {"
        Print #188, "    console.log(`Error`, err);"
        Print #188, "    obs.disconnect();"
        Print #188, "    clearInterval(myTimerFunction);"
        Print #188, "    clearTimeout(myTimerFunction);"
        Print #188, "    clearInterval(myTimerConnect);"
        Print #188, "    clearTimeout(myTimerConnect);"
        Print #188, "    myTimerConnect = setTimeout(repeatConnect, 2000);"
        Print #188, "});"
        Close #188

    End If
    If CheckUpdateOnStartup = "true" And Not iniFeatures Then
        file224$ = ""
        updateResult$ = ""
        _Delay 0.05
        ' Set OS variables
        Select Case OS
            Case "WINDOWS"
                Shell _Hide "%ComSpec% /C curl -H " + c34 + "Cache-Control: no-cache" + c34 + " https://raw.githubusercontent.com/loopy750/SRT-Stats-Monitor-Version/master/checkversion.txt > " + c34 + fileCheckVersion + c34 + ""
            Case "LINUX"
                Shell _Hide "curl -H " + c34 + "Cache-Control: no-cache" + c34 + " https://raw.githubusercontent.com/loopy750/SRT-Stats-Monitor-Version/master/checkversion.txt > " + c34 + fileCheckVersion + c34 + ""
        End Select
        _Delay 0.05
        If _FileExists(fileCheckVersion) Then
            Open fileCheckVersion For Input As #224
            Do Until EOF(224)
                If LOF(224) = 0 Then NoKill = TRUE: Exit Do ' Overkill with EOF checking, but just being safe
                If EOF(224) Then Exit Do
                Line Input #224, file224$
            Loop
        End If
        Close #224
        If _FileExists(fileCheckVersion) Then Kill fileCheckVersion
        updateResult$ = file224$
        If file224$ <> Ver Then verCheck$ = "New version is available (v" + _Trim$(Left$(updateResult$, 10)) + ")": _NotifyPopup "Loopy SRT Monitor", "New version is available (v" + _Trim$(Left$(updateResult$, 10)) + ")", "info"
        If file224$ = "" Or file224$ = "404: Not Found" Then verCheck$ = "Unable to check for new version..."
        If file224$ = Ver Then verCheck$ = "This is the latest version (v" + _Trim$(Left$(Ver, 10)) + ")..."
    End If
    iniFeatures = FALSE

    ' Test #4
    If ErrorTestRunOnce Then
        If Not __MultiCameraSwitch Then
            If Scene_OK = "" Or Scene_Fail = "" Or Scene_Intro = "" Then
                Error_msg = "- Scene names in " + c34 + "config.ini" + c34 + " are empty. Configure to match OBS scene names."
                ErrorDisplay (4)
            End If
        End If
    End If

    ' Test #5
    If ErrorTestRunOnce Then
        If __MultiCameraSwitch Then
            If titleScene1 = "" Or titleScene2 = "" Or titleScene12 = "" Then
                _Delay 1
                Error_msg = "- Scene names in " + c34 + "config.ini" + c34 + " are empty. Configure to match OBS scene names."
                ErrorDisplay (5)
            End If
        End If
    End If

    ' Test #6
    If ErrorTestRunOnce Then

        If HTTP_Enabled Then
            ' curl -s -XPOST -H "Authorization: password" -H "Content-type: application/json" "http://127.0.0.1:4445/call/GetVersion"
            Shell _Hide CMD_EXE_HTTP + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetVersion" + c34 + " -o " + c34 + filePrevious_ms + c34
            Open filePrevious_ms For Binary As #128
            JSON = Space$(LOF(128))
            Get #128, , JSON
            Close #128
            If GetKey("obsWebSocketVersion", JSON) = "" Then
                Error_msg = "- OBS " + c34 + "WebSocket Server" + c34 + " connection failed. Correctly configure " + c34 + "HTTPBindAddress, HTTPBindPort" + c34 + " in " + c34 + "config.ini" + c34 + " and retry." + Chr$(10) + "- If configuration is correct, check OBS Studio is open,  " + c34 + "WebSocket Server" + c34 + " is enabled in OBS Studio, and " + c34 + "obs-websocket-http" + c34 + " is installed.": Error_msg_3 = "- Check " + c34 + "WebSocketConnection" + c34 + " in " + c34 + "config.ini" + c34 + " is set to the required connection method. " + c34 + "obs-websocket-http" + c34 + " requires OBS WebSocket 5.x."
                ErrorDisplay (6)
            Else
                checkWebSocketVersion$ = GetKey("obsWebSocketVersion", JSON)
            End If
        Else
            ' Check for 5.x else fall back to 4.x. If 4.x also fails then error
            websocketVersion = 5

            ' File variables for 5.x
            ' Set OS variables
            obs_check_websocket = config_dir + s + "js" + s + "obs_check_websocket.mjs"
            obs_change_scene = config_dir + s + "js" + s + "obs_change_scene.mjs"
            shell_cmd_1 = CMD_EXE + c34 + obs_change_scene + c34 + " "
            shell_cmd_2 = ""

            Shell _Hide CMD_EXE + c34 + obs_check_websocket + c34 + " > " + c34 + filePrevious_ms + c34
            _Delay 0.05
            If _FileExists(filePrevious_ms) Then
                Open filePrevious_ms For Input As #90
                If EOF(90) Or LOF(90) = 0 Then
                    Close #90
                    On Error GoTo App_Fail
                    If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
                    On Error GoTo 0
                    ' Check for 4.x else error
                    websocketOK = FALSE
                Else
                    websocketOK = TRUE
                End If

                If websocketOK Then Line Input #90, file90
                If file90 <> "OK" Then
                    Close #90
                    If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
                    ' Check for 4.x else error
                    websocketOK = FALSE
                Else
                    websocketOK = TRUE
                    If EOF(90) Or LOF(90) = 0 Then
                        Close #90
                    Else
                        Line Input #90, checkWebSocketVersion$
                        Close #90
                    End If
                End If
            End If

            If Not websocketOK Then
                websocketVersion = 4

                ' File variables for 4.x
                ' Set OS variables
                obs_check_websocket = config_dir + s + "js" + s + "obs_check_websocket.js"
                obs_change_scene = config_dir + s + "js" + s + "obs_change_scene.js"
                shell_cmd_1 = CMD_EXE + c34 + obs_change_scene + c34 + " "
                shell_cmd_2 = ""

                Shell _Hide CMD_EXE + c34 + obs_check_websocket + c34 + " > " + c34 + filePrevious_ms + c34
                _Delay 0.05
                If _FileExists(filePrevious_ms) Then
                    Open filePrevious_ms For Input As #90
                    If EOF(90) Or LOF(90) = 0 Then
                        Close #90
                        On Error GoTo App_Fail
                        If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
                        On Error GoTo 0
                        websocketOK = FALSE
                        Error_msg = "- OBS " + c34 + "WebSocket Server" + c34 + " connection failed. Correctly configure " + c34 + "WebsocketAddress, WebsocketPassword" + c34 + " in " + c34 + "config.ini" + c34 + " and retry." + Chr$(10) + "- If configuration is correct, check OBS Studio is open, " + c34 + "WebSocket Server" + c34 + " is enabled in OBS Studio, and " + c34 + "Node.js" + c34 + " is installed.": Error_msg_3 = "- Check " + c34 + "WebSocketConnection" + c34 + " in " + c34 + "config.ini" + c34 + " is set to the required connection method."
                        ErrorDisplay (6)
                    Else
                        websocketOK = TRUE
                    End If

                    Line Input #90, file90
                    If file90 <> "OK" Then
                        Close #90
                        If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
                        websocketOK = FALSE
                        Error_msg = "- OBS " + c34 + "WebSocket Server" + c34 + " connection failed. Correctly configure " + c34 + "WebsocketAddress, WebsocketPassword" + c34 + " in " + c34 + "config.ini" + c34 + " and retry." + Chr$(10) + "- If configuration is correct, check OBS Studio is open, " + c34 + "WebSocket Server" + c34 + " is enabled in OBS Studio, and " + c34 + "Node.js" + c34 + " is installed.": Error_msg_3 = "- Check " + c34 + "WebSocketConnection" + c34 + " in " + c34 + "config.ini" + c34 + " is set to the required connection method."
                        ErrorDisplay (6)
                    Else
                        websocketOK = TRUE
                        If EOF(90) Or LOF(90) = 0 Then
                            Close #90
                        Else
                            Line Input #90, checkWebSocketVersion$
                            Close #90
                        End If
                    End If
                End If
            End If
            checkWebSocketVersion$ = Left$(checkWebSocketVersion$, 20)
            Select Case websocketVersion
                ' Set OS variables
                Case 5
                    ' 5.x
                    obs_change_scene = config_dir + s + "js" + s + "obs_change_scene.mjs"
                    obs_get_scene = config_dir + s + "js" + s + "obs_get_scene.mjs"
                    obs_get_scene_list = config_dir + s + "js" + s + "obs_get_scene_list.mjs"
                    obs_get_media1 = config_dir + s + "js" + s + "obs_get_media1.mjs"
                    obs_get_media1_scene = config_dir + s + "js" + s + "obs_get_media1_scene.mjs"
                    obs_get_media2 = config_dir + s + "js" + s + "obs_get_media2.mjs"
                    obs_get_media2_scene = config_dir + s + "js" + s + "obs_get_media2_scene.mjs"
                    obs_check_websocket = config_dir + s + "js" + s + "obs_check_websocket.mjs"
                Case 4
                    ' 4.x
                    obs_change_scene = config_dir + s + "js" + s + "obs_change_scene.js"
                    obs_get_scene = config_dir + s + "js" + s + "obs_get_scene.js"
                    obs_get_scene_list = config_dir + s + "js" + s + "obs_get_scene_list.js"
                    obs_get_media1 = config_dir + s + "js" + s + "obs_get_media1.js"
                    obs_get_media1_scene = config_dir + s + "js" + s + "obs_get_media1_scene.js"
                    obs_get_media2 = config_dir + s + "js" + s + "obs_get_media2.js"
                    obs_get_media2_scene = config_dir + s + "js" + s + "obs_get_media2_scene.js"
                    obs_check_websocket = config_dir + s + "js" + s + "obs_check_websocket.js"
            End Select
        End If

    End If

    ' Test #7
    If ErrorTestRunOnce Then
        If Not __MultiCameraSwitch Then

            If HTTP_Enabled Then
                Shell _Hide CMD_EXE_HTTP + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + MediaSource1 + "\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " > " + c34 + filePrevious_ms + c34
                Open filePrevious_ms For Binary As #128
                JSON = Space$(LOF(128))
                Get #128, , JSON
                Close #128
                If GetKey("mediaCursor", JSON) = "" Then
                    Error_msg = "- Unable to read " + c34 + "MediaSource1" + c34 + ". Correctly configure " + c34 + "MediaSource1" + c34 + " in " + c34 + "config.ini and retry." + Chr$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSocket version is 4.9.0 or newer."
                    ErrorDisplay (7)
                End If
            Else
                Shell _Hide CMD_EXE + c34 + obs_get_media1 + c34 + " > " + c34 + filePrevious_ms + c34
                _Delay 0.05
                If _FileExists(filePrevious_ms) Then
                    Open filePrevious_ms For Input As #90
                    If EOF(90) Or LOF(90) = 0 Then
                        Close #90
                        If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
                        Error_msg = "- Unable to read " + c34 + "MediaSource1" + c34 + ". Correctly configure " + c34 + "MediaSource1" + c34 + " in " + c34 + "config.ini and retry." + Chr$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSocket version is 4.9.0 or newer."
                        ErrorDisplay (7)
                    End If

                    ' No more lines to be read, so just close file
                    Close #90
                End If
            End If

        End If
    End If

    ' Test #8
    If ErrorTestRunOnce Then
        If __MultiCameraSwitch Then

            If HTTP_Enabled Then
                Shell _Hide CMD_EXE_HTTP + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + MediaSource1 + "\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " > " + c34 + filePrevious_ms + c34
                Open filePrevious_ms For Binary As #128
                JSON = Space$(LOF(128))
                Get #128, , JSON
                Close #128
                If GetKey("mediaCursor", JSON) = "" Then
                    Error_msg = "- Unable to read " + c34 + "MediaSource1" + c34 + ". Correctly configure " + c34 + "MediaSource1" + c34 + " in " + c34 + "config.ini and retry." + Chr$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSocket version is 4.9.0 or newer."
                    ErrorDisplay (8)
                End If
                Shell _Hide CMD_EXE_HTTP + "-d " + c34 + "{\" + c34 + "inputName\" + c34 + ": \" + c34 + MediaSource2 + "\" + c34 + "}" + c34 + " " + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetMediaInputStatus" + c34 + " > " + c34 + filePrevious_ms + c34
                Open filePrevious_ms For Binary As #128
                JSON = Space$(LOF(128))
                Get #128, , JSON
                Close #128
                If GetKey("mediaCursor", JSON) = "" Then
                    Error_msg = "- Unable to read " + c34 + "MediaSource2" + c34 + ". Correctly configure " + c34 + "MediaSource2" + c34 + " in " + c34 + "config.ini and retry." + Chr$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSocket version is 4.9.0 or newer."
                    ErrorDisplay (8)
                End If
            Else
                Shell _Hide CMD_EXE + c34 + obs_get_media2 + c34 + " > " + c34 + filePrevious_ms + c34
                _Delay 0.05
                If _FileExists(filePrevious_ms) Then
                    Open filePrevious_ms For Input As #90
                    If EOF(90) Or LOF(90) = 0 Then
                        Close #90
                        If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
                        Error_msg = "- Unable to read " + c34 + "MediaSource1" + c34 + ". Correctly configure " + c34 + "MediaSource1" + c34 + " in " + c34 + "config.ini and retry." + Chr$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSocket version is 4.9.0 or newer."
                        ErrorDisplay (8)
                    End If

                    Line Input #90, file90
                    If EOF(90) Or LOF(90) = 0 Then
                        Close #90
                        If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
                        Error_msg = "- Unable to read " + c34 + "MediaSource2" + c34 + ". Correctly configure " + c34 + "MediaSource2" + c34 + " in " + c34 + "config.ini and retry." + Chr$(10) + "- If configuration is correct, check " + c34 + "Restart Playback" + c34 + " is disabled and WebSocket version is 4.9.0 or newer."
                        ErrorDisplay (8)
                    End If
                    Close #90
                End If
            End If

        End If
    End If

    ' Test #9
    If ErrorTestRunOnce Then

        If HTTP_Enabled Then
            Shell _Hide CMD_EXE_HTTP + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetSceneList" + c34 + " -o " + c34 + filePrevious_ms + c34
            Open filePrevious_ms For Binary As #128
            JSON = Space$(LOF(128))
            Get #128, , JSON
            Close #128
            ReDim JSON_Multi(128) As String
            GetAllKey "sceneName", JSON, JSON_Multi()
            Test_Pass_9 = 0
            For i_JSON = 1 To UBound(JSON_Multi)
                ' JSON_Multi(i_JSON)
                If JSON_Multi(i_JSON) = Scene_OK Then Test_Pass_9 = Test_Pass_9 + 1
                If JSON_Multi(i_JSON) = Scene_Fail Then Test_Pass_9 = Test_Pass_9 + 2
                If JSON_Multi(i_JSON) = Scene_Intro Then Test_Pass_9 = Test_Pass_9 + 4
                Select Case Test_Pass_9
                    Case 0: Test_Pass_9_Value = "SceneOK, SceneFail, SceneIntro"
                    Case 1: Test_Pass_9_Value = "SceneFail, SceneIntro"
                    Case 2: Test_Pass_9_Value = "SceneIntro, SceneOK"
                    Case 3: Test_Pass_9_Value = "SceneIntro"
                    Case 4: Test_Pass_9_Value = "SceneOK, SceneFail"
                    Case 5: Test_Pass_9_Value = "SceneFail"
                    Case 6: Test_Pass_9_Value = "SceneOK"
                End Select
            Next
            ReDim JSON_Multi(10) As String
            If Test_Pass_9 <> 7 Then
                Error_msg = "- OBS scenes are missing. Scene names are case-sensitive and cannot be more than eight words." + Chr$(10) + "- Correctly configure scenes " + c34 + Test_Pass_9_Value + c34 + " in " + c34 + "config.ini" + c34 + " and confirm all scenes contain at least one source."
                ErrorDisplay (9)
            End If
        Else
            Shell _Hide CMD_EXE + c34 + obs_get_scene_list + c34 + " > " + c34 + filePrevious_ms + c34
            _Delay 0.05
            If _FileExists(filePrevious_ms) Then
                Open filePrevious_ms For Input As #90
                If EOF(90) Or LOF(90) = 0 Then
                    Close #90
                    On Error GoTo App_Fail
                    If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
                    On Error GoTo 0
                    Error_msg = "- Unable to retrieve OBS scene list. Correctly configure scenes in OBS and confirm they all contain at least one source."
                    ErrorDisplay (9)
                End If

                Test_Pass_9 = 0
                Do
                    If Not EOF(90) Then Line Input #90, file90
                    If file90 = Scene_OK Then Test_Pass_9 = Test_Pass_9 + 1
                    If file90 = Scene_Fail Then Test_Pass_9 = Test_Pass_9 + 2
                    If file90 = Scene_Intro Then Test_Pass_9 = Test_Pass_9 + 4
                    Select Case Test_Pass_9
                        Case 0: Test_Pass_9_Value = "SceneOK, SceneFail, SceneIntro"
                        Case 1: Test_Pass_9_Value = "SceneFail, SceneIntro"
                        Case 2: Test_Pass_9_Value = "SceneIntro, SceneOK"
                        Case 3: Test_Pass_9_Value = "SceneIntro"
                        Case 4: Test_Pass_9_Value = "SceneOK, SceneFail"
                        Case 5: Test_Pass_9_Value = "SceneFail"
                        Case 6: Test_Pass_9_Value = "SceneOK"
                    End Select
                Loop Until EOF(90)
                Close #90
                If Test_Pass_9 <> 7 Then
                    Error_msg = "- OBS scenes are missing. Scene names are case-sensitive and cannot be more than eight words." + Chr$(10) + "- Correctly configure scenes " + c34 + Test_Pass_9_Value + c34 + " in " + c34 + "config.ini" + c34 + " and confirm all scenes contain at least one source."
                    ErrorDisplay (9)
                End If
            End If
        End If

    End If

    ' Test #10
    If ErrorTestRunOnce Then
        If __MultiCameraSwitch Then

            If HTTP_Enabled Then
                Shell _Hide CMD_EXE_HTTP + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetSceneList" + c34 + " -o " + c34 + filePrevious_ms + c34
                Open filePrevious_ms For Binary As #128
                JSON = Space$(LOF(128))
                Get #128, , JSON
                Close #128
                ReDim JSON_Multi(128) As String
                GetAllKey "sceneName", JSON, JSON_Multi()
                Test_Pass_10 = 0
                For i_JSON = 1 To UBound(JSON_Multi)
                    ' JSON_Multi(i_JSON)
                    If JSON_Multi(i_JSON) = titleScene1 Then Test_Pass_10 = Test_Pass_10 + 1
                    If JSON_Multi(i_JSON) = titleScene2 Then Test_Pass_10 = Test_Pass_10 + 2
                    If JSON_Multi(i_JSON) = titleScene12 Then Test_Pass_10 = Test_Pass_10 + 4
                    Select Case Test_Pass_10
                        Case 0: Test_Pass_10_Value = "TitleScene1, TitleScene2, TitleScene12"
                        Case 1: Test_Pass_10_Value = "TitleScene2, TitleScene12"
                        Case 2: Test_Pass_10_Value = "TitleScene1, TitleScene12"
                        Case 3: Test_Pass_10_Value = "TitleScene12"
                        Case 4: Test_Pass_10_Value = "TitleScene1, TitleScene2"
                        Case 5: Test_Pass_10_Value = "TitleScene2"
                        Case 6: Test_Pass_10_Value = "TitleScene1"
                    End Select
                Next
                ReDim JSON_Multi(10) As String
                If Test_Pass_10 <> 7 Then
                    Error_msg = "- OBS scenes are missing. Scene names are case-sensitive and cannot be more than eight words." + Chr$(10) + "- Correctly configure scenes " + c34 + Test_Pass_10_Value + c34 + " in " + c34 + "config.ini" + c34 + " and confirm all scenes contain at least one source."
                    ErrorDisplay (10)
                End If
            Else
                Shell _Hide CMD_EXE + c34 + obs_get_scene_list + c34 + " > " + c34 + filePrevious_ms + c34
                _Delay 0.05
                If _FileExists(filePrevious_ms) Then
                    Open filePrevious_ms For Input As #90
                    If EOF(90) Or LOF(90) = 0 Then
                        Close #90
                        If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
                        Error_msg = "- Unable to retrieve OBS scene list. Correctly configure scenes in OBS and confirm they all contain at least one source."
                        ErrorDisplay (10)
                    End If

                    Test_Pass_10 = 0
                    Do
                        If Not EOF(90) Then Line Input #90, file90
                        If file90 = titleScene1 Then Test_Pass_10 = Test_Pass_10 + 1
                        If file90 = titleScene2 Then Test_Pass_10 = Test_Pass_10 + 2
                        If file90 = titleScene12 Then Test_Pass_10 = Test_Pass_10 + 4
                        Select Case Test_Pass_10
                            Case 0: Test_Pass_10_Value = "TitleScene1, TitleScene2, TitleScene12"
                            Case 1: Test_Pass_10_Value = "TitleScene2, TitleScene12"
                            Case 2: Test_Pass_10_Value = "TitleScene1, TitleScene12"
                            Case 3: Test_Pass_10_Value = "TitleScene12"
                            Case 4: Test_Pass_10_Value = "TitleScene1, TitleScene2"
                            Case 5: Test_Pass_10_Value = "TitleScene2"
                            Case 6: Test_Pass_10_Value = "TitleScene1"
                        End Select
                    Loop Until EOF(90)
                    Close #90
                    If Test_Pass_10 <> 7 Then
                        Error_msg = "- OBS scenes are missing. Scene names are case-sensitive and cannot be more than eight words." + Chr$(10) + "- Correctly configure scenes " + c34 + Test_Pass_10_Value + c34 + " in " + c34 + "config.ini" + c34 + " and confirm all scenes contain at least one source."
                        ErrorDisplay (10)
                    End If
                End If
            End If

        End If
    End If
    ' ---------------------------------------------------------------

    If Scene_OK = "" Or Scene_Fail = "" Or Scene_Intro = "" Or OBS_URL = "" Then RefreshDisplayRequest = TRUE: Error_msg = "- Variable/s for scenes empty, check if " + c34 + config_main + c34 + " exists. (Error: #3)": _Delay 3

    If _FileExists(filePrevious_ms) And HTTP_Communication_Native Then Kill filePrevious_ms

    If ConnectionsLog Then statusConnectionsLogToFile ""
    If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Program launched"

    If Not __MultiCameraSwitch Then
        Scene_Current = Scene_OK
        If Scene_Disabled <> "true" Then
            If HTTP_Communication_Native Then http_client_connect "Set", Scene_OK Else Shell _Hide _DontWait shell_cmd_1 + Scene_OK + shell_cmd_2
        End If
    End If

    If __MultiCameraSwitch Then
        Scene_Current = titleScene12
        If Scene_Disabled <> "true" Then
            If HTTP_Communication_Native Then http_client_connect "Set", titleScene12 Else Shell _Hide _DontWait shell_cmd_1 + titleScene12 + shell_cmd_2
        End If
    End If

    ' Disable changing of scenes if enabled
    If Scene_Disabled = "true" Then
        ' CMD_EXE = "": CMD_EXE_FAST = "": CMD_EXE_HTTP = "": CMD_EXE_HTTP_FAST = "": CMD_EXE_HTTP_FAST_GET_SCENE = "": CMD_EXE_HTTP_FAST_GET_MEDIA1 = "": CMD_EXE_HTTP_GET_SCENE = "": CMD_EXE_HTTP_GET_MEDIA2 = "": shell_cmd_1 = "": shell_cmd_2 = ""
        Scene_OK = "-": Scene_LBR = "-": Scene_Fail = "-": Scene_Intro = "-": titleScene1 = "": titleScene2 = "": titleScene12 = ""
    End If

    _Delay 0.03
    _Title "Loopy SRT Monitor"

    ' Enable Debug window on startup if enabled
    If VerBeta <> "" Or ForceDebugOnStartup = "true" Then
        If ForceDebugOnStartup <> "false" Then
            Debug = TRUE
            Control(DebugFrame).Hidden = FALSE
            Control(versionFrame).Hidden = TRUE
            Control(PictureBoxLogoBottom).Hidden = TRUE
            SetRadioButtonValue OptionsMenuDebug
        End If
    End If

    ' Update display: ---------------------------------------------------------------
    If Not __MultiCameraSwitch Then
        Control(Stream1).Hidden = TRUE
        Control(Stream2).Hidden = TRUE
        Control(StreamUptimeLB).Hidden = TRUE
        Control(failLB).Hidden = TRUE
        Control(Uptime_Stream_1LB).Hidden = TRUE
        Control(Timer_Fail_Stream1LB).Hidden = TRUE
        Control(StreamUptimeLB2).Hidden = TRUE
        Control(failLB2).Hidden = TRUE
        Control(Uptime_Stream_2LB).Hidden = TRUE
        Control(Timer_Fail_Stream2LB).Hidden = TRUE
        ' Low bitrate scene for multiple cameras only
        Control(LowBitrateSceneLB).Hidden = TRUE
        Control(Low_Bitrate_StatusLB).Hidden = TRUE
        SetCaption FailCount2LB, ""
        SetCaption Timer_Fail_Count_2LB, ""
        SetCaption FailCount1LB, "DC / Low bitrate"
        SetCaption FailCount2LB, "Low bitrate scene"
        SetCaption Timer_Fail_Count_2LB, "-" ' This is set in TIMER
    Else
        ' Stream #1 only
        SetCaption StreamUptimeLB3, ""
        SetCaption StreamFailTimerLB2, ""
        SetCaption Stream_UptimeLB, ""
        SetCaption Stream_Fail_TimerLB, ""
        SetCaption Low_Bitrate_StatusLB, "-" ' This is set in TIMER
    End If

    Control(DebugFrame).Hidden = TRUE
    ' Debug Temp
    If Debug_Temp <> "true" Then
        Control(DebugFrameTemp).Hidden = TRUE
        Control(DebugTemp1LB).Hidden = TRUE
        Control(DebugTemp2LB).Hidden = TRUE
        Control(DebugTemp3LB).Hidden = TRUE
        Control(DebugTemp4LB).Hidden = TRUE
        Control(DebugTemp1LB2).Hidden = TRUE
        Control(DebugTemp2LB2).Hidden = TRUE
        Control(DebugTemp3LB2).Hidden = TRUE
        Control(DebugTemp4LB2).Hidden = TRUE
    Else
        Control(Settings).Hidden = TRUE
    End If
    Control(versionFrame).Hidden = FALSE
    LoadImageMEM Control(PictureBoxLogoBottom), "srt_logo_bottom.png"
    Control(TimerLB).Hidden = TRUE
    Control(TimerSnapshotLB).Hidden = TRUE
    Control(td_displayLB2).Hidden = TRUE
    Control(mouseXLB2).Hidden = TRUE
    Control(mouseYLB2).Hidden = TRUE
    Control(__ERRORLINELB2).Hidden = TRUE
    Control(Debug_TimerLB).Hidden = TRUE
    Control(Debug_Timer_SnapshotLB).Hidden = TRUE
    Control(td_displayLB).Hidden = TRUE
    Control(mouseXLB).Hidden = TRUE
    Control(mouseYLB).Hidden = TRUE
    Control(__ERRORLINELB).Hidden = TRUE
    Control(LowBRTimerLB).Hidden = TRUE
    Control(br_countdownLB).Hidden = TRUE
    Control(MSRateLB).Hidden = TRUE
    Control(MSRateLB2).Hidden = TRUE
    Control(ms_playLB).Hidden = TRUE
    Control(ms_playLB2).Hidden = TRUE
    Control(LBRDelayLB).Hidden = TRUE
    Control(br_delayLB).Hidden = TRUE
    Control(PictureBoxLogoBottom).Hidden = FALSE
    If VerBeta = "" Then SetCaption (versionFrame), "v" + Ver Else SetCaption (versionFrame), "v" + VerBeta + "beta"
    ' ---------------------------------------------------------------

    t1 = _FreeTimer
    On Timer(t1, 1) Timer01
    Timer(t1) On
End Sub

Sub __UI_BeforeUpdateDisplay
    ' This event occurs at approximately 60 frames per second.
    ' You can change the update frequency by calling SetFrameRate DesiredRate%
    If Not _WindowHasFocus Then SetFrameRate 15 Else SetFrameRate 30

    If RefreshDisplayRequest Then
        RefreshDisplayRequest = FALSE
        Timer(t1) Stop
        Cls , _RGB(1, 100, 200)
        BSOD& = __imageMEM&("face_sad_x.png")
        _PutImage (25, 46)-(82, 158), BSOD&
        _FreeImage BSOD&
        Color _RGB(254, 254, 254), _RGB(1, 100, 200)
        _PrintString (20, 12 * 18), "Program encountered an error and needs to restart."
        If InStr(Error_msg, Chr$(10)) >= 1 Then
            _PrintString (20, 14 * 18), Left$(Error_msg, InStr(Error_msg, Chr$(10)) - 1)
            _PrintString (20, 15 * 18), Mid$(Error_msg, InStr(Error_msg, Chr$(10)) + 1)
        Else
            _PrintString (20, 14 * 18), Error_msg
        End If
        If InStr(Error_msg_2$, Chr$(10)) >= 1 Then
            _PrintString (20, 16 * 18), Left$(Error_msg_2$, InStr(Error_msg_2$, Chr$(10)) - 1)
            _PrintString (20, 17 * 18), Mid$(Error_msg_2$, InStr(Error_msg_2$, Chr$(10)) + 1)
        Else
            _PrintString (20, 16 * 18), Error_msg_2$
        End If
        _PrintString (20, 20 * 18), "Program will resume shortly"
        _Display: _Delay 8
        Error_msg = ""
        Error_msg_2$ = ""
        Cls , BG
        Timer(t1) On
    End If

    If Debug Then
        mouseX = _MouseX
        mouseY = _MouseY
        Debug_Timer = Timer(.001)
        TIMEms Debug_Timer, 0, 0
        SetCaption (Debug_TimerLB), tout + " sec   "
        TIMEms td_display, 1, 0
        SetCaption (td_displayLB), tout + " sec   "
        SetCaption (mouseXLB), LTrim$(Str$(mouseX + 1)) + "   "
        SetCaption (mouseYLB), LTrim$(Str$(mouseY + 1)) + "   "
        SetCaption (__ERRORLINELB), LTrim$(Str$(_ErrorLine)) + "   "
    End If

    If updateDisplay >= 1 Then
        updateDisplayCounter = updateDisplayCounter + 1
        If updateDisplayCounter >= 300 Then
            file224$ = ""
            verCheck$ = ""
            updateResult$ = ""
            updateDisplay = 0
            updateDisplayCounter = 0
            SetCaption StatusLB, ""
        End If
    End If

    q = _Exit
    Select Case q
        Case 1
            If _FileExists(filePrevious) Then Kill filePrevious
            If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
            If _FileExists(outputBitrateFile) Then Kill outputBitrateFile
            If _FileExists(outputStatusFile) Then Kill outputStatusFile
            If _FileExists(http_media2_File) Then Kill http_media2_File
            If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Program exit"
            If OS = "WINDOWS" And _FileExists(HTTP_File) Then Shell "%ComSpec% /C START " + c34 + c34 + " /MIN " + "taskkill /IM " + c34 + HTTP_Filename + c34 + " /F"
            System
    End Select

    ProgressCounter = ProgressCounter + 1 ' | / - \ | / - \
    Select Case ProgressCounter
        Case 1 To 8
            SetCaption IndicatorLB, "|"
        Case 9 To 16
            SetCaption IndicatorLB, "/"
        Case 17 To 24
            SetCaption IndicatorLB, "-"
        Case 25 To 32
            SetCaption IndicatorLB, "\"
        Case 33 To 40
            SetCaption IndicatorLB, "|"
        Case 41 To 48
            SetCaption IndicatorLB, "/"
        Case 49 To 56
            SetCaption IndicatorLB, "-"
        Case 57 To 64
            SetCaption IndicatorLB, "\"
        Case Is >= 64
            ProgressCounter = 1
    End Select

    ' Change mouse cursor for tooltip
    If Tooltip_Mouse Then
        mouseX = _MouseX
        mouseY = _MouseY
        If mouseX >= 170 And mouseX <= 250 And mouseY >= 75 And mouseY <= 90 Then Tooltip_Mouse_Active = TRUE Else Tooltip_Mouse_Active = FALSE
        If __MultiCameraSwitch Then
            If mouseX >= 300 And mouseX <= 380 And mouseY >= 75 And mouseY <= 90 And Tooltip_Mouse_Active = FALSE Then Tooltip_Mouse_Active = TRUE
        End If
        If Tooltip_Mouse_Active Then _MouseShow "LINK" Else _MouseShow "DEFAULT"
    End If
End Sub

Sub __UI_BeforeUnload
    ' If you set __UI_UnloadSignal = False here you can
    ' cancel the user's request to close.

End Sub

Sub __UI_Click (id As Long)
    Select Case id
        Case BitrateLB

        Case Bitrate_Stream_1LB

        Case BitrateLB2

        Case Bitrate_Stream_2LB

        Case DebugFrameTemp

        Case DebugTemp1LB

        Case DebugTemp2LB

        Case DebugTemp3LB

        Case DebugTemp4LB

        Case DebugTemp1LB2

        Case DebugTemp2LB2

        Case DebugTemp3LB2

        Case DebugTemp4LB2

        Case OptionsMenuRestoreWindowSize
            If Allow_Resize = "true" Then
                _Delay 0.25
                _Resize Off , _Smooth
                _Delay 0.5
                _Resize On , _Smooth
                _Delay 0.25
            End If

        Case LBRDelayLB

        Case br_delayLB

        Case Stream1LightLB

        Case StreamLightLB

        Case Stream2LightLB

        Case LoopySRTMonitor

        Case FileMenu

        Case OptionsMenu

        Case HelpMenu

        Case Status

        Case Settings

        Case CurrentScene

        Case DebugFrame

        Case Stream1

        Case Stream2

        Case versionFrame

        Case FileMenuExit
            If _FileExists(filePrevious) Then Kill filePrevious
            If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
            If _FileExists(outputBitrateFile) Then Kill outputBitrateFile
            If _FileExists(outputStatusFile) Then Kill outputStatusFile
            If _FileExists(http_media2_File) Then Kill http_media2_File
            If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Program exit"
            If OS = "WINDOWS" And _FileExists(HTTP_File) Then Shell "%ComSpec% /C START " + c34 + c34 + " /MIN " + "taskkill /IM " + c34 + HTTP_Filename + c34 + " /F"
            System

        Case StreamFailTimerLB

        Case ServerPingLB

        Case UpdateIntervalLB

        Case Timer_FailLB

        Case Timer_Fail_CountLB

        Case tPingOutLB

        Case td_updateLB

        Case StreamFailDelayLB

        Case MultiCameraSwitchLB

        Case Stream_Fail_DelayLB

        Case MultiCameraSwitchStatusLB

        Case TimerLB

        Case TimerSnapshotLB

        Case td_displayLB2

        Case mouseXLB2

        Case mouseYLB2

        Case __ERRORLINELB2

        Case Debug_TimerLB

        Case Debug_Timer_SnapshotLB

        Case td_displayLB

        Case mouseXLB

        Case mouseYLB

        Case __ERRORLINELB

        Case StreamUptimeLB

        Case failLB

        Case Uptime_Stream_1LB

        Case Timer_Fail_Stream1LB

        Case Scene_CurrentLB

        Case PictureBox1

        Case StreamUptimeLB2

        Case failLB2

        Case Uptime_Stream_2LB

        Case Timer_Fail_Stream2LB

        Case OptionsMenuAlwaysOnTop
            If Not AlwaysOnTop Then
                AlwaysOnTop = TRUE
                $If WIN Then
                    If OS = "WINDOWS" Then y& = SetWindowPos&(Myhwnd, -1, 0, 0, 0, 0, &H2 + &H1 + &H40) ' Windows only
                $End If
                SetRadioButtonValue OptionsMenuAlwaysOnTop
            Else
                AlwaysOnTop = FALSE
                $If WIN Then
                    If OS = "WINDOWS" Then y& = SetWindowPos&(Myhwnd, -2, 0, 0, 0, 0, &H2 + &H1 + &H40) ' Windows only
                $End If
                SetRadioButtonValue OptionsMenuAlwaysOnTop
            End If

        Case OptionsMenuDebug
            If Not Debug Then
                Debug = TRUE
                Control(DebugFrame).Hidden = FALSE
                Control(versionFrame).Hidden = TRUE
                Control(PictureBoxLogoBottom).Hidden = TRUE
                SetRadioButtonValue OptionsMenuDebug
            Else
                Debug = FALSE
                Control(versionFrame).Hidden = TRUE
                Control(PictureBoxLogoBottom).Hidden = TRUE
                SetRadioButtonValue OptionsMenuDebug
            End If

        Case HelpMenuVisitWebsite
            ' Set OS variables
            Select Case OS
                Case "WINDOWS"
                    Shell _Hide _DontWait "%ComSpec% /C START " + c34 + c34 + " /B https://github.com/loopy750/SRT-Stats-Monitor"
                Case "LINUX"
                    Shell _Hide _DontWait "xdg-open https://github.com/loopy750/SRT-Stats-Monitor"
            End Select

        Case HelpMenuCheckForUpdates
            ' Check for new version
            verCheck$ = "Checking for new version..."
            SetCaption StatusLB, verCheck$
            file224$ = ""
            updateResult$ = ""
            _Delay 0.25
            ' Set OS variables
            Select Case OS
                Case "WINDOWS"
                    Shell _Hide "%ComSpec% /C curl -H " + c34 + "Cache-Control: no-cache" + c34 + " https://raw.githubusercontent.com/loopy750/SRT-Stats-Monitor-Version/master/checkversion.txt > " + c34 + fileCheckVersion + c34 + ""
                Case "LINUX"
                    Shell _Hide "curl -H " + c34 + "Cache-Control: no-cache" + c34 + " https://raw.githubusercontent.com/loopy750/SRT-Stats-Monitor-Version/master/checkversion.txt > " + c34 + fileCheckVersion + c34 + ""
            End Select
            _Delay 0.25
            If _FileExists(fileCheckVersion) Then
                Open fileCheckVersion For Input As #224
                Do Until EOF(224)
                    If LOF(224) = 0 Then NoKill = TRUE: Exit Do ' Overkill with EOF checking, but just being safe
                    If EOF(224) Then Exit Do
                    Line Input #224, file224$
                Loop
            End If
            Close #224
            If _FileExists(fileCheckVersion) Then Kill fileCheckVersion
            updateResult$ = file224$
            If file224$ <> Ver Then verCheck$ = "New version is available (v" + _Trim$(Left$(updateResult$, 10)) + ")": _NotifyPopup "Loopy SRT Monitor", "New version is available (v" + _Trim$(Left$(updateResult$, 10)) + ")", "info"
            If file224$ = "" Or file224$ = "404: Not Found" Then verCheck$ = "Unable to check for new version..."
            If file224$ = Ver Then verCheck$ = "This is the latest version (v" + _Trim$(Left$(Ver, 10)) + ")..."
            If verCheck <> "" Then updateDisplayCounter = 0

        Case OptionsMenuFullscreen
            If Not FullScreen Then
                FullScreen = TRUE
                _FullScreen _SquarePixels , _Smooth
                SetRadioButtonValue OptionsMenuFullscreen
            Else
                FullScreen = FALSE
                _FullScreen _Off
                SetRadioButtonValue OptionsMenuFullscreen
            End If

        Case IndicatorLB

        Case HelpMenuAbout
            If VerBeta = "" Then
                If VerPortable = "false" Then
                    Answer = MessageBox("Loopy SRT Stats Monitor v" + Ver + " (" + VerDate + ") \nby loopy750\n\nOBS WebSocket version: " + checkWebSocketVersion$ + "\n\nHomepage: https://www.github.com/loopy750", "About", MsgBox_OkOnly + MsgBox_Information)
                Else
                    Answer = MessageBox("Loopy SRT Stats Monitor v" + Ver + " (" + VerDate + ") \nPortable version\nby loopy750\n\nOBS WebSocket version: " + checkWebSocketVersion$ + "\n\nHomepage: https://www.github.com/loopy750", "About", MsgBox_OkOnly + MsgBox_Information)
                End If
            Else
                If VerPortable = "false" Then
                    Answer = MessageBox("Loopy SRT Stats Monitor v" + VerBeta + "beta (" + VerDate + ") \nby loopy750\n\nOBS WebSocket version: " + checkWebSocketVersion$ + "\n\nHomepage: https://www.github.com/loopy750", "About", MsgBox_OkOnly + MsgBox_Information)
                Else
                    Answer = MessageBox("Loopy SRT Stats Monitor v" + VerBeta + "beta (" + VerDate + ") \nPortable version\nby loopy750\n\nOBS WebSocket version: " + checkWebSocketVersion$ + "\n\nHomepage: https://www.github.com/loopy750", "About", MsgBox_OkOnly + MsgBox_Information)
                End If
            End If

        Case StatusLB

        Case PictureBoxLogoBottom

        Case StreamUptimeLB3

        Case StreamFailTimerLB2

        Case Stream_UptimeLB

        Case Stream_Fail_TimerLB

        Case Timer_Fail_Count_2LB

        Case IPPingLB

        Case tIPPingOutLB

        Case FailCount2LB

        Case FailCount1LB

        Case LowBRTimerLB

        Case br_countdownLB

        Case MSRateLB

        Case ms_playLB

        Case LowBitrateSceneLB

        Case Low_Bitrate_StatusLB

        Case MSRateLB2

        Case ms_playLB2

    End Select
End Sub

Sub __UI_MouseEnter (id As Long)
    Select Case id
        Case BitrateLB

        Case Bitrate_Stream_1LB

        Case BitrateLB2

        Case Bitrate_Stream_2LB

        Case DebugFrameTemp

        Case DebugTemp1LB

        Case DebugTemp2LB

        Case DebugTemp3LB

        Case DebugTemp4LB

        Case DebugTemp1LB2

        Case DebugTemp2LB2

        Case DebugTemp3LB2

        Case DebugTemp4LB2

        Case OptionsMenuRestoreWindowSize

        Case LBRDelayLB

        Case br_delayLB

        Case Stream1LightLB

        Case StreamLightLB

        Case Stream2LightLB

        Case OptionsMenuAlwaysOnTop

        Case LoopySRTMonitor

        Case FileMenu

        Case OptionsMenu

        Case HelpMenu

        Case Status

        Case Settings

        Case CurrentScene

        Case DebugFrame

        Case Stream1

        Case Stream2

        Case versionFrame

        Case FileMenuExit

        Case StreamFailTimerLB

        Case ServerPingLB

        Case UpdateIntervalLB

        Case Timer_FailLB

        Case Timer_Fail_CountLB

        Case tPingOutLB

        Case td_updateLB

        Case StreamFailDelayLB

        Case MultiCameraSwitchLB

        Case Stream_Fail_DelayLB

        Case MultiCameraSwitchStatusLB

        Case TimerLB

        Case TimerSnapshotLB

        Case td_displayLB2

        Case mouseXLB2

        Case mouseYLB2

        Case __ERRORLINELB2

        Case Debug_TimerLB

        Case Debug_Timer_SnapshotLB

        Case td_displayLB

        Case mouseXLB

        Case mouseYLB

        Case __ERRORLINELB

        Case StreamUptimeLB

        Case failLB

        Case Uptime_Stream_1LB

        Case Timer_Fail_Stream1LB

        Case Scene_CurrentLB

        Case PictureBox1

        Case StreamUptimeLB2

        Case failLB2

        Case Uptime_Stream_2LB

        Case Timer_Fail_Stream2LB

        Case OptionsMenuDebug

        Case HelpMenuVisitWebsite

        Case HelpMenuCheckForUpdates

        Case OptionsMenuFullscreen

        Case IndicatorLB

        Case HelpMenuAbout

        Case StatusLB

        Case PictureBoxLogoBottom

        Case StreamUptimeLB3

        Case StreamFailTimerLB2

        Case Stream_UptimeLB

        Case Stream_Fail_TimerLB

        Case Timer_Fail_Count_2LB

        Case IPPingLB

        Case tIPPingOutLB

        Case FailCount2LB

        Case FailCount1LB

        Case LowBRTimerLB

        Case br_countdownLB

        Case MSRateLB

        Case ms_playLB

        Case LowBitrateSceneLB

        Case Low_Bitrate_StatusLB

        Case MSRateLB2

        Case ms_playLB2

    End Select
End Sub

Sub __UI_MouseLeave (id As Long)
    Select Case id
        Case BitrateLB

        Case Bitrate_Stream_1LB

        Case BitrateLB2

        Case Bitrate_Stream_2LB

        Case DebugFrameTemp

        Case DebugTemp1LB

        Case DebugTemp2LB

        Case DebugTemp3LB

        Case DebugTemp4LB

        Case DebugTemp1LB2

        Case DebugTemp2LB2

        Case DebugTemp3LB2

        Case DebugTemp4LB2

        Case OptionsMenuRestoreWindowSize

        Case LBRDelayLB

        Case br_delayLB

        Case Stream1LightLB

        Case StreamLightLB

        Case Stream2LightLB

        Case OptionsMenuAlwaysOnTop

        Case LoopySRTMonitor

        Case FileMenu

        Case OptionsMenu

        Case HelpMenu

        Case Status

        Case Settings

        Case CurrentScene

        Case DebugFrame

        Case Stream1

        Case Stream2

        Case versionFrame

        Case FileMenuExit

        Case StreamFailTimerLB

        Case ServerPingLB

        Case UpdateIntervalLB

        Case Timer_FailLB

        Case Timer_Fail_CountLB

        Case tPingOutLB

        Case td_updateLB

        Case StreamFailDelayLB

        Case MultiCameraSwitchLB

        Case Stream_Fail_DelayLB

        Case MultiCameraSwitchStatusLB

        Case TimerLB

        Case TimerSnapshotLB

        Case td_displayLB2

        Case mouseXLB2

        Case mouseYLB2

        Case __ERRORLINELB2

        Case Debug_TimerLB

        Case Debug_Timer_SnapshotLB

        Case td_displayLB

        Case mouseXLB

        Case mouseYLB

        Case __ERRORLINELB

        Case StreamUptimeLB

        Case failLB

        Case Uptime_Stream_1LB

        Case Timer_Fail_Stream1LB

        Case Scene_CurrentLB

        Case PictureBox1

        Case StreamUptimeLB2

        Case failLB2

        Case Uptime_Stream_2LB

        Case Timer_Fail_Stream2LB

        Case OptionsMenuDebug

        Case HelpMenuVisitWebsite

        Case HelpMenuCheckForUpdates

        Case OptionsMenuFullscreen

        Case IndicatorLB

        Case HelpMenuAbout

        Case StatusLB

        Case PictureBoxLogoBottom

        Case StreamUptimeLB3

        Case StreamFailTimerLB2

        Case Stream_UptimeLB

        Case Stream_Fail_TimerLB

        Case Timer_Fail_Count_2LB

        Case IPPingLB

        Case tIPPingOutLB

        Case FailCount2LB

        Case FailCount1LB

        Case LowBRTimerLB

        Case br_countdownLB

        Case MSRateLB

        Case ms_playLB

        Case LowBitrateSceneLB

        Case Low_Bitrate_StatusLB

        Case MSRateLB2

        Case ms_playLB2

    End Select
End Sub

Sub __UI_FocusIn (id As Long)
    Select Case id
        Case 0
    End Select
End Sub

Sub __UI_FocusOut (id As Long)
    ' This event occurs right before a control loses focus.
    ' To prevent a control from losing focus, set __UI_KeepFocus = True below.
    Select Case id
        Case 0
    End Select
End Sub

Sub __UI_MouseDown (id As Long)
    Select Case id
        Case BitrateLB

        Case Bitrate_Stream_1LB

        Case BitrateLB2

        Case Bitrate_Stream_2LB

        Case DebugFrameTemp

        Case DebugTemp1LB

        Case DebugTemp2LB

        Case DebugTemp3LB

        Case DebugTemp4LB

        Case DebugTemp1LB2

        Case DebugTemp2LB2

        Case DebugTemp3LB2

        Case DebugTemp4LB2

        Case OptionsMenuRestoreWindowSize

        Case LBRDelayLB

        Case br_delayLB

        Case Stream1LightLB

        Case StreamLightLB

        Case Stream2LightLB

        Case OptionsMenuAlwaysOnTop

        Case LoopySRTMonitor

        Case FileMenu

        Case OptionsMenu

        Case HelpMenu

        Case Status

        Case Settings

        Case CurrentScene

        Case DebugFrame

        Case Stream1

        Case Stream2

        Case versionFrame

        Case FileMenuExit

        Case StreamFailTimerLB

        Case ServerPingLB

        Case UpdateIntervalLB

        Case Timer_FailLB

        Case Timer_Fail_CountLB

        Case tPingOutLB

        Case td_updateLB

        Case StreamFailDelayLB

        Case MultiCameraSwitchLB

        Case Stream_Fail_DelayLB

        Case MultiCameraSwitchStatusLB

        Case TimerLB

        Case TimerSnapshotLB

        Case td_displayLB2

        Case mouseXLB2

        Case mouseYLB2

        Case __ERRORLINELB2

        Case Debug_TimerLB

        Case Debug_Timer_SnapshotLB

        Case td_displayLB

        Case mouseXLB

        Case mouseYLB

        Case __ERRORLINELB

        Case StreamUptimeLB

        Case failLB

        Case Uptime_Stream_1LB

        Case Timer_Fail_Stream1LB

        Case Scene_CurrentLB

        Case PictureBox1

        Case StreamUptimeLB2

        Case failLB2

        Case Uptime_Stream_2LB

        Case Timer_Fail_Stream2LB

        Case OptionsMenuDebug

        Case HelpMenuVisitWebsite

        Case HelpMenuCheckForUpdates

        Case OptionsMenuFullscreen

        Case IndicatorLB

        Case HelpMenuAbout

        Case StatusLB

        Case PictureBoxLogoBottom

        Case StreamUptimeLB3

        Case StreamFailTimerLB2

        Case Stream_UptimeLB

        Case Stream_Fail_TimerLB

        Case Timer_Fail_Count_2LB

        Case IPPingLB

        Case tIPPingOutLB

        Case FailCount2LB

        Case FailCount1LB

        Case LowBRTimerLB

        Case br_countdownLB

        Case MSRateLB

        Case ms_playLB

        Case LowBitrateSceneLB

        Case Low_Bitrate_StatusLB

        Case MSRateLB2

        Case ms_playLB2

    End Select
End Sub

Sub __UI_MouseUp (id As Long)
    Select Case id
        Case BitrateLB

        Case Bitrate_Stream_1LB

        Case BitrateLB2

        Case Bitrate_Stream_2LB

        Case DebugFrameTemp

        Case DebugTemp1LB

        Case DebugTemp2LB

        Case DebugTemp3LB

        Case DebugTemp4LB

        Case DebugTemp1LB2

        Case DebugTemp2LB2

        Case DebugTemp3LB2

        Case DebugTemp4LB2

        Case OptionsMenuRestoreWindowSize

        Case LBRDelayLB

        Case br_delayLB

        Case Stream1LightLB

        Case StreamLightLB

        Case Stream2LightLB

        Case OptionsMenuAlwaysOnTop

        Case LoopySRTMonitor

        Case FileMenu

        Case OptionsMenu

        Case HelpMenu

        Case Status

        Case Settings

        Case CurrentScene

        Case DebugFrame

        Case Stream1

        Case Stream2

        Case versionFrame

        Case FileMenuExit

        Case StreamFailTimerLB

        Case ServerPingLB

        Case UpdateIntervalLB

        Case Timer_FailLB

        Case Timer_Fail_CountLB

        Case tPingOutLB

        Case td_updateLB

        Case StreamFailDelayLB

        Case MultiCameraSwitchLB

        Case Stream_Fail_DelayLB

        Case MultiCameraSwitchStatusLB

        Case TimerLB

        Case TimerSnapshotLB

        Case td_displayLB2

        Case mouseXLB2

        Case mouseYLB2

        Case __ERRORLINELB2

        Case Debug_TimerLB

        Case Debug_Timer_SnapshotLB

        Case td_displayLB

        Case mouseXLB

        Case mouseYLB

        Case __ERRORLINELB

        Case StreamUptimeLB

        Case failLB

        Case Uptime_Stream_1LB

        Case Timer_Fail_Stream1LB

        Case Scene_CurrentLB

        Case PictureBox1

        Case StreamUptimeLB2

        Case failLB2

        Case Uptime_Stream_2LB

        Case Timer_Fail_Stream2LB

        Case OptionsMenuDebug

        Case HelpMenuVisitWebsite

        Case HelpMenuCheckForUpdates

        Case OptionsMenuFullscreen

        Case IndicatorLB

        Case HelpMenuAbout

        Case StatusLB

        Case PictureBoxLogoBottom

        Case StreamUptimeLB3

        Case StreamFailTimerLB2

        Case Stream_UptimeLB

        Case Stream_Fail_TimerLB

        Case Timer_Fail_Count_2LB

        Case IPPingLB

        Case tIPPingOutLB

        Case FailCount2LB

        Case FailCount1LB

        Case LowBRTimerLB

        Case br_countdownLB

        Case MSRateLB

        Case ms_playLB

        Case LowBitrateSceneLB

        Case Low_Bitrate_StatusLB

        Case MSRateLB2

        Case ms_playLB2

    End Select
End Sub

Sub __UI_KeyPress (id As Long)
    ' When this event is fired, __UI_KeyHit will contain the code of the key hit.
    ' You can change it and even cancel it by making it = 0
    Select Case id
        Case 0
    End Select
End Sub

Sub __UI_TextChanged (id As Long)
    Select Case id
        Case 0
    End Select
End Sub

Sub __UI_ValueChanged (id As Long)
    Select Case id
        Case 0
    End Select
End Sub

Sub __UI_FormResized

End Sub

' The following code has been manually added after InForm
Sub TIMEms (tout1#, plus, tsecondout)

    Timer(t1) Stop
    If tsecondout = 0 Then tout = "" Else tout_2 = ""
    tout2# = tout1#
    toutint# = Fix(tout2#)
    If tout1# >= 0 Then
        toutdec# = (tout2# - toutint#) + 1
        If plus Then tout = tout + "+"
    Else
        toutdec# = (tout2# - toutint#) - 1
        If toutint# = 0 Then tout = tout + "-"
    End If

    If tsecondout = 0 Then

        tout = tout + LTrim$(Str$(toutint#))
        If tout1# >= 0 Then tout = tout + "." + Mid$(LTrim$(Str$(toutdec#)), 3, 3) Else tout = tout + "." + Mid$(LTrim$(Str$(toutdec#)), 4, 3)
        If Len(Str$(toutdec#)) = 5 Then tout = tout + "0"
        If Len(Str$(toutdec#)) = 4 Then tout = tout + "00"
        If Len(Str$(toutdec#)) = 2 Then tout = tout + "000" ' Output to tout

    Else

        tout_2 = tout_2 + LTrim$(Str$(toutint#))
        If tout1# >= 0 Then tout_2 = tout_2 + "." + Mid$(LTrim$(Str$(toutdec#)), 3, 3) Else tout_2 = tout_2 + "." + Mid$(LTrim$(Str$(toutdec#)), 4, 3)
        If Len(Str$(toutdec#)) = 5 Then tout_2 = tout_2 + "0"
        If Len(Str$(toutdec#)) = 4 Then tout_2 = tout_2 + "00"
        If Len(Str$(toutdec#)) = 2 Then tout_2 = tout_2 + "000" ' Output to tout_2

    End If

    Timer(t1) On

End Sub

Sub calcbw (bout#, bits)

    Timer(t1) Stop
    bout = ""
    bout2# = bout#
    boutnodec = 0

    If bits = 0 Then
        Select Case bout2#
            Case Is < 1048576
                boutint# = bout2# / 1024
                boutm$ = "KB"
            Case Is < 1073741824
                boutint# = bout2# / 1048576
                boutm$ = "MB"
            Case Is >= 1073741824
                boutint# = bout2# / 1073741824
                boutm$ = "GB"
        End Select
        boutdec# = boutint# + 1
        boutint# = Fix(boutint#)
        bout = Str$(boutint#)
        If boutdec# = Fix(boutdec#) Then
            boutdec$ = "000"
        Else
            boutdec$ = Mid$(LTrim$(Str$(boutdec#)), InStr(LTrim$(Str$(boutdec#)), ".") + 1, 3)
        End If
        If Len(LTrim$(Str$(boutint#))) >= 5 Then
            boutdec$ = Left$(boutdec$, 1)
        Else
            If Len(boutdec$) = 2 Then boutdec$ = boutdec$ + "0"
            If Len(boutdec$) = 1 Then boutdec$ = boutdec$ + "00"
            If Len(boutdec$) = 0 Then boutdec$ = boutdec$ + "000"
        End If
        If bout# < 1073741824 Then boutdec$ = Left$(boutdec$, 2)
        bout = bout + "." + boutdec$ + " " + boutm$ ' Output to bout
    Else
        Select Case bout2#
            Case Is < 1048576
                boutint# = bout2# / 1024
                boutm$ = "Kb/s"
                boutnodec = 1
            Case Is < 1073741824
                boutint# = bout2# / 1048576
                boutm$ = "Mb/s"
            Case Is > 1073741824
                boutint# = bout2# / 1073741824
                boutm$ = "Gb/s"
        End Select
        boutdec# = boutint# + 1
        boutint# = Fix(boutint#)
        bout = Str$(boutint#)
        If boutdec# = Fix(boutdec#) Then
            boutdec$ = "00"
        Else
            boutdec$ = Mid$(LTrim$(Str$(boutdec#)), InStr(LTrim$(Str$(boutdec#)), ".") + 1, 2)
        End If
        If Len(LTrim$(Str$(boutint#))) >= 5 Then boutdec$ = Left$(boutdec$, 1)
        boutdec$ = "." + boutdec$
        If boutnodec = 1 Then boutdec$ = ""
        bout = bout + boutdec$ + " " + boutm$ ' Output to bout
    End If
    Timer(t1) On

End Sub

Function calc_srt$ (convertTime#, includeSec)

    Timer(t1) Stop
    If convertTime# > 3596400000 Then convertTime# = 3596400000
    t_hr = convertTime# \ 3600
    t_min = (convertTime# - (3600 * t_hr)) \ 60
    t_sec = (convertTime# - (3600 * t_hr)) - (t_min * 60)
    If Not leadingZero Then
        calc_srt$ = LTrim$(Str$(t_hr)) + "h " + LTrim$(Str$(t_min)) + "m "
        calc_srt_sec$ = ""
        If includeSec = 1 Then calc_srt_sec$ = LTrim$(Str$(t_sec)) + "s   "
    Else
        If t_hr < 10 Then calc_srt_hr_min$ = "0" + LTrim$(Str$(t_hr)) + "h " Else calc_srt_hr_min$ = LTrim$(Str$(t_hr)) + "h "
        If t_min < 10 Then calc_srt_hr_min$ = calc_srt_hr_min$ + "0" + LTrim$(Str$(t_min)) + "m " Else calc_srt$ = calc_srt_hr_min$ + LTrim$(Str$(t_min)) + "m "
        calc_srt$ = calc_srt_hr_min$
        calc_srt_sec$ = ""
        If includeSec = 1 Then If t_sec < 10 Then calc_srt_sec$ = "0" + LTrim$(Str$(t_sec)) + "s   " Else calc_srt_sec$ = LTrim$(Str$(t_sec)) + "s   "
    End If
    Timer(t1) On

End Function

Sub statusOutputToFile (outputMSG$)

    Timer(t1) Stop
    Open outputStatusFile For Output As #48
    Print #48, outputMSG$
    Close #48
    Timer(t1) On

End Sub

Sub statusBitrateToFile (outputBR$)

    Timer(t1) Stop
    Open outputBitrateFile For Output As #56
    Print #56, outputBR$
    Close #56
    Timer(t1) On

End Sub

Sub statusConnectionsLogToFile (outputCL$)

    Timer(t1) Stop
    Open outputConnectionsLogFile For Append As #60
    If outputCL$ = "" And LOF(60) Then
        Print #60, outputCL$
    ElseIf outputCL$ <> "" Then
        Print #60, "[" + Date$ + "] [" + Time$ + "] " + outputCL$
    End If
    Close #60
    Timer(t1) On

End Sub

Sub ErrorDisplay (ErrorTestVal)

    If Error_msg <> "" Then
        _Delay 1
        Cls , _RGB(1, 100, 200)

        ' Error 6 message
        If ErrorTestVal = 6 Then
            BSOD& = __imageMEM&("is_obs_open.png")
            _PutImage (195, 27)-(605, 90), BSOD&
            _FreeImage BSOD&
        End If

        BSOD& = __imageMEM&("face_sad_x.png")
        _PutImage (24, 46)-(81, 158), BSOD&
        _FreeImage BSOD&
        Color _RGB(254, 254, 254), _RGB(1, 100, 200)
        _PrintString (16, 12 * 18), "> Test #" + _Trim$(Str$(ErrorTestVal)) + " of 10 failed"
        If InStr(Error_msg, Chr$(10)) >= 1 Then
            _PrintString (16, 14 * 18), Left$(Error_msg, InStr(Error_msg, Chr$(10)) - 1)
            _PrintString (16, 15 * 18), Mid$(Error_msg, InStr(Error_msg, Chr$(10)) + 1)
            _PrintString (16, 16 * 18), Mid$(Error_msg_3, 1)
            Sound 440, 1.5
        Else
            _PrintString (16, 14 * 18), Error_msg
        End If
        _PrintString (16, 20 * 18), "Program will exit shortly or press any key to exit now..."
        _PrintString (645, 21 * 18), "Loopy SRT Monitor v" + Ver + ""
        _Display
        _Delay 0.5
        If HTTP_Enabled And HTTP_Auto_Open <> "false" Then If OS = "WINDOWS" And _FileExists(HTTP_File) Then Shell "%ComSpec% /C START " + c34 + c34 + " /MIN " + "taskkill /IM " + c34 + HTTP_Filename + c34 + " /F"
        Error_msg_3 = ""
        For Error_Exit = 1 To 120
            _Delay 0.5
            If _Exit Then System
            If InKey$ <> "" Then System
        Next
        System
    End If

End Sub

Function GetKey$ (keyname As String, JSON As String)
    ' Credit to SpriggsySpriggs
    Dim jkey As String
    If InStr(JSON, Chr$(34) + keyname + Chr$(34)) Then
        jkey = Mid$(JSON, InStr(JSON, Chr$(34) + keyname + Chr$(34)) + Len(keyname))
        jkey = Mid$(jkey, InStr(jkey, ":") + 2)
        If Mid$(jkey, 1, 1) = Chr$(34) Then
            jkey = Mid$(jkey, 2)
        End If
        jkey = Mid$(jkey, 1, InStr(jkey, Chr$(34)) - 1)
        If Right$(jkey, 1) = "," Then
            jkey = Mid$(jkey, 1, Len(jkey) - 1)
        End If
    Else
        GetKey = ""
    End If
    GetKey = jkey
End Function

Function GetKeyRestreamer$ (keyname As String, JSON As String)
    ' Credit to SpriggsySpriggs
    Dim jkey As String
    If InStr(JSON, Chr$(34) + keyname + Chr$(34)) Then
        jkey = Mid$(JSON, InStr(JSON, Chr$(34) + keyname + Chr$(34)) + Len(keyname))
        jkey = Mid$(jkey, InStr(jkey, ":") + 1)
        If Mid$(jkey, 1, 1) = Chr$(34) Then
            jkey = Mid$(jkey, 2)
        End If
        jkey = Mid$(jkey, 1, InStr(jkey, Chr$(34)) - 1)
        If Right$(jkey, 1) = "," Then
            jkey = Mid$(jkey, 1, Len(jkey) - 1)
        End If
    Else
        GetKeyRestreamer$ = ""
    End If
    GetKeyRestreamer$ = jkey
End Function

Sub GetAllKey (keyname As String, JSON As String, ParseKey() As String)
    ' Credit to SpriggsySpriggs
    Dim jkey As String
    Dim x_JSON
    Do
        If InStr(JSON, Chr$(34) + keyname + Chr$(34)) Then
            x_JSON = x_JSON + 1
            ReDim _Preserve ParseKey(x_JSON) As String
            JSON = Mid$(JSON, InStr(JSON, Chr$(34) + keyname + Chr$(34)) + Len(keyname))
            jkey = JSON
            jkey = Mid$(jkey, InStr(jkey, ":") + 2)
            If Mid$(jkey, 1, 1) = Chr$(34) Then
                jkey = Mid$(jkey, 2)
            End If
            jkey = Mid$(jkey, 1, InStr(jkey, Chr$(34)) - 1)
            If Right$(jkey, 1) = "," Then
                jkey = Mid$(jkey, 1, Len(jkey) - 1)
            End If
            ParseKey(x_JSON) = jkey
        End If
    Loop Until InStr(JSON, Chr$(34) + keyname + Chr$(34)) = 0
End Sub

Sub GetAllKeyRestreamer (keyname As String, JSON As String, ParseKey() As String)
    ' Credit to SpriggsySpriggs
    Dim jkey As String
    Dim x_JSON
    Do
        If InStr(JSON, Chr$(34) + keyname + Chr$(34)) Then
            x_JSON = x_JSON + 1
            ReDim _Preserve ParseKey(x_JSON) As String
            JSON = Mid$(JSON, InStr(JSON, Chr$(34) + keyname + Chr$(34)) + Len(keyname))
            jkey = JSON
            jkey = Mid$(jkey, InStr(jkey, ":") + 1)
            If Mid$(jkey, 1, 1) = Chr$(34) Then
                jkey = Mid$(jkey, 2)
            End If
            jkey = Mid$(jkey, 1, InStr(jkey, Chr$(34)) - 1)
            If Right$(jkey, 1) = "," Then
                jkey = Mid$(jkey, 1, Len(jkey) - 1)
            End If
            ParseKey(x_JSON) = jkey
        End If
    Loop Until InStr(JSON, Chr$(34) + keyname + Chr$(34)) = 0
End Sub

Sub GetAllKeyXML (keyname_XML As String, XML As String, ParseKeyXML() As String)
    ' Credit to SpriggsySpriggs
    Dim jkey_XML As String
    Dim x_XML
    Do
        If InStr(XML, Chr$(60) + keyname_XML + Chr$(62)) Then
            x_XML = x_XML + 1
            ReDim _Preserve ParseKeyXML(x_XML) As String
            XML = Mid$(XML, InStr(XML, Chr$(60) + keyname_XML + Chr$(62)) + Len(keyname_XML))
            jkey_XML = XML
            jkey_XML = Mid$(jkey_XML, InStr(jkey_XML, ">") + 1)
            If Mid$(jkey_XML, 1, 1) = Chr$(34) Then
                jkey_XML = Mid$(jkey_XML, 2)
            End If
            jkey_XML = Mid$(jkey_XML, 1, InStr(jkey_XML, Chr$(60)) - 1)
            If Right$(jkey_XML, 2) = "</" Then
                jkey_XML = Mid$(jkey_XML, 1, Len(jkey_XML) - 1)
            End If
            ParseKeyXML(x_XML) = jkey_XML
        End If
    Loop Until InStr(XML, Chr$(60) + keyname_XML + Chr$(62)) = 0
End Sub

Sub http_client_connect (HTTP_Mode$, HTTP_Scene$)

    On Error GoTo App_Fail
    App_Refresh = TRUE

    HTTP_Timer_GET = 0: HTTP_GET_a = "": HTTP_GET_a2 = "": HTTP_GET_i = 0: HTTP_GET_i2 = 0: HTTP_GET_i3 = 0: HTTP_GET_l = 0: HTTP_GET_d = "": HTTP_GET_d_2 = ""
    GetCurrentProgramScene.tmp = "": GetMediaInputStatus.tmp = "": GetVersion.tmp = ""

    ' Open client every x seconds (v1.1.0)
    http_connect_timer = http_connect_timer + 1
    If http_connect_timer >= 30 Or LCase$(HTTP_Mode$) = "get" Or LCase$(HTTP_Mode$) = "getmedia" Or LCase$(HTTP_Mode$) = "getversion" Then http_connect_timer = 1: Close http_client

    If http_connect_timer = 1 Then
        HTTP_Port_Client = "TCP/IP:" + HTTP_Bind_Port + ":"
        http_client = _OpenClient(HTTP_Port_Client + HTTP_Bind_Address)
        If http_client = 0 Then RefreshDisplayRequest = TRUE: Error_msg$ = "- Unable to connect, check if " + c34 + HTTP_Bind_Address + ":" + HTTP_Bind_Port + c34 + " is correct." + Chr$(10) + "- Program is unable to connect to " + c34 + "obs-websocket-http" + c34 + ". (Error: #15)": _Delay 3: Exit Sub
    End If

    Select Case LCase$(HTTP_Mode$)
        Case "set"
            ' Mode "Set", to change scene
            HTTP_Data = "{" + c34 + "sceneName" + c34 + ":" + c34 + HTTP_Scene$ + c34 + "}"

            HTTP_Header = ""
            HTTP_Header = HTTP_Header + "POST /emit/SetCurrentProgramScene HTTP/1.1" + SLS_EOL
            HTTP_Header = HTTP_Header + "Host: " + HTTP_Bind_Address + ":" + HTTP_Bind_Port + SLS_EOL
            HTTP_Header = HTTP_Header + "User-Agent: curl/7.88.1" + SLS_EOL
            HTTP_Header = HTTP_Header + "Accept: */*" + SLS_EOL
            HTTP_Header = HTTP_Header + "Authorization: " + HTTP_Auth_Key + SLS_EOL
            HTTP_Header = HTTP_Header + "Content-type: application/json" + SLS_EOL
            HTTP_Header = HTTP_Header + "Content-Length: " + _Trim$(Str$(Len(HTTP_Data))) + SLS_EOL + SLS_EOL
            HTTP_Header = HTTP_Header + HTTP_Data

            ' Reset timer and delay if connection was not established, else Put will cause a program error
            If http_client = 0 Then http_connect_timer = 99: _Delay 1

            Put #http_client, , HTTP_Header
            'Close http_client
            Exit Sub
        Case "get"
            ' Mode "Get", to get scene
            HTTP_Timer_GET = 0: HTTP_GET_a = "": HTTP_GET_a2 = "": HTTP_GET_i = 0: HTTP_GET_i2 = 0: HTTP_GET_i3 = 0: HTTP_GET_l = 0: HTTP_GET_d = "": HTTP_GET_d_2 = ""
            GetCurrentProgramScene.tmp = ""

            HTTP_Header = ""
            HTTP_Header = HTTP_Header + "POST /call/GetCurrentProgramScene HTTP/1.1" + SLS_EOL
            HTTP_Header = HTTP_Header + "Host: " + HTTP_Bind_Address + ":" + HTTP_Bind_Port + SLS_EOL
            HTTP_Header = HTTP_Header + "User-Agent: curl/7.88.1" + SLS_EOL
            HTTP_Header = HTTP_Header + "Accept: */*" + SLS_EOL
            HTTP_Header = HTTP_Header + "Authorization: " + HTTP_Auth_Key + SLS_EOL
            HTTP_Header = HTTP_Header + "Content-type: application/json" + SLS_EOL + SLS_EOL

            Put #http_client, , HTTP_Header

            ' Grab data
            HTTP_Timer_GET = Timer
            Do
                _Delay 0.01
                Get #http_client, , HTTP_GET_a2
                HTTP_GET_a = HTTP_GET_a + HTTP_GET_a2
                HTTP_GET_i = InStr(HTTP_GET_a, "Content-Length:")
                If HTTP_GET_i Then
                    HTTP_GET_i2 = InStr(HTTP_GET_i, HTTP_GET_a, SLS_EOL)
                    If HTTP_GET_i2 Then
                        HTTP_GET_l = Val(Mid$(HTTP_GET_a, HTTP_GET_i + 15, HTTP_GET_i2 - HTTP_GET_i - 14))
                        HTTP_GET_i3 = InStr(HTTP_GET_i2, HTTP_GET_a, SLS_EOL + SLS_EOL)
                        If HTTP_GET_i3 Then
                            HTTP_GET_i3 = HTTP_GET_i3 + 4 'move i3 to start of data
                            If (Len(HTTP_GET_a) - HTTP_GET_i3 + 1) = HTTP_GET_l Then
                                'Close http_client ' CLOSE CLIENT
                                HTTP_GET_d = Mid$(HTTP_GET_a, HTTP_GET_i3, HTTP_GET_l)
                                Exit Do
                            End If ' available data = l
                        End If ' i3
                    End If ' i2
                End If ' i
            Loop Until Timer > HTTP_Timer_GET + 2 ' 2 second timeout
            'Close http_client

            ' Store json data in GetCurrentProgramScene.tmp
            GetCurrentProgramScene.tmp = HTTP_GET_d
            Exit Sub
        Case "getmedia"
            ' Mode "GetMedia", to get scene
            HTTP_Timer_GET = 0: HTTP_GET_a = "": HTTP_GET_a2 = "": HTTP_GET_i = 0: HTTP_GET_i2 = 0: HTTP_GET_i3 = 0: HTTP_GET_l = 0: HTTP_GET_d = "": HTTP_GET_d_2 = ""
            GetMediaInputStatus.tmp = ""

            HTTP_Data = "{" + c34 + "inputName" + c34 + ":" + c34 + HTTP_Scene$ + c34 + "}"

            HTTP_Header = ""
            HTTP_Header = HTTP_Header + "POST /call/GetMediaInputStatus HTTP/1.1" + SLS_EOL
            HTTP_Header = HTTP_Header + "Host: " + HTTP_Bind_Address + ":" + HTTP_Bind_Port + SLS_EOL
            HTTP_Header = HTTP_Header + "User-Agent: curl/7.88.1" + SLS_EOL
            HTTP_Header = HTTP_Header + "Accept: */*" + SLS_EOL
            HTTP_Header = HTTP_Header + "Authorization: " + HTTP_Auth_Key + SLS_EOL
            HTTP_Header = HTTP_Header + "Content-type: application/json" + SLS_EOL
            HTTP_Header = HTTP_Header + "Content-Length: " + _Trim$(Str$(Len(HTTP_Data))) + SLS_EOL + SLS_EOL
            HTTP_Header = HTTP_Header + HTTP_Data

            Put #http_client, , HTTP_Header

            ' Grab data
            HTTP_Timer_GET = Timer
            Do
                _Delay 0.01
                Get #http_client, , HTTP_GET_a2
                HTTP_GET_a = HTTP_GET_a + HTTP_GET_a2
                HTTP_GET_i = InStr(HTTP_GET_a, "Content-Length:")
                If HTTP_GET_i Then
                    HTTP_GET_i2 = InStr(HTTP_GET_i, HTTP_GET_a, SLS_EOL)
                    If HTTP_GET_i2 Then
                        HTTP_GET_l = Val(Mid$(HTTP_GET_a, HTTP_GET_i + 15, HTTP_GET_i2 - HTTP_GET_i - 14))
                        HTTP_GET_i3 = InStr(HTTP_GET_i2, HTTP_GET_a, SLS_EOL + SLS_EOL)
                        If HTTP_GET_i3 Then
                            HTTP_GET_i3 = HTTP_GET_i3 + 4 'move i3 to start of data
                            If (Len(HTTP_GET_a) - HTTP_GET_i3 + 1) = HTTP_GET_l Then
                                'Close http_client ' CLOSE CLIENT
                                HTTP_GET_d = Mid$(HTTP_GET_a, HTTP_GET_i3, HTTP_GET_l)
                                Exit Do
                            End If ' available data = l
                        End If ' i3
                    End If ' i2
                End If ' i
            Loop Until Timer > HTTP_Timer_GET + 2 ' 2 second timeout
            'Close http_client

            ' Store json data in GetMediaInputStatus.tmp
            GetMediaInputStatus.tmp = HTTP_GET_d
            Exit Sub
        Case "getversion"
            ' Mode "GetVersion", to get current version
            HTTP_Timer_GET = 0: HTTP_GET_a = "": HTTP_GET_a2 = "": HTTP_GET_i = 0: HTTP_GET_i2 = 0: HTTP_GET_i3 = 0: HTTP_GET_l = 0: HTTP_GET_d = "": HTTP_GET_d_2 = ""
            GetVersion.tmp = ""

            HTTP_Header = ""
            HTTP_Header = HTTP_Header + "POST /call/GetVersion HTTP/1.1" + SLS_EOL
            HTTP_Header = HTTP_Header + "Host: " + HTTP_Bind_Address + ":" + HTTP_Bind_Port + SLS_EOL
            HTTP_Header = HTTP_Header + "User-Agent: curl/7.88.1" + SLS_EOL
            HTTP_Header = HTTP_Header + "Accept: */*" + SLS_EOL
            HTTP_Header = HTTP_Header + "Authorization: " + HTTP_Auth_Key + SLS_EOL
            HTTP_Header = HTTP_Header + "Content-type: application/json" + SLS_EOL + SLS_EOL

            Put #http_client, , HTTP_Header

            ' Grab data
            HTTP_Timer_GET = Timer
            Do
                _Delay 0.01
                Get #http_client, , HTTP_GET_a2
                HTTP_GET_a = HTTP_GET_a + HTTP_GET_a2
                HTTP_GET_i = InStr(HTTP_GET_a, "Content-Length:")
                If HTTP_GET_i Then
                    HTTP_GET_i2 = InStr(HTTP_GET_i, HTTP_GET_a, SLS_EOL)
                    If HTTP_GET_i2 Then
                        HTTP_GET_l = Val(Mid$(HTTP_GET_a, HTTP_GET_i + 15, HTTP_GET_i2 - HTTP_GET_i - 14))
                        HTTP_GET_i3 = InStr(HTTP_GET_i2, HTTP_GET_a, SLS_EOL + SLS_EOL)
                        If HTTP_GET_i3 Then
                            HTTP_GET_i3 = HTTP_GET_i3 + 4 'move i3 to start of data
                            If (Len(HTTP_GET_a) - HTTP_GET_i3 + 1) = HTTP_GET_l Then
                                'Close http_client ' CLOSE CLIENT
                                HTTP_GET_d = Mid$(HTTP_GET_a, HTTP_GET_i3, HTTP_GET_l)
                                Exit Do
                            End If ' available data = l
                        End If ' i3
                    End If ' i2
                End If ' i
            Loop Until Timer > HTTP_Timer_GET + 2 ' 2 second timeout
            'Close http_client

            ' Store json data in GetVersion.tmp
            GetVersion.tmp = HTTP_GET_d
            Exit Sub

    End Select

End Sub

Sub sls_client_connect

    ' Reset SLS data
    SLS_GET_a = "": SLS_GET_a2 = "": SLS_GET_i = 0: SLS_GET_i2 = 0: SLS_GET_i3 = 0: SLS_GET_l = 0: SLS_GET_d = "": sls_stats.xml = ""
    If __SLS_1_Enabled Then SLS_Bitrate1 = 0
    If __SLS_2_Enabled Then SLS_Bitrate2 = 0
    SLS_streams_found = 0: SLS_Uptime1 = 0: SLS_Uptime2 = 0: SLS_streams_seek = 0

    On Error GoTo App_Fail
    App_Refresh = TRUE

    ' Open client every x seconds to prevent program freezing every second with high pings (v1.1.0)
    If SLS_Server_KeepAlive1 <> 0 Then
        OpenClient_Interval_1 = SLS_Server_KeepAlive1
    Else
        If BELABOX_1_Found Then OpenClient_Interval_1 = KeepAlive_BELABOX_Default Else OpenClient_Interval_1 = KeepAlive_SLS_Default
    End If

    sls_connect_timer_1 = sls_connect_timer_1 + 1
    If sls_connect_timer_1 >= OpenClient_Interval_1 Then sls_connect_timer_1 = 1: Close sls_client
    If sls_connect_timer_1 = 1 Then

        SLS_Ping1 = Timer(.001)

        sls_client = _OpenClient(SLS_Port_Client + SLS_Server_IP)

        If sls_client = 0 Then RefreshDisplayRequest = TRUE: Error_msg$ = "- Unable to connect, check if " + c34 + SLS_Server_IP + ":" + SLS_Server_Port + c34 + " is correct." + Chr$(10) + "- Program is unable to read the SLS /" + Left$(SLS_Stats, 20) + " URL from its http server. (Error: #4)": _Delay 3: Exit Sub

        SLS_Ping2 = Timer(.001)
        SLS_PingOut = (SLS_Ping2 - SLS_Ping1)

    End If

    ' Reset timer and delay if connection was not established, else Put will cause a program error
    If sls_client = 0 Then sls_connect_timer_1 = 99: _Delay 3

    Put #sls_client, , SLS_Header

    ' Connect to SRT Live Server and grab json data
    SLS_Timer_GET = Timer
    Do
        _Delay 0.01
        Get #sls_client, , SLS_GET_a2
        SLS_GET_a = SLS_GET_a + SLS_GET_a2
        SLS_GET_i = InStr(SLS_GET_a, "Content-Length:")
        If SLS_GET_i Then
            SLS_GET_i2 = InStr(SLS_GET_i, SLS_GET_a, SLS_EOL)
            If SLS_GET_i2 Then
                SLS_GET_l = Val(Mid$(SLS_GET_a, SLS_GET_i + 15, SLS_GET_i2 - SLS_GET_i - 14))
                SLS_GET_i3 = InStr(SLS_GET_i2, SLS_GET_a, SLS_EOL + SLS_EOL)
                If SLS_GET_i3 Then
                    SLS_GET_i3 = SLS_GET_i3 + 4 'move i3 to start of data
                    If (Len(SLS_GET_a) - SLS_GET_i3 + 1) = SLS_GET_l Then
                        'Close sls_client ' CLOSE CLIENT
                        SLS_GET_d = Mid$(SLS_GET_a, SLS_GET_i3, SLS_GET_l)
                        Exit Do
                    End If ' available data = l
                End If ' i3
            End If ' i2
        End If ' i
    Loop Until Timer > SLS_Timer_GET + 3 ' 3 second timeout
    'Close sls_client

    ' Store json data in sls_stats.xml
    sls_stats.xml = SLS_GET_d

End Sub

Sub sls_client_connect_2 ' SLS 2nd IP

    ' Reset SLS data
    SLS_GET_a = "": SLS_GET_a2 = "": SLS_GET_i = 0: SLS_GET_i2 = 0: SLS_GET_i3 = 0: SLS_GET_l = 0: SLS_GET_d_2 = "": sls_stats_2.xml = ""
    If __SLS_1_Enabled Then SLS_Bitrate1 = 0
    If __SLS_2_Enabled Then SLS_Bitrate2 = 0
    SLS_streams_found = 0: SLS_Uptime1 = 0: SLS_Uptime2 = 0: SLS_streams_seek = 0

    On Error GoTo App_Fail
    App_Refresh = TRUE

    ' Open client every x seconds to prevent program freezing every second with high pings (v1.1.0)
    If SLS_Server_KeepAlive2 <> 0 Then
        OpenClient_Interval_2 = SLS_Server_KeepAlive2
    Else
        If BELABOX_2_Found Then OpenClient_Interval_2 = KeepAlive_BELABOX_Default Else OpenClient_Interval_2 = KeepAlive_SLS_Default
    End If

    sls_connect_timer_2 = sls_connect_timer_2 + 1
    If sls_connect_timer_2 >= OpenClient_Interval_2 Then sls_connect_timer_2 = 1: Close sls_client_2
    If sls_connect_timer_2 = 1 Then

        SLS_Ping1_2 = Timer(.001)

        sls_client_2 = _OpenClient(SLS_Port_Client_2 + SLS_Server_IP_2)

        If sls_client_2 = 0 Then RefreshDisplayRequest = TRUE: Error_msg$ = "- Unable to connect, check if " + c34 + SLS_Server_IP_2 + ":" + SLS_Server_Port_2 + c34 + " is correct." + Chr$(10) + "- Program is unable to read the SLS /" + Left$(SLS_Stats_2, 20) + " URL from its http server. (Error: #13)": _Delay 3: Exit Sub

        SLS_Ping2_2 = Timer(.001)
        SLS_PingOut_2 = (SLS_Ping2_2 - SLS_Ping1_2)

    End If

    ' Reset timer and delay if connection was not established, else Put will cause a program error
    If sls_client_2 = 0 Then sls_connect_timer_2 = 99: _Delay 3

    Put #sls_client_2, , SLS_Header_2

    ' Connect to SRT Live Server and grab json data
    SLS_Timer_GET = Timer
    Do
        _Delay 0.01
        Get #sls_client_2, , SLS_GET_a2
        SLS_GET_a = SLS_GET_a + SLS_GET_a2
        SLS_GET_i = InStr(SLS_GET_a, "Content-Length:")
        If SLS_GET_i Then
            SLS_GET_i2 = InStr(SLS_GET_i, SLS_GET_a, SLS_EOL)
            If SLS_GET_i2 Then
                SLS_GET_l = Val(Mid$(SLS_GET_a, SLS_GET_i + 15, SLS_GET_i2 - SLS_GET_i - 14))
                SLS_GET_i3 = InStr(SLS_GET_i2, SLS_GET_a, SLS_EOL + SLS_EOL)
                If SLS_GET_i3 Then
                    SLS_GET_i3 = SLS_GET_i3 + 4 'move i3 to start of data
                    If (Len(SLS_GET_a) - SLS_GET_i3 + 1) = SLS_GET_l Then
                        'Close sls_client_2 ' CLOSE CLIENT
                        SLS_GET_d_2 = Mid$(SLS_GET_a, SLS_GET_i3, SLS_GET_l)
                        Exit Do
                    End If ' available data = l
                End If ' i3
            End If ' i2
        End If ' i
    Loop Until Timer > SLS_Timer_GET + 3 ' 3 second timeout
    'Close sls_client_2

    ' Store json data in sls_stats_2.xml
    sls_stats_2.xml = SLS_GET_d_2

End Sub

Sub restreamer_client_connect

    ' Reset RESTREAMER data
    RESTREAMER_GET_a = "": RESTREAMER_GET_a2 = "": RESTREAMER_GET_i = 0: RESTREAMER_GET_i2 = 0: RESTREAMER_GET_i3 = 0: RESTREAMER_GET_l = 0: RESTREAMER_GET_d = "": restreamer_stats.xml = "": RESTREAMER_Bitrate1 = 0: RESTREAMER_Bitrate2 = 0
    RESTREAMER_streams_found = 0: RESTREAMER_streams_seek = 0
    restreamer_token.xml = ""

    On Error GoTo App_Fail
    App_Refresh = TRUE

    ' Open client every x seconds to prevent program freezing every second with high pings (v1.1.1)
    If RESTREAMER_Server_KeepAlive <> 0 Then
        OpenClient_Interval_RESTREAMER = RESTREAMER_Server_KeepAlive
    Else
        OpenClient_Interval_RESTREAMER = KeepAlive_RESTREAMER_Default
    End If

    restreamer_connect_timer = restreamer_connect_timer + 1
    If restreamer_connect_timer >= OpenClient_Interval_RESTREAMER Then restreamer_connect_timer = 1: Close restreamer_client
    If restreamer_connect_timer = 1 Then

        RESTREAMER_Ping1 = Timer(.001)

        restreamer_client = _OpenClient(RESTREAMER_Port_Client + RESTREAMER_Server_IP)

        If restreamer_client = 0 Then RefreshDisplayRequest = TRUE: Error_msg$ = "- Unable to connect, check if " + c34 + RESTREAMER_Server_IP + ":" + RESTREAMER_Server_Port + c34 + " is correct." + Chr$(10) + "- Program is unable to read the RESTREAMER stats URL from its http server. (Error: #16)": _Delay 3: Exit Sub

        RESTREAMER_Ping2 = Timer(.001)
        RESTREAMER_PingOut = (RESTREAMER_Ping2 - RESTREAMER_Ping1)

    End If

    ' Reset timer and delay if connection was not established, else Put will cause a program error
    If restreamer_client = 0 Then restreamer_connect_timer = 99: _Delay 3



    ' Get RESTREAMER token ---------------------------------------------------------------------------------------------------------- BEGIN

    restreamer_client = _OpenClient(RESTREAMER_Port_Client + RESTREAMER_Server_IP)

    RESTREAMER_Data = "{" + c34 + "username" + c34 + ":" + c34 + RESTREAMER_Username + c34 + "," + c34 + "password" + c34 + ":" + c34 + RESTREAMER_Password + c34 + "}"

    RESTREAMER_Header = ""
    RESTREAMER_Header = RESTREAMER_Header + "POST /api/login HTTP/1.1" + RESTREAMER_EOL
    RESTREAMER_Header = RESTREAMER_Header + "Host: " + RESTREAMER_Server_IP + ":" + RESTREAMER_Server_Port + RESTREAMER_EOL
    RESTREAMER_Header = RESTREAMER_Header + "User-Agent: curl/7.88.1" + RESTREAMER_EOL
    RESTREAMER_Header = RESTREAMER_Header + "Accept: */*" + RESTREAMER_EOL
    RESTREAMER_Header = RESTREAMER_Header + "Content-type: application/json" + RESTREAMER_EOL
    RESTREAMER_Header = RESTREAMER_Header + "Content-Length: " + _Trim$(Str$(Len(RESTREAMER_Data))) + RESTREAMER_EOL + RESTREAMER_EOL
    RESTREAMER_Header = RESTREAMER_Header + RESTREAMER_Data

    ' Reset timer and delay if connection was not established, else Put will cause a program error
    If restreamer_client = 0 Then restreamer_connect_timer = 99: _Delay 1

    Put #restreamer_client, , RESTREAMER_Header
    'Close restreamer_client

    ' Reset RESTREAMER data
    RESTREAMER_GET_a = "": RESTREAMER_GET_a2 = "": RESTREAMER_GET_i = 0: RESTREAMER_GET_i2 = 0: RESTREAMER_GET_i3 = 0: RESTREAMER_GET_l = 0: RESTREAMER_GET_d = "": restreamer_stats.xml = "": RESTREAMER_Bitrate1 = 0: RESTREAMER_Bitrate2 = 0
    RESTREAMER_streams_found = 0: RESTREAMER_streams_seek = 0
    restreamer_token.xml = ""

    ' Connect to RESTREAMER Live Server and grab json data
    RESTREAMER_Timer_GET = Timer
    Do
        _Delay 0.01
        Get #restreamer_client, , RESTREAMER_GET_a2
        RESTREAMER_GET_a = RESTREAMER_GET_a + RESTREAMER_GET_a2
        RESTREAMER_GET_i = InStr(RESTREAMER_GET_a, "Content-Length:")
        If RESTREAMER_GET_i Then
            RESTREAMER_GET_i2 = InStr(RESTREAMER_GET_i, RESTREAMER_GET_a, RESTREAMER_EOL)
            If RESTREAMER_GET_i2 Then
                RESTREAMER_GET_l = Val(Mid$(RESTREAMER_GET_a, RESTREAMER_GET_i + 15, RESTREAMER_GET_i2 - RESTREAMER_GET_i - 14))
                RESTREAMER_GET_i3 = InStr(RESTREAMER_GET_i2, RESTREAMER_GET_a, RESTREAMER_EOL + RESTREAMER_EOL)
                If RESTREAMER_GET_i3 Then
                    RESTREAMER_GET_i3 = RESTREAMER_GET_i3 + 4 'move i3 to start of data
                    If (Len(RESTREAMER_GET_a) - RESTREAMER_GET_i3 + 1) = RESTREAMER_GET_l Then
                        'Close restreamer_client ' CLOSE CLIENT
                        RESTREAMER_GET_d = Mid$(RESTREAMER_GET_a, RESTREAMER_GET_i3, RESTREAMER_GET_l)
                        Exit Do
                    End If ' available data = l
                End If ' i3
            End If ' i2
        End If ' i
    Loop Until Timer > RESTREAMER_Timer_GET + 2 ' 2 second timeout
    'Close restreamer_client

    ' Store json data in restreamer_token.xml
    restreamer_token.xml = RESTREAMER_GET_d

    restreamer_token.xml = GetKeyRestreamer("access_token", restreamer_token.xml)

    ' Get RESTREAMER token ---------------------------------------------------------------------------------------------------------- END




    RESTREAMER_Header = ""
    RESTREAMER_Header = RESTREAMER_Header + "GET /api/v3/session/active?collectors=" + RESTREAMER_Stats + " HTTP/1.1" + RESTREAMER_EOL
    RESTREAMER_Header = RESTREAMER_Header + "Host: " + RESTREAMER_Server_IP + ":" + RESTREAMER_Server_Port + RESTREAMER_EOL
    RESTREAMER_Header = RESTREAMER_Header + "User-Agent: curl/7.88.1" + RESTREAMER_EOL
    RESTREAMER_Header = RESTREAMER_Header + "Accept: application/json" + RESTREAMER_EOL
    RESTREAMER_Header = RESTREAMER_Header + "Authorization: Bearer " + restreamer_token.xml + RESTREAMER_EOL
    RESTREAMER_Header = RESTREAMER_Header + RESTREAMER_EOL

    RESTREAMER_Port_Client = "TCP/IP:" + RESTREAMER_Server_Port + ":"



    ' Reset RESTREAMER data
    RESTREAMER_GET_a = "": RESTREAMER_GET_a2 = "": RESTREAMER_GET_i = 0: RESTREAMER_GET_i2 = 0: RESTREAMER_GET_i3 = 0: RESTREAMER_GET_l = 0: RESTREAMER_GET_d = "": restreamer_stats.xml = "": RESTREAMER_Bitrate1 = 0: RESTREAMER_Bitrate2 = 0
    RESTREAMER_streams_found = 0: RESTREAMER_streams_seek = 0

    On Error GoTo App_Fail
    App_Refresh = TRUE



    ' For code 401
    ' Open client every x seconds to prevent program freezing every second with high pings (v1.1.1)
    If RESTREAMER_Server_KeepAlive <> 0 Then
        OpenClient_Interval_RESTREAMER = RESTREAMER_Server_KeepAlive
    Else
        OpenClient_Interval_RESTREAMER = KeepAlive_RESTREAMER_Default
    End If

    If restreamer_connect_timer >= OpenClient_Interval_RESTREAMER Then restreamer_connect_timer = 1: Close restreamer_client
    If restreamer_connect_timer = 1 Then

        RESTREAMER_Ping1 = Timer(.001)

        restreamer_client = _OpenClient(RESTREAMER_Port_Client + RESTREAMER_Server_IP)

        If restreamer_client = 0 Then RefreshDisplayRequest = TRUE: Error_msg$ = "- Unable to connect, check if " + c34 + RESTREAMER_Server_IP + ":" + RESTREAMER_Server_Port + c34 + " is correct." + Chr$(10) + "- Program is unable to read the RESTREAMER stats URL from its http server. (Error: #16)": _Delay 3: Exit Sub

        RESTREAMER_Ping2 = Timer(.001)
        RESTREAMER_PingOut = (RESTREAMER_Ping2 - RESTREAMER_Ping1)

    End If

    ' Reset timer and delay if connection was not established, else Put will cause a program error
    If restreamer_client = 0 Then restreamer_connect_timer = 99: _Delay 3



    Put #restreamer_client, , RESTREAMER_Header

    ' Connect to RESTREAMER Live Server and grab json data
    RESTREAMER_Timer_GET = Timer
    Do
        _Delay 0.01
        Get #restreamer_client, , RESTREAMER_GET_a2
        RESTREAMER_GET_a = RESTREAMER_GET_a + RESTREAMER_GET_a2
        RESTREAMER_GET_i = InStr(RESTREAMER_GET_a, "Content-Length:")
        If RESTREAMER_GET_i Then
            RESTREAMER_GET_i2 = InStr(RESTREAMER_GET_i, RESTREAMER_GET_a, RESTREAMER_EOL)
            If RESTREAMER_GET_i2 Then
                RESTREAMER_GET_l = Val(Mid$(RESTREAMER_GET_a, RESTREAMER_GET_i + 15, RESTREAMER_GET_i2 - RESTREAMER_GET_i - 14))
                RESTREAMER_GET_i3 = InStr(RESTREAMER_GET_i2, RESTREAMER_GET_a, RESTREAMER_EOL + RESTREAMER_EOL)
                If RESTREAMER_GET_i3 Then
                    RESTREAMER_GET_i3 = RESTREAMER_GET_i3 + 4 'move i3 to start of data
                    If (Len(RESTREAMER_GET_a) - RESTREAMER_GET_i3 + 1) = RESTREAMER_GET_l Then
                        'Close restreamer_client ' CLOSE CLIENT
                        RESTREAMER_GET_d = Mid$(RESTREAMER_GET_a, RESTREAMER_GET_i3, RESTREAMER_GET_l)
                        Exit Do
                    End If ' available data = l
                End If ' i3
            End If ' i2
        End If ' i
    Loop Until Timer > RESTREAMER_Timer_GET + 2 ' 2 second timeout
    'Close restreamer_client

    ' Store json data in restreamer_stats.xml
    restreamer_stats.xml = RESTREAMER_GET_d

End Sub

Sub rtmp_client_connect

    ' Reset RTMP data
    RTMP_GET_a = "": RTMP_GET_a2 = "": RTMP_GET_i = 0: RTMP_GET_i2 = 0: RTMP_GET_i3 = 0: RTMP_GET_l = 0: RTMP_GET_d = "": rtmp_stats.xml = "": RTMP_Bitrate1 = 0: RTMP_Bitrate2 = 0
    RTMP_streams_found = 0: RTMP_Uptime1 = 0: RTMP_Uptime2 = 0: RTMP_streams_seek = 0

    On Error GoTo App_Fail
    App_Refresh = TRUE

    ' Open client every x seconds (v1.1.0)
    If RTMP_Server_KeepAlive <> 0 Then
        OpenClient_Interval_RTMP = RTMP_Server_KeepAlive
    Else
        OpenClient_Interval_RTMP = KeepAlive_RTMP_Server_Default
    End If
    rtmp_connect_timer = rtmp_connect_timer + 1
    If rtmp_connect_timer >= OpenClient_Interval_RTMP Then rtmp_connect_timer = 1: Close rtmp_client
    If rtmp_connect_timer = 1 Then

        RTMP_Ping1 = Timer(.001)
        rtmp_client = _OpenClient(RTMP_Port_Client + RTMP_Server_IP)

        If rtmp_client = 0 Then RefreshDisplayRequest = TRUE: Error_msg$ = "- Unable to connect, check if " + c34 + RTMP_Server_IP + ":" + RTMP_Server_Port + c34 + " is correct." + Chr$(10) + "- Program is unable to read the NGINX /" + Left$(RTMP_Stats, 20) + " URL from its http server. (Error: #14)": _Delay 3: Exit Sub

        RTMP_Ping2 = Timer(.001)
        RTMP_PingOut = (RTMP_Ping2 - RTMP_Ping1)

    End If

    ' Reset timer and delay if connection was not established, else Put will cause a program error
    If rtmp_client = 0 Then rtmp_connect_timer = 99: _Delay 3

    Put #rtmp_client, , RTMP_Header

    ' Connect to NGINX Server and grab json data
    RTMP_Timer_GET = Timer
    Do
        _Delay 0.01
        Get #rtmp_client, , RTMP_GET_a2
        RTMP_GET_a = RTMP_GET_a + RTMP_GET_a2
        RTMP_GET_i = InStr(RTMP_GET_a, "Content-Length:")
        If RTMP_GET_i Then
            RTMP_GET_i2 = InStr(RTMP_GET_i, RTMP_GET_a, RTMP_EOL)
            If RTMP_GET_i2 Then
                RTMP_GET_l = Val(Mid$(RTMP_GET_a, RTMP_GET_i + 15, RTMP_GET_i2 - RTMP_GET_i - 14))
                RTMP_GET_i3 = InStr(RTMP_GET_i2, RTMP_GET_a, RTMP_EOL + RTMP_EOL)
                If RTMP_GET_i3 Then
                    RTMP_GET_i3 = RTMP_GET_i3 + 4 'move i3 to start of data
                    If (Len(RTMP_GET_a) - RTMP_GET_i3 + 1) = RTMP_GET_l Then
                        'Close rtmp_client ' CLOSE CLIENT
                        RTMP_GET_d = Mid$(RTMP_GET_a, RTMP_GET_i3, RTMP_GET_l)
                        Exit Do
                    End If ' available data = l
                End If ' i3
            End If ' i2
        End If ' i
    Loop Until Timer > RTMP_Timer_GET + 3 ' 3 second timeout
    'Close rtmp_client

    ' Store json data in rtmp_stats.xml
    rtmp_stats.xml = RTMP_GET_d

End Sub

Sub Multi0 (serverType$)

    ' Cancel cooldown if stream has stopped
    ' It's not required for single camera, but it will exit LBR quicker on playback stop
    If Scene_Current = Scene_LBR And Timer_Fail_Stream1 >= 1 Then CooldownLog = 0
    If Not SceneLBActive And Timer_Fail_Stream1 >= 1 Then CooldownLog = 0

    MediaSource1TimeLog = MediaSource1TimeMS

    Select Case serverType$
        Case "SRT"
            If HTTP_Enabled Then If HTTP_Communication_Native Then http_client_connect "GetMedia", MediaSource1 Else Shell _Hide CMD_EXE_HTTP_FAST_GET_MEDIA1 Else Shell _Hide CMD_EXE_FAST + c34 + obs_get_media1 + c34

            On Error GoTo App_Fail
            App_Refresh = TRUE



            If HTTP_Communication_Native Then

                RIST_MediaSource1Time = MediaSource1TimeMS ' RIST mode

                If HTTP_Enabled Then ' HTTP

                    ' http_client_connect doesn't need to be called here
                    JSON = Space$(Len(GetMediaInputStatus.tmp))
                    JSON = GetMediaInputStatus.tmp
                    GetAllKey "mediaCursor", JSON, JSON_Multi()
                    For i_JSON = 1 To UBound(JSON_Multi)
                        ' JSON_Multi(i_JSON)
                    Next
                    file92 = JSON_Multi(1)

                End If

                MediaSource1TimeMS = Val(file92)

                ' RIST mode
                If __RIST_Fail_Mode_1 Then
                    If MediaSource1TimeMS <> 0 Then
                        If RIST_MediaSource1Time = MediaSource1TimeMS Then
                            RIST_MediaSource1Time_Count = RIST_MediaSource1Time_Count + 1 ' Scene_Fail will be triggered at 5 seconds, the same as SRT timeout
                            If RIST_MediaSource1Time_Count > 99 Then RIST_MediaSource1Time_Count = 99 ' No need to have it count up forever
                        Else
                            RIST_MediaSource1Time_Count = 0
                        End If
                    End If
                Else
                    RIST_MediaSource1Time_Count = 0
                End If

            Else

                If _FileExists(filePrevious_ms) Then

                    If Not HTTP_Enabled Then ' HTTP

                        Open filePrevious_ms For Input As #92

                        If EOF(92) Then
                            RefreshDisplayRequest = TRUE
                            Error_msg = "- Unable to read " + c34 + "SceneOK" + c34 + ", check " + c34 + "config.ini" + c34 + " & OBS to confirm it's correct." + Chr$(10) + "- If OBS is open, check communication is available via Node.js & obs-websocket-js.": Error_msg_2$ = "- If Node.js is installed, check " + c34 + "Restart playback" + c34 + " is disabled in OBS " + c34 + "Media Source" + c34 + "." + Chr$(10) + "- If " + c34 + "Restart playback" + c34 + " is disabled, check OBS WebSocket options are correctly set. (Error: #9)"
                            _Delay 3
                            GoTo LOF92
                        End If

                        If LOF(92) = 0 Then NoKill = TRUE: GoTo LOF92 ' Overkill with EOF checking, but just being safe
                        If EOF(92) Then GoTo LOF92
                        Line Input #92, file92

                    End If

                    RIST_MediaSource1Time = MediaSource1TimeMS ' RIST mode

                    If HTTP_Enabled Then ' HTTP

                        Open filePrevious_ms For Binary As #128
                        JSON = Space$(LOF(128))
                        Get #128, , JSON
                        Close #128
                        ' No JSON_Multi(0) redmin required
                        GetAllKey "mediaCursor", JSON, JSON_Multi()
                        For i_JSON = 1 To UBound(JSON_Multi)
                            ' JSON_Multi(i_JSON)
                        Next
                        file92 = JSON_Multi(1)

                    End If

                    MediaSource1TimeMS = Val(file92)

                    ' RIST mode
                    If __RIST_Fail_Mode_1 Then
                        If MediaSource1TimeMS <> 0 Then
                            If RIST_MediaSource1Time = MediaSource1TimeMS Then
                                RIST_MediaSource1Time_Count = RIST_MediaSource1Time_Count + 1 ' Scene_Fail will be triggered at 5 seconds, the same as SRT timeout
                                If RIST_MediaSource1Time_Count > 99 Then RIST_MediaSource1Time_Count = 99 ' No need to have it count up forever
                            Else
                                RIST_MediaSource1Time_Count = 0
                            End If
                        End If
                    Else
                        RIST_MediaSource1Time_Count = 0
                    End If

                    LOF92:
                End If
                Close #92

            End If


            If NoKill Then NoKill = FALSE Else If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
        Case "SLS"
            If __SLS_1_Enabled Then sls_client_connect
            If SLS_2_Active Then sls_client_connect_2 ' SLS 2nd IP

            On Error GoTo 0
            App_Refresh = FALSE


            If Dummy_Server <> "" Then DummyServer Dummy_Server


            ' Discover if one or two streams are running
            Do
                SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats.xml, "uptime")
                If SLS_streams_seek Then
                    SLS_streams_found = SLS_streams_found + 1
                End If
            Loop Until SLS_streams_seek = 0

            Select Case SLS_streams_found
                Case 1
                    ' If one stream is running and SLS_Publisher1 is the stream, find it here
                    If Mid$(sls_stats.xml, InStr(sls_stats.xml, "publishers") + 14, Len(SLS_Publisher1)) = SLS_Publisher1 Then
                        If InStr(sls_stats.xml, SLS_Publisher1) Then SLS_Bitrate1 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, SLS_Publisher1) + Len(SLS_Publisher1)) + 13, 6))
                        If InStr(sls_stats.xml, "uptime") Then SLS_Uptime1 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, "uptime") + Len("uptime")) + 2, 6))
                    End If
                Case 2
                    ' If two streams are running and SLS_Publisher1 is the second stream, find it here
                    If Mid$(sls_stats.xml, InStr(sls_stats.xml, SLS_Publisher1), Len(SLS_Publisher1)) = SLS_Publisher1 Then
                        SLS_Bitrate1 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "bitrate") + 9, 6))
                        SLS_Uptime1 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "uptime") + 8, 6))
                    End If
            End Select



            ' ---------- BELABOX detection ----------

            BELABOX_1_Found = FALSE: BELABOX_2_Found = FALSE

            ' Discover if one or two streams are running
            Do
                SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats.xml, c34 + "connected" + c34 + ": true")
                If SLS_streams_seek Then
                    SLS_streams_found = SLS_streams_found + 1
                End If
            Loop Until SLS_streams_seek = 0
            Do
                SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats.xml, c34 + "connected" + c34 + ": false")
                If SLS_streams_seek Then
                    SLS_streams_found = SLS_streams_found + 1
                End If
            Loop Until SLS_streams_seek = 0
            If SLS_streams_found > 2 Then SLS_streams_found = 2

            Select Case SLS_streams_found
                Case 1
                    ' If one stream is running and SLS_Publisher1 is the stream, find it here
                    If Mid$(sls_stats.xml, InStr(sls_stats.xml, "publishers") + 15, Len(SLS_Publisher1)) = SLS_Publisher1 Then
                        If InStr(sls_stats.xml, SLS_Publisher1) Then SLS_Bitrate1 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, c34 + "bitrate" + c34 + ":") + Len(c34 + "bitrate" + c34 + ":")), 6))

                        If _Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)) = "true" Then
                            BELABOX_1_Found = TRUE: BELABOX_1_Uptime = BELABOX_1_Uptime + 1: SLS_Uptime1 = BELABOX_1_Uptime: BELABOX_1_Offline = FALSE ' Uptime not reported in JSON data
                        ElseIf Left$(_Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)), 4) = "fals" Then
                            BELABOX_1_Found = TRUE: BELABOX_1_Offline = TRUE: BELABOX_1_Uptime = 0
                        End If

                    End If
                Case 2
                    ' If two streams are running and SLS_Publisher1 is the second stream, find it here
                    If Mid$(sls_stats.xml, InStr(sls_stats.xml, SLS_Publisher1), Len(SLS_Publisher1)) = SLS_Publisher1 Then
                        SLS_Bitrate1 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "bitrate") + 9, 6))

                        If _Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)) = "true" Then
                            BELABOX_1_Found = TRUE: BELABOX_1_Uptime = BELABOX_1_Uptime + 1: SLS_Uptime1 = BELABOX_1_Uptime: BELABOX_1_Offline = FALSE ' Uptime not reported in JSON data
                        ElseIf Left$(_Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)), 4) = "fals" Then
                            BELABOX_1_Found = TRUE: BELABOX_1_Offline = TRUE: BELABOX_1_Uptime = 0
                        End If

                    End If
            End Select

            If Not BELABOX_1_Found Then BELABOX_1_Uptime = 0
            If Not BELABOX_2_Found Then BELABOX_2_Uptime = 0



            ' Uptime
            MediaSource1Time = SLS_Uptime1
            MediaSource1TimeMS = SLS_Uptime1 * 1000

            ' Check BitrateFail1 - if bitrate is below fail value, appear to be 0
            If SLS_Bitrate1 < SLS_BitrateFail1 Then MediaSource1TimeMS = 0

        Case "RESTREAMER"

            If __RESTREAMER_1_Enabled Then restreamer_client_connect

            On Error GoTo 0
            App_Refresh = FALSE


            If Dummy_Server <> "" Then DummyServer Dummy_Server


            If GetKeyRestreamer("message", restreamer_stats.xml) = "Missing or invalid JWT token" Then RefreshDisplayRequest = TRUE: Error_msg$ = "- Unable to connect, check if " + c34 + RESTREAMER_Server_IP + ":" + RESTREAMER_Server_Port + c34 + " is correct. Confirm correct username and password." + Chr$(10) + "- Restreamer response is " + c34 + "Missing or invalid JWT token" + c34 + ". (Error: #17)": _Delay 3: Exit Sub

            If InStr(restreamer_stats.xml, RESTREAMER_ID_1) Then
                RESTREAMER_Bitrate1 = Int(Val(GetKeyRestreamer("bandwidth_rx_kbit", Mid$(restreamer_stats.xml, InStr(restreamer_stats.xml, RESTREAMER_ID_1)))))
                If RESTREAMER_Bitrate1 > 0 Then RESTREAMER_Uptime1 = RESTREAMER_Uptime1 + 1 Else RESTREAMER_Uptime1 = 0
                SLS_Uptime1 = RESTREAMER_Uptime1
            Else
                RESTREAMER_Bitrate1 = 0
                RESTREAMER_Uptime1 = 0
            End If

            SLS_Bitrate1 = RESTREAMER_Bitrate1

            ' Uptime
            MediaSource1Time = SLS_Uptime1
            MediaSource1TimeMS = SLS_Uptime1 * 1000

            ' Check BitrateFail1 - if bitrate is below fail value, appear to be 0
            If RESTREAMER_Bitrate1 < RESTREAMER_BitrateFail1 Then MediaSource1TimeMS = 0

        Case "NGINX"
            rtmp_client_connect

            On Error GoTo App_Fail
            App_Refresh = TRUE

            ' Older code:
            'If InStr(rtmp_stats.xml$, "<uptime>") Then RTMP_Uptime1 = Val(Mid$(rtmp_stats.xml$, InStr(rtmp_stats.xml$, "<uptime>") + 8, 16))
            'If InStr(rtmp_stats.xml$, "<time>") Then RTMP_Uptime1 = (Val(Mid$(rtmp_stats.xml$, InStr(rtmp_stats.xml$, "<time>") + 6, 12)) / 1000)
            'If InStr(rtmp_stats.xml$, "<bytes_in>") Then RTMP_Bytes_In = Val(Mid$(rtmp_stats.xml$, InStr(rtmp_stats.xml$, "<bytes_in>") + 10, 16))

            ' name:
            ' (1) = live
            ' (2) = stream1
            ' (3) = hls

            ' time:
            ' (1) time #1
            ' (2) time #1 or mpv time #1

            ' bytes_in
            ' (1) total
            ' (2) stream #1

            ' Check if stream name = requested stream name
            rtmp_stats.xml_XML = rtmp_stats.xml
            ReDim XML_Multi(64) As String
            GetAllKeyXML "name", rtmp_stats.xml_XML, XML_Multi()
            For i_XML = 1 To UBound(XML_Multi)
                ' xml_multi(i_XML)
            Next

            If i_XML > 2 Then
                If __RTMP_1_Enabled Then ' Bug fix for RTMP1Enabled=false ?
                    If RTMP_Publisher1 = XML_Multi(2) Then

                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "time", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' xml_multi(i_XML)
                        Next
                        If i_XML > 2 Then RTMP_Uptime1 = Val(XML_Multi(2)) / 1000

                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "bytes_in", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' xml_multi(i_XML)
                        Next
                        If i_XML > 2 Then RTMP_Bytes_In = Val(XML_Multi(2))

                        ' bw_in update interval is too slow, so get bytes_in minus the previous bytes_in = birate updated every second
                        RTMP_Bytes_In_Temp1 = RTMP_Bytes_In
                        If RTMP_Bytes_In_Temp1 >= 1 And RTMP_Bytes_In_Temp2 >= 1 Then
                            RTMP_Bitrate1 = Int((RTMP_Bytes_In_Temp1 - RTMP_Bytes_In_Temp2) / 128)
                        End If

                    End If
                End If
            End If


            If i_XML > 3 Then
                ' Check if stream name 2 = requested stream name 1
                If __RTMP_1_Enabled Then ' Bug fix for RTMP1Enabled=false ?
                    If RTMP_Publisher1 = XML_Multi(3) Then
                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "time", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' XML_Multi(i_XML)
                        Next
                        If i_XML > 3 Then RTMP_Uptime1 = Val(XML_Multi(3)) / 1000

                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "bytes_in", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' XML_Multi(i_XML)
                        Next
                        If i_XML > 3 Then RTMP_Bytes_In = Val(XML_Multi(3))

                        ' bw_in update interval is too slow, so get bytes_in minus the previous bytes_in = birate updated every second
                        RTMP_Bytes_In_Temp1 = RTMP_Bytes_In
                        If RTMP_Bytes_In_Temp1 >= 1 And RTMP_Bytes_In_Temp2 >= 1 Then
                            RTMP_Bitrate1 = Int((RTMP_Bytes_In_Temp1 - RTMP_Bytes_In_Temp2) / 128)
                        End If
                    End If
                End If
            End If


            ' Uptime
            MediaSource1Time = RTMP_Uptime1
            MediaSource1TimeMS = RTMP_Uptime1 * 1000

            If RTMP_Bitrate1 < RTMP_BitrateFail1 Then MediaSource1TimeMS = 0
    End Select

    MediaSource1Time = MediaSource1TimeMS / 1000
    On Error GoTo 0
    App_Refresh = FALSE

    MediaSource1TimeMSOffset = MediaSource1TimeMS - MediaSource1TimeLog
    If MediaSource1TimeMSOffset < 0 Then MediaSource1TimeMSOffset = 0

    ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true

    Select Case serverType$
        Case "SRT"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If MediaSource1TimeMSOffset < MediaSourceTimeLB And Timer_Fail_Stream1 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total Then Multi0_CMD_LBR

            If MediaSource1TimeMSOffset < MediaSourceTimeLB And Timer_Fail_Stream1 = 0 Then
                ' LBR_Delay
                If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                LBR_Delay = LBR_Delay + 1: If LBR_Delay > LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total
            End If
        Case "SLS"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If SLS_Bitrate1 < SLS_BitrateLow1 And Timer_Fail_Stream1 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total Then Multi0_CMD_LBR

            If SLS_Bitrate1 < SLS_BitrateLow1 And Timer_Fail_Stream1 = 0 Then
                ' LBR_Delay
                If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                LBR_Delay = LBR_Delay + 1: If LBR_Delay > LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total
            End If
        Case "RESTREAMER"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If RESTREAMER_Bitrate1 < RESTREAMER_BitrateLow1 And Timer_Fail_Stream1 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total Then Multi0_CMD_LBR

            If RESTREAMER_Bitrate1 < RESTREAMER_BitrateLow1 And Timer_Fail_Stream1 = 0 Then
                ' LBR_Delay
                If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                LBR_Delay = LBR_Delay + 1: If LBR_Delay > LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total
            End If
        Case "NGINX"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If RTMP_Bitrate1 < RTMP_BitrateLow1 And Timer_Fail_Stream1 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total Then Multi0_CMD_LBR

            If RTMP_Bitrate1 < RTMP_BitrateLow1 And Timer_Fail_Stream1 = 0 Then
                ' LBR_Delay
                If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                LBR_Delay = LBR_Delay + 1: If LBR_Delay > LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total
            End If
    End Select

    Select Case serverType$
        Case "SRT"
            Select Case MediaSource1TimeMSOffset
                Case 960 To 1040, 0
                    LBR_Delay = LBR_Delay - 1: If LBR_Delay <= 0 Then LBR_Delay = 0
            End Select
        Case "SLS"
            ' Bitrate can be used here. Case 960 - 1040 is invalid.
            Select Case SLS_Bitrate1
                Case Is > SLS_BitrateLow1, 0
                    LBR_Delay = LBR_Delay - 1: If LBR_Delay <= 0 Then LBR_Delay = 0
            End Select
        Case "RESTREAMER"
            ' Bitrate can be used here. Case 960 - 1040 is invalid.
            Select Case SLS_Bitrate1
                Case Is > RESTREAMER_BitrateLow1, 0
                    LBR_Delay = LBR_Delay - 1: If LBR_Delay <= 0 Then LBR_Delay = 0
            End Select
        Case "NGINX"
            ' Bitrate can be used here. Case 960 - 1040 is invalid.
            Select Case RTMP_Bitrate1
                Case Is > RTMP_BitrateLow1, 0
                    LBR_Delay = LBR_Delay - 1: If LBR_Delay <= 0 Then LBR_Delay = 0
            End Select
    End Select

    If CooldownActive = 1 And CooldownLog = 0 Then
        CooldownActive = 0

        ' Restore Scene_OK
        If SceneLBActive Then
            If Scene_Current = Scene_LBR Then
                Scene_Current = Scene_OK
                If HTTP_Communication_Native Then http_client_connect "Set", Scene_OK Else Shell _Hide _DontWait shell_cmd_1 + Scene_OK + shell_cmd_2
            End If
        End If

        If tmpFileRestore = TRUE Then
            tmpFileRestore = FALSE
        Else
            If __FileStatusOutput Then statusOutputToFile "[FULL BANDWIDTH]:[STREAM] (" + _Trim$(Str$(CooldownDuration)) + " sec)"
            If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Bandwidth restored for stream, " + _Trim$(Str$(ConnectionsLog1Count)) + " times (" + _Trim$(Str$(CooldownDuration)) + " sec)"
        End If
        ' Reset low bitrate duration seconds count
        CooldownDuration = 0
    End If

End Sub

Sub Multi0_CMD_LBR
    CooldownActive = 1
    ConnectionsLog1Count = ConnectionsLog1Count + 1
    If ConnectionsLog1Count > 999 Then ConnectionsLog1Count = 999

    ' Switch to Low Bandwidth Scene
    If SceneLBActive Then
        Scene_Current = Scene_LBR
        If HTTP_Communication_Native Then http_client_connect "Set", Scene_LBR Else Shell _Hide _DontWait shell_cmd_1 + Scene_LBR + shell_cmd_2
    End If

    If __FileStatusOutput Then statusOutputToFile "[LOW BANDWIDTH]:[STREAM]"
    If ConnectionsLog Then statusConnectionsLogToFile "[WARN] Insufficient bandwidth for stream, " + _Trim$(Str$(ConnectionsLog1Count)) + " times": CooldownLog = CooldownLogTotal
End Sub

Sub Multi1 (serverType As String, serverSelection As _Byte)

    ' Cancel cooldown if stream has stopped otherwise things will break
    ' if StreamFailDelay is set lower than CooldownLogTotal
    If Scene_Current = titleScene1 And Timer_Fail_Stream1 >= 1 Then CooldownLog = 0
    If Scene_Current = titleScene2 And Timer_Fail_Stream2 >= 1 Then CooldownLog = 0
    If Scene_Current = titleScene12 And Timer_Fail_Stream1 >= 1 Then CooldownLog = 0
    If Scene_Current = titleScene12 And Timer_Fail_Stream2 >= 1 Then CooldownLog = 0

    If serverSelection%% = 0 Or serverSelection%% = 1 Then MediaSource1TimeLog = MediaSource1TimeMS
    If serverSelection%% = 0 Or serverSelection%% = 2 Then MediaSource2TimeLog = MediaSource2TimeMS

    Select Case serverType$
        Case "SRT"
            If HTTP_Enabled Then
                If HTTP_Communication_Native Then
                    http_client_connect "GetMedia", MediaSource1
                    GetMediaInputStatus2.tmp = "": GetMediaInputStatus2.tmp = GetMediaInputStatus.tmp
                    http_client_connect "GetMedia", MediaSource2
                    GetMediaInputStatus2.tmp = GetMediaInputStatus2.tmp + GetMediaInputStatus.tmp
                Else
                    Select Case OS
                        Case "WINDOWS"
                            Shell _Hide http_media2_File
                        Case "LINUX"
                            Shell _Hide CMD_EXE_HTTP_GET_MEDIA2
                    End Select
                End If
            Else
                Shell _Hide CMD_EXE_FAST + c34 + obs_get_media2 + c34
            End If

            On Error GoTo App_Fail
            App_Refresh = TRUE



            If HTTP_Communication_Native Then

                If serverSelection%% = 0 Or serverSelection%% = 1 Then RIST_MediaSource1Time = MediaSource1TimeMS ' RIST mode

                If HTTP_Enabled Then ' HTTP

                    ' http_client_connect doesn't need to be called here
                    JSON = Space$(Len(GetMediaInputStatus2.tmp))
                    JSON = GetMediaInputStatus2.tmp
                    GetAllKey "mediaCursor", JSON, JSON_Multi()
                    For i_XML = 1 To UBound(JSON_Multi)
                        ' JSON_Multi(i_XML)
                    Next
                    file92 = JSON_Multi(1)

                End If

                If serverSelection%% = 0 Or serverSelection%% = 1 Then MediaSource1TimeMS = Val(file92)

                ' RIST mode
                If __RIST_Fail_Mode_1 Then
                    If serverSelection%% = 0 Or serverSelection%% = 1 Then If MediaSource1TimeMS <> 0 Then
                            If RIST_MediaSource1Time = MediaSource1TimeMS Then
                                RIST_MediaSource1Time_Count = RIST_MediaSource1Time_Count + 1 ' Scene_Fail will be triggered at 5 seconds, the same as SRT timeout
                                If RIST_MediaSource1Time_Count > 99 Then RIST_MediaSource1Time_Count = 99 ' No need to have it count up forever
                            Else
                                RIST_MediaSource1Time_Count = 0
                            End If
                        End If
                    End If
                Else
                    If serverSelection%% = 0 Or serverSelection%% = 1 Then RIST_MediaSource1Time_Count = 0
                End If

                If serverSelection%% = 0 Or serverSelection%% = 1 Then MediaSource1Time = MediaSource1TimeMS / 1000


                If serverSelection%% = 0 Or serverSelection%% = 2 Then RIST_MediaSource2Time = MediaSource2TimeMS ' RIST mode - Source 2

                If HTTP_Enabled Then ' HTTP
                    If serverSelection%% = 0 Or serverSelection%% = 2 Then MediaSource2TimeMS = Val(JSON_Multi(2))
                Else
                    If serverSelection%% = 0 Or serverSelection%% = 2 Then MediaSource2TimeMS = Val(file92)
                End If

                ' RIST mode - Source 2
                If __RIST_Fail_Mode_2 Then
                    If serverSelection%% = 0 Or serverSelection%% = 2 Then
                        If MediaSource2TimeMS <> 0 Then
                            If RIST_MediaSource2Time = MediaSource2TimeMS Then
                                RIST_MediaSource2Time_Count = RIST_MediaSource2Time_Count + 1 ' Scene_Fail will be triggered at 5 seconds, the same as SRT timeout
                                If RIST_MediaSource2Time_Count > 99 Then RIST_MediaSource2Time_Count = 99 ' No need to have it count up forever
                            Else
                                RIST_MediaSource2Time_Count = 0
                            End If
                        End If
                    End If
                Else
                    If serverSelection%% = 0 Or serverSelection%% = 2 Then RIST_MediaSource2Time_Count = 0
                End If

                If serverSelection%% = 0 Or serverSelection%% = 2 Then MediaSource2Time = MediaSource2TimeMS / 1000

            Else

                If _FileExists(filePrevious_ms) Then

                    If Not HTTP_Enabled Then

                        Open filePrevious_ms For Input As #92
                        If EOF(92) Then
                            RefreshDisplayRequest = TRUE
                            Error_msg = "- Unable to read " + c34 + "MediaSource1" + c34 + ", check " + c34 + "config.ini" + c34 + " & OBS to confirm it's correct." + Chr$(10) + "- If OBS is open, check communication is available via Node.js & obs-websocket-js.": Error_msg_2$ = "- If Node.js is installed, check " + c34 + "Restart playback" + c34 + " is disabled in OBS " + c34 + "Media Source" + c34 + "." + Chr$(10) + "- If " + c34 + "Restart playback" + c34 + " is disabled, check OBS WebSocket options are correctly set. (Error: #7)"
                            _Delay 3
                            GoTo LOF922
                        End If

                        If LOF(92) = 0 Then NoKill = TRUE: GoTo LOF922 ' Overkill with EOF checking, but just being safe
                        Line Input #92, file92

                    End If

                    If serverSelection%% = 0 Or serverSelection%% = 1 Then RIST_MediaSource1Time = MediaSource1TimeMS ' RIST mode

                    If HTTP_Enabled Then ' HTTP
                        Open filePrevious_ms For Binary As #128
                        JSON = Space$(LOF(128))
                        Get #128, , JSON
                        Close #128
                        ' No JSON_Multi(0) redmin required
                        GetAllKey "mediaCursor", JSON, JSON_Multi()
                        For i_XML = 1 To UBound(JSON_Multi)
                            ' JSON_Multi(i_XML)
                        Next
                        file92 = JSON_Multi(1)
                    End If

                    If serverSelection%% = 0 Or serverSelection%% = 1 Then MediaSource1TimeMS = Val(file92)

                    ' RIST mode
                    If __RIST_Fail_Mode_1 Then
                        If serverSelection%% = 0 Or serverSelection%% = 1 Then If MediaSource1TimeMS <> 0 Then
                                If RIST_MediaSource1Time = MediaSource1TimeMS Then
                                    RIST_MediaSource1Time_Count = RIST_MediaSource1Time_Count + 1 ' Scene_Fail will be triggered at 5 seconds, the same as SRT timeout
                                    If RIST_MediaSource1Time_Count > 99 Then RIST_MediaSource1Time_Count = 99 ' No need to have it count up forever
                                Else
                                    RIST_MediaSource1Time_Count = 0
                                End If
                            End If
                        End If
                    Else
                        If serverSelection%% = 0 Or serverSelection%% = 1 Then RIST_MediaSource1Time_Count = 0
                    End If

                    If serverSelection%% = 0 Or serverSelection%% = 1 Then MediaSource1Time = MediaSource1TimeMS / 1000

                    If Not HTTP_Enabled Then

                        If EOF(92) Then RefreshDisplayRequest = TRUE: Error_msg = "- Unable to read " + c34 + "MediaSource2" + c34 + ", check " + c34 + "config.ini" + c34 + " & OBS to confirm it's correct." + Chr$(10) + "- If OBS is open, check communication is available via Node.js & obs-websocket-js.": Error_msg_2$ = "- If Node.js is installed, check " + c34 + "Restart playback" + c34 + " is disabled in OBS " + c34 + "Media Source" + c34 + "." + Chr$(10) + "- If " + c34 + "Restart playback" + c34 + " is disabled, check OBS WebSocket options are correctly set. (Error: #8)": _Delay 3: GoTo LOF922
                        Line Input #92, file92

                    End If

                    If serverSelection%% = 0 Or serverSelection%% = 2 Then RIST_MediaSource2Time = MediaSource2TimeMS ' RIST mode - Source 2

                    If HTTP_Enabled Then ' HTTP
                        If serverSelection%% = 0 Or serverSelection%% = 2 Then MediaSource2TimeMS = Val(JSON_Multi(2))
                    Else
                        If serverSelection%% = 0 Or serverSelection%% = 2 Then MediaSource2TimeMS = Val(file92)
                    End If

                    ' RIST mode - Source 2
                    If __RIST_Fail_Mode_2 Then
                        If serverSelection%% = 0 Or serverSelection%% = 2 Then
                            If MediaSource2TimeMS <> 0 Then
                                If RIST_MediaSource2Time = MediaSource2TimeMS Then
                                    RIST_MediaSource2Time_Count = RIST_MediaSource2Time_Count + 1 ' Scene_Fail will be triggered at 5 seconds, the same as SRT timeout
                                    If RIST_MediaSource2Time_Count > 99 Then RIST_MediaSource2Time_Count = 99 ' No need to have it count up forever
                                Else
                                    RIST_MediaSource2Time_Count = 0
                                End If
                            End If
                        End If
                    Else
                        If serverSelection%% = 0 Or serverSelection%% = 2 Then RIST_MediaSource2Time_Count = 0
                    End If

                    If serverSelection%% = 0 Or serverSelection%% = 2 Then MediaSource2Time = MediaSource2TimeMS / 1000

                    LOF922:
                End If
                Close #92

            End If


            If NoKill = TRUE Then NoKill = FALSE Else If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
            On Error GoTo 0
            App_Refresh = FALSE
        Case "SLS"
            If __SLS_1_Enabled Then sls_client_connect
            If SLS_2_Active Then sls_client_connect_2 ' SLS 2nd IP

            On Error GoTo 0
            App_Refresh = FALSE


            If Dummy_Server <> "" Then DummyServer Dummy_Server


            ' Discover if one or two streams are running
            If Not SLS_2_Active Then

                Do
                    SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats.xml, "uptime")
                    If SLS_streams_seek Then
                        SLS_streams_found = SLS_streams_found + 1
                    End If
                Loop Until SLS_streams_seek = 0

                Select Case SLS_streams_found
                    Case 1
                        ' If one stream is running and SLS_Publisher1 is the stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, "publishers") + 14, Len(SLS_Publisher1)) = SLS_Publisher1 Then
                            If InStr(sls_stats.xml, SLS_Publisher1) Then SLS_Bitrate1 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, SLS_Publisher1) + Len(SLS_Publisher1)) + 13, 6))
                            If InStr(sls_stats.xml, "uptime") Then SLS_Uptime1 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, "uptime") + Len("uptime")) + 2, 6))
                        End If
                        ' If one stream is running and SLS_Publisher2 is the stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, "publishers") + 14, Len(SLS_Publisher2)) = SLS_Publisher2 Then
                            If InStr(sls_stats.xml, SLS_Publisher2) Then SLS_Bitrate2 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, SLS_Publisher2) + Len(SLS_Publisher2)) + 13, 6))
                            If InStr(sls_stats.xml, "uptime") Then SLS_Uptime2 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, "uptime") + Len("uptime")) + 2, 6))
                        End If
                    Case 2
                        ' If two streams are running and SLS_Publisher1 is either the first or second stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, SLS_Publisher1), Len(SLS_Publisher1)) = SLS_Publisher1 Then
                            SLS_Bitrate1 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "bitrate") + 9, 6))
                            SLS_Uptime1 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "uptime") + 8, 6))
                        End If
                        ' If two streams are running and SLS_Publisher2 is either the first or second stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, SLS_Publisher2), Len(SLS_Publisher2)) = SLS_Publisher2 Then
                            SLS_Bitrate2 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher2), sls_stats.xml, "bitrate") + 9, 6))
                            SLS_Uptime2 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher2), sls_stats.xml, "uptime") + 8, 6))
                        End If
                End Select


            Else


                ' SLS 2nd IP
                Do
                    SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats.xml, "uptime")
                    If SLS_streams_seek Then
                        SLS_streams_found = SLS_streams_found + 1
                    End If
                Loop Until SLS_streams_seek = 0


                Do
                    SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats_2.xml, "uptime")
                    If SLS_streams_seek Then
                        SLS_streams_found = SLS_streams_found + 1
                    End If
                Loop Until SLS_streams_seek = 0
                If SLS_streams_found > 2 Then SLS_streams_found = 2


                Select Case SLS_streams_found
                    Case 1
                        ' If one stream is running and SLS_Publisher1 is the stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, "publishers") + 14, Len(SLS_Publisher1)) = SLS_Publisher1 Then
                            If InStr(sls_stats.xml, SLS_Publisher1) Then SLS_Bitrate1 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, SLS_Publisher1) + Len(SLS_Publisher1)) + 13, 6))
                            If InStr(sls_stats.xml, "uptime") Then SLS_Uptime1 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, "uptime") + Len("uptime")) + 2, 6))
                        End If
                        ' If one stream is running and SLS_Publisher2 is the stream, find it here
                        If Mid$(sls_stats_2.xml, InStr(sls_stats_2.xml, "publishers") + 14, Len(SLS_Publisher2)) = SLS_Publisher2 Then
                            If InStr(sls_stats_2.xml, SLS_Publisher2) Then SLS_Bitrate2 = Val(Mid$(sls_stats_2.xml, (InStr(sls_stats_2.xml, SLS_Publisher2) + Len(SLS_Publisher2)) + 13, 6))
                            If InStr(sls_stats_2.xml, "uptime") Then SLS_Uptime2 = Val(Mid$(sls_stats_2.xml, (InStr(sls_stats_2.xml, "uptime") + Len("uptime")) + 2, 6))
                        End If
                    Case 2
                        ' If two streams are running and SLS_Publisher1 is either the first or second stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, SLS_Publisher1), Len(SLS_Publisher1)) = SLS_Publisher1 Then
                            SLS_Bitrate1 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "bitrate") + 9, 6))
                            SLS_Uptime1 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "uptime") + 8, 6))
                        End If
                        ' If two streams are running and SLS_Publisher2 is either the first or second stream, find it here
                        If Mid$(sls_stats_2.xml, InStr(sls_stats_2.xml, SLS_Publisher2), Len(SLS_Publisher2)) = SLS_Publisher2 Then
                            SLS_Bitrate2 = Val(Mid$(sls_stats_2.xml, InStr(InStr(sls_stats_2.xml, SLS_Publisher2), sls_stats_2.xml, "bitrate") + 9, 6))
                            SLS_Uptime2 = Val(Mid$(sls_stats_2.xml, InStr(InStr(sls_stats_2.xml, SLS_Publisher2), sls_stats_2.xml, "uptime") + 8, 6))
                        End If
                End Select


            End If



            ' ---------- BELABOX detection ----------

            BELABOX_1_Found = FALSE: BELABOX_2_Found = FALSE



            ' Discover if one or two streams are running
            If Not SLS_2_Active Then


                Do
                    SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats.xml, c34 + "connected" + c34 + ": true")
                    If SLS_streams_seek Then
                        SLS_streams_found = SLS_streams_found + 1
                    End If
                Loop Until SLS_streams_seek = 0
                Do
                    SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats.xml, c34 + "connected" + c34 + ": false")
                    If SLS_streams_seek Then
                        SLS_streams_found = SLS_streams_found + 1
                    End If
                Loop Until SLS_streams_seek = 0
                If SLS_streams_found > 2 Then SLS_streams_found = 2


                Select Case SLS_streams_found
                    Case 1
                        ' If one stream is running and SLS_Publisher1 is the stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, "publishers") + 15, Len(SLS_Publisher1)) = SLS_Publisher1 Then
                            If InStr(sls_stats.xml, SLS_Publisher1) Then SLS_Bitrate1 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, c34 + "bitrate" + c34 + ":") + Len(c34 + "bitrate" + c34 + ":")), 6))

                            If _Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)) = "true" Then
                                BELABOX_1_Found = TRUE: BELABOX_1_Uptime = BELABOX_1_Uptime + 1: SLS_Uptime1 = BELABOX_1_Uptime: BELABOX_1_Offline = FALSE ' Uptime not reported in JSON data
                            ElseIf Left$(_Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)), 4) = "fals" Then
                                BELABOX_1_Found = TRUE: BELABOX_1_Offline = TRUE: BELABOX_1_Uptime = 0
                            End If

                        End If
                        ' If one stream is running and SLS_Publisher2 is the stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, "publishers") + 15, Len(SLS_Publisher2)) = SLS_Publisher2 Then
                            If InStr(sls_stats.xml, SLS_Publisher2) Then SLS_Bitrate2 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, c34 + "bitrate" + c34 + ":") + Len(c34 + "bitrate" + c34 + ":")), 6))

                            If _Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher2), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)) = "true" Then
                                BELABOX_2_Found = TRUE: BELABOX_2_Uptime = BELABOX_2_Uptime + 1: SLS_Uptime2 = BELABOX_2_Uptime ' Uptime not reported in JSON data
                            ElseIf Left$(_Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher2), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)), 4) = "fals" Then
                                BELABOX_2_Found = TRUE: BELABOX_2_Offline = TRUE: BELABOX_2_Uptime = 0
                            End If

                        End If
                    Case 2
                        ' If two streams are running and SLS_Publisher1 is either the first or second stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, SLS_Publisher1), Len(SLS_Publisher1)) = SLS_Publisher1 Then
                            SLS_Bitrate1 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "bitrate") + 9, 6))

                            If _Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)) = "true" Then
                                BELABOX_1_Found = TRUE: BELABOX_1_Uptime = BELABOX_1_Uptime + 1: SLS_Uptime1 = BELABOX_1_Uptime: BELABOX_1_Offline = FALSE ' Uptime not reported in JSON data
                            ElseIf Left$(_Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)), 4) = "fals" Then
                                BELABOX_1_Found = TRUE: BELABOX_1_Offline = TRUE: BELABOX_1_Uptime = 0
                            End If

                        End If
                        ' If two streams are running and SLS_Publisher2 is either the first or second stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, SLS_Publisher2), Len(SLS_Publisher2)) = SLS_Publisher2 Then
                            SLS_Bitrate2 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher2), sls_stats.xml, "bitrate") + 9, 6))

                            If _Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher2), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)) = "true" Then
                                BELABOX_2_Found = TRUE: BELABOX_2_Uptime = BELABOX_2_Uptime + 1: SLS_Uptime2 = BELABOX_2_Uptime ' Uptime not reported in JSON data
                            ElseIf Left$(_Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher2), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)), 4) = "fals" Then
                                BELABOX_2_Found = TRUE: BELABOX_2_Offline = TRUE: BELABOX_2_Uptime = 0
                            End If

                        End If
                End Select


            Else


                ' SLS 2nd IP
                Do
                    SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats.xml, c34 + "connected" + c34 + ": true")
                    If SLS_streams_seek Then
                        SLS_streams_found = SLS_streams_found + 1
                    End If
                Loop Until SLS_streams_seek = 0
                Do
                    SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats.xml, c34 + "connected" + c34 + ": false")
                    If SLS_streams_seek Then
                        SLS_streams_found = SLS_streams_found + 1
                    End If
                Loop Until SLS_streams_seek = 0


                Do
                    SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats_2.xml, c34 + "connected" + c34 + ": true")
                    If SLS_streams_seek Then
                        SLS_streams_found = SLS_streams_found + 1
                    End If
                Loop Until SLS_streams_seek = 0
                Do
                    SLS_streams_seek = InStr(SLS_streams_seek + 1, sls_stats_2.xml, c34 + "connected" + c34 + ": false")
                    If SLS_streams_seek Then
                        SLS_streams_found = SLS_streams_found + 1
                    End If
                Loop Until SLS_streams_seek = 0
                If SLS_streams_found > 2 Then SLS_streams_found = 2


                Select Case SLS_streams_found
                    Case 1
                        ' If one stream is running and SLS_Publisher1 is the stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, "publishers") + 15, Len(SLS_Publisher1)) = SLS_Publisher1 Then
                            If InStr(sls_stats.xml, SLS_Publisher1) Then SLS_Bitrate1 = Val(Mid$(sls_stats.xml, (InStr(sls_stats.xml, c34 + "bitrate" + c34 + ":") + Len(c34 + "bitrate" + c34 + ":")), 6))

                            If _Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)) = "true" Then
                                BELABOX_1_Found = TRUE: BELABOX_1_Uptime = BELABOX_1_Uptime + 1: SLS_Uptime1 = BELABOX_1_Uptime: BELABOX_1_Offline = FALSE ' Uptime not reported in JSON data
                            ElseIf Left$(_Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)), 4) = "fals" Then
                                BELABOX_1_Found = TRUE: BELABOX_1_Offline = TRUE: BELABOX_1_Uptime = 0
                            End If

                        End If
                        ' If one stream is running and SLS_Publisher2 is the stream, find it here
                        If Mid$(sls_stats_2.xml, InStr(sls_stats_2.xml, "publishers") + 15, Len(SLS_Publisher2)) = SLS_Publisher2 Then
                            If InStr(sls_stats_2.xml, SLS_Publisher2) Then SLS_Bitrate2 = Val(Mid$(sls_stats_2.xml, (InStr(sls_stats_2.xml, c34 + "bitrate" + c34 + ":") + Len(c34 + "bitrate" + c34 + ":")), 6))

                            If _Trim$(Mid$(sls_stats_2.xml, InStr(InStr(sls_stats_2.xml, SLS_Publisher2), sls_stats_2.xml, c34 + "connected" + c34 + ":") + 12, 5)) = "true" Then
                                BELABOX_2_Found = TRUE: BELABOX_2_Uptime = BELABOX_2_Uptime + 1: SLS_Uptime2 = BELABOX_2_Uptime: BELABOX_2_Offline = FALSE ' Uptime not reported in JSON data
                            ElseIf Left$(_Trim$(Mid$(sls_stats_2.xml, InStr(InStr(sls_stats_2.xml, SLS_Publisher2), sls_stats_2.xml, c34 + "connected" + c34 + ":") + 12, 5)), 4) = "fals" Then
                                BELABOX_2_Found = TRUE: BELABOX_2_Offline = TRUE: BELABOX_2_Uptime = 0
                            End If

                        End If
                    Case 2
                        ' If two streams are running and SLS_Publisher1 is either the first or second stream, find it here
                        If Mid$(sls_stats.xml, InStr(sls_stats.xml, SLS_Publisher1), Len(SLS_Publisher1)) = SLS_Publisher1 Then
                            SLS_Bitrate1 = Val(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, "bitrate") + 9, 6))

                            If _Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)) = "true" Then
                                BELABOX_1_Found = TRUE: BELABOX_1_Uptime = BELABOX_1_Uptime + 1: SLS_Uptime1 = BELABOX_1_Uptime: BELABOX_1_Offline = FALSE ' Uptime not reported in JSON data
                            ElseIf Left$(_Trim$(Mid$(sls_stats.xml, InStr(InStr(sls_stats.xml, SLS_Publisher1), sls_stats.xml, c34 + "connected" + c34 + ":") + 12, 5)), 4) = "false" Then
                                BELABOX_1_Found = TRUE: BELABOX_1_Offline = TRUE: BELABOX_1_Uptime = 0
                            End If

                        End If
                        ' If two streams are running and SLS_Publisher2 is either the first or second stream, find it here
                        If Mid$(sls_stats_2.xml, InStr(sls_stats_2.xml, SLS_Publisher2), Len(SLS_Publisher2)) = SLS_Publisher2 Then
                            SLS_Bitrate2 = Val(Mid$(sls_stats_2.xml, InStr(InStr(sls_stats_2.xml, SLS_Publisher2), sls_stats_2.xml, "bitrate") + 9, 6))

                            If _Trim$(Mid$(sls_stats_2.xml, InStr(InStr(sls_stats_2.xml, SLS_Publisher2), sls_stats_2.xml, c34 + "connected" + c34 + ":") + 12, 5)) = "true" Then
                                BELABOX_2_Found = TRUE: BELABOX_2_Uptime = BELABOX_2_Uptime + 1: SLS_Uptime2 = BELABOX_2_Uptime ' Uptime not reported in JSON data
                            ElseIf Left$(_Trim$(Mid$(sls_stats_2.xml, InStr(InStr(sls_stats_2.xml, SLS_Publisher2), sls_stats_2.xml, c34 + "connected" + c34 + ":") + 12, 5)), 4) = "fals" Then
                                BELABOX_2_Found = TRUE: BELABOX_2_Offline = TRUE: BELABOX_2_Uptime = 0
                            End If

                        End If
                End Select


            End If

            If Not BELABOX_1_Found Then BELABOX_1_Uptime = 0
            If Not BELABOX_2_Found Then BELABOX_2_Uptime = 0






            ' Uptime
            If serverSelection%% = 0 Or serverSelection%% = 1 Then
                MediaSource1Time = SLS_Uptime1
                MediaSource1TimeMS = SLS_Uptime1 * 1000
                ' Check BitrateFail1 - if bitrate is below fail value, appear to be 0
                If SLS_Bitrate1 < SLS_BitrateFail1 Then MediaSource1TimeMS = 0
                MediaSource1Time = MediaSource1TimeMS / 1000
            End If

            If serverSelection%% = 0 Or serverSelection%% = 2 Then
                MediaSource2Time = SLS_Uptime2
                MediaSource2TimeMS = SLS_Uptime2 * 1000
                ' Check BitrateFail2 - if bitrate is below fail value, appear to be 0
                If SLS_Bitrate2 < SLS_BitrateFail2 Then MediaSource2TimeMS = 0
                MediaSource2Time = MediaSource2TimeMS / 1000
            End If

        Case "RESTREAMER"

            If __RESTREAMER_1_Enabled Or __RESTREAMER_2_Enabled Then restreamer_client_connect

            On Error GoTo 0
            App_Refresh = FALSE

            If Dummy_Server <> "" Then DummyServer Dummy_Server

            If GetKeyRestreamer("message", restreamer_stats.xml) = "Missing or invalid JWT token" Then RefreshDisplayRequest = TRUE: Error_msg$ = "- Unable to connect, check if " + c34 + RESTREAMER_Server_IP + ":" + RESTREAMER_Server_Port + c34 + " is correct. Confirm correct username and password." + Chr$(10) + "- Restreamer response is " + c34 + "Missing or invalid JWT token" + c34 + ". (Error: #18)": _Delay 3: Exit Sub

            If __RESTREAMER_1_Enabled Then
                If InStr(restreamer_stats.xml, RESTREAMER_ID_1) Then
                    RESTREAMER_Bitrate1 = Int(Val(GetKeyRestreamer("bandwidth_rx_kbit", Mid$(restreamer_stats.xml, InStr(restreamer_stats.xml, RESTREAMER_ID_1)))))
                    If RESTREAMER_Bitrate1 > 0 Then RESTREAMER_Uptime1 = RESTREAMER_Uptime1 + 1 Else RESTREAMER_Uptime1 = 0
                    SLS_Uptime1 = RESTREAMER_Uptime1
                Else
                    RESTREAMER_Bitrate1 = 0
                    RESTREAMER_Uptime1 = 0
                End If
                SLS_Bitrate1 = RESTREAMER_Bitrate1
            End If

            If __RESTREAMER_2_Enabled Then
                If InStr(restreamer_stats.xml, RESTREAMER_ID_2) Then
                    RESTREAMER_Bitrate2 = Int(Val(GetKeyRestreamer("bandwidth_rx_kbit", Mid$(restreamer_stats.xml, InStr(restreamer_stats.xml, RESTREAMER_ID_2)))))
                    If RESTREAMER_Bitrate2 > 0 Then RESTREAMER_Uptime2 = RESTREAMER_Uptime2 + 1 Else RESTREAMER_Uptime2 = 0
                    SLS_Uptime2 = RESTREAMER_Uptime2
                Else
                    RESTREAMER_Bitrate2 = 0
                    RESTREAMER_Uptime2 = 0
                End If
                SLS_Bitrate2 = RESTREAMER_Bitrate2
            End If


            ' Uptime
            If serverSelection%% = 0 Or serverSelection%% = 1 Then
                MediaSource1Time = SLS_Uptime1
                MediaSource1TimeMS = SLS_Uptime1 * 1000
                ' Check BitrateFail1 - if bitrate is below fail value, appear to be 0
                If RESTREAMER_Bitrate1 < RESTREAMER_BitrateFail1 Then MediaSource1TimeMS = 0
                MediaSource1Time = MediaSource1TimeMS / 1000
            End If

            If serverSelection%% = 0 Or serverSelection%% = 2 Then
                MediaSource2Time = SLS_Uptime2
                MediaSource2TimeMS = SLS_Uptime2 * 1000
                ' Check BitrateFail2 - if bitrate is below fail value, appear to be 0
                If RESTREAMER_Bitrate2 < RESTREAMER_BitrateFail2 Then MediaSource2TimeMS = 0
                MediaSource2Time = MediaSource2TimeMS / 1000
            End If

        Case "NGINX"
            rtmp_client_connect

            On Error GoTo App_Fail
            App_Refresh = TRUE

            ' name:                       ' time:                                 ' bytes_in:
            ' (1) = live                  ' (1) time #1                           ' (1) total
            ' (2) = stream1               ' (2) time #1 or mpv time #1            ' (2) stream #1
            ' (3) = stream2               ' (3) time #2                           ' (3) stream #2
            ' (4) = hls                   ' (4) time #2 or mpv time #2            ' (4)

            'multiStream1 = 0: multiStream2 = 0

            ' Check if stream name 1 = requested stream name 1 or stream name 2
            rtmp_stats.xml_XML = rtmp_stats.xml
            ReDim XML_Multi(64) As String
            GetAllKeyXML "name", rtmp_stats.xml_XML, XML_Multi()
            For i_XML = 1 To UBound(XML_Multi)
                ' XML_Multi(i_XML)
            Next

            If i_XML > 2 Then

                ' Check if stream name 1 = requested stream name 1
                If __RTMP_1_Enabled Then ' Bug fix for RTMP1Enabled=false ?
                    If RTMP_Publisher1 = XML_Multi(2) Then
                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "time", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' XML_Multi(i_XML)
                        Next
                        If i_XML > 2 Then RTMP_Uptime1 = Val(XML_Multi(2)) / 1000

                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "bytes_in", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' XML_Multi(i_XML)
                        Next
                        If i_XML > 2 Then RTMP_Bytes_In = Val(XML_Multi(2))

                        ' bw_in update interval is too slow, so get bytes_in minus the previous bytes_in = birate updated every second
                        multiStream1 = RTMP_Bytes_In

                    End If
                End If

                ' Check if stream name 1 = requested stream name 1
                If __RTMP_2_Enabled Then ' Bug fix for RTMP2Enabled=false ?
                    If RTMP_Publisher2 = XML_Multi(2) Then
                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "time", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' XML_Multi(i_XML)
                        Next
                        If i_XML > 2 Then RTMP_Uptime2 = Val(XML_Multi(2)) / 1000

                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "bytes_in", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' XML_Multi(i_XML)
                        Next
                        If i_XML > 2 Then RTMP_Bytes_In = Val(XML_Multi(2))

                        ' bw_in update interval is too slow, so get bytes_in minus the previous bytes_in = birate updated every second
                        multiStream2 = RTMP_Bytes_In
                    End If
                End If

            End If

            ' Check if stream name 2 = requested stream name 2 or stream name 1
            rtmp_stats.xml_XML = rtmp_stats.xml
            ReDim XML_Multi(64) As String
            GetAllKeyXML "name", rtmp_stats.xml_XML, XML_Multi()
            For i_XML = 1 To UBound(XML_Multi)
                ' XML_Multi(i_XML)
            Next

            If i_XML > 3 Then
                ' Check if stream name 2 = requested stream name 2
                If __RTMP_2_Enabled Then ' Bug fix for RTMP2Enabled=false ?
                    If RTMP_Publisher2 = XML_Multi(3) Then
                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "time", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' XML_Multi(i_XML)
                        Next
                        If i_XML > 3 Then RTMP_Uptime2 = Val(XML_Multi(3)) / 1000

                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "bytes_in", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' XML_Multi(i_XML)
                        Next
                        If i_XML > 3 Then RTMP_Bytes_In = Val(XML_Multi(3))

                        ' bw_in update interval is too slow, so get bytes_in minus the previous bytes_in = birate updated every second
                        multiStream2 = RTMP_Bytes_In

                    End If
                End If

                ' Check if stream name 2 = requested stream name 1
                If __RTMP_1_Enabled Then ' Bug fix for RTMP1Enabled=false ?
                    If RTMP_Publisher1 = XML_Multi(3) Then
                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "time", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' XML_Multi(i_XML)
                        Next
                        If i_XML > 3 Then RTMP_Uptime1 = Val(XML_Multi(3)) / 1000

                        rtmp_stats.xml_XML = rtmp_stats.xml
                        ReDim XML_Multi(64) As String
                        GetAllKeyXML "bytes_in", rtmp_stats.xml_XML, XML_Multi()
                        For i_XML = 1 To UBound(XML_Multi)
                            ' XML_Multi(i_XML)
                        Next
                        If i_XML > 3 Then RTMP_Bytes_In = Val(XML_Multi(3))

                        ' bw_in update interval is too slow, so get bytes_in minus the previous bytes_in = birate updated every second
                        multiStream1 = RTMP_Bytes_In
                    End If
                End If

            End If


            ' Uptime
            If serverSelection%% = 0 Or serverSelection%% = 1 Then

                multiStream1_Temp1 = multiStream1
                If multiStream1_Temp1 >= 1 And multiStream1_Temp2 >= 1 Then
                    RTMP_Bitrate1 = Int((multiStream1_Temp1 - multiStream1_Temp2) / 128)
                End If

                MediaSource1Time = RTMP_Uptime1
                MediaSource1TimeMS = RTMP_Uptime1 * 1000
                ' Check BitrateFail1 - if bitrate is below fail value, appear to be 0
                If RTMP_Bitrate1 < RTMP_BitrateFail1 Then MediaSource1TimeMS = 0
                MediaSource1Time = MediaSource1TimeMS / 1000
            End If

            If serverSelection%% = 0 Or serverSelection%% = 2 Then

                multiStream2_Temp1 = multiStream2
                If multiStream2_Temp1 >= 1 And multiStream2_Temp2 >= 1 Then ' Fixed in v1.1.0
                    RTMP_Bitrate2 = Int((multiStream2_Temp1 - multiStream2_Temp2) / 128)
                End If

                MediaSource2Time = RTMP_Uptime2
                MediaSource2TimeMS = RTMP_Uptime2 * 1000
                ' Check BitrateFail2 - if bitrate is below fail value, appear to be 0
                If RTMP_Bitrate2 < RTMP_BitrateFail2 Then MediaSource2TimeMS = 0
                MediaSource2Time = MediaSource2TimeMS / 1000
            End If
    End Select

    On Error GoTo 0
    App_Refresh = FALSE

    If serverSelection%% = 0 Or serverSelection%% = 1 Then
        MediaSource1TimeMSOffset = MediaSource1TimeMS - MediaSource1TimeLog
        If MediaSource1TimeMSOffset < 0 Then MediaSource1TimeMSOffset = 0
    End If

    If serverSelection%% = 0 Or serverSelection%% = 2 Then
        MediaSource2TimeMSOffset = MediaSource2TimeMS - MediaSource2TimeLog
        If MediaSource2TimeMSOffset < 0 Then MediaSource2TimeMSOffset = 0
    End If

    ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true

    Select Case serverType$
        Case "SRT"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If serverSelection%% = 0 Or serverSelection%% = 1 Then
                If MediaSource1TimeMSOffset < MediaSourceTimeLB And Timer_Fail_Stream1 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total Then Multi1_CMD_LBR_1

                If MediaSource1TimeMSOffset < MediaSourceTimeLB And Timer_Fail_Stream1 = 0 Then
                    ' LBR_Delay
                    If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                    LBR_Delay_Plus = 1
                End If
                Multi1_CMD_LBR_2
            End If

            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If serverSelection%% = 0 Or serverSelection%% = 2 Then
                If MediaSource2TimeMSOffset < MediaSourceTimeLB And Timer_Fail_Stream2 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total And Not Scene2LBInactive Then Multi1_CMD_LBR_3

                ' Disable Scene #2 LBR if Scene2LBRDisabled is true
                If MediaSource2TimeMSOffset < MediaSourceTimeLB And Timer_Fail_Stream2 = 0 And Not Scene2LBInactive Then
                    ' LBR_Delay
                    If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                    LBR_Delay_Plus = 1
                End If
            End If
        Case "SLS"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If serverSelection%% = 0 Or serverSelection%% = 1 Then
                If SLS_Bitrate1 < SLS_BitrateLow1 And Timer_Fail_Stream1 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total Then Multi1_CMD_LBR_1

                If SLS_Bitrate1 < SLS_BitrateLow1 And Timer_Fail_Stream1 = 0 Then
                    ' LBR_Delay
                    If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                    LBR_Delay_Plus = 1
                End If
                Multi1_CMD_LBR_2
            End If

            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If serverSelection%% = 0 Or serverSelection%% = 2 Then
                If SLS_Bitrate2 < SLS_BitrateLow2 And Timer_Fail_Stream2 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total And Not Scene2LBInactive Then Multi1_CMD_LBR_3

                ' Disable Scene #2 LBR if Scene2LBRDisabled is true
                If SLS_Bitrate2 < SLS_BitrateLow2 And Timer_Fail_Stream2 = 0 And Not Scene2LBInactive Then
                    ' LBR_Delay
                    If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                    LBR_Delay_Plus = 1
                End If
            End If
        Case "RESTREAMER"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If serverSelection%% = 0 Or serverSelection%% = 1 Then
                If RESTREAMER_Bitrate1 < RESTREAMER_BitrateLow1 And Timer_Fail_Stream1 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total Then Multi1_CMD_LBR_1

                If RESTREAMER_Bitrate1 < RESTREAMER_BitrateLow1 And Timer_Fail_Stream1 = 0 Then
                    ' LBR_Delay
                    If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                    LBR_Delay_Plus = 1
                End If
                Multi1_CMD_LBR_2
            End If

            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If serverSelection%% = 0 Or serverSelection%% = 2 Then
                If RESTREAMER_Bitrate2 < RESTREAMER_BitrateLow2 And Timer_Fail_Stream2 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total And Not Scene2LBInactive Then Multi1_CMD_LBR_3

                ' Disable Scene #2 LBR if Scene2LBRDisabled is true
                If RESTREAMER_Bitrate2 < RESTREAMER_BitrateLow2 And Timer_Fail_Stream2 = 0 And Not Scene2LBInactive Then
                    ' LBR_Delay
                    If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                    LBR_Delay_Plus = 1
                End If
            End If
        Case "NGINX"
            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If serverSelection%% = 0 Or serverSelection%% = 1 Then
                If RTMP_Bitrate1 < RTMP_BitrateLow1 And Timer_Fail_Stream1 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total Then Multi1_CMD_LBR_1

                If RTMP_Bitrate1 < RTMP_BitrateLow1 And Timer_Fail_Stream1 = 0 Then
                    ' LBR_Delay
                    If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                    LBR_Delay_Plus = 1
                End If
                Multi1_CMD_LBR_2
            End If

            ' Added LBR_Delay >= LBR_Delay_Total for LBR_Delay and ConnectionsLog=true
            If serverSelection%% = 0 Or serverSelection%% = 2 Then
                If RTMP_Bitrate2 < RTMP_BitrateLow2 And Timer_Fail_Stream2 = 0 And CooldownLog = 0 And LBR_Delay >= LBR_Delay_Total And Not Scene2LBInactive Then Multi1_CMD_LBR_3

                ' Disable Scene #2 LBR if Scene2LBRDisabled is true
                If RTMP_Bitrate2 < RTMP_BitrateLow2 And Timer_Fail_Stream2 = 0 And Not Scene2LBInactive Then
                    ' LBR_Delay
                    If LBR_Delay >= LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total: CooldownLog = CooldownLogTotal: If CooldownLog > CooldownLogTotal Then CooldownLog = CooldownLogTotal
                    LBR_Delay_Plus = 1
                End If
            End If
    End Select

End Sub

Sub Multi1_CMD_LBR_1
    CooldownActive = 1
    ConnectionsLog1Count = ConnectionsLog1Count + 1
    If ConnectionsLog1Count > 999 Then ConnectionsLog1Count = 999

    ' Switch to Low Bandwidth Scene #1
    On Error GoTo App_Fail
    If SceneLBActive Then ' LBR fix Scene #1
        If _FileExists(outputLB_Temp1 + "png") Then Name outputLB_Temp1 + "png" As outputLB1 + "png"
        If _FileExists(outputLB_Temp1 + "gif") Then Name outputLB_Temp1 + "gif" As outputLB1 + "gif"

        ' Change scene for multi camera
        ' ReturnPreviousScene with SceneLBREnabled will be bugged unless the following code is used

        ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=true
        If streamsUp <> "0" And __returnPreviousScene And __returnPreviousSceneRemember Then
            If Right$(Scene_Current, 4) <> " LBR" Then ' Only set variable if not a Low Bitrate scene
                If streamsUp = "1" And previousScene = titleScene1 And Scene_Current <> titleScene1 Then titleScene1 = previousScene: Scene_Current = titleScene1 ' titleScene1 needs to reflect the manual scene change and be changed
                If streamsUp = "12" And previousScene = titleScene12 And Scene_Current <> titleScene12 Then titleScene12 = previousScene: Scene_Current = titleScene12 ' titleScene12 needs to reflect the manual scene change and be changed
            End If
        End If

        ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
        If streamsUp <> "0" And __returnPreviousScene And Not __returnPreviousSceneRemember Then
            If Right$(Scene_Current, 4) <> " LBR" And Right$(previousScene, 4) <> " LBR" Then ' Only set variable if not a Low Bitrate scene
                ' titleScene1 cannot be changed so previousScene is used to change to LBR scene
                ' this section changes to LBR scene but does not change back
                If streamsUp = "1" Then SRR = TRUE: titleScene1 = previousScene: Scene_Current = titleScene1 ' For LBR title temp
                If streamsUp = "12" Then SRR = TRUE: titleScene12 = previousScene: Scene_Current = titleScene12 ' For LBR title temp
            End If
        End If

        ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
        If SRR Then
            If HTTP_Communication_Native Then http_client_connect "Set", previousScene + " LBR" Else Shell _Hide _DontWait shell_cmd_1 + previousScene + " LBR" + shell_cmd_2
            SRR = FALSE
        Else
            ' These two lines were the only code prior to LBR fix
            If Scene_Current = titleScene1 Then
                If HTTP_Communication_Native Then http_client_connect "Set", titleScene1 + " LBR" Else Shell _Hide _DontWait shell_cmd_1 + titleScene1 + " LBR" + shell_cmd_2
            End If
            If Scene_Current = titleScene12 Then
                If HTTP_Communication_Native Then http_client_connect "Set", titleScene12 + " LBR" Else Shell _Hide _DontWait shell_cmd_1 + titleScene12 + " LBR" + shell_cmd_2
            End If
        End If

    End If
    On Error GoTo 0

    If __FileStatusOutput Then statusOutputToFile "[LOW BANDWIDTH]:[CAMERA #1]"
    If ConnectionsLog Then statusConnectionsLogToFile "[WARN] Insufficient bandwidth for stream #1, " + _Trim$(Str$(ConnectionsLog1Count)) + " times": CooldownLog = CooldownLogTotal
End Sub

Sub Multi1_CMD_LBR_2
    If CooldownActive = 1 And CooldownLog = 0 Then
        CooldownActive = 0

        ' Switch to Low Bandwidth Scene #1 end
        On Error GoTo App_Fail
        If SceneLBActive Then ' LBR fix Scene #1 end
            If _FileExists(outputLB1 + "png") Then Name outputLB1 + "png" As outputLB_Temp1 + "png"
            If _FileExists(outputLB1 + "gif") Then Name outputLB1 + "gif" As outputLB_Temp1 + "gif"

            ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
            If streamsUp <> "0" And __returnPreviousScene And Not __returnPreviousSceneRemember Then
                If Right$(Scene_Current, 4) = " LBR" Or Right$(previousScene, 4) = " LBR" Then
                    ' titleScene1 cannot be changed so previousScene is used to change to LBR scene

                    If streamsUp = "1" Then
                        If previousScene <> titleScene1 Or Scene_Current <> titleScene1 Then
                            SRR = TRUE
                        End If
                    End If

                    If streamsUp = "12" Then
                        If previousScene <> titleScene12 Or Scene_Current <> titleScene12 Then
                            SRR = TRUE
                        End If
                    End If

                End If
            End If

            If SRR Then ' previousScene is current scene name so " LBR" needs to be removed from the end
                If Right$(previousScene, 4) = " LBR" Then
                    If HTTP_Communication_Native Then http_client_connect "Set", Mid$(previousScene, 1, Len(previousScene) - 4) Else Shell _Hide _DontWait shell_cmd_1 + Mid$(previousScene, 1, Len(previousScene) - 4) + shell_cmd_2
                End If
                ' titleScene change should not be permanent when ReturnPreviousSceneRemember=false, so use titleScene Temp to revert
                titleScene1 = titleScene1Temp: titleScene2 = titleScene2Temp: titleScene12 = titleScene12Temp
                SRR = FALSE
            Else
                ' Change scene for multi camera
                ' These two lines were the only code prior to LBR fix
                If Scene_Current = titleScene1 Then
                    If HTTP_Communication_Native Then http_client_connect "Set", titleScene1 Else Shell _Hide _DontWait shell_cmd_1 + titleScene1 + shell_cmd_2
                End If
                If Scene_Current = titleScene12 Then
                    If HTTP_Communication_Native Then http_client_connect "Set", titleScene12 Else Shell _Hide _DontWait shell_cmd_1 + titleScene12 + shell_cmd_2
                End If
            End If

        End If
        On Error GoTo 0

        If tmpFileRestore = TRUE Then
            tmpFileRestore = FALSE
        Else
            If __FileStatusOutput Then statusOutputToFile "[FULL BANDWIDTH]:[CAMERA #1] (" + _Trim$(Str$(CooldownDuration)) + " sec)"
            If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Bandwidth restored for stream #1, " + _Trim$(Str$(ConnectionsLog1Count)) + " times (" + _Trim$(Str$(CooldownDuration)) + " sec)"
        End If
        ' Reset low bitrate duration seconds count
        CooldownDuration = 0
    End If
End Sub

Sub Multi1_CMD_LBR_3
    CooldownActive = 2
    ConnectionsLog2Count = ConnectionsLog2Count + 1
    If ConnectionsLog2Count > 999 Then ConnectionsLog2Count = 999

    ' Switch to Low Bandwidth Scene #2
    On Error GoTo App_Fail
    If SceneLBActive Then ' LBR fix Scene #2
        If _FileExists(outputLB_Temp2 + "png") Then Name outputLB_Temp2 + "png" As outputLB2 + "png"
        If _FileExists(outputLB_Temp2 + "gif") Then Name outputLB_Temp2 + "gif" As outputLB2 + "gif"

        ' Change scene for multi camera
        ' Disable Scene #2 LBR if Scene2LBRDisabled is true

        ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=true
        If streamsUp <> "0" And __returnPreviousScene And __returnPreviousSceneRemember Then
            If Right$(Scene_Current, 4) <> " LBR" Then ' Only set variable if not a Low Bitrate scene
                If streamsUp = "2" And previousScene = titleScene2 And Scene_Current <> titleScene2 Then titleScene2 = previousScene: Scene_Current = titleScene2 ' titleScene2 needs to reflect the manual scene change and be changed
                If streamsUp = "12" And previousScene = titleScene12 And Scene_Current <> titleScene12 Then titleScene12 = previousScene: Scene_Current = titleScene12 ' titleScene12 needs to reflect the manual scene change and be changed
            End If
        End If


        ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
        If streamsUp <> "0" And __returnPreviousScene And Not __returnPreviousSceneRemember Then
            If Right$(Scene_Current, 4) <> " LBR" And Right$(previousScene, 4) <> " LBR" Then ' Only set variable if not a Low Bitrate scene
                ' titleScene2 cannot be changed so previousScene is used to change to LBR scene
                ' this section changes to LBR scene but does not change back
                If streamsUp = "2" Then SRR = TRUE: titleScene2 = previousScene: Scene_Current = titleScene2 ' For LBR title temp
                If streamsUp = "12" Then SRR = TRUE: titleScene12 = previousScene: Scene_Current = titleScene12 ' For LBR title temp
            End If
        End If


        ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
        If SRR Then
            If HTTP_Communication_Native Then http_client_connect "Set", previousScene + " LBR" Else Shell _Hide _DontWait shell_cmd_1 + previousScene + " LBR" + shell_cmd_2
            SRR = FALSE
        Else
            ' These two lines were the only code prior to LBR fix
            If Scene_Current = titleScene2 Then
                If HTTP_Communication_Native Then http_client_connect "Set", titleScene2 + " LBR" Else Shell _Hide _DontWait shell_cmd_1 + titleScene2 + " LBR" + shell_cmd_2
            End If
            If Scene_Current = titleScene12 Then
                If HTTP_Communication_Native Then http_client_connect "Set", titleScene12 + " LBR" Else Shell _Hide _DontWait shell_cmd_1 + titleScene12 + " LBR" + shell_cmd_2
            End If
        End If

    End If
    On Error GoTo 0

    If __FileStatusOutput Then statusOutputToFile "[LOW BANDWIDTH]:[CAMERA #2]"
    If ConnectionsLog Then statusConnectionsLogToFile "[WARN] Insufficient bandwidth for stream #2, " + _Trim$(Str$(ConnectionsLog2Count)) + " times": CooldownLog = CooldownLogTotal
End Sub

Sub Multi1_CMD_LBR_4
    ' Can only be called once per second else LBR malfuntions with mixed servers

    If Timer_Fail_Stream1 = 0 And Timer_Fail_Stream2 = 0 Then

        ' LBR_Delay streams 1+2

        Select Case MediaSource1TimeMSOffset
            Case 960 To 1040, 0
                If Server_1 = "SRT" Then LBR_Delay_Minus = 1
        End Select
        Select Case MediaSource2TimeMSOffset
            Case 960 To 1040, 0
                If Server_2 = "SRT" Then LBR_Delay_Minus = 1
        End Select
        Select Case SLS_Bitrate1 ' Bitrate can be used here. Case 960 - 1040 is invalid.
            Case Is > SLS_BitrateLow1, 0
                If Server_1 = "SLS" Then LBR_Delay_Minus = 1
        End Select
        Select Case SLS_Bitrate2 ' Bitrate can be used here. Case 960 - 1040 is invalid.
            Case Is > SLS_BitrateLow2, 0
                If Server_2 = "SLS" Then LBR_Delay_Minus = 1
        End Select
        Select Case RESTREAMER_Bitrate1 ' Bitrate can be used here. Case 960 - 1040 is invalid.
            Case Is > RESTREAMER_BitrateLow1, 0
                If Server_1 = "RESTREAMER" Then LBR_Delay_Minus = 1
        End Select
        Select Case RESTREAMER_Bitrate2 ' Bitrate can be used here. Case 960 - 1040 is invalid.
            Case Is > RESTREAMER_BitrateLow2, 0
                If Server_2 = "RESTREAMER" Then LBR_Delay_Minus = 1
        End Select
        Select Case RTMP_Bitrate1 ' Bitrate can be used here. Case 960 - 1040 is invalid.
            Case Is > RTMP_BitrateLow1, 0
                If Server_1 = "NGINX" Then LBR_Delay_Minus = 1
        End Select
        Select Case RTMP_Bitrate2 ' Bitrate can be used here. Case 960 - 1040 is invalid.
            Case Is > RTMP_BitrateLow2, 0
                If Server_2 = "NGINX" Then LBR_Delay_Minus = 1
        End Select


        If LBR_Delay_Plus = 1 Then
            LBR_Delay = LBR_Delay + 1: If LBR_Delay > LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total
        ElseIf LBR_Delay_Minus = 1 Then
            LBR_Delay = LBR_Delay - 1: If LBR_Delay <= 0 Then LBR_Delay = 0
        End If


    Else

        ' LBR_Delay stream 1 or 2

        If Timer_Fail_Stream1 = 0 Then
            Select Case MediaSource1TimeMSOffset
                Case 960 To 1040, 0
                    If Server_1 = "SRT" Then LBR_Delay_Minus = 1
            End Select
        End If
        If Timer_Fail_Stream2 = 0 Then
            Select Case MediaSource2TimeMSOffset
                Case 960 To 1040, 0
                    If Server_2 = "SRT" Then LBR_Delay_Minus = 1
            End Select
        End If
        ' Bitrate can be used here. Case 960 - 1040 is invalid.
        If Timer_Fail_Stream1 = 0 Then
            Select Case SLS_Bitrate1
                Case Is > SLS_BitrateLow1, 0
                    If Server_1 = "SLS" Then LBR_Delay_Minus = 1
            End Select
        End If
        ' Bitrate can be used here. Case 960 - 1040 is invalid.
        If Timer_Fail_Stream2 = 0 Then
            Select Case SLS_Bitrate2
                Case Is > SLS_BitrateLow2, 0
                    If Server_2 = "SLS" Then LBR_Delay_Minus = 1
            End Select
        End If
        ' Bitrate can be used here. Case 960 - 1040 is invalid.
        If Timer_Fail_Stream1 = 0 Then
            Select Case RTMP_Bitrate1
                Case Is > RTMP_BitrateLow1, 0
                    If Server_1 = "NGINX" Then LBR_Delay_Minus = 1
            End Select
        End If
        ' Bitrate can be used here. Case 960 - 1040 is invalid.
        If Timer_Fail_Stream2 = 0 Then
            Select Case RTMP_Bitrate2
                Case Is > RTMP_BitrateLow2, 0
                    If Server_2 = "NGINX" Then LBR_Delay_Minus = 1
            End Select
        End If

        If LBR_Delay_Plus = 1 Then LBR_Delay = LBR_Delay + 1: If LBR_Delay > LBR_Delay_Total Then LBR_Delay = LBR_Delay_Total
        If LBR_Delay_Minus = 1 Then LBR_Delay = LBR_Delay - 1: If LBR_Delay <= 0 Then LBR_Delay = 0

    End If


    LBR_Delay_Minus = 0
    LBR_Delay_Plus = 0


    If serverSelection%% = 0 Or serverSelection%% = 2 Then

        If CooldownActive = 2 And CooldownLog = 0 Then
            CooldownActive = 0

            ' Switch to Low Bandwidth Scene #2 end
            On Error GoTo App_Fail
            If SceneLBActive Then ' LBR fix Scene #2 end
                If _FileExists(outputLB2 + "png") Then Name outputLB2 + "png" As outputLB_Temp2 + "png"
                If _FileExists(outputLB2 + "gif") Then Name outputLB2 + "gif" As outputLB_Temp2 + "gif"

                ' Fix for LBR scene when ReturnPreviousScene=true and ReturnPreviousSceneRemember=false
                If streamsUp <> "0" And __returnPreviousScene And Not __returnPreviousSceneRemember Then
                    If Right$(Scene_Current, 4) = " LBR" Or Right$(previousScene, 4) = " LBR" Then
                        ' titleScene1 cannot be changed so previousScene is used to change to LBR scene

                        If streamsUp = "2" Then
                            If previousScene <> titleScene2 Or Scene_Current <> titleScene2 Then
                                SRR = TRUE
                            End If
                        End If

                        If streamsUp = "12" Then
                            If previousScene <> titleScene12 Or Scene_Current <> titleScene12 Then
                                SRR = TRUE
                            End If
                        End If

                    End If
                End If

                If SRR Then ' previousScene is current scene name so " LBR" needs to be removed from the end
                    If Right$(previousScene, 4) = " LBR" Then
                        If HTTP_Communication_Native Then http_client_connect "Set", Mid$(previousScene, 1, Len(previousScene) - 4) Else Shell _Hide _DontWait shell_cmd_1 + Mid$(previousScene, 1, Len(previousScene) - 4) + shell_cmd_2
                    End If
                    ' titleScene change should not be permanent when ReturnPreviousSceneRemember=false, so use titleScene Temp to revert
                    titleScene1 = titleScene1Temp: titleScene2 = titleScene2Temp: titleScene12 = titleScene12Temp
                    SRR = FALSE
                Else
                    ' Change scene for multi camera
                    ' These two lines were the only code prior to LBR fix
                    If Scene_Current = titleScene2 Then
                        If HTTP_Communication_Native Then http_client_connect "Set", titleScene2 Else Shell _Hide _DontWait shell_cmd_1 + titleScene2 + shell_cmd_2
                    End If
                    If Scene_Current = titleScene12 Then
                        If HTTP_Communication_Native Then http_client_connect "Set", titleScene12 Else Shell _Hide _DontWait shell_cmd_1 + titleScene12 + shell_cmd_2
                    End If
                End If

            End If
            On Error GoTo 0

            If tmpFileRestore = TRUE Then
                tmpFileRestore = FALSE
            Else
                If __FileStatusOutput Then statusOutputToFile "[FULL BANDWIDTH]:[CAMERA #2] (" + _Trim$(Str$(CooldownDuration)) + " sec)"
                If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Bandwidth restored for stream #2, " + _Trim$(Str$(ConnectionsLog1Count)) + " times (" + _Trim$(Str$(CooldownDuration)) + " sec)"
            End If
            ' Reset low bitrate duration seconds count
            CooldownDuration = 0
        End If

    End If
End Sub

Sub DummyServer (DummyServerSelection$)

    ' Dummy server for testing
    Server_Dummy_Time = Server_Dummy_Time + 1: If Server_Dummy_Time >= 30 Then Server_Dummy_Time = 0
    If Server_Dummy_Time <= 15 Then
        ' Server online
        Select Case UCase$(DummyServerSelection$)
            Case "BELABOX1", "BELABOX2"
                sls_stats_dummy.xml = "{" + c10
                sls_stats_dummy.xml = sls_stats_dummy.xml + "  " + c34 + "publishers" + c34 + ": {" + c34 + "publish/live/stream1" + c34 + ": {" + c34 + "connected" + c34 + ": true, " + c34 + "latency" + c34 + ": 2000, " + c34 + "network" + c34 + ": 5365, " + c34 + "bitrate" + c34 + ": 5355, " + c34 + "rtt" + c34 + ": 42, " + c34 + "dropped_pkts" + c34 + ": 0}}," + c10
                sls_stats_dummy.xml = sls_stats_dummy.xml + "  " + c34 + "consumers" + c34 + ": [" + c10
                sls_stats_dummy.xml = sls_stats_dummy.xml + "    {" + c34 + "latency" + c34 + ": 200, " + c34 + "network" + c34 + ": 5397, " + c34 + "bitrate" + c34 + ": 5397, " + c34 + "rtt" + c34 + ": 37, " + c34 + "dropped_pkts" + c34 + ": 0}" + c10
                sls_stats_dummy.xml = sls_stats_dummy.xml + "  ]" + c10 + "}"
            Case "SLS1", "SLS2"
                sls_stats_dummy.xml = "{" + c34 + "publishers" + c34 + ":{" + c34 + "publish/live/stream1" + c34 + ":{" + c34 + "bitrate" + c34 + ":914," + c34 + "bytesRcvDrop" + c34 + ":1708160," + c34 + "bytesRcvLoss" + c34 + ":0," + c34 + "mbpsBandwidth" + c34 + ":10.0," + c34 + "mbpsRecvRate" + c34 + ":0.0," + c34 + "msRcvBuf" + c34 + ":1083129856," + c34 + "pktRcvDrop" + c34 + ":0," + c34 + "pktRcvLoss" + c34 + ":0," + c34 + "rtt" + c34 + ":0.0," + c34 + "uptime" + c34 + ":15}}," + c34 + "status" + c34 + ":" + c34 + "ok" + c34 + "}"
        End Select
        Select Case UCase$(DummyServerSelection$)
            Case "BELABOX1"
                sls_stats.xml = "": sls_stats.xml = sls_stats_dummy.xml
            Case "BELABOX2"
                sls_stats_2.xml = "": sls_stats_2.xml = sls_stats_dummy.xml
            Case "SLS1"
                sls_stats.xml = "": sls_stats.xml = sls_stats_dummy.xml
            Case "SLS2"
                sls_stats_2.xml = "": sls_stats_2.xml = sls_stats_dummy.xml
        End Select
    Else
        ' Server offline
        Select Case UCase$(DummyServerSelection$)
            Case "BELABOX1", "BELABOX2"
                sls_stats_dummy.xml = "{" + c10
                sls_stats_dummy.xml = sls_stats_dummy.xml + "  " + c34 + "publishers" + c34 + ": {" + c34 + "publish/live/stream1" + c34 + ": {" + c34 + "connected" + c34 + ": false, " + c34 + "latency" + c34 + ": 0, " + c34 + "network" + c34 + ": 0, " + c34 + "bitrate" + c34 + ": 0, " + c34 + "rtt" + c34 + ": 0, " + c34 + "dropped_pkts" + c34 + ": 0}}," + c10
                sls_stats_dummy.xml = sls_stats_dummy.xml + "  " + c34 + "consumers" + c34 + ": [" + c10
                sls_stats_dummy.xml = sls_stats_dummy.xml + "  ]" + c10
                sls_stats_dummy.xml = sls_stats_dummy.xml + "}"
            Case "SLS1", "SLS2"
                sls_stats_dummy.xml = "{" + c34 + "publishers" + c34 + ":{}," + c34 + "status" + c34 + ":" + c34 + "ok" + c34 + "}"
        End Select
        Select Case UCase$(DummyServerSelection$)
            Case "BELABOX1"
                sls_stats.xml = "": sls_stats.xml = sls_stats_dummy.xml
            Case "BELABOX2"
                sls_stats_2.xml = "": sls_stats_2.xml = sls_stats_dummy.xml
            Case "SLS1"
                sls_stats.xml = "": sls_stats.xml = sls_stats_dummy.xml
            Case "SLS2"
                sls_stats_2.xml = "": sls_stats_2.xml = sls_stats_dummy.xml
        End Select
    End If

End Sub

Sub Timer01
    ' Timer01: ------------------------------------------------------------------------------------------------------------------------------
    td_update = Timer(.001) - timer1
    timer1 = Timer(.001)

    'SetCaption DebugTemp1LB, ' Temp
    'SetCaption DebugTemp1LB2, ' Temp
    'SetCaption DebugTemp2LB, "" ' Temp
    'SetCaption DebugTemp2LB2, ' Temp
    'SetCaption DebugTemp3LB, "" ' Temp
    'SetCaption DebugTemp3LB2, ' Temp
    'SetCaption DebugTemp4LB, "" ' Temp
    'SetCaption DebugTemp4LB2, ' Temp

    CooldownLog = CooldownLog - 1
    If CooldownLog < 0 Then CooldownLog = 0

    If _DirExists(config_dir) Then If Not _DirExists(temp_dir) Then MkDir temp_dir

    tPing1 = Timer(.001)

    ' Count how many seconds stream has been running at low bitrate
    If CooldownLog Then CooldownDuration = CooldownDuration + 1
    If CooldownDuration > Timer_Limit Then CooldownDuration = Timer_Limit

    ' Get Media Source times (1 stream) ------------------------------------------------------------------------------------------------------------------------------
    If Not __MultiCameraSwitch Then

        If Not __SLS_1_Enabled And Not __RTMP_1_Enabled And Not __RESTREAMER_1_Enabled Then Multi0 "SRT": Server_1 = "SRT"
        If __SLS_1_Enabled And Not __RTMP_1_Enabled And Not __RESTREAMER_1_Enabled Then Multi0 "SLS": Server_1 = "SLS"
        If __RTMP_1_Enabled And Not __SLS_1_Enabled And Not __RESTREAMER_1_Enabled Then Multi0 "NGINX": Server_1 = "NGINX"
        If __RESTREAMER_1_Enabled And Not __SLS_1_Enabled And Not __RTMP_1_Enabled Then Multi0 "RESTREAMER": Server_1 = "RESTREAMER"

    End If

    ' Get Media Source times (2 streams) ------------------------------------------------------------------------------------------------------------------------------
    If __MultiCameraSwitch Then

        ' OBS SRT only
        If Not SLS_Active And Not RTMP_Active And Not RESTREAMER_Active Then Multi1 "SRT", 0: Server_1 = "SRT": Server_2 = "SRT": GoTo Servers_Found

        ' Both true for same server (no OBS SRT)
        If __SLS_1_Enabled And __SLS_2_Enabled Then Multi1 "SLS", 0: Server_1 = "SLS": Server_2 = "SLS": GoTo Servers_Found
        If __RTMP_1_Enabled And __RTMP_2_Enabled Then Multi1 "NGINX", 0: Server_1 = "NGINX": Server_2 = "NGINX": GoTo Servers_Found
        If __RESTREAMER_1_Enabled And __RESTREAMER_2_Enabled Then Multi1 "RESTREAMER", 0: Server_1 = "RESTREAMER": Server_2 = "RESTREAMER": GoTo Servers_Found

        ' Mixed servers (no OBS SRT)
        If __SLS_1_Enabled And __RTMP_2_Enabled Then Multi1 "SLS", 1: Multi1 "RTMP", 2: Server_1 = "SLS": Server_2 = "RTMP": GoTo Servers_Found
        If __RTMP_1_Enabled And __SLS_2_Enabled Then Multi1 "RTMP", 1: Multi1 "SLS", 2: Server_1 = "RTMP": Server_2 = "SLS": GoTo Servers_Found
        If __SLS_1_Enabled And __RESTREAMER_2_Enabled Then Multi1 "SLS", 1: Multi1 "RESTREAMER", 2: Server_1 = "SLS": Server_2 = "RESTREAMER": GoTo Servers_Found
        If __RESTREAMER_1_Enabled And __SLS_2_Enabled Then Multi1 "RESTREAMER", 1: Multi1 "SLS", 2: Server_1 = "RESTREAMER": Server_2 = "SLS": GoTo Servers_Found
        If __RTMP_1_Enabled And __RESTREAMER_2_Enabled Then Multi1 "RTMP", 1: Multi1 "RESTREAMER", 2: Server_1 = "RTMP": Server_2 = "RESTREAMER": GoTo Servers_Found
        If __RESTREAMER_1_Enabled And __RTMP_2_Enabled Then Multi1 "RESTREAMER", 1: Multi1 "RTMP", 2: Server_1 = "RESTREAMER": Server_2 = "RTMP": GoTo Servers_Found

        ' Mixed servers (with OBS SRT)
        If __SLS_1_Enabled And Not __SLS_2_Enabled And Not RTMP_Active And Not RESTREAMER_Active Then Multi1 "SLS", 1: Multi1 "SRT", 2: Server_1 = "SLS": Server_2 = "SRT": GoTo Servers_Found
        If __SLS_2_Enabled And Not __SLS_1_Enabled And Not RTMP_Active And Not RESTREAMER_Active Then Multi1 "SRT", 1: Multi1 "SLS", 2: Server_1 = "SRT": Server_2 = "SLS": GoTo Servers_Found
        If __RTMP_1_Enabled And Not __RTMP_2_Enabled And Not SLS_Active And Not RESTREAMER_Active Then Multi1 "RTMP", 1: Multi1 "SRT", 2: Server_1 = "RTMP": Server_2 = "SRT": GoTo Servers_Found
        If __RTMP_2_Enabled And Not __RTMP_1_Enabled And Not SLS_Active And Not RESTREAMER_Active Then Multi1 "SRT", 1: Multi1 "RTMP", 2: Server_1 = "SRT": Server_2 = "RTMP": GoTo Servers_Found
        If __RESTREAMER_1_Enabled And Not __RESTREAMER_2_Enabled And Not RTMP_Active And Not SLS_Active Then Multi1 "RESTREAMER", 1: Multi1 "SRT", 2: Server_1 = "RESTREAMER": Server_2 = "SRT": GoTo Servers_Found
        If __RESTREAMER_2_Enabled And Not __RESTREAMER_1_Enabled And Not RTMP_Active And Not SLS_Active Then Multi1 "SRT", 1: Multi1 "RESTREAMER", 2: Server_1 = "SRT": Server_2 = "RESTREAMER": GoTo Servers_Found

        Servers_Found:
        Multi1_CMD_LBR_4 ' Can't be called more than once

    End If

    ' Debug: MS rate
    MediaSourceTimeMSOffsetDisplay = Int((MediaSource1TimeMSOffset) / 10) * 10
    If MediaSourceTimeMSOffsetDisplay > 960 And MediaSourceTimeMSOffsetDisplay < 1040 Then MediaSourceTimeMSOffsetDisplay = 1000
    If MediaSourceTimeMSOffsetDisplay > 99999 Then MediaSourceTimeMSOffsetDisplay = 99999

    MediaSource2TimeMSOffsetDisplay = Int((MediaSource2TimeMSOffset) / 10) * 10
    If MediaSource2TimeMSOffsetDisplay > 960 And MediaSource2TimeMSOffsetDisplay < 1040 Then MediaSource2TimeMSOffsetDisplay = 1000
    If MediaSource2TimeMSOffsetDisplay > 99999 Then MediaSource2TimeMSOffsetDisplay = 99999

    tPing2 = Timer(.001)
    tPingOut = (tPing2 - tPing1)

    If Deny_Ping <> "true" Then
        tPingTimer = tPingTimer + 1
        If tPingTimer >= 10 Then
            tPingTimer = 0
            If Not SLS_Active Then
                On Error GoTo App_Fail
                tIPPing1 = Timer(.001)
                network_client = _OpenClient("TCP/IP:" + Mid$(OBS_URL, InStr(OBS_URL, ":") + 1) + ":" + Left$(OBS_URL, InStr(OBS_URL, ":") - 1))
                Close network_client
                tIPPing2 = Timer(.001)
                tIPPingOut = (tIPPing2 - tIPPing1)
                On Error GoTo 0
            End If

            ' Check if obs-websocket-http is still connected and attempt to force close & reopen if it's not
            If OS = "WINDOWS" And _FileExists(HTTP_File) Then
                If HTTP_Enabled Then
                    If HTTP_Communication_Native Then
                        http_client_connect "GetVersion", ""
                        JSON = Space$(Len(GetVersion.tmp))
                        JSON = GetVersion.tmp
                        If GetKey("obsWebSocketVersion", JSON) = "" Then
                            Shell "%ComSpec% /C START " + c34 + c34 + " /MIN " + "taskkill /IM " + c34 + HTTP_Filename + c34 + " /F"
                            _Delay 1
                            Shell _DontWait "%ComSpec% /C START " + c34 + c34 + " /MIN " + c34 + HTTP_File
                            'If HTTP_Auth_Key = "" Then Shell _DontWait "%ComSpec% /C START " + c34 + c34 + " /MIN " + c34 + HTTP_File + c34 + " --ws_url ws://" + OBS_URL + " --ws_password " + OBS_PW Else Shell _DontWait "%ComSpec% /C START " + c34 + c34 + " /MIN " + c34 + HTTP_File + c34 + " --ws_url ws://" + OBS_URL + " --ws_password " + OBS_PW + " --http_auth_key " + HTTP_Auth_Key
                        End If
                    Else
                        Shell _Hide CMD_EXE_HTTP + c34 + "http://" + HTTP_Bind_Address + ":" + HTTP_Bind_Port + "/call/GetVersion" + c34 + " -o " + c34 + filePrevious_ms + c34
                        Open filePrevious_ms For Binary As #128
                        JSON = Space$(LOF(128))
                        Get #128, , JSON
                        Close #128
                        If GetKey("obsWebSocketVersion", JSON) = "" Then
                            Shell "%ComSpec% /C START " + c34 + c34 + " /MIN " + "taskkill /IM " + c34 + HTTP_Filename + c34 + " /F"
                            _Delay 1
                            Shell _DontWait "%ComSpec% /C START " + c34 + c34 + " /MIN " + c34 + HTTP_File
                            'If HTTP_Auth_Key = "" Then Shell _DontWait "%ComSpec% /C START " + c34 + c34 + " /MIN " + c34 + HTTP_File + c34 + " --ws_url ws://" + OBS_URL + " --ws_password " + OBS_PW Else Shell _DontWait "%ComSpec% /C START " + c34 + c34 + " /MIN " + c34 + HTTP_File + c34 + " --ws_url ws://" + OBS_URL + " --ws_password " + OBS_PW + " --http_auth_key " + HTTP_Auth_Key
                        End If
                    End If

                    If _FileExists(filePrevious_ms) Then Kill filePrevious_ms
                End If
            End If

        End If
    End If

    ' Display stuff on screen ------------------------------------------------------------------------------------------------------------------------------
    If Timer_Failed Then Timer_Failed = FALSE: ToolTip(Timer_Fail_CountLB) = "Last Failed: " + Time$: Tooltip_Mouse = TRUE
    If Timer_Failed1 Then Timer_Failed1 = FALSE: ToolTip(Timer_Fail_CountLB) = "Last Failed: " + Time$: Tooltip_Mouse = TRUE
    If Timer_Failed2 Then Timer_Failed2 = FALSE: ToolTip(Timer_Fail_Count_2LB) = "Last Failed: " + Time$: Tooltip_Mouse = TRUE

    If MediaSource1Time <> 0 Or MediaSource2Time <> 0 And RIST_MediaSource1Time_Count <= 4 And RIST_MediaSource2Time_Count <= 4 Then Timer_Fail = 0 ' SRT ' RIST mode

    If MediaSource1Time = 0 And MediaSource2Time = 0 And srt_warmup Then Timer_Fail = Timer_Fail + 1 ' SRT
    If Timer_Fail > Timer_Limit Then Timer_Fail = Timer_Limit

    ' Fail icon
    If Timer_Fail >= Stream_Fail_Delay Then
        Control(Timer_FailLB).ForeColor = RED_FAIL
    Else
        If Timer_Fail >= 1 Then
            Control(Timer_FailLB).ForeColor = RED_WARNING
            Stream_Down_Icon = TRUE
            _Title "Stream Down! - Loopy SRT Monitor"
            iconStatus& = __imageMEM&("icon-x-16.png")
            If iconStatus& < -1 Then
                _Icon iconStatus&
                _FreeImage iconStatus&
            End If
        Else Control(Timer_FailLB).ForeColor = GREEN_OK
        End If
    End If
    SetCaption (Timer_FailLB), calc_srt$(Timer_Fail, 1) + calc_srt_sec$

    ' OK icon
    If Timer_Fail = 0 And Stream_Down_Icon Then
        Stream_Down_Icon = FALSE
        If Err = 0 Then
            _Title "Loopy SRT Monitor"
            $ExeIcon:'.\icon.ico'
        End If
    End If

    If Not __MultiCameraSwitch Then

        If Timer_Fail_Count >= 1 Then Control(Timer_Fail_CountLB).ForeColor = RED_WARNING Else Control(Timer_Fail_CountLB).ForeColor = GREEN_OK
        If Timer_Fail_Count = 1 And ConnectionsLog1Count = 1 Then
            SetCaption (Timer_Fail_CountLB), LTrim$(Str$(Timer_Fail_Count)) + "   /   " + LTrim$(Str$(ConnectionsLog1Count)) + "  time"
        Else
            SetCaption (Timer_Fail_CountLB), LTrim$(Str$(Timer_Fail_Count)) + "   /   " + LTrim$(Str$(ConnectionsLog1Count)) + "  times"
        End If

        Control(Stream1LightLB).Hidden = TRUE
        Control(Stream2LightLB).Hidden = TRUE
        If MediaSource1Time <= 1 Then
            Control(StreamLightLB).ForeColor = _RGB32(252, 20, 10)
            SetCaption (StreamLightLB), "____________________________________"
        Else
            Control(StreamLightLB).ForeColor = _RGB32(18, 245, 20)
            SetCaption (StreamLightLB), "_____________________________________"
        End If

    Else

        If Timer_Fail_Count1 >= 1 Then Control(Timer_Fail_CountLB).ForeColor = RED_WARNING Else Control(Timer_Fail_CountLB).ForeColor = GREEN_OK
        If Timer_Fail_Count1 = 1 And ConnectionsLog1Count = 1 Then
            SetCaption (Timer_Fail_CountLB), LTrim$(Str$(Timer_Fail_Count1)) + "   /   " + LTrim$(Str$(ConnectionsLog1Count)) + "  time"
        Else
            SetCaption (Timer_Fail_CountLB), LTrim$(Str$(Timer_Fail_Count1)) + "   /   " + LTrim$(Str$(ConnectionsLog1Count)) + "  times"
        End If

        If Timer_Fail_Count2 >= 1 Then Control(Timer_Fail_Count_2LB).ForeColor = RED_WARNING Else Control(Timer_Fail_Count_2LB).ForeColor = GREEN_OK
        If Timer_Fail_Count2 = 1 And ConnectionsLog2Count = 1 Then
            SetCaption (Timer_Fail_Count_2LB), LTrim$(Str$(Timer_Fail_Count2)) + "   /   " + LTrim$(Str$(ConnectionsLog2Count)) + "  time"
        Else
            SetCaption (Timer_Fail_Count_2LB), LTrim$(Str$(Timer_Fail_Count2)) + "   /   " + LTrim$(Str$(ConnectionsLog2Count)) + "  times"
        End If

    End If

    CooldownLogWarn = CooldownLogWarn - 1: If CooldownLogWarn < 0 Then CooldownLogWarn = 0
    If Not SLS_Active Then
        If CooldownLogWarn <= 0 Then If ConnectionsLog And Val(tout) >= .35 And CooldownLog = 0 Then statusConnectionsLogToFile "[WARN] IP ping exceeding 350ms": CooldownLog = CooldownLogTotal: CooldownLogWarn = 60
    Else
        If CooldownLogWarn <= 0 Then If ConnectionsLog And Val(tout) >= .45 And CooldownLog = 0 Then statusConnectionsLogToFile "[WARN] SLS ping exceeding 450ms": CooldownLog = CooldownLogTotal: CooldownLogWarn = 60
        If CooldownLogWarn <= 0 Then If ConnectionsLog And Val(tout_2) >= .45 And CooldownLog = 0 Then statusConnectionsLogToFile "[WARN] SLS #2 ping exceeding 450ms": CooldownLog = CooldownLogTotal:: CooldownLogWarn = 60
    End If

    TIMEms tPingOut, 0, 0
    If Val(tout) >= .6 Then Control(tPingOutLB).ForeColor = RED_WARNING Else Control(tPingOutLB).ForeColor = GREEN_OK
    If CooldownLogWarn <= 0 Then If ConnectionsLog And Val(tout) >= .512 And CooldownLog = 0 And sls_connect_timer_1 <> 1 And sls_connect_timer_2 <> 1 Then statusConnectionsLogToFile "[WARN] WebSocket ping exceeding 500ms": CooldownLog = CooldownLogTotal: CooldownLogWarn = 60
    If Val(tout) >= .6 And CooldownLog = 0 And sls_connect_timer_1 <> 1 And sls_connect_timer_2 <> 1 Then SetCaption StatusLB, "WebSocket/Server ping very high...": updateDisplay = 1 ' Display error if WebSocket ping is too high
    SetCaption (tPingOutLB), LTrim$(Str$(Val(tout) * 1000)) + " ms"

    ' NGINX RTMP Server
    If RTMP_Active And Not __MultiCameraSwitch Then
        If RTMP_Bitrate1 > RTMP_BitrateLow1 Then Control(MultiCameraSwitchStatusLB).ForeColor = GREEN_OK Else Control(MultiCameraSwitchStatusLB).ForeColor = RED_WARNING
        If RTMP_Bitrate1 < RTMP_BitrateFail1 Or RTMP_Bitrate1 = 0 Then Control(MultiCameraSwitchStatusLB).ForeColor = RED_FAIL
        Select Case RTMP_Bitrate1
            Case 0 To 99
                If RTMP_Kbps_Precision <> "nerd" Then bitrateOutput1Display = _Trim$(Str$(Int(RTMP_Bitrate1 / 100))) + " Kbps" Else bitrateOutput1Display = _Trim$(Str$(Int(RTMP_Bitrate1))) + " Kbps"
                SetCaption MultiCameraSwitchStatusLB, bitrateOutput1Display
            Case Is >= 100
                If RTMP_Kbps_Precision <> "nerd" Then bitrateOutput1Display = _Trim$(Str$(Int(RTMP_Bitrate1 / 100))) + "00 Kbps" Else bitrateOutput1Display = _Trim$(Str$(Int(RTMP_Bitrate1))) + " Kbps"
                SetCaption MultiCameraSwitchStatusLB, bitrateOutput1Display
        End Select
    End If

    If RTMP_Active And __MultiCameraSwitch Then
        If Not __SLS_1_Enabled Then If RTMP_Bitrate1 > RTMP_BitrateLow1 Then Control(Bitrate_Stream_1LB).ForeColor = GREEN_OK Else Control(Bitrate_Stream_1LB).ForeColor = RED_WARNING
        If Not __SLS_2_Enabled Then If RTMP_Bitrate2 > RTMP_BitrateLow2 Then Control(Bitrate_Stream_2LB).ForeColor = GREEN_OK Else Control(Bitrate_Stream_2LB).ForeColor = RED_WARNING
        If Not __SLS_1_Enabled Then If RTMP_Bitrate1 < RTMP_BitrateFail1 Or RTMP_Bitrate1 = 0 Then Control(Bitrate_Stream_1LB).ForeColor = RED_FAIL
        If Not __SLS_2_Enabled Then If RTMP_Bitrate2 < RTMP_BitrateFail1 Or RTMP_Bitrate2 = 0 Then Control(Bitrate_Stream_2LB).ForeColor = RED_FAIL
        If Not __SLS_1_Enabled Then
            Select Case RTMP_Bitrate1
                Case 0 To 99
                    If RTMP_Kbps_Precision <> "nerd" Then bitrateOutput1Display = _Trim$(Str$(Int(RTMP_Bitrate1 / 100))) + " Kbps" Else bitrateOutput1Display = _Trim$(Str$(Int(RTMP_Bitrate1))) + " Kbps"
                    SetCaption Bitrate_Stream_1LB, bitrateOutput1Display
                Case Is >= 100
                    If RTMP_Kbps_Precision <> "nerd" Then bitrateOutput1Display = _Trim$(Str$(Int(RTMP_Bitrate1 / 100))) + "00 Kbps" Else bitrateOutput1Display = _Trim$(Str$(Int(RTMP_Bitrate1))) + " Kbps"
                    SetCaption Bitrate_Stream_1LB, bitrateOutput1Display
            End Select
        End If
        If Not __SLS_2_Enabled Then
            Select Case RTMP_Bitrate2
                Case 0 To 99
                    If RTMP_Kbps_Precision <> "nerd" Then bitrateOutput2Display = _Trim$(Str$(Int(RTMP_Bitrate2 / 100))) + " Kbps" Else bitrateOutput2Display = _Trim$(Str$(Int(RTMP_Bitrate2))) + " Kbps"
                    SetCaption Bitrate_Stream_2LB, bitrateOutput2Display
                Case Is >= 100
                    If RTMP_Kbps_Precision <> "nerd" Then bitrateOutput2Display = _Trim$(Str$(Int(RTMP_Bitrate2 / 100))) + "00 Kbps" Else bitrateOutput2Display = _Trim$(Str$(Int(RTMP_Bitrate2))) + " Kbps"
                    SetCaption Bitrate_Stream_2LB, bitrateOutput2Display
            End Select
        End If
    End If


    ' SRT Live Server
    If SLS_Active And Not __MultiCameraSwitch Or RESTREAMER_Active And Not __MultiCameraSwitch Then
        If __SLS_1_Enabled Then If SLS_Bitrate1 > SLS_BitrateLow1 Then Control(MultiCameraSwitchStatusLB).ForeColor = GREEN_OK Else Control(MultiCameraSwitchStatusLB).ForeColor = RED_WARNING
        If __SLS_1_Enabled Then If SLS_Active Then If SLS_Bitrate1 < SLS_BitrateFail1 Or SLS_Bitrate1 = 0 Then Control(MultiCameraSwitchStatusLB).ForeColor = RED_FAIL

        If __RESTREAMER_1_Enabled Then If RESTREAMER_Bitrate1 > RESTREAMER_BitrateLow1 Then Control(MultiCameraSwitchStatusLB).ForeColor = GREEN_OK Else Control(MultiCameraSwitchStatusLB).ForeColor = RED_WARNING
        If __RESTREAMER_1_Enabled Then If RESTREAMER_Active Then If RESTREAMER_Bitrate1 < RESTREAMER_BitrateFail1 Or RESTREAMER_Bitrate1 = 0 Then Control(MultiCameraSwitchStatusLB).ForeColor = RED_FAIL
        Select Case SLS_Bitrate1
            Case 0 To 99
                If SLS_Kbps_Precision <> "nerd" Then bitrateOutput1Display = _Trim$(Str$(Int(SLS_Bitrate1 / 100))) + " Kbps" Else bitrateOutput1Display = _Trim$(Str$(Int(SLS_Bitrate1))) + " Kbps"
                SetCaption MultiCameraSwitchStatusLB, bitrateOutput1Display
            Case Is >= 100
                If SLS_Kbps_Precision <> "nerd" Then bitrateOutput1Display = _Trim$(Str$(Int(SLS_Bitrate1 / 100))) + "00 Kbps" Else bitrateOutput1Display = _Trim$(Str$(Int(SLS_Bitrate1))) + " Kbps"
                SetCaption MultiCameraSwitchStatusLB, bitrateOutput1Display
        End Select
    End If

    If SLS_Active And __MultiCameraSwitch Or RESTREAMER_Active And __MultiCameraSwitch Then
        If Not __RTMP_1_Enabled And __SLS_1_Enabled Then If SLS_Bitrate1 > SLS_BitrateLow1 Then Control(Bitrate_Stream_1LB).ForeColor = GREEN_OK Else Control(Bitrate_Stream_1LB).ForeColor = RED_WARNING
        If Not __RTMP_2_Enabled And __SLS_2_Enabled Then If SLS_Bitrate2 > SLS_BitrateLow2 Then Control(Bitrate_Stream_2LB).ForeColor = GREEN_OK Else Control(Bitrate_Stream_2LB).ForeColor = RED_WARNING
        If Not __RTMP_1_Enabled And __SLS_1_Enabled Then If SLS_Bitrate1 < SLS_BitrateFail1 Or SLS_Bitrate1 = 0 Then Control(Bitrate_Stream_1LB).ForeColor = RED_FAIL: If SLS_Bitrate2 < SLS_BitrateFail2 Or SLS_Bitrate2 = 0 Then Control(Bitrate_Stream_2LB).ForeColor = RED_FAIL

        If Not __RTMP_1_Enabled And __RESTREAMER_1_Enabled Then If RESTREAMER_Bitrate1 > RESTREAMER_BitrateLow1 Then Control(Bitrate_Stream_1LB).ForeColor = GREEN_OK Else Control(Bitrate_Stream_1LB).ForeColor = RED_WARNING
        If Not __RTMP_2_Enabled And __RESTREAMER_2_Enabled Then If RESTREAMER_Bitrate2 > RESTREAMER_BitrateLow2 Then Control(Bitrate_Stream_2LB).ForeColor = GREEN_OK Else Control(Bitrate_Stream_2LB).ForeColor = RED_WARNING
        If Not __RTMP_1_Enabled And __RESTREAMER_1_Enabled Then If RESTREAMER_Bitrate1 < RESTREAMER_BitrateFail1 Or RESTREAMER_Bitrate1 = 0 Then Control(Bitrate_Stream_1LB).ForeColor = RED_FAIL: If SLS_Bitrate2 < SLS_BitrateFail2 Or SLS_Bitrate2 = 0 Then Control(Bitrate_Stream_2LB).ForeColor = RED_FAIL

        If Not __RTMP_1_Enabled Then
            Select Case SLS_Bitrate1
                Case 0 To 99
                    If SLS_Kbps_Precision <> "nerd" Then bitrateOutput1Display = _Trim$(Str$(Int(SLS_Bitrate1 / 100))) + " Kbps" Else bitrateOutput1Display = _Trim$(Str$(Int(SLS_Bitrate1))) + " Kbps"
                    SetCaption Bitrate_Stream_1LB, bitrateOutput1Display
                Case Is >= 100
                    If SLS_Kbps_Precision <> "nerd" Then bitrateOutput1Display = _Trim$(Str$(Int(SLS_Bitrate1 / 100))) + "00 Kbps" Else bitrateOutput1Display = _Trim$(Str$(Int(SLS_Bitrate1))) + " Kbps"
                    SetCaption Bitrate_Stream_1LB, bitrateOutput1Display
            End Select
        End If
        If Not __RTMP_2_Enabled Then
            Select Case SLS_Bitrate2
                Case 0 To 99
                    If SLS_Kbps_Precision <> "nerd" Then bitrateOutput2Display = _Trim$(Str$(Int(SLS_Bitrate2 / 100))) + " Kbps" Else bitrateOutput2Display = _Trim$(Str$(Int(SLS_Bitrate2))) + " Kbps"
                    SetCaption Bitrate_Stream_2LB, bitrateOutput2Display
                Case Is >= 100
                    If SLS_Kbps_Precision <> "nerd" Then bitrateOutput2Display = _Trim$(Str$(Int(SLS_Bitrate2 / 100))) + "00 Kbps" Else bitrateOutput2Display = _Trim$(Str$(Int(SLS_Bitrate2))) + " Kbps"
                    SetCaption Bitrate_Stream_2LB, bitrateOutput2Display
            End Select
        End If
    End If

    If Not srt_warmup Then
        Control(td_updateLB).ForeColor = GREEN_OK
        SetCaption (td_updateLB), "1.000 sec " ' Dummy time displayed on startup just for 1 second
    End If

    If srt_warmup Then
        If td_update <= 0.001 Then td_update = 0.001
        If td_update >= 9.999 Then td_update = 9.999
        If td_update <= 0.979 Or td_update >= 1.021 Then Control(td_updateLB).ForeColor = RED_WARNING Else Control(td_updateLB).ForeColor = GREEN_OK
        TIMEms td_update, 0, 0
        SetCaption (td_updateLB), tout + " sec "
    End If

    ' Temporarily disable LBR if update interval is too high
    If srt_warmup And SceneLBActive_Temp_Disable >= 1 Then
        SceneLBActive_Temp_Disable = SceneLBActive_Temp_Disable + 1
        SceneLBActive_Temp_Disable_Display = " (" + _Trim$(Str$(31 - SceneLBActive_Temp_Disable)) + "s)"
        If SceneLBActive_Temp_Disable > 31 Then SceneLBActive_Temp_Disable = 0: SceneLBActive_Temp_Disable_Display = "": SceneLBActive = TRUE ' Number of seconds to disable LBR
    End If
    If CooldownLog = 0 And srt_warmup And td_update > 1.1 And SceneLBActive And SceneLBActive_Temp_Disable = 0 And srt_warmup_LB = 0 Then
        SceneLBActive_Temp_Disable = 1
        SceneLBActive = FALSE
        SetCaption StatusLB, "Update interval too high, LBR temporarily disabled...": updateDisplay = 1 ' Display error if update interval too high
    End If
    If CooldownLog = 0 And srt_warmup And td_update > 1.1 And Not SceneLBActive And SceneLBActive_Temp_Disable >= 1 Then
        SceneLBActive_Temp_Disable = 1
        SetCaption StatusLB, "Update interval too high, LBR temporarily disabled...": updateDisplay = 1 ' Display error if update interval too high
    End If

    SetCaption (Stream_Fail_DelayLB), calc_srt$(Stream_Fail_Delay, 1) + calc_srt_sec$
    If Timer_Fail And MediaSource1Time = 0 And MediaSource2Time = 0 Then Control(Scene_CurrentLB).ForeColor = RED_FAIL Else Control(Scene_CurrentLB).ForeColor = GREEN_SCENE_OK
    If Not SLS_Active And Not RTMP_Active And Not RESTREAMER_Active And Not __MultiCameraSwitch Then SetCaption (MultiCameraSwitchStatusLB), "Disabled"

    'If RTMP_Width1 And RTMP_Height1 Then Server_Display1 = " / " + LTrim$(Str$(RTMP_Width1)) + "x" + LTrim$(Str$(RTMP_Height1))
    'If RTMP_Width2 And RTMP_Height2 Then Server_Display2 = " / " + LTrim$(Str$(RTMP_Width2)) + "x" + LTrim$(Str$(RTMP_Height2))

    If __SLS_1_Enabled Then Server_Display1 = "  //  [SLS]"
    If __SLS_2_Enabled Then Server_Display2 = "  //  [SLS]"
    If __RESTREAMER_1_Enabled Then Server_Display1 = "  //  [RESTREAMER]"
    If __RESTREAMER_2_Enabled Then Server_Display2 = "  //  [RESTREAMER]"
    If __RTMP_1_Enabled Then Server_Display1 = "  //  [NGINX]"
    If __RTMP_2_Enabled Then Server_Display2 = "  //  [NGINX]"
    If Not __SLS_1_Enabled And Not __RTMP_1_Enabled And Not __RESTREAMER_1_Enabled Then Server_Display1 = "  //  [SRT]"
    If Not __SLS_2_Enabled And Not __RTMP_2_Enabled And Not __RESTREAMER_2_Enabled Then Server_Display2 = "  //  [SRT]"
    If BELABOX_1_Found Or BELABOX_1_Offline Then Server_Display1 = "  //  [BELABOX]"
    If BELABOX_2_Found Or BELABOX_2_Offline Then Server_Display2 = "  //  [BELABOX]"

    If SLS_2_Active And __SLS_1_Enabled Then Stream_Title_1 = "Server" Else Stream_Title_1 = "Stream" ' SLS 2nd IP
    If SLS_2_Active And __SLS_2_Enabled Then Stream_Title_2 = "Server" Else Stream_Title_2 = "Stream" ' SLS 2nd IP
    If Timer_Fail_Stream1 Then SetCaption (Stream1), Stream_Title_1 + " #1" + Server_Display1 + " ": Control(Stream1).ForeColor = RED_FAIL Else SetCaption (Stream1), Stream_Title_1 + " #1" + Server_Display1: Control(Stream1).ForeColor = GREEN_STREAM_OK
    If Timer_Fail_Stream2 Then SetCaption (Stream2), Stream_Title_2 + " #2" + Server_Display2 + " ": Control(Stream2).ForeColor = RED_FAIL Else SetCaption (Stream2), Stream_Title_2 + " #2" + Server_Display2: Control(Stream2).ForeColor = GREEN_STREAM_OK


    ' Set ping label for all situations
    tout = "": tout_2 = ""
    If Not __MultiCameraSwitch Then
        Server_Ping_Display_1 = Server_1
        If Server_Ping_Display_1 = "SRT" Then Server_Ping_Display_1 = "Network"
        If BELABOX_1_Found Or BELABOX_1_Offline Then Server_Ping_Display_1 = "BELABOX"
        SetCaption IPPingLB, Server_Ping_Display_1 + " ping"
        ' Find ping
        If Server_Ping_Display_1 = "SRT" Or Server_Ping_Display_1 = "Network" Then TIMEms tIPPingOut, 0, 0
        If Server_Ping_Display_1 = "NGINX" Then TIMEms RTMP_PingOut, 0, 0
        If Server_Ping_Display_1 = "SLS" Or Server_Ping_Display_1 = "BELABOX" Then TIMEms SLS_PingOut, 0, 0
        If Server_Ping_Display_1 = "RESTREAMER" Then TIMEms RESTREAMER_PingOut, 0, 0
        ' Display ping
        SetCaption (tIPPingOutLB), LTrim$(Str$(Val(tout) * 1000)) + " ms"
    Else
        Server_Ping_Display_1 = Server_1
        Server_Ping_Display_2 = Server_2
        If Server_Ping_Display_1 = "SRT" And Server_Ping_Display_2 = "SRT" Then Server_Ping_Display_1 = "Network": Server_Ping_Display_2 = "Network"
        If BELABOX_1_Found Or BELABOX_1_Offline Then Server_Ping_Display_1 = "BELABOX"
        If BELABOX_2_Found Or BELABOX_2_Offline Then Server_Ping_Display_2 = "BELABOX"
        If Server_Ping_Display_1 = Server_Ping_Display_2 Then SetCaption IPPingLB, Server_Ping_Display_1 + " ping" Else SetCaption IPPingLB, Server_Ping_Display_1 + " / " + Server_Ping_Display_2
        ' Find ping(s)
        If Server_Ping_Display_1 = "SRT" Or Server_Ping_Display_1 = "Network" Then TIMEms tIPPingOut, 0, 0
        If Server_Ping_Display_1 = "NGINX" Then TIMEms RTMP_PingOut, 0, 0
        If Server_Ping_Display_1 = "SLS" Or Server_Ping_Display_1 = "BELABOX" Then TIMEms SLS_PingOut, 0, 0
        If Server_Ping_Display_1 = "RESTREAMER" Then TIMEms RESTREAMER_PingOut, 0, 0
        If Server_Ping_Display_2 = "SRT" Or Server_Ping_Display_2 = "Network" Then TIMEms tIPPingOut, 0, 1
        If Server_Ping_Display_2 = "NGINX" Then TIMEms RTMP_PingOut, 0, 1
        If Server_Ping_Display_2 = "SLS" Or Server_Ping_Display_2 = "BELABOX" Then TIMEms SLS_PingOut_2, 0, 1
        If Server_Ping_Display_2 = "RESTREAMER" Then TIMEms RESTREAMER_PingOut, 0, 1
        ' Display ping(s)
        If Server_Ping_Display_1 = Server_Ping_Display_2 And Not SLS_2_Active Then
            SetCaption (tIPPingOutLB), LTrim$(Str$(Val(tout) * 1000)) + " ms"
        Else
            SetCaption (tIPPingOutLB), LTrim$(Str$(Val(tout) * 1000)) + "   /   " + LTrim$(Str$(Val(tout_2) * 1000)) + " ms" ' SLS 2nd IP
        End If
    End If
    If Val(tout) >= .5 Or Val(tout_2) >= .5 Then Control(tIPPingOutLB).ForeColor = RED_WARNING Else Control(tIPPingOutLB).ForeColor = GREEN_OK


    If __MultiCameraSwitch Then
        SetCaption (MultiCameraSwitchStatusLB), "Enabled"
        SetCaption (Scene_CurrentLB), Left$(previousSceneDisplay, 20)

        ' temp1_stream1 variables
        If srt_warmup Then Timer_Fail_Stream1 = Timer_Fail_Stream1 + 1
        If MediaSource1Time <> 0 And RIST_MediaSource1Time_Count <= 4 Then Timer_Fail_Stream1 = 0: Timer_Fail = 0 ' SRT ' RIST mode
        If Timer_Fail_Stream1 > Timer_Limit Then Timer_Fail_Stream1 = Timer_Limit
        If Timer_Fail_Output1 > Timer_Limit Then Timer_Fail_Output1 = Timer_Limit

        ' temp1_stream2 variables
        If srt_warmup Then Timer_Fail_Stream2 = Timer_Fail_Stream2 + 1
        If MediaSource2Time <> 0 And RIST_MediaSource2Time_Count <= 4 Then Timer_Fail_Stream2 = 0: Timer_Fail = 0 ' SRT ' RIST mode
        If Timer_Fail_Stream2 > Timer_Limit Then Timer_Fail_Stream2 = Timer_Limit
        If Timer_Fail_Output2 > Timer_Limit Then Timer_Fail_Output2 = Timer_Limit

        If Timer_Fail_Stream1 >= Stream_Fail_Delay Then Control(Timer_Fail_Stream1LB).ForeColor = RED_FAIL Else If Timer_Fail_Stream1 >= 1 Then Control(Timer_Fail_Stream1LB).ForeColor = RED_WARNING Else Control(Timer_Fail_Stream1LB).ForeColor = GREEN_OK
        If __FileStatusOutput Or ConnectionsLog Then If Timer_Fail_Stream1 >= 1 Then Timer_Fail_Output1 = Timer_Fail_Stream1
        SetCaption (Timer_Fail_Stream1LB), calc_srt$(Timer_Fail_Stream1, 1) + calc_srt_sec$

        If Timer_Fail_Stream2 >= Stream_Fail_Delay Then Control(Timer_Fail_Stream2LB).ForeColor = RED_FAIL Else If Timer_Fail_Stream2 >= 1 Then Control(Timer_Fail_Stream2LB).ForeColor = RED_WARNING Else Control(Timer_Fail_Stream2LB).ForeColor = GREEN_OK
        If __FileStatusOutput Or ConnectionsLog Then If Timer_Fail_Stream2 >= 1 Then Timer_Fail_Output2 = Timer_Fail_Stream2
        SetCaption (Timer_Fail_Stream2LB), calc_srt$(Timer_Fail_Stream2, 1) + calc_srt_sec$

        If MediaSource1Time <= 2 Then Control(Uptime_Stream_1LB).ForeColor = RED_FAIL Else If MediaSource1Time >= 3 And MediaSource1Time < 10 Then Control(Uptime_Stream_1LB).ForeColor = RED_WARNING Else Control(Uptime_Stream_1LB).ForeColor = GREEN_OK

        If BELABOX_1_Found And MediaSource1Time >= 1 And MediaSource1Time <= 10 Then SetCaption (Uptime_Stream_1LB), calc_srt$(MediaSource1Time, 1) + calc_srt_sec$ + "*" Else SetCaption (Uptime_Stream_1LB), calc_srt$(MediaSource1Time, 1) + calc_srt_sec$ ' SRT ' SLS 2nd IP
        If MediaSource2Time <= 2 Then Control(Uptime_Stream_2LB).ForeColor = RED_FAIL Else If MediaSource2Time >= 3 And MediaSource2Time < 10 Then Control(Uptime_Stream_2LB).ForeColor = RED_WARNING Else Control(Uptime_Stream_2LB).ForeColor = GREEN_OK
        If BELABOX_2_Found And MediaSource2Time >= 1 And MediaSource2Time <= 10 Then SetCaption (Uptime_Stream_2LB), calc_srt$(MediaSource2Time, 1) + calc_srt_sec$ + "*" Else SetCaption (Uptime_Stream_2LB), calc_srt$(MediaSource2Time, 1) + calc_srt_sec$ ' SRT ' SLS 2nd IP

        Control(StreamLightLB).Hidden = TRUE
        If MediaSource1Time <= 1 Then
            Control(Stream1LightLB).ForeColor = _RGB32(252, 20, 10)
            SetCaption (Stream1LightLB), "____________________________________"
        Else
            Control(Stream1LightLB).ForeColor = _RGB32(18, 245, 20)
            SetCaption (Stream1LightLB), "_____________________________________"
        End If
        If MediaSource2Time <= 1 Then
            Control(Stream2LightLB).ForeColor = _RGB32(252, 20, 10)
            SetCaption (Stream2LightLB), "____________________________________"
        Else
            Control(Stream2LightLB).ForeColor = _RGB32(18, 245, 20)
            SetCaption (Stream2LightLB), "_____________________________________"
        End If

        If Timer_Fail_Stream1 = 2 And CooldownStartup = 0 Then
            Timer_Fail_Count1 = Timer_Fail_Count1 + 1
            Timer_Failed1 = TRUE
            If Timer_Fail_Count1 > 999 Then Timer_Fail_Count1 = 999
        End If

        If Timer_Fail_Stream2 = 2 And CooldownStartup = 0 Then
            Timer_Fail_Count2 = Timer_Fail_Count2 + 1
            Timer_Failed2 = TRUE
            If Timer_Fail_Count2 > 999 Then Timer_Fail_Count2 = 999
        End If
    Else
        SetCaption (Scene_CurrentLB), Left$(Scene_Current, 20)

        ' Stream #1 only
        If srt_warmup Then Timer_Fail_Stream1 = Timer_Fail_Stream1 + 1
        If MediaSource1Time <> 0 And RIST_MediaSource1Time_Count <= 4 Then Timer_Fail_Stream1 = 0: Timer_Fail = 0 ' SRT ' RIST mode
        If Timer_Fail_Stream1 > Timer_Limit Then Timer_Fail_Stream1 = Timer_Limit
        If Timer_Fail_Output1 > Timer_Limit Then Timer_Fail_Output1 = Timer_Limit

        If MediaSource1Time <= 3 Then Control(Stream_UptimeLB).ForeColor = RED_FAIL Else If MediaSource1Time > 3 And MediaSource1Time < 10 Then Control(Stream_UptimeLB).ForeColor = RED_WARNING Else Control(Stream_UptimeLB).ForeColor = GREEN_OK
        ' Stream #1 uptime
        SetCaption (Stream_UptimeLB), calc_srt$(MediaSource1Time, 1) + calc_srt_sec$ ' SRT
        If BELABOX_1_Found And MediaSource1Time >= 1 And MediaSource1Time <= 10 Then SetCaption (Stream_UptimeLB), calc_srt$(MediaSource1Time, 1) + calc_srt_sec$ + "*" ' SRT ' SLS 2nd IP
        If Timer_Fail_Stream1 >= Stream_Fail_Delay Then Control(Stream_Fail_TimerLB).ForeColor = RED_FAIL Else If Timer_Fail_Stream1 >= 1 Then Control(Stream_Fail_TimerLB).ForeColor = RED_WARNING Else Control(Stream_Fail_TimerLB).ForeColor = GREEN_OK
        If __FileStatusOutput Or ConnectionsLog Then If Timer_Fail_Stream1 >= 1 Then Timer_Fail_Output1 = Timer_Fail_Stream1
        SetCaption (Stream_Fail_TimerLB), calc_srt$(Timer_Fail_Stream1, 1) + calc_srt_sec$
    End If

    If Scene_OK = "" Or Scene_Fail = "" Or Scene_Intro = "" Then RefreshDisplayRequest = TRUE: Error_msg = "- Variable/s for scenes empty, check if " + c34 + config_main + c34 + " exists. (Error: #5)": _Delay 3

    If Timer_Fail >= 1 And Exe_OK And streamsUp <> "0" Then
        LoadImageMEM Control(PictureBox1), "tick_warning.png"
    ElseIf Timer_Fail = 0 And Exe_OK Then
        LoadImageMEM Control(PictureBox1), "tick.png"
    End If


    If Not __MultiCameraSwitch Then
        If SceneLBActive Then SetCaption Timer_Fail_Count_2LB, "Enabled" Else SetCaption Timer_Fail_Count_2LB, "Disabled" + SceneLBActive_Temp_Disable_Display ' Displayed same time as others and not "IF __MultiCameraSwitch" above
    Else
        If SceneLBActive Then SetCaption Low_Bitrate_StatusLB, "Enabled" Else SetCaption Low_Bitrate_StatusLB, "Disabled" + SceneLBActive_Temp_Disable_Display ' Displayed same time as others and not "IF __MultiCameraSwitch" above
    End If

    ' Update Display: ---------------------------------------------------------------
    ' Debug
    If Not Debug Then
        Control(DebugFrame).Hidden = TRUE
        Control(versionFrame).Hidden = FALSE
        Control(TimerLB).Hidden = TRUE
        Control(TimerSnapshotLB).Hidden = TRUE
        Control(td_displayLB2).Hidden = TRUE
        Control(mouseXLB2).Hidden = TRUE
        Control(mouseYLB2).Hidden = TRUE
        Control(__ERRORLINELB2).Hidden = TRUE
        Control(Debug_TimerLB).Hidden = TRUE
        Control(Debug_Timer_SnapshotLB).Hidden = TRUE
        Control(td_displayLB).Hidden = TRUE
        Control(mouseXLB).Hidden = TRUE
        Control(mouseYLB).Hidden = TRUE
        Control(__ERRORLINELB).Hidden = TRUE
        Control(LowBRTimerLB).Hidden = TRUE
        Control(br_countdownLB).Hidden = TRUE
        Control(MSRateLB).Hidden = TRUE
        Control(MSRateLB2).Hidden = TRUE
        Control(ms_playLB).Hidden = TRUE
        Control(ms_playLB2).Hidden = TRUE
        Control(LBRDelayLB).Hidden = TRUE
        Control(br_delayLB).Hidden = TRUE
        Control(PictureBoxLogoBottom).Hidden = FALSE
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
        If Debug_Temp = "true" Then
            Control(DebugFrameTemp).Hidden = TRUE
            Control(DebugTemp1LB).Hidden = TRUE
            Control(DebugTemp2LB).Hidden = TRUE
            Control(DebugTemp3LB).Hidden = TRUE
            Control(DebugTemp4LB).Hidden = TRUE
            Control(DebugTemp1LB2).Hidden = TRUE
            Control(DebugTemp2LB2).Hidden = TRUE
            Control(DebugTemp3LB2).Hidden = TRUE
            Control(DebugTemp4LB2).Hidden = TRUE
            Control(Settings).Hidden = FALSE
        End If

    ElseIf Debug Then
        Control(DebugFrame).Hidden = FALSE
        Control(versionFrame).Hidden = TRUE
        Control(TimerLB).Hidden = FALSE
        Control(TimerSnapshotLB).Hidden = FALSE
        Control(td_displayLB2).Hidden = FALSE
        Control(mouseXLB2).Hidden = FALSE
        Control(mouseYLB2).Hidden = FALSE
        Control(__ERRORLINELB2).Hidden = FALSE
        Control(Debug_TimerLB).Hidden = FALSE
        Control(Debug_Timer_SnapshotLB).Hidden = FALSE
        Control(td_displayLB).Hidden = FALSE
        Control(mouseXLB).Hidden = FALSE
        Control(mouseYLB).Hidden = FALSE
        Control(__ERRORLINELB).Hidden = FALSE
        Control(LowBRTimerLB).Hidden = FALSE
        Control(ms_playLB).Hidden = FALSE
        Control(ms_playLB2).Hidden = FALSE
        Control(br_countdownLB).Hidden = FALSE
        Control(MSRateLB).Hidden = FALSE
        Control(MSRateLB2).Hidden = FALSE
        Control(LBRDelayLB).Hidden = FALSE
        Control(br_delayLB).Hidden = FALSE
        Control(PictureBoxLogoBottom).Hidden = TRUE

        ' Debug Temp
        If Debug_Temp = "true" Then
            Control(DebugFrameTemp).Hidden = FALSE
            Control(DebugTemp1LB).Hidden = FALSE
            Control(DebugTemp2LB).Hidden = FALSE
            Control(DebugTemp3LB).Hidden = FALSE
            Control(DebugTemp4LB).Hidden = FALSE
            Control(DebugTemp1LB2).Hidden = FALSE
            Control(DebugTemp2LB2).Hidden = FALSE
            Control(DebugTemp3LB2).Hidden = FALSE
            Control(DebugTemp4LB2).Hidden = FALSE
            Control(Settings).Hidden = TRUE
        End If

        SetCaption TimerLB, "TIMER" ' TIMER
        SetCaption TimerSnapshotLB, "TIMER (snapshot)"
        SetCaption td_displayLB2, "td_display"
        SetCaption LBRDelayLB, "LBR Del"
        SetCaption mouseXLB2, "mouseX"
        SetCaption mouseYLB2, "mouseY"
        SetCaption __ERRORLINELB2, "_ERRORLINE"
        TIMEms Debug_Timer, 0, 0
        SetCaption (Debug_Timer_SnapshotLB), tout + " sec "
        ' MS rate
        SetCaption ms_playLB, _Trim$(Str$((MediaSourceTimeMSOffsetDisplay))) + " ms "
        SetCaption ms_playLB2, _Trim$(Str$((MediaSource2TimeMSOffsetDisplay))) + " ms "
        SetCaption br_countdownLB, _Trim$(Str$(CooldownLog)) + " sec "
        SetCaption br_delayLB, _Trim$(Str$(LBR_Delay)) + " sec "

    End If

    If verCheck$ <> "" Then
        SetCaption StatusLB, verCheck$
        updateDisplay = 1
    End If
    ' ---------------------------------------------------------------

    ' Get OBS scene: ---------------------------------------------------------------
    GetOBSScene:
    If Scene_Bypass <> Scene_Bypass_Check And Scene_Bypass_2 <> Scene_Bypass_Check And Scene_Bypass_3 <> Scene_Bypass_Check And Scene_Bypass_4 <> Scene_Bypass_Check And Scene_Bypass_5 <> Scene_Bypass_Check And Scene_Bypass_6 <> Scene_Bypass_Check And Scene_Bypass_7 <> Scene_Bypass_Check And Scene_Bypass_8 <> Scene_Bypass_Check And Scene_Bypass_9 <> Scene_Bypass_Check Then
        returnPreviousSceneTime = returnPreviousSceneTime + 1
        If returnPreviousSceneTime > 2 Then
            ' Output Kbps to file
            If __FileStatusOutput Then
                On Error GoTo App_Fail
                App_Refresh = TRUE
                Open outputKbpsFile1 For Output As #200
                Select Case SLS_Bitrate1
                    Case 0 To 99
                        If SLS_Kbps_Precision <> "nerd" Then Print #200, _Trim$(Str$(Int(SLS_Bitrate1 / 100))) Else Print #200, _Trim$(Str$(Int(SLS_Bitrate1)))
                    Case Is >= 100
                        If SLS_Kbps_Precision <> "nerd" Then Print #200, _Trim$(Str$(Int(SLS_Bitrate1 / 100))) + "00" Else Print #200, _Trim$(Str$(Int(SLS_Bitrate1)))
                End Select
                Close 200
                Open outputKbpsFile2 For Output As #204
                Select Case SLS_Bitrate2
                    Case 0 To 99
                        If SLS_Kbps_Precision <> "nerd" Then Print #204, _Trim$(Str$(Int(SLS_Bitrate2 / 100))) Else Print #204, _Trim$(Str$(Int(SLS_Bitrate2)))
                    Case Is >= 100
                        If SLS_Kbps_Precision <> "nerd" Then Print #204, _Trim$(Str$(Int(SLS_Bitrate2 / 100))) + "00" Else Print #204, _Trim$(Str$(Int(SLS_Bitrate2)))
                End Select
                Close 204
                On Error GoTo 0
                App_Refresh = FALSE
            End If
            returnPreviousSceneTime = 1
        Else
            GoTo Exit_returnPreviousSceneCheck
        End If
        returnFirstCheck = TRUE

        If HTTP_Enabled Then If HTTP_Communication_Native Then http_client_connect "Get", "" Else Shell _Hide CMD_EXE_HTTP_FAST_GET_SCENE Else Shell _Hide CMD_EXE_FAST + c34 + obs_get_scene + c34

        On Error GoTo App_Fail
        App_Refresh = TRUE

        If Not HTTP_Enabled Then ' HTTP

            If HTTP_Communication_Native Then
                http_client_connect "Get", ""
                Scene_Bypass_Check = GetCurrentProgramScene.tmp
                If streamsUp <> "0" Then previousScene = GetCurrentProgramScene.tmp
                previousSceneDisplay = GetCurrentProgramScene.tmp
            Else
                If _FileExists(filePrevious) Then
                    Open filePrevious For Input As #96
                    ' LOCK #96
                    Do Until EOF(96)
                        If LOF(96) = 0 Then NoKill = TRUE: Exit Do ' Overkill with EOF checking, but just being safe
                        If EOF(96) Then Exit Do
                        Line Input #96, file96
                        Scene_Bypass_Check = file96
                        If streamsUp <> "0" Then previousScene = file96
                        previousSceneDisplay = file96
                        Exit Do ' Output to previousScene
                    Loop
                End If
            End If

        End If

        If HTTP_Enabled Then ' HTTP

            If HTTP_Communication_Native Then
                http_client_connect "Get", ""
                JSON = Space$(Len(GetCurrentProgramScene.tmp))
                JSON = GetCurrentProgramScene.tmp
                file96 = GetKey("currentProgramSceneName", JSON)
                Scene_Bypass_Check = file96
                If streamsUp <> "0" Then previousScene = file96
                previousSceneDisplay = file96
            Else
                Open filePrevious For Binary As #128
                JSON = Space$(LOF(128))
                Get #128, , JSON
                Close #128
                file96 = GetKey("currentProgramSceneName", JSON)
                Scene_Bypass_Check = file96
                If streamsUp <> "0" Then previousScene = file96
                previousSceneDisplay = file96
            End If

        End If

        If __MultiCameraSwitch Then SetCaption (Scene_CurrentLB), Left$(previousSceneDisplay, 20) ' Update scene name faster for multi-camera-switch

    Else

        If Scene_Bypass <> "none" Or Scene_Bypass_2 <> "none" Or Scene_Bypass_3 <> "none" Or Scene_Bypass_4 <> "none" Or Scene_Bypass_5 <> "none" Or Scene_Bypass_6 <> "none" Or Scene_Bypass_7 <> "none" Or Scene_Bypass_8 <> "none" Or Scene_Bypass_9 <> "none" Then

            If HTTP_Enabled Then If HTTP_Communication_Native Then http_client_connect "Get", "" Else Shell _Hide CMD_EXE_HTTP_FAST_GET_SCENE Else Shell _Hide CMD_EXE_FAST + c34 + obs_get_scene + c34

            On Error GoTo App_Fail
            App_Refresh = TRUE

            If Not HTTP_Enabled Then ' HTTP

                If HTTP_Communication_Native Then
                    http_client_connect "Get", ""
                    Scene_Bypass_Check = GetCurrentProgramScene.tmp
                Else
                    If _FileExists(filePrevious) Then
                        Open filePrevious For Input As #96
                        ' LOCK #96
                        Do Until EOF(96)
                            If LOF(96) = 0 Then NoKill = TRUE: Exit Do ' Overkill with EOF checking, but just being safe
                            If EOF(96) Then Exit Do
                            Line Input #96, file96
                            Scene_Bypass_Check = file96
                            '
                            '
                            Exit Do ' Output to previousScene
                        Loop
                    End If
                End If

            End If

            If HTTP_Enabled Then ' HTTP

                If HTTP_Communication_Native Then
                    http_client_connect "Get", ""
                    JSON = Space$(Len(GetCurrentProgramScene.tmp))
                    JSON = GetCurrentProgramScene.tmp
                    file96 = GetKey("currentProgramSceneName", JSON)
                    Scene_Bypass_Check = file96
                Else
                    Open filePrevious For Binary As #128
                    JSON = Space$(LOF(128))
                    Get #128, , JSON
                    Close #128
                    file96 = GetKey("currentProgramSceneName", JSON)
                    Scene_Bypass_Check = file96
                    '
                    '
                End If

            End If

        End If

    End If
    Close #96

    If NoKill Then NoKill = FALSE Else If _FileExists(filePrevious) Then Kill filePrevious

    On Error GoTo 0
    App_Refresh = FALSE

    ' Check if any of the 9 bypass scenes equal the current scene
    If Scene_Bypass_Check <> "none" Then ' In case user has scene name labelled "none", which will break the program
        If Scene_Bypass = Scene_Bypass_Check Or Scene_Bypass_2 = Scene_Bypass_Check Or Scene_Bypass_3 = Scene_Bypass_Check Or Scene_Bypass_4 = Scene_Bypass_Check Or Scene_Bypass_5 = Scene_Bypass_Check Or Scene_Bypass_6 = Scene_Bypass_Check Or Scene_Bypass_7 = Scene_Bypass_Check Or Scene_Bypass_8 = Scene_Bypass_Check Or Scene_Bypass_9 = Scene_Bypass_Check Then
            SetCaption (Scene_CurrentLB), "[ PAUSE ]"
            If Not Scene_Bypass_Log Then
                Scene_Bypass_Log = TRUE
                If __FileStatusOutput Then statusOutputToFile "[STREAM PAUSED]"
                If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Stream manually paused"
            End If
            sls_connect_timer_1 = 99: sls_connect_timer_2 = 99: rtmp_connect_timer = 99: _Delay 1
            GoTo GetOBSScene
        End If
    End If

    Exit_returnPreviousSceneCheck:
    ' ---------------------------------------------------------------

    If __FileStatusOutput Then
        If Not __MultiCameraSwitch Then
            If _Trim$(bitrateOutput1Display) = "" Then bitrateOutput1Display = "n/a"
            bitrateOutput = "Bitrate: (#1: " + _Trim$(bitrateOutput1Display) + ")"
        Else
            If _Trim$(bitrateOutput1Display) = "" Then bitrateOutput1Display = "n/a": If _Trim$(bitrateOutput2Display) = "" Then bitrateOutput2Display = "n/a"
            bitrateOutput = "Bitrate: (#1: " + _Trim$(bitrateOutput1Display) + ") (#2: " + _Trim$(bitrateOutput2Display) + ")"
        End If
        statusBitrateToFile bitrateOutput
    End If

    Scene_Bypass_Log = FALSE

    ' Execute Stream OK
    If Not __MultiCameraSwitch Then
        If MediaSource1Time <> 0 And RIST_MediaSource1Time_Count <= 4 Then ' SRT ' RIST mode
            Timer_Fail = 0
            If CooldownLog = 0 Then Scene_Current = Scene_OK
            If Exe_Fail Then
                Exe_Fail = FALSE
                Exe_OK = TRUE
                LoadImageMEM Control(PictureBox1), "tick.png"
                If HTTP_Communication_Native Then http_client_connect "Set", Scene_OK Else Shell _Hide _DontWait shell_cmd_1 + Scene_OK + shell_cmd_2
                _Delay 0.033
                If Timer_Fail_Output1 = 0 Then Timer_Fail_Output1_Str = "-" Else Timer_Fail_Output1_Str = Str$(Timer_Fail_Output1)
                If __FileStatusOutput Then statusOutputToFile "[STREAM UP] (" + _Trim$(Timer_Fail_Output1_Str) + " sec)"
                If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Now online stream (" + _Trim$(Timer_Fail_Output1_Str) + " sec)"
                Timer_Fail_Stream1 = 0
            End If
        Else
            If Timer_Fail >= Stream_Fail_Delay Or RIST_MediaSource1Time_Count >= 5 Then ' RIST mode ' Scene_Fail triggered at 5 seconds, the same as SRT timeout
                If Exe_OK Then
                    Exe_OK = FALSE
                    Exe_Fail = TRUE
                    LoadImageMEM Control(PictureBox1), "cross.png"
                    If Not Exe_Fail_First Then
                        Exe_Fail_First = TRUE
                        Scene_Current = Scene_Intro
                        If HTTP_Communication_Native Then http_client_connect "Set", Scene_Intro Else Shell _Hide _DontWait shell_cmd_1 + Scene_Intro + shell_cmd_2
                        _Delay 0.033
                    Else
                        Scene_Current = Scene_Fail
                        If HTTP_Communication_Native Then http_client_connect "Set", Scene_Fail Else Shell _Hide _DontWait shell_cmd_1 + Scene_Fail + shell_cmd_2
                        _Delay 0.033
                        If __FileStatusOutput Then statusOutputToFile "[STREAM DOWN]"
                        If ConnectionsLog Then statusConnectionsLogToFile "[WARN] No bandwidth for stream, " + _Trim$(Str$(ConnectionsLog1Count)) + " times"
                        Timer_Fail_Count = Timer_Fail_Count + 1
                        Timer_Failed = TRUE
                        If Timer_Fail_Count > 999 Then Timer_Fail_Count = 999
                    End If
                End If
            End If
        End If
        If __MultiCameraSwitch Then SetCaption (Scene_CurrentLB), Left$(previousSceneDisplay, 20) Else SetCaption (Scene_CurrentLB), Left$(Scene_Current, 20)
    End If

    If streamsUp <> "0" Then lastStreamUp = streamsUp

    ' Only set variable if not a Low Bitrate scene
    If Right$(previousScene, 4) <> " LBR" Then
        If streamsUp <> "0" And __returnPreviousSceneRemember Then
            If streamsUp = "1" Then titleScene1 = previousScene
            If streamsUp = "2" Then titleScene2 = previousScene
            If streamsUp = "12" Then titleScene12 = previousScene
        End If
    End If

    If __MultiCameraSwitch Then
        If Timer_Fail_Stream1 = 0 And Timer_Fail_Stream2 >= Stream_Fail_Delay Then
            If streamsUp <> "1" Then
                If previousScene <> titleScene1 And streamsUp = "0" And __returnPreviousScene Then ' __returnPreviousScene added for ReturnPreviousSceneRemember=false
                    If lastStreamUp <> "1" Then previousScene = titleScene1
                    Scene_Current = previousScene
                    If HTTP_Communication_Native Then http_client_connect "Set", previousScene Else Shell _Hide _DontWait shell_cmd_1 + previousScene + shell_cmd_2
                    _Delay 0.033
                    If Timer_Fail_Output1 = 0 Then Timer_Fail_Output1_Str = "-" Else Timer_Fail_Output1_Str = Str$(Timer_Fail_Output1)
                    If Timer_Fail_Output2 = 0 Then Timer_Fail_Output2_Str = "-" Else Timer_Fail_Output2_Str = Str$(Timer_Fail_Output2)
                    If __FileStatusOutput Then statusOutputToFile "[STREAM UP]:[CAMERA #1 UP]:[CAMERA #2 DOWN] (" + _Trim$(Timer_Fail_Output1_Str) + " sec)"
                    If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Now online stream #1, now down stream #2 (" + _Trim$(Timer_Fail_Output1_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                Else ' ReturnPreviousSceneRemember=false
                    Scene_Current = titleScene1
                    If HTTP_Communication_Native Then http_client_connect "Set", titleScene1 Else Shell _Hide _DontWait shell_cmd_1 + titleScene1 + shell_cmd_2
                    _Delay 0.033
                    If Timer_Fail_Output1 = 0 Then Timer_Fail_Output1_Str = "-" Else Timer_Fail_Output1_Str = Str$(Timer_Fail_Output1)
                    If Timer_Fail_Output2 = 0 Then Timer_Fail_Output2_Str = "-" Else Timer_Fail_Output2_Str = Str$(Timer_Fail_Output2)
                    If __FileStatusOutput Then statusOutputToFile "[STREAM UP]:[CAMERA #1 UP] (" + _Trim$(Timer_Fail_Output1_Str) + " sec)"
                    If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Now online stream #1 (" + _Trim$(Timer_Fail_Output1_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                End If
            End If
            streamsUp = "1"
        End If

        If Timer_Fail_Stream1 >= Stream_Fail_Delay And Timer_Fail_Stream2 = 0 Then
            If streamsUp <> "2" Then
                If previousScene <> titleScene2 And streamsUp = "0" And __returnPreviousScene Then
                    If lastStreamUp <> "2" Then previousScene = titleScene2
                    Scene_Current = previousScene
                    If HTTP_Communication_Native Then http_client_connect "Set", previousScene Else Shell _Hide _DontWait shell_cmd_1 + previousScene + shell_cmd_2
                    _Delay 0.033
                    If Timer_Fail_Output1 = 0 Then Timer_Fail_Output1_Str = "-" Else Timer_Fail_Output1_Str = Str$(Timer_Fail_Output1)
                    If Timer_Fail_Output2 = 0 Then Timer_Fail_Output2_Str = "-" Else Timer_Fail_Output2_Str = Str$(Timer_Fail_Output2)
                    If __FileStatusOutput Then statusOutputToFile "[STREAM UP]:[CAMERA #2 UP]:[CAMERA #1 DOWN] (" + _Trim$(Timer_Fail_Output2_Str) + " sec)"
                    If ConnectionsLog Then statusConnectionsLogToFile "[WARN] Now down stream #1, now online stream #2 (" + _Trim$(Timer_Fail_Output2_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                Else ' ReturnPreviousSceneRemember=false
                    Scene_Current = titleScene2
                    If HTTP_Communication_Native Then http_client_connect "Set", titleScene2 Else Shell _Hide _DontWait shell_cmd_1 + titleScene2 + shell_cmd_2
                    _Delay 0.033
                    If Timer_Fail_Output1 = 0 Then Timer_Fail_Output1_Str = "-" Else Timer_Fail_Output1_Str = Str$(Timer_Fail_Output1)
                    If Timer_Fail_Output2 = 0 Then Timer_Fail_Output2_Str = "-" Else Timer_Fail_Output2_Str = Str$(Timer_Fail_Output2)
                    If __FileStatusOutput Then statusOutputToFile "[STREAM UP]:[CAMERA #2 UP] (" + _Trim$(Timer_Fail_Output2_Str) + " sec)"
                    If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Now online stream #2 (" + _Trim$(Timer_Fail_Output2_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                End If
            End If
            streamsUp = "2"
        End If

        If Timer_Fail_Stream1 = 0 And Timer_Fail_Stream2 = 0 Then
            If streamsUp <> "12" Then
                If previousScene <> titleScene12 And streamsUp = "0" And __returnPreviousScene Then
                    If lastStreamUp <> "12" Then previousScene = titleScene12
                    Scene_Current = previousScene
                    If HTTP_Communication_Native Then http_client_connect "Set", previousScene Else Shell _Hide _DontWait shell_cmd_1 + previousScene + shell_cmd_2
                    _Delay 0.033
                    If Timer_Fail_Output1 = 0 Then Timer_Fail_Output1_Str = "-" Else Timer_Fail_Output1_Str = Str$(Timer_Fail_Output1)
                    If Timer_Fail_Output2 = 0 Then Timer_Fail_Output2_Str = "-" Else Timer_Fail_Output2_Str = Str$(Timer_Fail_Output2)
                    If __FileStatusOutput Then statusOutputToFile "[STREAM UP]:[ALL CAMERAS UP] (" + _Trim$(Timer_Fail_Output1_Str) + " sec):(" + _Trim$(Timer_Fail_Output2_Str) + " sec)"
                    If ConnectionsLog Then statusConnectionsLogToFile "[INFO] Now online stream #1, now online stream #2 (" + _Trim$(Timer_Fail_Output1_Str) + " sec):(" + _Trim$(Timer_Fail_Output2_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                Else ' ReturnPreviousSceneRemember=false
                    ' CooldownLog = CooldownLogTotal
                    Scene_Current = titleScene12
                    If CooldownLog And CooldownStartup = 0 Then
                        If Not SceneLBActive Then
                            If HTTP_Communication_Native Then http_client_connect "Set", titleScene12 Else Shell _Hide _DontWait shell_cmd_1 + titleScene12 + shell_cmd_2
                        Else
                            If HTTP_Communication_Native Then http_client_connect "Set", titleScene12 + " LBR" Else Shell _Hide _DontWait shell_cmd_1 + titleScene12 + " LBR" + shell_cmd_2
                        End If
                    Else
                        If HTTP_Communication_Native Then http_client_connect "Set", titleScene12 Else Shell _Hide _DontWait shell_cmd_1 + titleScene12 + shell_cmd_2
                    End If
                    _Delay 0.033
                    If Timer_Fail_Output1 = 0 Then Timer_Fail_Output1_Str = "-" Else Timer_Fail_Output1_Str = Str$(Timer_Fail_Output1)
                    If Timer_Fail_Output2 = 0 Then Timer_Fail_Output2_Str = "-" Else Timer_Fail_Output2_Str = Str$(Timer_Fail_Output2)
                    If __FileStatusOutput Then statusOutputToFile "[STREAM UP]:[ALL CAMERAS UP] (" + _Trim$(Timer_Fail_Output1_Str) + " sec):(" + _Trim$(Timer_Fail_Output2_Str) + " sec)"
                    If ConnectionsLog And CooldownLog = 0 Then statusConnectionsLogToFile "[INFO] Now online stream #1, now online stream #2 (" + _Trim$(Timer_Fail_Output1_Str) + " sec):(" + _Trim$(Timer_Fail_Output2_Str) + " sec)"
                    Timer_Fail_Output1 = 0: Timer_Fail_Output2 = 0
                End If
            End If
            streamsUp = "12"
        End If

        If Timer_Fail_Stream1 >= Stream_Fail_Delay And Timer_Fail_Stream2 >= Stream_Fail_Delay Then
            If streamsUp <> "0" Then
                streamsUp = "0"
                LoadImageMEM Control(PictureBox1), "cross.png"
                If Not Exe_Fail_First Then
                    Exe_Fail_First = TRUE
                    Scene_Current = Scene_Intro
                    If HTTP_Communication_Native Then http_client_connect "Set", Scene_Intro Else Shell _Hide _DontWait shell_cmd_1 + Scene_Intro + shell_cmd_2
                    _Delay 0.033
                Else
                    Scene_Current = Scene_Fail
                    If HTTP_Communication_Native Then http_client_connect "Set", Scene_Fail Else Shell _Hide _DontWait shell_cmd_1 + Scene_Fail + shell_cmd_2
                    _Delay 0.033
                    If __FileStatusOutput Then statusOutputToFile "[STREAM DOWN]:[ALL CAMERAS DOWN]"
                    If ConnectionsLog Then statusConnectionsLogToFile "[WARN] No bandwidth for stream #1, no bandwidth for stream #2"
                    Timer_Fail_Count = Timer_Fail_Count + 1
                    Timer_Failed = TRUE
                    If Timer_Fail_Count > 999 Then Timer_Fail_Count = 999
                End If
            End If
        End If
    End If

    If srt_warmup And returnFirstCheck And __MultiCameraSwitch And previousSceneDisplay = "" Then RefreshDisplayRequest = TRUE: Error_msg = "- Variable/s for scenes empty, check if OBS is open." + Chr$(10) + "- If OBS is open, check communication is available via Node.js or obs-websocket-http.": Error_msg_2$ = "- If Node.js is selected, check OBS WebSocket options are correctly set. (Error: #6)": _Delay 3

    If RTMP_Active Then
        ' Temp2 variables
        RTMP_Bytes_In_Temp2 = RTMP_Bytes_In

        ' Temp_stream1 & Temp_stream2 variables
        multiStream1_Temp2 = multiStream1
        multiStream2_Temp2 = multiStream2
    End If

    If Not Exe_Fail_First Then
        Timer_Fail_First = Timer_Fail_First + 1
        If (Stream_Fail_Delay + 3) - Timer_Fail_First <= 0 Then Exe_Fail_First = TRUE
    End If

    If Not Exe_Fail_First_Stream1 Then
        Timer_Fail_First_Stream1 = Timer_Fail_First_Stream1 + 1
        If (Stream_Fail_Delay + 3) - Timer_Fail_First_Stream1 <= 0 Then Exe_Fail_First_Stream1 = TRUE
    End If

    If Not Exe_Fail_First_Stream2 Then
        Timer_Fail_First_Stream2 = Timer_Fail_First_Stream2 + 1
        If (Stream_Fail_Delay + 3) - Timer_Fail_First_Stream2 <= 0 Then Exe_Fail_First_Stream2 = TRUE
    End If

    If Refresh_Request Then
        Refresh_Request = FALSE
        RefreshDisplayRequest = TRUE
    End If

    CooldownStartup = CooldownStartup - 1
    If CooldownStartup < 0 Then CooldownStartup = 0

    If srt_warmup_LB >= 1 Then srt_warmup_LB = srt_warmup_LB - 1

    If Not srt_warmup Then
        srt_warmup = TRUE
        If Allow_Resize = "true" Then
            _Resize On , _Smooth
            _Delay 0.25
        End If
        On Error GoTo App_Fail
        network_client = _OpenClient("TCP/IP:" + Mid$(OBS_URL, InStr(OBS_URL, ":") + 1) + ":" + Left$(OBS_URL, InStr(OBS_URL, ":") - 1))
        Close network_client
        On Error GoTo 0
    End If

    If ErrorTestRunOnce = TRUE Then ErrorTestRunOnce = FALSE

    If PingLog = "true" Then
        If Int(Timer / 60) <> PingLogTimer Then
            PingLogTimer = Int(Timer / 60)
            If ConnectionsLog Then statusConnectionsLogToFile "[DEBU] PING!"
        End If
    End If

    td_display = Timer(.001) - timer1
End Sub

'$INCLUDE:'InForm\InForm.ui'

