import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../routes.dart';
import '../ui/layout.dart';
import '../ui/composants.dart';
import '../ui/buttons.dart';
import '../ui/theme.dart';
import 'package:flutter/scheduler.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      contentHeight: 850,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: navBarHeight,
        ),
        Headline2Section(
          name: 'Je peux vous rendre',
          headlineName: 'Service',
          description:
              'Innovative experiences that help companies recapture the market from their competitors.',
        ),
        Expanded(child: DesktopServices()),
        SizedBox(
          height: navBarHeight,
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
      children: <Widget>[], // TODO
    );
  }
}

class DesktopServices extends StatefulWidget {
  @override
  _DesktopServicesState createState() => _DesktopServicesState();
}

class _DesktopServicesState extends State<DesktopServices>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> mainScaling;
  Animation<double> sideScaling;
  List<ServiceModel> services;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    services = [formation, backend, mobile];
    mainScaling = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );
    sideScaling = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.1, 0.5, curve: Curves.easeIn),
      ),
    );

    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) =>
          Future.delayed(Duration(milliseconds: 100))
              .then((onValue) => _controller.forward()));
    }
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ScaleTransition(
          scale: sideScaling,
          child: ServiceCard(
            service: formation,
          ),
        ),
        ScaleTransition(
          scale: mainScaling,
          child: ServiceCard(
            service: backend,
            main: true,
          ),
        ),
        ScaleTransition(
          scale: sideScaling,
          child: ServiceCard(
            service: mobile,
          ),
        ),
      ],
    );
  }
}

class ServiceImage extends StatelessWidget {
  final ServiceModel service;
  final bool main;

  ServiceImage({
    this.service,
    this.main: false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: main ? 150 : 120,
      child: Container(
        child: Center(
          child: Image.asset(
            service.image,
            fit: BoxFit.fitHeight,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final bool main;

  ServiceCard({
    this.service,
    this.main: false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: main ? 350 : 300,
        height: main ? 600 : 500,
        child: ShadowedCard(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: service.name,
                    style: Theme.of(context).textTheme.headline5,
                    children: <TextSpan>[
                      TextSpan(
                        text: service.headlineName,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ServiceImage(
                  service: service,
                  main: main,
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: SkillBar(
                      small: true,
                      skills: service.skills,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "${service.experience} d'expérience",
                      style: Theme.of(context).textTheme.overline,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "A partir de ${service.pricing}€ / jour",
                      style: Theme.of(context).textTheme.overline,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: main
                        ? FilledButton(
                            title: "Contact",
                            color: Theme.of(context).accentColor,
                            action: () {
                              Navigator.of(context)
                                  .push(createRoute("contact"));
                            })
                        : TransparentButton(
                            title: "Contact",
                            action: () {
                              Navigator.of(context)
                                  .push(createRoute("contact"));
                            }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceModel {
  final String description;
  final int id;
  final String image;
  final String name;
  final String headlineName;
  final List<String> skills;
  final String pricing;
  final String experience;

  ServiceModel({
    this.id,
    this.name,
    this.headlineName,
    this.image,
    this.description,
    this.skills,
    this.pricing,
    this.experience,
  });
}

final backend = ServiceModel(
  id: 1,
  name: 'Développement ',
  headlineName: 'Web',
  image: 'images/mac_code.png',
  pricing: "400",
  experience: "6 ans",
  description: "Revendre son bien peut s’avérer être un parcours "
      "du combattant. C’est pour cela qu’une start-up française "
      "a développé une appli qui permet d’estimer et revendre "
      "efficacement ses biens : Valoo. Tout juste lancée, Valoo "
      "est unique dans son genre et présente de multiples avantages.",
  skills: [
    "images/python.png",
    "images/javascript.png",
    "images/docker.png",
  ],
);

final mobile = ServiceModel(
  id: 1,
  name: 'Application ',
  headlineName: 'Mobile',
  image: 'images/iphone_code.png',
  experience: "6 mois",
  pricing: "300",
  description: "Revendre son bien peut s’avérer être un parcours "
      "du combattant. C’est pour cela qu’une start-up française "
      "a développé une appli qui permet d’estimer et revendre "
      "efficacement ses biens : Valoo. Tout juste lancée, Valoo "
      "est unique dans son genre et présente de multiples avantages.",
  skills: [
    "images/flutter.png",
    "images/apple.png",
    "images/android.png",
  ],
);

final formation = ServiceModel(
  id: 1,
  name: 'Formation ',
  headlineName: 'Web',
  pricing: "600",
  experience: "6 mois",
  image: 'images/formation.png',
  description: "Revendre son bien peut s’avérer être un parcours "
      "du combattant. C’est pour cela qu’une start-up française "
      "a développé une appli qui permet d’estimer et revendre "
      "efficacement ses biens : Valoo. Tout juste lancée, Valoo "
      "est unique dans son genre et présente de multiples avantages.",
  skills: [
    "images/python.png",
    "images/javascript.png",
  ],
);
