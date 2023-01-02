# Loopy SRT Stats Monitor v1.0.1 (03-Jan-2023)

NOTE: If updating from a previous version !!!

This program does not modify 'config.ini', it only reads it. v1.0.1 has three additional features that must be manually added to the [config] section to be enabled:

```
SLSServerIP2=127.0.0.1
SLSServerPort2=8191
SLSServerStats2=stats
```

- Added support for two separate SLS servers
- Added support for BELABOX cloud relay server
- Added "Yami" OBS theme
- Added "Grey" OBS theme
- Automatically restart "obs-websocket-http" on lost connection
- Minor fixes with LBR Delay setting
- Optional ping log output for troubleshooting (PingLog=true)

[Download](https://github.com/loopy750/SRT-Stats-Monitor/raw/beta/loopy_srt_monitor_v1.0.1_beta_setup.exe)
