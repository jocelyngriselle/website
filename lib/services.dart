import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'button.dart';
import 'layout.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Page(
      content: ScreenTypeLayout(
        desktop: ServicesContentDesktop(),
        tablet: ServicesContentMobile(),
        mobile: ServicesContentMobile(),
      ),
    );
  }
}

class ServicesContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
//        SizedBox(
//          height: 30,
//        ),
//        Container(
//          width: 1000,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: [
//              RichText(
//                text: TextSpan(
//                  text: "Jocelyn Griselle,\n",
//                  style: Theme.of(context).textTheme.headline3,
//                  children: <TextSpan>[
//                    TextSpan(
//                      text: 'développeur ',
//                      style: Theme.of(context).textTheme.headline3,
//                    ),
//                    TextSpan(
//                      text: ' fullstack ', //' backend & mobile ',
//                      style: Theme.of(context).textTheme.headline4,
//                    ),
//                  ],
//                ),
//              ),
//              SizedBox(
//                height: 30,
//              ),
//              Text(
//                'Ingénieur en développement freelance, '
//                'je suis basé à Nantes et disponible pour vos projets web et mobile.',
//                style: Theme.of(context).textTheme.bodyText1,
//              ),
//            ],
//          ),
//        ),
        SizedBox(
          height: 50,
        ),
        ServiceCardReverse(
          title: 'Formation ',
          titleHeadline: ' Web ',
          image: 'images/mac.png',
          description:
              "Anonyme assembla ensemble des morceaux de texte pour réaliser"
              " un livre spécimen de polices de texte.",
        ),
        SizedBox(
          height: 50,
        ),
        ServiceCard(
          title: 'Développement ',
          titleHeadline: ' Mobile ',
          image: 'images/iphone.png',
          description:
              "Anonyme assembla ensemble des morceaux de texte pour réaliser"
              " un livre spécimen de polices de texte.",
        ),
        SizedBox(
          height: 50,
        ),
        ServiceCardReverse(
          title: ' Formation & \n',
          titleHeadline: ' Enseignement ',
          image: 'images/formation.png',
          description:
              "Anonyme assembla ensemble des morceaux de texte pour réaliser"
              " un livre spécimen de polices de texte.",
        ),
      ],
    );
  }
}

class ServicesContentMobile extends StatelessWidget {
  const ServicesContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String titleHeadline;
  final String description;
  final String image;

  ServiceCard({this.title, this.titleHeadline, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: title,
                    style: Theme.of(context).textTheme.headline3,
                    children: <TextSpan>[
                      TextSpan(
                        text: titleHeadline,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.no_encryption,
                      size: 18,
                      color: Colors.blue,
                    ),
                    Text(
                      ' Sécurisé',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.remove_red_eye,
                      size: 18,
                      color: Colors.pink,
                    ),
                    Text(
                      ' User friendly',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.security,
                      size: 18,
                      color: Colors.orange,
                    ),
                    Text(
                      ' RGPD',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 200,
          ),
          Center(
            child: SizedBox(
              height: 380,
              width: 280,
              child: Image.asset(
                image,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          //CallToAction('Discutons'),
        ],
      ),
    );
  }
}

class ServiceCardReverse extends StatelessWidget {
  final String title;
  final String titleHeadline;
  final String description;
  final String image;

  ServiceCardReverse(
      {this.title, this.titleHeadline, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 400,
            child: Center(
              child: SizedBox(
                height: 380,
                width: 280,
                child: Image.asset(
                  image,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 200,
          ),
          Container(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: title,
                    style: Theme.of(context).textTheme.headline3,
                    children: <TextSpan>[
                      TextSpan(
                        text: titleHeadline,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.no_encryption,
                      size: 18,
                      color: Colors.blue,
                    ),
                    Text(
                      ' Sécurisé',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.remove_red_eye,
                      size: 18,
                      color: Colors.pink,
                    ),
                    Text(
                      ' User friendly',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.security,
                      size: 18,
                      color: Colors.orange,
                    ),
                    Text(
                      ' RGPD',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),

          //CallToAction('Discutons'),
        ],
      ),
    );
  }
}
