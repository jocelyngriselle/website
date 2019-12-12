import 'package:flutter/material.dart';
import 'onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jocelyn Griselle',

      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Open Sans',
          )),
      onGenerateRoute: (RouteSettings settings) {
        print(settings);
        if (settings.isInitialRoute) {
          print("isInitialRoute");
          return AnimationsPlayground.route();
        }
        else {
          return null;}
      },
    );
  }
}
