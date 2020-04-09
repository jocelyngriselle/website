import 'package:flutter/material.dart';

class Skill extends StatelessWidget {
  final String image;

  Skill({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(this.image),
        ),
      ),
    );
  }
}
