import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'navigation.dart';
import 'centered_view.dart';
import 'button.dart';
import 'footer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(children: <Widget>[
            NavigationBar(),
            Expanded(
              child: ScreenTypeLayout(
                desktop: HomeContentDesktop(),
                tablet: HomeContentMobile(),
                mobile: HomeContentMobile(),
              ),
            )
          ]),
        ),
        bottomNavigationBar: Footer()
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
              : 80;
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
            Container(
              margin: EdgeInsets.only(bottom: 30),
              padding: EdgeInsets.only(bottom: 30),
              color: Colors.red,
              child:Text(

              "HELLO\nJOCELYN",
                overflow: TextOverflow.visible,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: titleSize,
                  height: 1,),
              textAlign: textAlignment,
            ),),
            SizedBox(
              height: 30,
            ),
            Text(
              'Je suis Jocelyn Griselle, ingénieur en développement mobile et web en freelance. Je suis basé à Nantes, ouvert au télétravail mais pas tout le temps, disponible pour vos projets mobiles et data.',
              style: TextStyle(fontSize: descriptionSize, height: 1.7),
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
