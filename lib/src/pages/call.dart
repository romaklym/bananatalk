import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:bananatalk/src/utils/settings.dart';

class CallPage extends StatefulWidget {
  final String channelName;

  const CallPage({Key key, this.channelName}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  static final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;
  bool video = false;
  bool _visible = true;

  @override
  void dispose() {
    _users.clear();
    AgoraRtcEngine.leaveChannel();
    AgoraRtcEngine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    if (APP_ID.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }

    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await AgoraRtcEngine.enableWebSdkInteroperability(true);
    await AgoraRtcEngine.setParameters(
        '''{\"che.video.lowBitRateStreamParameter\":{\"width\":320,\"height\":180,\"frameRate\":15,\"bitRate\":140}}''');
    await AgoraRtcEngine.joinChannel(null, widget.channelName, null, 0);
  }

  Future<void> _initAgoraRtcEngine() async {
    await AgoraRtcEngine.create(APP_ID);
    await AgoraRtcEngine.enableVideo();
  }

  void _addAgoraEventHandlers() {
    AgoraRtcEngine.onError = (dynamic code) {
      setState(() {
        final info = 'onError: $code';
        _infoStrings.add(info);
      });
    };

    AgoraRtcEngine.onJoinChannelSuccess = (
      String channel,
      int uid,
      int elapsed,
    ) {
      setState(() {
        final info = 'onJoinChannel: $channel, uid: $uid';
        _infoStrings.add(info);
      });
    };

    AgoraRtcEngine.onLeaveChannel = () {
      setState(() {
        _infoStrings.add('onLeaveChannel');
        _users.clear();
      });
    };

    AgoraRtcEngine.onUserJoined = (int uid, int elapsed) {
      setState(() {
        final info = 'userJoined: $uid';
        _infoStrings.add(info);
        _users.add(uid);
      });
    };

    AgoraRtcEngine.onUserOffline = (int uid, int reason) {
      setState(() {
        final info = 'userOffline: $uid';
        _infoStrings.add(info);
        _users.remove(uid);
      });
    };

    AgoraRtcEngine.onFirstRemoteVideoFrame = (
      int uid,
      int width,
      int height,
      int elapsed,
    ) {
      setState(() {
        final info = 'firstRemoteVideo: $uid ${width}x $height';
        _infoStrings.add(info);
      });
    };
  }

  List<Widget> _getRenderViews() {
    final List<AgoraRenderWidget> list = [
      AgoraRenderWidget(0, local: true, preview: true),
    ];
    _users.forEach((int uid) => list.add(AgoraRenderWidget(uid)));
    return list;
  }

  Widget _videoView(view) {
    return Expanded(child: Container(child: view));
  }

  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  Widget _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
            child: Column(
          children: <Widget>[_videoView(views[0])],
        ));
      case 2:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow([views[0]]),
            _expandedVideoRow([views[1]])
          ],
        ));
      case 3:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 3))
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4))
          ],
        ));
      case 5:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4)),
            _expandedVideoRow(views.sublist(4, 5))
          ],
        ));
      case 6:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4)),
            _expandedVideoRow(views.sublist(4, 6))
          ],
        ));
      case 7:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4)),
            _expandedVideoRow(views.sublist(4, 6)),
            _expandedVideoRow(views.sublist(6, 7))
          ],
        ));
      default:
    }
    return Container();
  }

  Widget _toolbar() {
    ScreenUtil.init(context,
        width: 1440, height: 2960, allowFontScaling: false);

    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(vertical: 80.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // InkWell(
          //   onTap: _visible ? _onToggleVideo : null,
          //   child: Icon(
          //     video
          //         ? Icons.videocam_off
          //         : Icons.videocam,
          //     color: video ? Color(0xffffd800) : Color(0xff9f703d),
          //     size: 100.h,
          //   ),
          // ),
          InkWell(
            onTap: _visible ? _onToggleMute : null,
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Color(0xff9f703d) : Color(0xffffd800),
              size: 100.h,
            ),
          ),
          RawMaterialButton(
            onPressed: _visible ? () => _onCallEnd(context) : null,
            child: Image.asset(
              'assets/images/2.png',
              height: 125.h,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(85.h)),
            elevation: 10.0.h,
            fillColor: Color(0xff9f703d),
            padding: EdgeInsets.all(45.h),
          ),
          InkWell(
            onTap: _visible ? _onSwitchCamera : null,
            child: Icon(
              FontAwesomeIcons.syncAlt,
              color: Color(0xffffd800),
              size: 77.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _hideRow() {
    return InkWell(
      onTap: () {
        setState(() {
          _visible = !_visible;
        });
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.h, 45.h, 45.h, 0.h),
        child: Container(),
      ),
    );
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    AgoraRtcEngine.muteLocalAudioStream(muted);
  }

  // void _onToggleVideo() {
  //   setState(() {
  //     video = !video;
  //   });
  //   AgoraRtcEngine.muteLocalVideoStream(video);
  // }

  void _onSwitchCamera() {
    AgoraRtcEngine.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        iconTheme: IconThemeData(
          color: Color(0xff9f703d),
        ),
        title: Text(
          widget.channelName.toUpperCase(),
          style: TextStyle(color: Color(0xff9f703d)),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            _viewRows(),
            _hideRow(),
            AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 100),
                child: _toolbar()),
          ],
        ),
      ),
    );
  }
}
