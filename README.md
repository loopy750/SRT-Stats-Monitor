# Loopy SRT Stats Monitor v1.1.0 (11-Jan-2023)

NOTE: If updating from a previous version !!!

This program does not modify `config.ini`, it only reads it. Loopy SRT Monitor v1.1.0 contains additional features that must be manually added to `config.ini` to be enabled.

⚠️ It is **strongly recommended** `config.default.ini` be renamed and reconfigured.

```
[obs-websocket-http]
HTTPCommunication=native

[nginx-rtmp-module]
RTMPServerKeepAlive=Default

[srt-live-server]
SLSServerIP2=127.0.0.1
SLSServerPort2=8181
SLSServerStats2=stats
SLSServerKeepAlive1=Default
SLSServerKeepAlive2=Default
```

- Added support for two separate SLS/BELABOX servers
- Added support for BELABOX cloud relay server
- Added "Yami" OBS theme
- Added "Grey" OBS theme
- Added 'HTTPCommunication' configuration - see readme.txt for instructions
- Added 'RTMPServerKeepAlive' configuration - see readme.txt for instructions
- Added 'SLSServerIP2' configuration - see readme.txt for instructions
- Added 'SLSServerPort2' configuration - see readme.txt for instructions
- Added 'SLSServerStats2' configuration - see readme.txt for instructions
- Added 'SLSServerKeepAlive1' configuration - see readme.txt for instructions
- Added 'SLSServerKeepAlive2' configuration - see readme.txt for instructions
- Removed some configurations - use 'config.default.ini' if updating.
- Automatically restart "obs-websocket-http" on lost connection [Windows]
- Minor fixes with LBR Delay setting
- Minor fixes with NGINX
- Minor fixes and improvements

[Download](https://github.com/loopy750/SRT-Stats-Monitor/raw/beta/loopy_srt_monitor_v1.1.0_beta_setup.exe)
