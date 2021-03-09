import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'agreementDialog.dart' as fullDialog;

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
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
      margin: EdgeInsets.symmetric(horizontal: 32.0.h),
      height: 25.h,
      width: isActive ? 100.0.w : 60.0.w,
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
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/banana.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 100.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        _openAgreeDialog(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.h),
                            color: Color(0xff9f703d)),
                        child: Padding(
                          padding: EdgeInsets.all(30.0.h),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Color(0xffffd800),
                              fontSize: 55.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 2200.h,
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
                          padding: EdgeInsets.all(120.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/7.png',
                                  ),
                                  height: 1000.h,
                                ),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'Create your own',
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(70)),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'Private Video Rooms',
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(100)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(120.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/8.png',
                                  ),
                                  height: 1000.0.h,
                                ),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'and Videochat with',
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(100)),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'Up to 7 other people',
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(70)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(120.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/9.png',
                                  ),
                                  height: 1000.0.h,
                                ),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'No accounts required',
                                style: TextStyle(
                                    color: Color(0xff9f703d),
                                    fontSize: ScreenUtil().setSp(70)),
                              ),
                              SizedBox(height: 45.0.h),
                              Text(
                                'For Fast and Easy access',
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
                                  duration: Duration(milliseconds: 300),
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
                                            BorderRadius.circular(35.h),
                                        color: Color(0xffffd800)),
                                    child: Padding(
                                      padding: EdgeInsets.all(35.0.h),
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
            ? GestureDetector(
                onTap: () {
                  _openAgreeDialog(context);
                },
                child: Container(
                  height: 190.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //     colors: [Color(0xfffcc70e), Color(0xffffde59)]),
                      ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0.h),
                      child: Text(
                        'Get Started',
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

Future _openAgreeDialog(context) async {
  String result = await Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return fullDialog.CreateAgreement();
      },
      //true to display with a dismiss button rather than a return navigation arrow
      fullscreenDialog: true));
  if (result != null) {
    letsDoSomething(result, context);
  } else {
    print('you could do another action here if they cancel');
  }
}

letsDoSomething(String result, context) {
  print(result); //prints 'User Agreed'
}
