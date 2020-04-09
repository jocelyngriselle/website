import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:website/skills.dart';
import 'home.dart';
import 'contact.dart';
import 'services.dart';
import 'portofolio.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    case "Compétences":
      {
        return SkillsPage();
      }
      break;
    case "Portofolio":
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
              NavBarItem(
                'Services',
                key: UniqueKey(),
              ),
              NavBarItem(
                'Compétences',
                key: UniqueKey(),
              ),
              NavBarItem(
                'Portofolio',
                key: UniqueKey(),
              ),
              OutlineButton(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.of(context).push(
                    createRoute('Contact'),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Text(
                    "Contact",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).accentColor,
                      //fontWeight: FontWeight.w800,
                      //color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
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
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
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

class NavBarItem extends StatefulWidget {
  final String title;

  const NavBarItem(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = false;
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.title);
    //print(_selected);
//    return InkWell(
//      borderRadius: BorderRadius.circular(5.0),
//      onTap: () {
//        Navigator.of(context).push(createRoute(widget.title));
//      },
//      child: Container(
//        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
//        child: Text(
//          widget.title,
//          style: TextStyle(
//            fontSize: _selected ? 18 : 18,
//            color: Colors.black,
//
//          ),
//        ),
//      ),
//    );
    return FlatButton(
      //color: Color.fromARGB(255, 31, 229, 146),
      onPressed: () {
        Navigator.of(context).push(
          createRoute(widget.title),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            //fontWeight: FontWeight.w800,
            //color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
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
    return Row(
      children: <Widget>[
        SizedBox(
          height: 45,
          width: 45,
          child: InkResponse(
            onTap: () {
              Navigator.of(context).push(
                createRoute('Acceuil'),
              );
            },
            child: Image.asset('images/logo.png'),
          ),
        ),
//        SizedBox(
//          width: 10,
//        ),
//        Text(
//          'Jocelyn Griselle',
//          style: TextStyle(
//              color: Theme.of(context).accentColor,
//              fontFamily: 'Open sans',
//              fontSize: 24),
//        )

//        IconButton(
//          icon: Icon(FontAwesomeIcons.twitter),
//          onPressed: () {},
//        ),
//        IconButton(
//          icon: Icon(FontAwesomeIcons.linkedin),
//          onPressed: () {},
//        ),
//        IconButton(
//          icon: Icon(FontAwesomeIcons.medium),
//          onPressed: () {},
//        ),
//        IconButton(
//          icon: Icon(FontAwesomeIcons.github),
//          onPressed: () {},
//        ),
      ],
    );
  }
}
