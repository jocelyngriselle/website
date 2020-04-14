import 'package:flutter/material.dart';
import 'ui/theme.dart';
import 'pages/onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO for loop through /images folder
    precacheImage(AssetImage('images/logo.png'), context);
    precacheImage(AssetImage('images/hello.png'), context);
    precacheImage(AssetImage('images/contact.png'), context);

    precacheImage(AssetImage('images/mixity_project.png'), context);
    precacheImage(AssetImage('images/creative_project.png'), context);
    precacheImage(AssetImage('images/valoo_project.png'), context);
    precacheImage(AssetImage('images/openclassroom_project.png'), context);

    precacheImage(AssetImage('images/kerouanton.png'), context);
    precacheImage(AssetImage('images/remes.png'), context);
    precacheImage(AssetImage('images/charpentier.png'), context);
    precacheImage(AssetImage('images/marc.png'), context);

    precacheImage(AssetImage('images/mac_code.png'), context);
    precacheImage(AssetImage('images/iphone_code.png'), context);
    precacheImage(AssetImage('images/formation.png'), context);

    precacheImage(AssetImage('images/python.png'), context);
    precacheImage(AssetImage('images/django.png'), context);
    precacheImage(AssetImage('images/postgresql.png'), context);
    precacheImage(AssetImage('images/scrapy.png'), context);
    precacheImage(AssetImage('images/heroku.png'), context);
    precacheImage(AssetImage('images/javascript.png'), context);

    precacheImage(AssetImage('images/dart.png'), context);
    precacheImage(AssetImage('images/flutter.png'), context);
    precacheImage(AssetImage('images/firebase.png'), context);
    precacheImage(AssetImage('images/apple.png'), context);
    precacheImage(AssetImage('images/android.png'), context);

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
