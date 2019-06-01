import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:team_up/dummy_home.dart';

class TeamUpp extends StatefulWidget {
  @override
  _TeamUppState createState() => _TeamUppState();
}

class _TeamUppState extends State<TeamUpp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: MyHomePage(),
        title: new Text(
          'Let\'s Team Upp',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset('images/splash.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}
