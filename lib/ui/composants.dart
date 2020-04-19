import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'buttons.dart';
import '../routes.dart';

class Headline1Section extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                ? TextAlign.left
                : TextAlign.center;
        var headline1 =
            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                ? Theme.of(context).textTheme.headline1
                : Theme.of(context).textTheme.headline3;
        var headline2 =
            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                ? Theme.of(context).textTheme.headline2
                : Theme.of(context).textTheme.headline4;
        var crossAxisAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center;
        return Container(
          width: 600,
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                textAlign: textAlignment,
                text: TextSpan(
                  text: "Jocelyn Griselle,\n",
                  style: headline1,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'développeur ',
                      style: headline1,
                    ),
                    TextSpan(
                      text: ' fullstack ', //' backend & mobile ',
                      style: headline2,
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
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 30,
              ),
              FilledButton(
                title: 'Discutons',
                color: Theme.of(context).accentColor,
                small: false,
                action: () {
                  Navigator.of(context).push(createRoute("contact"));
                },
              ),
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
          width: 1200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                style: Theme.of(context).textTheme.subtitle2,
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

class ShadowedCardold extends StatelessWidget {
  final Widget child;

  ShadowedCardold({this.child});

  @override
  Widget build(BuildContext context) {
    final blurRadius = 30.0;
    final borderRadius = 30.0;
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              // offset, the X,Y coordinates to offset the shadow
              offset: new Offset(0.0, 0.0),
              // blurRadius, the higher the number the more smeared look
              blurRadius: blurRadius,
              spreadRadius: 4.0)
        ],
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      //borderRadius: BorderRadius.circular(15.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          clipBehavior: Clip.antiAlias,
          child: child),
    );
  }
}

class ShadowedCard extends StatelessWidget {
  final Widget child;

  ShadowedCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.circular(30.0),
//      ),
      elevation: 3.0,
      child: child,
    );
  }
}

class Skill extends StatelessWidget {
  final String image;
  final bool small;

  Skill({this.image, this.small: false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Center(
        child: SizedBox(
          height: small ? 70 : 100,
          width: small ? 75 : 100,
          child: Image.asset(
            this.image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class SkillBar extends StatelessWidget {
  final List<String> skills;
  final bool small;

  SkillBar({this.skills, this.small: false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisSize: small ? MainAxisSize.max : MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
              small ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: skills
              .map(
                (skill) => new Skill(
                  image: skill,
                  small: small,
                ),
              )
              .toList()),
    );
  }
}
