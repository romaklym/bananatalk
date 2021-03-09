import 'package:bananatalk/src/pages/index.dart';
import 'package:bananatalk/src/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // initScreen = prefs.getInt("initScreen");
  // await prefs.setInt("initScreen", 1);
  // print('initScreen $initScreen');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        canvasColor: Colors.white,
        fontFamily: 'e-Ukraine',
        hintColor: Color(0xffffd800),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          labelStyle: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        '/': (context) => IndexPage(),
        "first": (context) => OnboardingScreen(),
      },
    );
  }
}
