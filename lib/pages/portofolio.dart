import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../ui/layout.dart';
import '../ui/composants.dart';

class PortofolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Page(
      content: ScreenTypeLayout(
        desktop: PortofolioContentDesktop(),
        //tablet: ServicesContentMobile(),
        //mobile: ServicesContentMobile(),
      ),
    );
  }
}

class PortofolioContentMobile extends StatelessWidget {
  const PortofolioContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Project(
          project: mixity,
        ),
      ],
    );
  }
}

class PortofolioContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Project(
                project: valoo,
              ),
            ),
            Expanded(
              child: Project(
                project: mixity,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Project(
                project: unknown,
              ),
            ),
            Expanded(
              child: Project(
                project: creative,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Project extends StatefulWidget {
  final ProjectModel project;

  Project({this.project});

  @override
  ProjectState createState() => ProjectState();
}

class ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 1200.0,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProjectDetail(
            project: widget.project,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Hero(
          tag: "avatar_" + widget.project.id.toString(),
          child: Image.asset(
            widget.project.image,
            height: 280,
          ),
        ),
      ),
    );
  }
}

class ProjectDetail extends StatelessWidget {
  final ProjectModel project;

  ProjectDetail({this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Retour",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 70.0),
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 1200,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    //color: Colors.pink,
                    child: ProjectRow(
                      project: project,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TestimonyRow(
                    project: project,
                  ),
                ],
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectRow extends StatelessWidget {
  final ProjectModel project;

  ProjectRow({this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          //color: Colors.blue,
          width: 600,
          child: ProjectDescription(
            project: project,
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Expanded(
          child: Container(
            //color: Colors.green,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 400,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: "avatar_" + project.id.toString(),
                  child: Image.asset(project.image),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectDescription extends StatelessWidget {
  final ProjectModel project;

  ProjectDescription({this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: "${project.name} ",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontFamily: 'Open sans',
              color: Colors.black,
              fontSize: 32,
              height: 1.5,
            ),
            children: <TextSpan>[
              TextSpan(
                text: " ${project.headlineName} ", //' backend & mobile ',
                style: TextStyle(
                  backgroundColor: Colors.grey.shade200,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Open sans',
                  fontSize: 32,
                  height: 0.9,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          project.description,
          style: TextStyle(fontSize: 21, height: 1.7),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: project.skills
                .map((skill) => new Skill(image: skill))
                .toList()),
      ],
    );
  }
}

class TestimonyRow extends StatelessWidget {
  final ProjectModel project;

  TestimonyRow({this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      //color: Colors.deepPurpleAccent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 130,
                  width: 130,
                  child: Image.asset(project.testimonyImage),
                ),
                Text(
                  project.testimonyName,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  project.testimonyJob,
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Expanded(
            flex: 3,
            child: Container(
              //color: Colors.orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Icon(
                      FontAwesomeIcons.quoteLeft,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    project.testimonyDescription,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      FontAwesomeIcons.quoteRight,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectModel {
  final String description;
  final int id;
  final String image;
  final String name;
  final String headlineName;
  final String testimonyName;
  final String testimonyJob;
  final String testimonyImage;
  final String testimonyDescription;
  final List<String> skills;

  ProjectModel({
    this.id,
    this.name,
    this.headlineName,
    this.image,
    this.description,
    this.testimonyDescription,
    this.testimonyImage,
    this.testimonyJob,
    this.testimonyName,
    this.skills,
  });
}

final valoo = ProjectModel(
  id: 1,
  name: 'Assurance à la',
  headlineName: 'demande',
  image: 'images/valoo.png',
  description: "Revendre son bien peut s’avérer être un parcours "
      "du combattant. C’est pour cela qu’une start-up française "
      "a développé une appli qui permet d’estimer et revendre "
      "efficacement ses biens : Valoo. Tout juste lancée, Valoo "
      "est unique dans son genre et présente de multiples avantages.",
  testimonyName: "Jeremy Marc",
  testimonyJob: "CTO @ Valoo",
  testimonyImage: "images/marc.png",
  testimonyDescription:
      "Jocelyn est venu renforcer notre équipe back-office Python/"
      "Django et a su rapidement prendre en main notre serveur"
      " de produits. Son goût pour la découverte de nouvelles "
      "technologies ( Scrapy, Docker, ELK, VueJS ) fait de lui "
      "un explorateur avisé."
      "\nSes talents de développeur et sa bonne humeur lui "
      "présagent un bel avenir dans le freelance !",
  skills: [
    "images/python.png",
    "images/django.png",
    "images/scrapy.png",
    "images/docker.png",
  ],
);

final mixity = ProjectModel(
  id: 2,
  name: 'Fullstack for',
  headlineName: 'good',
  image: 'images/mixity.png',
  description: "Mixity est la première plateforme digitale qui "
      "restitue l’impact global diversité et inclusion des "
      "entreprises, écoles, collectivités, associations...\n"
      "Mixity s’appuie sur un référentiel reposant sur 5 thèmes"
      " RSE : Genre - Handicap - Multi-culturel - Multi-générationnel"
      " - LGBT+, pour générer une Empreinte diversité et inclusion "
      "propre à chaque organisation.",
  testimonyName: "Sandrine Charpentier",
  testimonyJob: "CEO @ Mixity",
  testimonyImage: "images/charpentier.png",
  testimonyDescription:
      "Jocelyn est venu renforcer notre équipe back-office Python/"
      "Django et a su rapidement prendre en main notre serveur"
      " de produits. Son goût pour la découverte de nouvelles "
      "technologies ( Scrapy, Docker, ELK, VueJS ) fait de lui "
      "un explorateur avisé."
      "\nSes talents de développeur et sa bonne humeur lui "
      "présagent un bel avenir dans le freelance !",
  skills: [
    "images/python.png",
    "images/django.png",
    "images/heroku.png",
  ],
);

final unknown = ProjectModel(
  id: 3,
  name: 'fgtretre',
  headlineName: 'rtett',
  image: 'images/mac.png',
  description: "Mixity est la première plateforme digitale qui "
      "restitue l’impact global diversité et inclusion des "
      "entreprises, écoles, collectivités, associations...\n"
      "Mixity s’appuie sur un référentiel reposant sur 5 thèmes"
      " RSE : Genre - Handicap - Multi-culturel - Multi-générationnel"
      " - LGBT+, pour générer une Empreinte diversité et inclusion "
      "propre à chaque organisation.",
  testimonyName: "Sandrine Charpentier",
  testimonyJob: "CEO @ Mixity",
  testimonyImage: "images/charpentier.png",
  testimonyDescription:
      "Jocelyn est venu renforcer notre équipe back-office Python/"
      "Django et a su rapidement prendre en main notre serveur"
      " de produits. Son goût pour la découverte de nouvelles "
      "technologies ( Scrapy, Docker, ELK, VueJS ) fait de lui "
      "un explorateur avisé."
      "\nSes talents de développeur et sa bonne humeur lui "
      "présagent un bel avenir dans le freelance !",
  skills: [
    "images/dart.png",
    "images/flutter.png",
    "images/firebase.png",
  ],
);

final creative = ProjectModel(
  id: 4,
  name: 'Oblique',
  headlineName: 'strategies',
  image: 'images/creative.png',
  description: 'Les cartes « stratégies obliques » ont été '
      'développées en anglais, et de nombreuses applications '
      'mobiles ou sites web vous permettent de piocher une '
      'carte au hasard. Une traduction française circule également'
      ' sur le net, sans que son auteur soit clairement identifié.',
  testimonyName: "DJ Izem",
  testimonyJob: "Music Producer",
  testimonyImage: "images/kerouanton.png",
  testimonyDescription: 'Ingénieur en développement freelance, '
      "Jocelyn est venu renforcer notre équipe back-office Python/"
      "Django et a su rapidement prendre en main notre serveur"
      " de produits. Son goût pour la découverte de nouvelles "
      "technologies ( Scrapy, Docker, ELK, VueJS ) fait de lui "
      "un explorateur avisé."
      "\nSes talents de développeur et sa bonne humeur lui "
      "présagent un bel avenir dans le freelance !",
  skills: [
    "images/dart.png",
    "images/flutter.png",
    "images/firebase.png",
  ],
);
