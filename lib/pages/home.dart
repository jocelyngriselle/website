import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../ui/layout.dart';
import '../ui/composants.dart';

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
        Headline1Section(),
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
        Headline1Section(),
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
        child: Image.asset('images/hello.png'),
      ),
    );
  }
}
