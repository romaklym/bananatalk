import 'dart:async';

import 'package:bananatalk/src/pages/faq.dart';
import 'package:bananatalk/src/pages/qr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import './call.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  final _channelController = TextEditingController();

  bool _validateError = false;

  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1440, height: 2960, allowFontScaling: false);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title:
              Text('BANANA TALK', style: TextStyle(color: Color(0xff9f703d))),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Color(0xffffd800),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/banana.png'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter)),
                child: Padding(
                  padding: EdgeInsets.only(right: 100.h, left: 100.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff9f703d)),
                                color: Color(0xffffd800),
                                borderRadius: BorderRadius.circular(45.h)),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(80.h, 30.h, 80.h, 30.h),
                              child: TextField(
                                textInputAction: TextInputAction.go,
                                onEditingComplete: onJoin,
                                autofocus: false,
                                autocorrect: false,
                                showCursor: true,
                                cursorColor: Color(0xff9f703d),
                                style: TextStyle(
                                  color: Color(0xff9f703d),
                                ),
                                controller: _channelController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  errorText: _validateError
                                      ? "Channel name cannot be empty"
                                          .toUpperCase()
                                      : null,
                                  errorMaxLines: 1,
                                  errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(40)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.h, color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.h, color: Colors.transparent),
                                  ),
                                  hintText: "ENTER CHANNEL NAME",
                                  hintStyle: TextStyle(
                                      color: Color(0xff9f703d),
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(55)),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 60.h),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                  onTap: onJoin,
                                  child: Container(
                                    height: 210.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xff9f703d)),
                                        color: Color(0xffffd800),
                                        borderRadius:
                                            BorderRadius.circular(45.h)),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          24.h, 15.h, 72.h, 15.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xff9f703d),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          45.h)),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    85.h, 10.h, 85.h, 10.h),
                                                child: Image.asset(
                                                  'assets/images/6.png',
                                                  width: 105.w,
                                                ),
                                              )),
                                          Text(
                                            'JOIN',
                                            style: TextStyle(
                                                color: Color(0xff9f703d),
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ScreenUtil().setSp(55)),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 160.0.h,
                  right: 140.0.h,
                  child: Image.asset(
                    'assets/images/4.png',
                    height: 700.h,
                  )),
              Positioned(
                  bottom: 0.h, child: Image.asset('assets/images/banana1.png'))
            ],
          ),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff9f703d)),
              borderRadius: BorderRadius.circular(45.h)),
          child: FloatingActionButton(
            backgroundColor: Color(0xffffd800),
            onPressed: () {
              _settingModalBottomSheet(context);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45.h)),
            child: Icon(
              FontAwesomeIcons.cog,
              color: Color(0xff9f703d),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      await _handleCameraAndMic();
      await Navigator.push(
          context,
          SlideRightRoute(
              page: CallPage(channelName: _channelController.text)));
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class SlideUpRoute extends PageRouteBuilder {
  final Widget page;
  SlideUpRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      backgroundColor: Colors.amber,
      context: context,
      builder: (BuildContext buildContext) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(58.h),
                  topRight: Radius.circular(58.h))),
          child: Wrap(
            children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Icon(
                    FontAwesomeIcons.minus,
                    color: Color(0xff9f703d),
                  )),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.qrcode,
                  color: Color(0xff9f703d),
                ),
                title: Text(
                  'Share',
                  style: TextStyle(color: Color(0xff9f703d)),
                ),
                onTap: () {
                  Navigator.push(context, SlideUpRoute(page: QrPage()));
                },
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.handsHelping,
                  color: Color(0xff9f703d),
                ),
                title: Text(
                  'FAQ',
                  style: TextStyle(color: Color(0xff9f703d)),
                ),
                onTap: () {
                  Navigator.push(context, SlideUpRoute(page: FAQ()));
                },
              ),
              ListTile(
                  leading: Icon(
                    FontAwesomeIcons.info,
                    color: Color(0xff9f703d),
                  ),
                  title: Text(
                    'Info',
                    style: TextStyle(color: Color(0xff9f703d)),
                  ),
                  onTap: () {}),
            ],
          ),
        );
      });
}
