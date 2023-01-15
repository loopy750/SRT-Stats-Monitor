# F.A.Q.

### Q. **Which Operating Systems does this support?**
##### A. The program has been tested on _**Windows 10**_, _**Windows 11**_, _**Linux Mint**_, and _**macOS Catalina**_.

### Q. **When I launch the program, I'm getting "Test #6 of 10 failed", how do I resolve this?**
##### A. Confirm **OBS Websocket** is enabled in OBS, and the desired port and password are set, and match the `config.ini` settings. The default port for **OBS Websocket 5.x** is **4455**, and **4445** for **obs-websocket-http**. Both `WebSocketPassword` and `ws_password` need to be correctly configured. See [here](https://github.com/loopy750/SRT-Stats-Monitor/blob/main/modifications/resources/quick_start_guide.md) for further assistance.

### Q. **Scene is not switching, or not switching back after it's back online, what is wrong?**
##### A. Ensure Media Sources must have "Restart playback when source becomes active" disabled. Carefully read through all instructions and notes.

### Q. **When streaming using OBS SRT, there is no bitrate information, where do I find it?**
##### A. Unfortunately this information isn't available via OBS, therefore making it impossible to fetch the current bitrate. It is only visible when streaming via a server such as 'SRT Live Server' (modified version by mattwb65), or 'BELABOX cloud relay server'.

### Q. **If OBS SRT doesn't expose bitrate information, how does the "low bitrate" scene function?**
##### A. This is achieved by monitoring for freezes in playback. When more than 200ms of freezing is detected over the span of one second, LBR is triggered. This is a fixed value within the program, but can be altered (at your own risk) by using the configuration `MediaSourceTime=800`, where 800 is the default setting (1000-800ms = 200ms).

### Q. **This software looks good, but doesn't do everything I want it to do, is there an alternative?**
##### A. There could be, I have little experience with other monitoring software. You can search online for 'NOALBS' to see if that suits your needs.

### Q. Would this program run on a cloud virtual machine with 1 vCPU allocated and OBS running?
##### A. Some basic testing was performed with AWS cloud virtualisation and 1 vCPU, and it was not enough to reliably run **Loopy SRT Monitor** while streaming with OBS.

### Q. **Are there any future plans to support more than two simultaneous streams?**
##### A. No.
