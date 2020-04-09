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
        Navigator.of(context).push(createRoute("Contact"));
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

class CallToActionTablet extends StatelessWidget {
  final String title;
  const CallToActionTablet(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
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
          color: Color.fromARGB(255, 31, 229, 146),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class CallToActionMobile extends StatelessWidget {
  final String title;

  const CallToActionMobile(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 31, 229, 146),
        borderRadius: BorderRadius.circular(5),
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
      mobile: CallToActionMobile(title),
      tablet: CallToActionTablet(title),
      desktop: CallToActionDesktop(title),
    );
  }
}
