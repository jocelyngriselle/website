import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final String title;
  final bool small;
  final Color color;
  final Function action;
  const FilledButton({this.title, this.action, this.color, this.small: true});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      onPressed: action,
      child: Container(
        constraints:
            small ? BoxConstraints(minWidth: 24) : BoxConstraints(minWidth: 32),
        padding: EdgeInsets.symmetric(
            horizontal: small ? 16 : 24, vertical: small ? 8 : 16),
        child: Text(
          title,
          style: Theme.of(context).textTheme.button.copyWith(
                color: Colors.white,
                fontSize: small ? 16 : 18,
              ),
        ),
      ),
    );
  }
}

class TransparentButton extends StatelessWidget {
  final String title;
  final bool small;
  final Function action;
  const TransparentButton({
    this.title,
    this.action,
    this.small: true,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.transparent,
      onPressed: action,
      child: Container(
        constraints: small
            ? BoxConstraints(minWidth: 150)
            : BoxConstraints(minWidth: 250),
        padding: EdgeInsets.symmetric(
            horizontal: small ? 16 : 24, vertical: small ? 8 : 16),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).accentColor,
                  fontSize: small ? 16 : 18,
                ),
          ),
        ),
      ),
    );
  }
}
