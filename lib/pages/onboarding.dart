//import 'package:flutter/material.dart';
//import 'package:responsive_builder/responsive_builder.dart';
//import 'home.dart';
//import '../ui/navigation.dart';
//import '../ui/layout.dart';
//import '../ui/composants.dart';
//import 'package:flutter/scheduler.dart';
//
//class AnimationsPlayground extends StatelessWidget {
//  static Route<dynamic> route() {
//    return PageRouteBuilder(
//      transitionDuration: const Duration(seconds: 2),
//      pageBuilder: (BuildContext context, Animation<double> animation,
//          Animation<double> secondaryAnimation) {
//        return AnimationsPlayground();
//      },
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return PageLayout(
//      contentHeight: 500,
//      content: ScreenTypeLayout(
//        desktop: DesktopAnimatedApp(),
//        tablet: MobileAnimatedApp(),
//        mobile: MobileAnimatedApp(),
//      ),
//      //footer: AnimatedFooter(),
//    );
//  }
//}
//
//class DesktopAnimatedApp extends StatefulWidget {
//  @override
//  _DesktopAnimatedAppState createState() => _DesktopAnimatedAppState();
//}
//
//class _DesktopAnimatedAppState extends State<DesktopAnimatedApp>
//    with SingleTickerProviderStateMixin {
//  AnimationController _controller;
//  Animation<Offset> imageTranslation;
//  Animation<Offset> textTranslation;
//  Animation<Offset> navbarTranslation;
//  Animation<Offset> footerTranslation;
//  Animation<double> imageOpacity;
//  Animation<double> textOpacity;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = AnimationController(
//      duration: const Duration(milliseconds: 1000),
//      vsync: this,
//    );
//    imageTranslation = Tween(
//      begin: Offset(-0.5, 0.0),
//      end: Offset(0.0, 0.0),
//    ).animate(
//      CurvedAnimation(
//        parent: _controller,
//        curve: Interval(0.6, 1, curve: Curves.fastOutSlowIn),
//      ),
//    );
//    imageOpacity = Tween(begin: 0.0, end: 1.0).animate(
//      CurvedAnimation(
//        parent: _controller,
//        curve: Interval(0.0, 0.4, curve: Curves.easeIn),
//      ),
//    );
//    textTranslation = Tween(
//      begin: Offset(0.0, 1.0),
//      end: Offset(0.0, 0.0),
//    ).animate(
//      CurvedAnimation(
//        parent: _controller,
//        curve: Interval(0.54, 1.0, curve: Curves.ease),
//      ),
//    );
//    textOpacity = Tween(begin: 0.0, end: 1.0).animate(
//      CurvedAnimation(
//        parent: _controller,
//        curve: Interval(0.54, 1.0, curve: Curves.linear),
//      ),
//    );
//    navbarTranslation = Tween(
//      begin: Offset(0.0, -5.0),
//      end: Offset(0.0, 0.0),
//    ).animate(
//      CurvedAnimation(
//        parent: _controller,
//        curve: Interval(0.8, 1.0, curve: Curves.easeIn),
//      ),
//    );
//    if (SchedulerBinding.instance.schedulerPhase ==
//        SchedulerPhase.persistentCallbacks) {
//      SchedulerBinding.instance.addPostFrameCallback((_) =>
//          Future.delayed(Duration(milliseconds: 500))
//              .then((onValue) => _controller.forward()));
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//      animation: _controller,
//      builder: (BuildContext context, Widget child) {
//        return Row(
//          children: [
//            FractionalTranslation(
//              translation: textTranslation.value,
//              child: FadeTransition(
//                opacity: textOpacity,
//                child: Headline1Section(),
//              ),
//            ),
//            Expanded(
//              child: FractionalTranslation(
//                translation: imageTranslation.value,
//                child: FadeTransition(
//                  opacity: imageOpacity,
//                  child: ImageDetails(),
//                ),
//              ),
//            ),
//          ],
//        );
//      },
//    );
//  }
//}
//
//class MobileAnimatedApp extends StatefulWidget {
//  @override
//  _MobileAnimatedAppState createState() => _MobileAnimatedAppState();
//}
//
//class _MobileAnimatedAppState extends State<MobileAnimatedApp>
//    with SingleTickerProviderStateMixin {
//  AnimationController controller;
//  Animation<Offset> imageTranslation;
//  Animation<Offset> textTranslation;
//  Animation<Offset> navbarTranslation;
//  Animation<Offset> footerTranslation;
//  Animation<double> imageOpacity;
//  Animation<double> textOpacity;
//
//  @override
//  void initState() {
//    super.initState();
//    controller = AnimationController(
//      duration: const Duration(seconds: 1),
//      vsync: this,
//    )..forward();
//    textTranslation = Tween(
//      begin: Offset(0.0, 1.0),
//      end: Offset(0.0, 0.0),
//    ).animate(
//      CurvedAnimation(
//        parent: controller,
//        curve: Interval(0, 0.4, curve: Curves.ease),
//      ),
//    );
//    textOpacity = Tween(begin: 0.0, end: 1.0).animate(
//      CurvedAnimation(
//        parent: controller,
//        curve: Interval(0.1, 0.5, curve: Curves.linear),
//      ),
//    );
//    navbarTranslation = Tween(
//      begin: Offset(0.0, -1.0),
//      end: Offset(0.0, 0.0),
//    ).animate(
//      CurvedAnimation(
//        parent: controller,
//        curve: Interval(0.4, 0.7, curve: Curves.easeIn),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//      animation: controller,
//      builder: (BuildContext context, Widget child) {
//        return Row(
//          children: [
//            Expanded(
//              child: FractionalTranslation(
//                translation: textTranslation.value,
//                child: FadeTransition(
//                  opacity: textOpacity,
//                  child: Headline1Section(),
//                ),
//              ),
//            ),
//          ],
//        );
//        ;
//      },
//    );
//  }
//}
//
//class AnimatedNavbar extends StatefulWidget {
//  @override
//  AnimatedNavbarState createState() => AnimatedNavbarState();
//}
//
//class AnimatedNavbarState extends State<AnimatedNavbar>
//    with SingleTickerProviderStateMixin {
//  AnimationController controller;
//  Animation<Offset> navbarTranslation;
//
//  @override
//  void initState() {
//    super.initState();
//    controller = AnimationController(
//      duration: const Duration(seconds: 3),
//      vsync: this,
//    )..forward();
//    navbarTranslation = Tween(
//      begin: Offset(0.0, -5.0),
//      end: Offset(0.0, 0.0),
//    ).animate(
//      CurvedAnimation(
//        parent: controller,
//        curve: Interval(0.8, 1.0, curve: Curves.easeIn),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//      animation: controller,
//      builder: (BuildContext context, Widget child) {
//        return FractionalTranslation(
//          translation: navbarTranslation.value,
//          child: NavigationBar(),
//        );
//      },
//    );
//  }
//}
