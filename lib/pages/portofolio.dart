import 'dart:html';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:website/ui/theme.dart';

import '../ui/layout.dart';
import '../ui/composants.dart';
import '../ui/buttons.dart';
import 'package:flutter/scheduler.dart';

class PortofolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: PageLayout(
        content: DesktopProjects(),
        contentHeight: 800,
      ),
      tablet: PageLayout(
        content: PortofolioContentMobile(),
        contentHeight: 2200,
      ),
      mobile: PageLayout(
        content: PortofolioContentMobile(),
        contentHeight: 2200,
      ),
    );
  }
}

class PortofolioContentMobile extends StatelessWidget {
  const PortofolioContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: navBarHeight,
        ),
        Headline2Section(
          name: 'Présentation de quelques',
          headlineName: 'Projets',
          description:
              "A closer look at the mission, impact, and outcome of every featured project.",
        ),
        ProjectsMobile(),
        SizedBox(
          height: navBarHeight,
        ),
      ],
    );
  }
}

class PortofolioContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: navBarHeight,
        ),
        Headline2Section(
          name: 'Présentation de quelques',
          headlineName: 'Projets',
          description:
              "A closer look at the mission, impact, and outcome of every featured project.",
        ),
        Expanded(child: DesktopProjects()),
        SizedBox(
          height: navBarHeight,
        ),
      ],
    );
  }
}

class DesktopProjects extends StatefulWidget {
  @override
  _DesktopProjectsState createState() => _DesktopProjectsState();
}

class _DesktopProjectsState extends State<DesktopProjects>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  List<Animation<Offset>> imageTranslations;
  List<Animation<double>> imageOpacities;

  Animation<Offset> textTranslation;

  Animation<double> textOpacity;
  List<ProjectModel> projects;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    projects = [creative, valoo, openClassroom, mixity];
    imageTranslations = [];
    imageOpacities = [];

    for (var i = projects.length; i > 0; i--) {
      imageTranslations.add(
        Tween(
          begin: Offset(2.0, 0),
          end: Offset(0.0, 0.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.1 * (i), 0.25 * (i), curve: Curves.easeOutSine),
          ),
        ),
      );
      imageOpacities.add(
        Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.1 * (i), 0.8, curve: Curves.easeIn),
          ),
        ),
      );
    }
    textTranslation = Tween(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.54, 1.0, curve: Curves.ease),
      ),
    );
    textOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.54, 1.0, curve: Curves.linear),
      ),
    );

    //controller.forward();
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) =>
          Future.delayed(Duration(milliseconds: 100))
              .then((onValue) => controller.forward()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: navBarHeight,
        ),
        SlideTransition(
          position: textTranslation,
          child: FadeTransition(
            opacity: textOpacity,
            child: Headline2Section(
              name: 'Laissez moi vous présenter quelques',
              headlineName: 'Projets',
              description:
                  "A closer look at the mission, impact, and outcome of every featured project.",
            ),
          ),
        ),
        Expanded(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [3, 2, 1, 0]
                    .map(
                      (index) => SlideTransition(
                        position: imageTranslations[index],
                        child: FadeTransition(
                          opacity: imageOpacities[index],
                          child: Project(
                            project: projects[index],
                          ),
                        ),
                      ),
                    )
                    .toList())),
        SizedBox(
          height: navBarHeight,
        ),
      ],
    );
  }
}

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Project(
          project: creative,
        ),
        Project(
          project: openClassroom,
        ),
        Project(
          project: valoo,
        ),
        Project(
          project: mixity,
        ),
      ],
    );
  }
}

class ProjectsMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Project(
          project: openClassroom,
        ),
        SizedBox(
          height: 30,
        ),
        Project(
          project: creative,
        ),
        SizedBox(
          height: 30,
        ),
        Project(
          project: mixity,
        ),
        SizedBox(
          height: 30,
        ),
        Project(
          project: valoo,
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
  final width = 300.0; // TODO mobile width : 300 ?
  final height = 450.0; // TODO mobile height : 300 ?
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: ShadowedCard(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: height / 3,
                width: width,
                child: Hero(
                  tag: "avatar_" + widget.project.id.toString(),
                  child: Image.asset(
                    widget.project.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                height: 2 / 3 * height - 8,
                width: width,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${widget.project.client}",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: widget.project.color),
                        ),
                        Text(
                          "${widget.project.role} - ${widget.project.duration}",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    Text(
                      "\" ${widget.project.testimonyDescription.substring(0, 100)} ... \"",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        FilledButton(
                          color: widget.project.color,
                          title: 'Détails',
                          action: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectDetail(
                                  project: widget.project,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.asset(widget.project.testimonyImage),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
    return ScreenTypeLayout(
      desktop: Layout(
        contentHeight: 900,
        title: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(project.role,
                  style: Theme.of(context).textTheme.overline),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text("-", style: Theme.of(context).textTheme.overline),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(project.status,
                  style: Theme.of(context).textTheme.overline),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text("-", style: Theme.of(context).textTheme.overline),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(project.duration,
                  style: Theme.of(context).textTheme.overline),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text("-", style: Theme.of(context).textTheme.overline),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(project.location,
                  style: Theme.of(context).textTheme.overline),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
        leading: BackButton(
          color: Colors.black,
        ),
        actions: [
          project.canVisit
              ? ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      color: project.color,
                      onPressed: () {
                        window.open(project.url, 'url');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Visiter",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: Colors.white),
                            ),
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
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        ),
      ),
      mobile: Layout(
        contentHeight: 1400,
        title: Container(),
        leading: BackButton(
          color: Colors.black,
        ),
        actions: [
          project.canVisit
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      color: project.color,
                      onPressed: () {
                        window.open(project.url, 'url');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Visiter",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: Colors.white),
                            ),
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
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              //color: Colors.pink,
              child: ProjectDetailColumn(
                project: project,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TestimonyColumn(
              project: project,
            ),
          ],
        ),
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
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 500,
              maxWidth: 400,
            ),
            child: Hero(
              tag: "avatar_" + project.id.toString(),
              child: ShadowedCard(
                child: Image.asset(
                  project.image,
                  fit: BoxFit.fitWidth,
                  //"images/creative_test2.png"
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectDetailColumn extends StatelessWidget {
  final ProjectModel project;

  ProjectDetailColumn({this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 500,
            maxWidth: 400,
          ),
          child: Hero(
            tag: "avatar_" + project.id.toString(),
            child: ShadowedCard(
              child: Image.asset(
                project.image,
                fit: BoxFit.fitWidth,
                //"images/creative_test2.png"
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
            style: Theme.of(context).textTheme.headline3,
            children: <TextSpan>[
              TextSpan(
                text: " ${project.headlineName} ", //' backend & mobile ',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: project.color),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          project.description,
          style: Theme.of(context).textTheme.bodyText1,
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
      //margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          bottomRight: const Radius.circular(15.0),
          topLeft: const Radius.circular(15.0),
        ),
      ),
      child: Container(
        decoration: new BoxDecoration(
          color: project.color.withOpacity(0.25),
          borderRadius: new BorderRadius.only(
            bottomRight: const Radius.circular(15.0),
            topLeft: const Radius.circular(15.0),
          ),
        ),
        width: 900,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
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
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: project.color),
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
                          color: project.color,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        project.testimonyDescription,
                        style: Theme.of(context).textTheme.overline,
                        textAlign: TextAlign.left,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          FontAwesomeIcons.quoteRight,
                          color: project.color,
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
        ),
      ),
    );
  }
}

class TestimonyColumn extends StatelessWidget {
  final ProjectModel project;

  TestimonyColumn({this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          bottomRight: const Radius.circular(15.0),
          topLeft: const Radius.circular(15.0),
        ),
      ),
      child: Container(
        decoration: new BoxDecoration(
          color: project.color.withOpacity(0.25),
          borderRadius: new BorderRadius.only(
            bottomRight: const Radius.circular(15.0),
            topLeft: const Radius.circular(15.0),
          ),
        ),
        width: 900,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
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
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: project.color),
                  )
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Container(
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
                        color: project.color,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      project.testimonyDescription,
                      style: Theme.of(context).textTheme.overline,
                      textAlign: TextAlign.left,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        FontAwesomeIcons.quoteRight,
                        color: project.color,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
  final Color color;
  final String client;

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
    this.color: Colors.red,
    this.client: "Some Client",
  });
}

final valoo = ProjectModel(
  id: 0,
  client: "Valoo",
  name: 'Assurance à la',
  headlineName: 'demande',
  image: 'images/valoo_project.png',
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
  color: Color.fromRGBO(94, 193, 173, 1),
);

final mixity = ProjectModel(
  id: 1,
  client: "Mixity",
  name: 'Fullstack for',
  headlineName: 'Good',
  image: 'images/mixity_project.png',
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
  color: Color.fromRGBO(86, 166, 191, 1),
);

final openClassroom = ProjectModel(
  id: 2,
  name: 'Cours à ciel',
  client: 'OpenClassroom',
  headlineName: 'Ouvert',
  image: 'images/openclassroom_project.png',
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
  canVisit: true,
  url: "https://openclassrooms.com/",
  role: "Mentor Parcours Python",
  duration: "6 mois",
  location: "Télétravail",
  status: "Freelance",
  color: Color.fromRGBO(109, 90, 227, 1),
);

final creative = ProjectModel(
  id: 3,
  name: 'Oblique',
  client: "Creative Hacks",
  headlineName: 'Strategies',
  image: 'images/creative_project.png',
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
  color: Color.fromRGBO(238, 174, 120, 1),
);
