import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/contact.dart';
import 'pages/services.dart';
import 'pages/portofolio.dart';

Widget getRoute(String name) {
  switch (name) {
    case "Acceuil":
      {
        return HomePage();
      }
      break;
    case "Contact":
      {
        return ContactPage();
      }
      break;
    case "Services":
      {
        return ServicesPage();
      }
      break;
    case "Projets":
      {
        return PortofolioPage();
      }
      break;
  }
}

Route createRoute(String name) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => getRoute(name),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var textOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: ModalRoute.of(context).animation,
          curve: Interval(0.0, 0.84, curve: Curves.linear),
        ),
      );
      return FadeTransition(
        opacity: textOpacity,
        child: child,
      );
    },
  );
}
