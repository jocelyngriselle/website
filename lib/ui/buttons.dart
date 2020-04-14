import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../routes.dart';

class CallToActionDesktop extends StatelessWidget {
  final String title;
  const CallToActionDesktop(this.title);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).accentColor,
      onPressed: () {
        Navigator.of(context).push(createRoute(title));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class CallToAction extends StatelessWidget {
  final String title;
  const CallToAction(this.title);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: CallToActionDesktop(title),
      tablet: CallToActionDesktop(title),
      desktop: CallToActionDesktop(title),
    );
  }
}

class OutlineButtonDesktop extends StatelessWidget {
  final String title;
  const OutlineButtonDesktop(this.title);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(width: 2.0, color: Theme.of(context).accentColor),
      color: Colors.transparent,
      highlightedBorderColor: Theme.of(context).accentColor,
      onPressed: () {
        Navigator.of(context).push(createRoute(title));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}

class OutlineButtonToAction extends StatelessWidget {
  final String title;
  const OutlineButtonToAction(this.title);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OutlineButtonDesktop(title),
      tablet: OutlineButtonDesktop(title),
      desktop: OutlineButtonDesktop(title),
    );
  }
}
