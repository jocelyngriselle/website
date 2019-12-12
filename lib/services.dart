import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'navigation.dart';
import 'centered_view.dart';
import 'button.dart';
import 'footer.dart';
import 'card.dart';

class ServicesPage extends StatelessWidget {
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
                  desktop: ServicesContentDesktop(),
                  tablet: ServicesContentMobile(),
                  mobile: ServicesContentMobile(),
                ),
              )
            ]),
          ),
          bottomNavigationBar: Footer()),
    );
  }
}


class ServiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Image(
          image: AssetImage("images/blink.png"),
          height: 92.0,
          width: 92.0,
        ),
        Text(
          'Sécurité & RGPD',
        ),
      ],),
      Text(
        'In this course we will go over the basics of using Flutter Web for website development.',
      ),
    ]);
  }
}

class ServicesContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ServiceCard(),
            ServiceCard(),
            ServiceCard(),
          ],
        ),

    Expanded(child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              image: AssetImage("images/blink.png"),
              height: 92.0,
              width: 92.0,
            ),
            Image(
              image: AssetImage("images/blink.png"),
              height: 92.0,
              width: 92.0,
            ),
            Image(
              image: AssetImage("images/blink.png"),
              height: 92.0,
              width: 92.0,
            ),
          ],
        ),
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
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "GREEZ\nMOBILE FIRST",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: titleSize,
                  height: 0.9),
              textAlign: textAlignment,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
              style: TextStyle(fontSize: descriptionSize, height: 1.7),
              textAlign: textAlignment,
            ),
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
