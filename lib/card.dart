import 'package:flutter/material.dart';

class PlanetRow extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            PlanetCard(),
            PlanetThumbnail(),
          ],
        )
      );
    }
  }


class PlanetThumbnail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 16.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: Image(
        image: AssetImage("images/blink.png"),
        height: 92.0,
        width: 92.0,
      ),
    );
  }
}

class PlanetCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.0,
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );
  }
}