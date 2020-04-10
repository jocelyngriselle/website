import 'package:flutter/material.dart';
import 'pages/onboarding.dart';
import 'ui/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/logo.png'), context);
    precacheImage(AssetImage('images/hello.png'), context);
    precacheImage(AssetImage('images/contact.png'), context);
    precacheImage(AssetImage('images/computer.png'), context);

    precacheImage(AssetImage('images/mixity.png'), context);
    precacheImage(AssetImage('images/creative.png'), context);
    precacheImage(AssetImage('images/valoo.png'), context);
    precacheImage(AssetImage('images/openclassroom.png'), context);

    precacheImage(AssetImage('images/kerouanton.png'), context);
    precacheImage(AssetImage('images/remes.png'), context);
    precacheImage(AssetImage('images/charpentier.png'), context);
    precacheImage(AssetImage('images/marc.png'), context);

    precacheImage(AssetImage('images/python.png'), context);
    precacheImage(AssetImage('images/django.png'), context);
    precacheImage(AssetImage('images/postgresql.png'), context);
    precacheImage(AssetImage('images/scrapy.png'), context);
    precacheImage(AssetImage('images/heroku.png'), context);
    precacheImage(AssetImage('images/javascript.png'), context);

    precacheImage(AssetImage('images/dart.png'), context);
    precacheImage(AssetImage('images/flutter.png'), context);
    precacheImage(AssetImage('images/firebase.png'), context);

    ThemeData theme = MyTheme.defaultTheme;
    return MaterialApp(
      title: 'Jocelyn Griselle',
      theme: theme,
      onGenerateRoute: (RouteSettings setting) {
        return AnimationsPlayground.route();
      },
    );
  }
}
