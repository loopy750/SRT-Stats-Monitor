# Loopy SRT Stats Monitor v1.0.1 (09-Jan-2023)

NOTE: If updating from a previous version !!!

This program does not modify `config.ini`, it only reads it. Loopy SRT Monitor v1.0.1 has additional features that must be manually added to `config.ini` to be enabled. It is **highly recommended** `config.default.ini` be renamed and configured.

```
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
- Automatically restart "obs-websocket-http" on lost connection [Windows]
- Minor fixes with LBR Delay setting
- Minor fixes with NGINX
- Minor fixes

[Download](https://github.com/loopy750/SRT-Stats-Monitor/raw/beta/loopy_srt_monitor_v1.0.1_beta_setup.exe)
