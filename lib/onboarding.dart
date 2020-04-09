import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'home.dart';
import 'navigation.dart';
import 'layout.dart';
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
    return Layout(
      navbar: AnimatedNavbar(), // AnimatedNavbar
      content: ScreenTypeLayout(
          desktop: DesktopAnimatedApp(),
          tablet: MobileAnimatedApp(),
          mobile: MobileAnimatedApp()),
      footer: AnimatedFooter(),
    );
  }
}

class DesktopAnimatedApp extends StatefulWidget {
  @override
  _DesktopAnimatedAppState createState() => _DesktopAnimatedAppState();
}

class _DesktopAnimatedAppState extends State<DesktopAnimatedApp>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> imageTranslation;
  Animation<Offset> textTranslation;
  Animation<Offset> navbarTranslation;
  Animation<Offset> footerTranslation;
  Animation<double> imageOpacity;
  Animation<double> textOpacity;

  @override
  void initState() {
    // this shouldnt go here
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Row(
          children: [
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
          ],
        );
      },
    );
  }
}

class MobileAnimatedApp extends StatefulWidget {
  @override
  _MobileAnimatedAppState createState() => _MobileAnimatedAppState();
}

class _MobileAnimatedAppState extends State<MobileAnimatedApp>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> imageTranslation;
  Animation<Offset> textTranslation;
  Animation<Offset> navbarTranslation;
  Animation<Offset> footerTranslation;
  Animation<double> imageOpacity;
  Animation<double> textOpacity;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Layout(
          navbar: FractionalTranslation(
            translation: navbarTranslation.value,
            child: NavigationBar(),
          ),
          content: Expanded(
            child: FractionalTranslation(
              translation: textTranslation.value,
              child: FadeTransition(
                opacity: textOpacity,
                child: HomeContentMobile(),
              ),
            ),
          ),
          footer: AnimatedFooter(),
        );
      },
    );
  }
}

class AnimatedFooter extends StatefulWidget {
  @override
  AnimatedFooterState createState() => AnimatedFooterState();
}

class AnimatedFooterState extends State<AnimatedFooter>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> footerTranslation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
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

class AnimatedNavbar extends StatefulWidget {
  @override
  AnimatedNavbarState createState() => AnimatedNavbarState();
}

class AnimatedNavbarState extends State<AnimatedNavbar>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> navbarTranslation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return FractionalTranslation(
          translation: navbarTranslation.value,
          child: NavigationBar(),
        );
      },
    );
  }
}
