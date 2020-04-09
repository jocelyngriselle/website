import 'package:flutter/material.dart';
import 'pages/onboarding.dart';
import 'ui/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
