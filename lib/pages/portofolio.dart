import 'dart:html';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../ui/layout.dart';
import '../ui/composants.dart';
import '../ui/theme.dart';

class PortofolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Page(
      content: ScreenTypeLayout(
        desktop: PortofolioContentDesktop(),
        tablet: PortofolioContentDesktop(),
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
    return Container(
      constraints: BoxConstraints(maxHeight: maxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Headline2Section(
            name: 'Selection de',
            headlineName: 'Projets',
            description: 'Une selection des projets réalisés par moi et '
                'seulement parce que je suis énorme et trop bon',
          ),
          Expanded(
            child: Projects(),
          ),
        ],
      ),
    );
  }
}

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Project(
                  project: valoo,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Expanded(
                flex: 5,
                child: Project(
                  project: mixity,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Project(
                  project: openClassroom,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Expanded(
                flex: 4,
                child: Project(
                  project: creative,
                ),
              ),
            ],
          ),
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
    return Container(
      //height: 900,
      color: Colors.blue,
      //constraints: BoxConstraints(minHeight: 1500, minWidth: 500),
      child: Semantics(
        container: true,
        child: new Container(
            margin: const EdgeInsets.all(4.0),
            child: Material(
              shadowColor: Colors.grey.shade400, // added
              color: Colors.transparent,
              type: MaterialType.card,
              elevation: 3,
              child: InkWell(
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
                  padding: EdgeInsets.all(50),
                  child: Hero(
                    tag: "avatar_" + widget.project.id.toString(),
                    child: Image.asset(
                      widget.project.image,
                      height: 280,
                    ),
                  ),
                ),
              ),
              borderRadius: new BorderRadius.circular(15.0), // added
            )),
      ),
    );
  }
}

class ProjectDetail extends StatelessWidget {
  final ProjectModel project;
  ProjectDetail({this.project});

  @override
  Widget build(BuildContext context) {
    return Layout(
      navbar: HeroNavBar(
        project: project,
      ), // AnimatedNavbar
      content: Column(
        children: <Widget>[
          Container(
            //color: Colors.pink,
            child: ProjectDetailRow(
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
    );
  }
}

class ProjectDetailRow extends StatelessWidget {
  final ProjectModel project;

  ProjectDetailRow({this.project});

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
                  child: Image.asset(
                    project.image,
                  ),
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
        SkillBar(
          skills: project.skills,
        )
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
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
      width: 900,
      decoration: new BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: new BorderRadius.only(
            bottomRight: const Radius.circular(15.0),
            topLeft: const Radius.circular(15.0),
          )),
      //color: Color.fromRGBO(242, 255, 243, 0.8),
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
                  " ${project.testimonyName}",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  " ${project.testimonyJob} ",
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
                    textAlign: TextAlign.left,
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

class HeroNavBar extends StatelessWidget {
  final ProjectModel project;

  HeroNavBar({this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BackButton(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(project.role,
                    style: Theme.of(context).textTheme.overline),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text("-", style: Theme.of(context).textTheme.overline),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(project.status,
                    style: Theme.of(context).textTheme.overline),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text("-", style: Theme.of(context).textTheme.overline),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(project.duration,
                    style: Theme.of(context).textTheme.overline),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text("-", style: Theme.of(context).textTheme.overline),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(project.location,
                    style: Theme.of(context).textTheme.overline),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          project.canVisit
              ? ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    OutlineButton(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor),
                      color: Theme.of(context).accentColor,
                      highlightedBorderColor: Theme.of(context).accentColor,
                      onPressed: () {
                        window.open(project.url, 'url');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Visiter",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              FontAwesomeIcons.eye,
                              color: Theme.of(context).accentColor,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
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
  final bool canVisit;
  final String role;
  final String status;
  final String duration;
  final String location;
  final String url;

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
    this.canVisit,
    this.role,
    this.status,
    this.duration,
    this.location,
    this.url,
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
  canVisit: false,
  role: "Développeur Backend",
  duration: "2 ans",
  location: "Nantes",
  status: "CDI",
);

final mixity = ProjectModel(
  id: 2,
  name: 'Fullstack for',
  headlineName: 'Good',
  image: 'images/mixity.png',
  description: "Mixity est la première plateforme digitale qui "
      "restitue l’impact global diversité et inclusion des "
      "entreprises, écoles, collectivités, associations...\n"
      "Mixity s’appuie sur un référentiel reposant sur 5 thèmes"
      " RSE : Genre - Handicap - Multi-culturel - Multi-générationnel"
      " - LGBT+, pour générer une Empreinte diversité et inclusion "
      "propre à chaque organisation.",
  testimonyName: "Sandrine\n Charpentier",
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
    "images/javascript.png",
  ],
  canVisit: true,
  role: "Développeur Fullstack",
  duration: "6 mois",
  location: "Nantes",
  status: "Freelance",
  url: "https://www.mixity.co/",
);

final openClassroom = ProjectModel(
  id: 3,
  name: 'Cours à ciel',
  headlineName: 'Ouvert',
  image: 'images/openclassroom.png',
  description:
      "OpenClassrooms est un site web de formation en ligne qui propose"
      " à ses membres des cours certifiants et des parcours débouchant sur des "
      "métiers en croissance. Ses contenus sont réalisés en interne, par des "
      "écoles, des universités, des entreprises partenaires comme Microsoft ou "
      "IBM, ou historiquement par des bénévoles.",
  testimonyName: "Bela Remes",
  testimonyJob: "Etudiant @ OC",
  testimonyImage: "images/remes.png",
  testimonyDescription:
      "Jocelyn est un excellent professeur Jocelyn est un excellent professeur"
      "Jocelyn est un excellent professeurJocelyn est un excellent professeur"
      "Jocelyn est un excellent professeur Jocelyn est un excellent professeur"
      "Jocelyn est un excellent professeur Jocelyn est un excellent professeur"
      "Jocelyn est un excellent professeur Jocelyn est un excellent professeur"
      "Jocelyn est un excellent professeur",
  skills: [
    "images/python.png",
    "images/django.png",
    "images/postgresql.png",
  ],
  canVisit: false,
  role: "Mentor Parcours Python",
  duration: "6 mois",
  location: "Télétravail",
  status: "Freelance",
);

final creative = ProjectModel(
  id: 4,
  name: 'Oblique',
  headlineName: 'Strategies',
  image: 'images/creative.png',
  description: 'Les cartes « stratégies obliques » ont été '
      'développées en anglais, et de nombreuses applications '
      'mobiles ou sites web vous permettent de piocher une '
      'carte au hasard. Une traduction française circule également'
      ' sur le net, sans que son auteur soit clairement identifié.',
  testimonyName: "DJ Izem",
  testimonyJob: "Music Producer",
  testimonyImage: "images/kerouanton.png",
  testimonyDescription:
      "J’ai fait appel à Jocelyn pour superviser le développement"
      " de mon projet d’application Creative Hacks. La communication s’est "
      "révélée très fluide et j’ai apprécié le soin qu’il a porté à comprendre "
      "le problème en profondeur. Il a confirmé cette première bonne impression "
      "en fournissant un travail de développement rapide, efficace et détaillé, "
      "totalement en accord avec mes attentes.",
  skills: [
    "images/dart.png",
    "images/flutter.png",
    "images/firebase.png",
  ],
  canVisit: false,
  role: "Développeur Mobile",
  duration: "2 mois",
  location: "Télétravail",
  status: "Freelance",
);
