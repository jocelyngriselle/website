import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../ui/layout.dart';
import '../ui/composants.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      contentHeight: 500,
      content: ScreenTypeLayout(
        desktop: DesktopAnimatedHome(),
        tablet: HomeContentMobile(),
        mobile: HomeContentMobile(),
      ),
    );
  }
}

class DesktopAnimatedHome extends StatefulWidget {
  @override
  _DesktopAnimatedHomeState createState() => _DesktopAnimatedHomeState();
}

class _DesktopAnimatedHomeState extends State<DesktopAnimatedHome>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> imageTranslation;
  Animation<Offset> textTranslation;
  Animation<Offset> navbarTranslation;
  Animation<Offset> footerTranslation;
  Animation<double> imageOpacity;
  Animation<double> textOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );
    imageTranslation = Tween(
      begin: Offset(-0.5, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    imageOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );
    textTranslation = Tween(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.54, 1.0, curve: Curves.ease),
      ),
    );
    textOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.54, 1.0, curve: Curves.linear),
      ),
    );
    navbarTranslation = Tween(
      begin: Offset(0.0, -5.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.8, 1.0, curve: Curves.easeIn),
      ),
    );
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) =>
          Future.delayed(Duration(milliseconds: 0))
              .then((onValue) => _controller.forward()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
//        SlideTransition(
//          position: textTranslation,
//          child: FadeTransition(
//            opacity: textOpacity,
//            child: Headline1Section(),
//          ),
//        ),
        Headline1Section(),
        Expanded(
          child: SlideTransition(
            position: imageTranslation,
            child: FadeTransition(
              opacity: imageOpacity,
              child: ImageDetails(),
            ),
          ),
        )
      ],
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
