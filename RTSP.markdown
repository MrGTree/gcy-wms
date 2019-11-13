[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:370: <<<
OPTIONS rtsp://localhost:9554/live/livestream RTSP/1.0
CSeq: 1
User-Agent: Lavf58.29.100

[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:378: >>>
RTSP/1.0 200 OK
Public: DESCRIBE, SETUP, TEARDOWN, PLAY, PAUSE, OPTIONS, ANNOUNCE, RECORD
CSeq: 1
Session: QrzMZQ0Zg

[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:370: <<<
DESCRIBE rtsp://localhost:9554/live/livestream RTSP/1.0
User-Agent: Lavf58.29.100
Session: QrzMZQ0Zg
Accept: application/sdp
CSeq: 2

[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:378: >>>
RTSP/1.0 200 OK
Content-Length: 572
CSeq: 2
Session: QrzMZQ0Zg

v=0
o=- 1383190487994921 1 IN IP4 0.0.0.0
s=RTSP Session, streamed by the ZLMediaKit
i=ZLMediaKit Live Stream
c=IN IP4 0.0.0.0
t=0 0
a=range:npt=0-
a=control:*
m=video 0 RTP/AVP 96
b=AS:4000
a=rtpmap:96 H264/90000
a=fmtp:96 packetization-mode=1; profile-level-id=64001F; sprop-parameter-sets=Z2QAH6zZQFAFuhAAAAMAEAAAAwPI8YMZYA==,aO+8sA==
a=control:trackID=0
m=audio 0 RTP/AVP 98
b=AS:128
a=rtpmap:98 MPEG4-GENERIC/44100
a=fmtp:98 streamtype=5;profile-level-id=1;mode=AAC-hbr;sizelength=13;indexlength=3;indexdeltalength=3;config=1210
a=control:trackID=1
[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:370: <<<
SETUP rtsp://localhost:9554/live/livestream/trackID=0 RTSP/1.0
Transport: RTP/AVP/TCP;unicast;interleaved=0-1
CSeq: 3
User-Agent: Lavf58.29.100
Session: QrzMZQ0Zg

[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:600: Parse SETUP req.TRANSPORT:TCP.Session.Type:1,control:rtsp://localhost:9554/live/livestream/trackID=0, AControl:trackID=1,VControl:trackID=0
[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:378: >>>
RTSP/1.0 200 OK
Transport: RTP/AVP/TCP;unicast;interleaved=0-1
CSeq: 3
Session: QrzMZQ0Zg

[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:370: <<<
SETUP rtsp://localhost:9554/live/livestream/trackID=1 RTSP/1.0
User-Agent: Lavf58.29.100
Session: QrzMZQ0Zg
Transport: RTP/AVP/TCP;unicast;interleaved=2-3
CSeq: 4

[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:600: Parse SETUP req.TRANSPORT:TCP.Session.Type:1,control:rtsp://localhost:9554/live/livestream/trackID=1, AControl:trackID=1,VControl:trackID=0
[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:378: >>>
RTSP/1.0 200 OK
CSeq: 4
Session: QrzMZQ0Zg
Transport: RTP/AVP/TCP;unicast;interleaved=2-3

[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:370: <<<
PLAY rtsp://localhost:9554/live/livestream RTSP/1.0
Range: npt=0.000-
CSeq: 5
User-Agent: Lavf58.29.100
Session: QrzMZQ0Zg

[QrzMZQ0Zg]2019/11/02 23:13:43 rtsp-session.go:378: >>>
RTSP/1.0 200 OK
CSeq: 5
Session: QrzMZQ0Zg
Range: npt=0.000-