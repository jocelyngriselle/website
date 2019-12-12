import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(color: Theme.of(context).dividerColor))
              ),
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(children: <Widget>[
                Text("Fait avec ",),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Text(" par Jocelyn Griselle"),
                    //style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(children: <Widget>[
                Text("Conditions d'utilisation"),
  ],),
            ),
        ],),
    );
  }
}
