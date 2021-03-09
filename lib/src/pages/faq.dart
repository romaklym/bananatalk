import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    ScreenUtil.init(context,
        width: 1440, height: 2960, allowFontScaling: false);

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 25.0.h,
      width: isActive ? 100.h : 60.h,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff9f703d) : Color(0xffffd800),
        borderRadius: BorderRadius.all(Radius.circular(12.h)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1440, height: 2960, allowFontScaling: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.clear, color: Color(0xff9f703d)),
          ),
          title: Text('FAQ', style: TextStyle(color: Color(0xff9f703d))),
          centerTitle: true,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Color(0xff9f703d),
          ),
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/banana.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 2150.h,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(120.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/4.png',
                                  ),
                                  height: 1000.h,
                                ),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'Banana Talk lets you',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(100)),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'create Video Chat Rooms',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(70)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(120.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/phone3.png',
                                  ),
                                  height: 1100.0.h,
                                ),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                "You don't even need and account,",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(70)),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'just your imagination',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(100)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(120.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/phone2.png',
                                  ),
                                  height: 1100.0.h,
                                ),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'Come up with your unique Channel Name',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(90)),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'any symbols, spaces, languages, emojis',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(70)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(120.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/phone1.png',
                                  ),
                                  height: 1100.h,
                                ),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'Wait for friends to join',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(70)),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'And chat as much as you want',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(100)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  _currentPage != _numPages - 1
                      ? Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: FlatButton(
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(45.h),
                                        color: Color(0xffffd800)),
                                    child: Padding(
                                      padding: EdgeInsets.all(24.h),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Next',
                                            style: TextStyle(
                                              color: Color(0xff9f703d),
                                              fontSize: ScreenUtil().setSp(55),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Color(0xff9f703d),
                                            size: 100.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Text(''),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: _currentPage == _numPages - 1
            ? Container(
                height: 190.h,
                width: double.infinity,
                decoration: BoxDecoration(),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Text(
                        'Try it Now!',
                        style: TextStyle(
                          color: Color(0xff9f703d),
                          fontSize: ScreenUtil().setSp(55),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Text(''),
      ),
    );
  }
}
