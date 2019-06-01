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
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          '/': (context) => TeamUpp(),
          // Other screen
          //'/create': (context) => CreateScreen(),
          //'/details': (context) => DetailsScreen(settings.arguments),
          // '/login': (context) => LoginScreen(),
          // '/feed': (context) => FeedScreen(),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
