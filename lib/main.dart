import 'package:flutter/material.dart';
import 'package:team_up/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Upp',
      initialRoute: '/',
      routes: {
        // home screen
        '/': (context) => TeamUpp(),
        /**
         * Created routes here, please enable them as you finish your screen and
         * change the class name accordingly, don't forget to import the class file first
         */
        // Other screen
        //'/create': (context) => CreateScreen(),
        // '/details': (context) => DetailsScreen(),
        // '/login': (context) => LoginScreen(),
        // '/feed': (context) => FeedScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
