import 'package:flutter/material.dart';
import 'onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final primaryColor = Colors.white;
  final accentColor = Color.fromARGB(255, 31, 229, 146);
  final cardColor = Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jocelyn Griselle',
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: TextStyle(
              fontWeight: FontWeight.w800,
              fontFamily: 'Open sans',
              color: Colors.black,
              fontSize: 50,
              height: 1.5,
            ),
            headline2: TextStyle(
              backgroundColor: Colors.grey.shade200,
              color: accentColor,
              fontWeight: FontWeight.w800,
              fontFamily: 'Open sans',
              fontSize: 50,
              height: 0.9,
            ),
            headline3: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 32,
              height: 1.5,
              fontFamily: 'Open sans',
            ),
            headline4: TextStyle(
              backgroundColor: Colors.grey.shade200,
              color: accentColor,
              fontWeight: FontWeight.w600,
              fontSize: 32,
              height: 1.5,
              fontFamily: 'Open sans',
            ),
            headline5: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontFamily: 'Open sans',
            ),
            headline6: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
              backgroundColor: Colors.grey.shade200,
              color: accentColor,
              fontFamily: 'Open sans',
            ),
            bodyText1: TextStyle(
              fontSize: 21.0,
              height: 1.7,
              fontFamily: 'Open sans',
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Open sans',
              color: Colors.black,
            ),
            button: TextStyle(
              fontFamily: 'Open sans',
              fontSize: 14.0,
              //fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          accentColor: accentColor,
          primaryColor: primaryColor,
        ),

        /*onGenerateInitialRoutes: (String initialRouteName) {
          //if initialRouteName == 'home'
          print(initialRouteName);
          return <Route>[AnimationsPlayground.route()];
        }*/
        onGenerateRoute: (RouteSettings setting) {
          if (setting.name == '/')
            return AnimationsPlayground.route();
          else
            return AnimationsPlayground.route();
        });
  }
}
