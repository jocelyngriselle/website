import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'button.dart';
import 'layout.dart';

class SkillsPage extends StatelessWidget {
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

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  ServiceCard({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: "",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontFamily: 'Open sans',
                color: Colors.black,
                fontSize: 32,
                height: 1.5,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Pour vous offrir la ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 32,
                    height: 0.9,
                    fontFamily: 'Open sans',
                  ),
                ),
                TextSpan(
                  text: ' meilleure solution ', //' backend & mobile ',
                  style: TextStyle(
                    backgroundColor: Colors.grey.shade200,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Open sans',
                    fontSize: 32,
                    height: 0.9,
                  ),
                ),
                TextSpan(
                  text: ' possible',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 32,
                    height: 0.9,
                    fontFamily: 'Open sans',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Ingénieur en développement freelance, '
            'je suis basé à Nantes et disponible pour vos projets web et mobile.'
            'je suis basé à Nantes et disponible pour vos projets web et mobile.'
            'je suis basé à Nantes et disponible pour vos projets web et mobile.',
            style: TextStyle(fontSize: 21, height: 1.7),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 30,
          ),
          //CallToAction('Discutons'),
        ],
      ),
    );
  }
}

class ServicesContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ServiceCard(
              title: 'DEVELOPPEMENT',
              description:
                  "Anonyme assembla ensemble des morceaux de texte pour réaliser"
                  " un livre spécimen de polices de texte. Il n'a pas fait "
                  "que survivre cinq siècles, mais s'est aussi adapté à la"
                  " bureautique informatique, sans que son contenu n'en "
                  "soit modifié. Il a été popularisé dans les années 1960",
            ),
            Expanded(
              child: ImageDetails(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              //child: Skills(),
              child: ImageDetails(),
            ),
            ServiceCard(
              title: 'DEVELOPPEMENT',
              description:
                  "Anonyme assembla ensemble des morceaux de texte pour réaliser"
                  " un livre spécimen de polices de texte. Il n'a pas fait "
                  "que survivre cinq siècles, mais s'est aussi adapté à la"
                  " bureautique informatique, sans que son contenu n'en "
                  "soit modifié. Il a été popularisé dans les années 1960",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ServiceCard(
              title: 'DEVELOPPEMENT',
              description:
                  "Anonyme assembla ensemble des morceaux de texte pour réaliser"
                  " un livre spécimen de polices de texte. Il n'a pas fait "
                  "que survivre cinq siècles, mais s'est aussi adapté à la"
                  " bureautique informatique, sans que son contenu n'en "
                  "soit modifié. Il a été popularisé dans les années 1960",
            ),
            Expanded(
              child: ImageDetails(),
            ),
          ],
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
      children: <Widget>[
        Skills(),
      ],
    );
  }
}

class ImageDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 380,
        width: 280,
        child: Image.asset('images/computer.png'),
      ),
    );
  }
}

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  height: 5.0,
                  indent: 5.0,
                  color: Colors.grey.shade200,
                ),
              ),
              Text(
                ' Backend ',
                style: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 20, height: 0.9),
              ),
              Expanded(
                child: Divider(
                  height: 5.0,
                  indent: 5.0,
                  color: Colors.grey.shade200,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Skill(image: "images/python.png"),
              Skill(image: "images/django.png"),
              Skill(image: "images/scrapy.png"),
              Skill(image: "images/postgresql.png"),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  height: 5.0,
                  indent: 5.0,
                  color: Colors.grey.shade200,
                ),
              ),
              Text(
                ' Devops ',
                style: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 20, height: 0.9),
              ),
              Expanded(
                child: Divider(
                  height: 5.0,
                  indent: 5.0,
                  color: Colors.grey.shade200,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Skill(image: "images/docker.png"),
              Skill(image: "images/heroku.png"),
              Skill(image: "images/gitlab.png"),
              Skill(image: "images/kubernetes.png"),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  height: 10.0,
                  indent: 5.0,
                  color: Colors.grey.shade200,
                ),
              ),
              Text(
                ' Mobile ',
                style: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 20, height: 0.9),
              ),
              Expanded(
                child: Divider(
                  height: 10.0,
                  indent: 5.0,
                  color: Colors.grey.shade200,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Skill(image: "images/dart.png"),
              Skill(image: "images/flutter.png"),
              Skill(image: "images/swift.png"),
              Skill(image: "images/fastlane.png"),
            ],
          ),
        ],
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final String image;

  Skill({this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Image.asset(this.image),
      ),
    );
  }
}
