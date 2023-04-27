# Loopy SRT Stats Monitor v1.1.1 (27-Apr-2023)

NOTE: If updating from a previous version !!!

This program does not modify `config.ini`, it only reads it. Loopy SRT Monitor v1.1.1 contains additional features that must be manually added to `config.ini` to be enabled.

⚠️ It is **strongly recommended** `config.default.ini` be renamed and reconfigured.

```
[datarhei-restreamer]
Restreamer1Enabled=false
Restreamer2Enabled=false
RestreamerUsername=admin
RestreamerPassword=password
RestreamerServerIP=127.0.0.1
RestreamerServerPort=8080
RestreamerStats=srt,rtmp
RestreamerServerKeepAlive=Default
RestreamerID1=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
RestreamerID2=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
RestreamerBitrateLow1=800
RestreamerBitrateLow2=800
RestreamerBitrateFail1=400
RestreamerBitrateFail2=400
```

v1.1.1
------
- Added support for datarhei Restreamer (HTTP)
- Minor fixes

[Download](https://github.com/loopy750/SRT-Stats-Monitor/raw/beta/loopy_srt_monitor_v1.1.1_beta_setup.exe)
