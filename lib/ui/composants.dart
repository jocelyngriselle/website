import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'buttons.dart';

class Headline1Section extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                ? TextAlign.left
                : TextAlign.center;
        double titleSize =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? 50
                : 50;
        double descriptionSize =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? 16
                : 21;
        return Container(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: "Jocelyn Griselle,\n",
                  style: Theme.of(context).textTheme.headline1,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'développeur ',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    TextSpan(
                      text: ' fullstack ', //' backend & mobile ',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Ingénieur en développement freelance, '
                'je suis basé à Nantes et disponible pour vos projets web et mobile.',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 30,
              ),
              CallToAction('Discutons'),
            ],
          ),
        );
      },
    );
  }
}

class Headline2Section extends StatelessWidget {
  final String headlineName;
  final String name;
  final String description;

  Headline2Section({this.headlineName, this.name, this.description});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                ? TextAlign.left
                : TextAlign.center;
        double titleSize =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? 50
                : 50;
        double descriptionSize =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? 16
                : 21;
        return Container(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: '$name ',
                  style: Theme.of(context).textTheme.headline3,
                  children: <TextSpan>[
                    TextSpan(
                      text: ' $headlineName ',
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
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 30,
              ),
              //CallToAction('Discutons'),
            ],
          ),
        );
      },
    );
  }
}

class Skill extends StatelessWidget {
  final String image;

  Skill({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(this.image),
        ),
      ),
    );
  }
}

class SkillBar extends StatelessWidget {
  final List<String> skills;

  SkillBar({this.skills});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: skills
            .map(
              (skill) => new Skill(image: skill),
            )
            .toList());
  }
}
