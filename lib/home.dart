import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'layout.dart';
import 'button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Page(
      content: ScreenTypeLayout(
        desktop: HomeContentDesktop(),
        tablet: HomeContentMobile(),
        mobile: HomeContentMobile(),
      ),
    );
  }
}

class HomeContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CourseDetails(),
        Expanded(
          child: ImageDetails(),
        )
      ],
    );
  }
}

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CourseDetails(),
      ],
    );
  }
}

class CourseDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
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
    });
  }
}

class ImageDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 380,
        width: 280,
        child: Image.asset('images/hello.png'),
      ),
    );
  }
}
