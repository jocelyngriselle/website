import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'home.dart';
import 'navigation.dart';
import 'centered_view.dart';
import 'footer.dart';


class AnimationsPlayground extends StatelessWidget {
  static Route<dynamic> route() {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 3),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AnimationsPlayground();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
          desktop: DesktopAnimatedApp(),
          tablet: MobileAnimatedApp(),
          mobile: MobileAnimatedApp()),
      bottomNavigationBar: AnimatedFooter(),
    );
  }
}

class DesktopAnimatedApp extends StatefulWidget {
  @override
  _DesktopAnimatedAppState createState() => _DesktopAnimatedAppState();
}

class _DesktopAnimatedAppState extends State<DesktopAnimatedApp> {
  Animation<double> controller;
  Animation<Offset> imageTranslation;
  Animation<Offset> textTranslation;
  Animation<Offset> navbarTranslation;
  Animation<Offset> footerTranslation;
  Animation<double> imageOpacity;
  Animation<double> textOpacity;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (controller == null) {
      controller = ModalRoute.of(context).animation;
      imageTranslation = Tween(
        begin: Offset(-0.5, 0.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
        ),
      );
      imageOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.2, 0.45, curve: Curves.easeIn),
        ),
      );
      textTranslation = Tween(
        begin: Offset(0.0, 1.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.54, 0.84, curve: Curves.ease),
        ),
      );
      textOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.54, 0.84, curve: Curves.linear),
        ),
      );
      navbarTranslation = Tween(
        begin: Offset(0.0, -5.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.8, 1.0, curve: Curves.easeIn),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return CenteredView(
          child: Column(
            children: <Widget>[
              FractionalTranslation(
                translation: navbarTranslation.value,
                child: NavigationBar(),
              ),
              Expanded(
                child: Row(children: [
                  FractionalTranslation(
                    translation: textTranslation.value,
                    child: FadeTransition(
                      opacity: textOpacity,
                      child: CourseDetails(),
                    ),
                  ),
                  Expanded(
                    child: FractionalTranslation(
                      translation: imageTranslation.value,
                      child: FadeTransition(
                        opacity: imageOpacity,
                        child: ImageDetails(),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MobileAnimatedApp extends StatefulWidget {
  @override
  _MobileAnimatedAppState createState() => _MobileAnimatedAppState();
}

class _MobileAnimatedAppState extends State<MobileAnimatedApp> {
  Animation<double> controller;
  Animation<Offset> imageTranslation;
  Animation<Offset> textTranslation;
  Animation<Offset> navbarTranslation;
  Animation<Offset> footerTranslation;
  Animation<double> imageOpacity;
  Animation<double> textOpacity;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (controller == null) {
      controller = ModalRoute.of(context).animation;
      textTranslation = Tween(
        begin: Offset(0.0, 1.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0, 0.4, curve: Curves.ease),
        ),
      );
      textOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.1, 0.5, curve: Curves.linear),
        ),
      );
      navbarTranslation = Tween(
        begin: Offset(0.0, -5.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.4, 0.7, curve: Curves.easeIn),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return CenteredView(
          child: Column(
            children: <Widget>[
              FractionalTranslation(
                translation: navbarTranslation.value,
                child: NavigationBar(),
              ),
              Expanded(
                child: FractionalTranslation(
                  translation: textTranslation.value,
                  child: FadeTransition(
                    opacity: textOpacity,
                    child: HomeContentMobile(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



class AnimatedFooter extends StatefulWidget {
  @override
  AnimatedFooterState createState() => AnimatedFooterState();
}

class AnimatedFooterState extends State<AnimatedFooter> {
  Animation<double> controller;
  Animation<Offset> footerTranslation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (controller == null) {
      controller = ModalRoute.of(context).animation;
      footerTranslation = Tween(
        begin: Offset(0.0, 5.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.8, 1.0, curve: Curves.easeIn),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return FractionalTranslation(
          translation: footerTranslation.value,
          child: Footer(),
        );
      },
    );
  }
}
