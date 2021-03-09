import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrPage extends StatefulWidget {
  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1440, height: 2960, allowFontScaling: false);

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.clear, color: Color(0xff9f703d)),
            ),
            title: Text('SHARE', style: TextStyle(color: Color(0xff9f703d))),
            centerTitle: true,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Color(0xff9f703d),
            ),
            // gradient:
            //     LinearGradient(colors: [Color(0xffffd800), Color(0xffffef00)]),
            bottom: TabBar(
              unselectedLabelColor: Colors.amber,
              labelColor: Color(0xff9f703d),
              indicatorColor: Color(0xff9f703d),
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.apple)),
                Tab(
                  icon: Icon(FontAwesomeIcons.android),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
                // gradient: LinearGradient(
                //     colors: [Color(0xffffd800), Color(0xffffef00)])),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    PrettyQr(
                        image: AssetImage('assets/images/4.png'),
                        typeNumber: 3,
                        elementColor: Color(0xff9f703d),
                        size: 1000.h,
                        data: "Wow, buster! It's Coming Soon",
                        roundEdges: true),
                    Text(
                      "Coming Soon",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(50)),
                    ),
                    // Text(
                    //   "Share Banana Talk with Apple users",
                    //   style: TextStyle(
                    //       color: Color(0xff9f703d),
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: ScreenUtil().setSp(50)),
                    // )
                  ],
                )),
              ),
              Container(
                decoration: BoxDecoration(),
                // gradient: LinearGradient(
                //     colors: [Color(0xffffd800), Color(0xffffef00)])),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    PrettyQr(
                        image: AssetImage('assets/images/4.png'),
                        typeNumber: 3,
                        elementColor: Color(0xff9f703d),
                        size: 1000.h,
                        data: 'https://www.google.com',
                        roundEdges: true),
                    Text(
                      "Share Banana Talk with Android Users",
                      style: TextStyle(
                          color: Color(0xff9f703d),
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(50)),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
