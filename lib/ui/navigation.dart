import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html';
import '../routes.dart';
import '../ui/theme.dart';

class NavigationBar extends StatelessWidget {
  NavigationBar({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      tablet: NavigationBarMobile(),
      desktop: NavigationBarDesktop(),
    );
  }
}

class NavigationBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: NavBarLogo(),
      title: Socials(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ],
    );
  }
}

class NavigationBarDesktop extends StatelessWidget {
  double elevation;
  NavigationBarDesktop({this.elevation});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: NavBarLogo(),
      title: Socials(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: false,
      elevation: elevation,
      actions: [
        ButtonBarItem(
          'SERVICES',
          key: UniqueKey(),
        ),
        ButtonBarItem(
          'PROJETS',
          key: UniqueKey(),
        ),
        ButtonBarItem(
          'CONTACT',
          key: UniqueKey(),
        ),
      ],
    );
  }
}

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Color.fromARGB(255, 31, 229, 146),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Jocelyn Griselle',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          Text(
            'Développeur fullstack',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          DrawerItem('HOME', Icons.home),
          DrawerItem('SERVICES', Icons.build),
          DrawerItem('PROJETS', Icons.image),
          DrawerItem('CONTACT', Icons.contact_mail),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItem(this.title, this.icon);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 30),
          ButtonBarItem(title),
        ],
      ),
    );
  }
}

class ButtonBarItem extends StatelessWidget {
  final String title;

  const ButtonBarItem(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).push(
          createRoute(title),
        );
      },
      child: Text(title, style: Theme.of(context).textTheme.bodyText1),
    );
  }
}

class NavBarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        Navigator.of(context).push(
          createRoute('ACCEUIL'),
        );
      },
      child: Image.asset('images/blink.png'),
    );
  }
}

class Socials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //Text("Conditions d'utilisation"),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.twitter,
            color: textColor,
          ),
          onPressed: () {
            window.open('https://twitter.com/jocelyngriselle/', 'twitter');
          },
        ),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.linkedin,
            color: textColor,
          ),
          onPressed: () {
            window.open(
                'https://www.linkedin.com/in/jocelyngriselle/', 'linkedin');
          },
        ),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.medium,
            color: textColor,
          ),
          onPressed: () {
            window.open('https://medium.com/@jocelyngriselle', 'medium');
          },
        ),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.github,
            color: textColor,
          ),
          onPressed: () {
            window.open('https://github.com/jocelyngriselle/', 'github');
          },
        ),
      ],
    );
  }
}
