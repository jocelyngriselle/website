import 'package:flutter/material.dart';
import 'package:website/skills.dart';
import 'home.dart';
import 'contact.dart';
import 'services.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Widget _getRoute(String name) {
  switch (name) {
    case "Acceuil":
      {return HomePage();}
      break;
    case "Contact":
      {return ContactPage();}
      break;
    case "Projets":
      {return SkillsPage();}
      break;
    case "Services":
      {return ServicesPage();}
      break;
  }
}

Route createRoute(String name) {
  print("in _createRoute()");
  print(name);

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => _getRoute(name),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var textOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: ModalRoute.of(context).animation,
          curve: Interval(0.54, 0.84, curve: Curves.linear),
        ),
      );
      return FadeTransition(
        opacity: textOpacity,
        child: child,
      );
    },
  );


}


class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);
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
  const NavigationBarMobile({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          NavBarLogo()
        ],
      ),
    );
  }
}



class NavigationBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarSocials(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Acceuil'),
              NavBarItem('Services'),
              NavBarItem('Projets'),
              NavBarItem('Contact'),
            ],
          )
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
          NavBarItem(title),
        ],
      ),
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
            'SKILL UP NOW',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          Text(
            'TAP HERE',
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
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          DrawerItem('Episodes', Icons.videocam),
          DrawerItem('About', Icons.help),
        ],
      ),
    );
  }
}


class NavBarItem extends StatelessWidget {
  final String title;

  const NavBarItem(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(createRoute(title));
      },
      child: 
      Container(
        padding: EdgeInsets.all(30),
        child:
        Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}


class NavBarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 180,
      child: Image.asset('images/blink.png'),
    );
  }
}

class NavBarSocials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.twitter),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.linkedin),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.medium),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.github),
            onPressed: () {},
          ),
        ],
      );
  }

}