import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../ui/layout.dart';

const blue = Color.fromRGBO(19, 137, 253, 1);

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      contentHeight: 800,
      content: ScreenTypeLayout(
        desktop: IntroAnimatedApp(),
        tablet: IntroAnimatedApp(),
        mobile: IntroAnimatedApp(),
      ),
    );
  }
}

class BackgroundLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(70.0, 110.0, 0, 110.0),
      child: Image.asset(
        'images/flutter_slide_1-bg.jpg',
        //fit: BoxFit.fitHeight,
      ),
    );
  }
}

class PhoneLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'images/flutter_phone.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class Layer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 0.0),
      child: Image.asset(
        'images/flutter_slide_1-layer_1.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class Layer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 70.0),
      child: Image.asset(
        'images/flutter_slide_1-layer_2.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class TextLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Lancez ",
          style: Theme.of(context).textTheme.headline1.copyWith(
                color: blue,
                fontSize: 78,
              ),
          children: <TextSpan>[
            TextSpan(
              text: 'votre ',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Colors.white,
                    backgroundColor: Colors.transparent,
                    fontSize: 78,
                  ),
            ),
            TextSpan(
              text: 'produit ', //' backend & mobile ',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: blue,
                    fontSize: 78,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class IntroAnimatedApp extends StatefulWidget {
  @override
  _IntroAnimatedAppState createState() => _IntroAnimatedAppState();
}

class _IntroAnimatedAppState extends State<IntroAnimatedApp>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<Offset> backgroundTranslation;
  Animation<double> backgroundOpacity;

  Animation<Offset> phoneTranslation;
  Animation<double> phoneOpacity;

  Animation<Offset> layer1Translation;
  Animation<double> layer1Opacity;

  Animation<Offset> layer2Translation;
  Animation<double> layer2Opacity;

  Animation<Offset> textTranslation;
  Animation<double> textOpacity;

  @override
  void initState() {
    // this shouldnt go here
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    phoneTranslation = Tween(
      begin: Offset(-0.5, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.3, curve: Curves.fastOutSlowIn),
      ),
    );
    phoneOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );
    backgroundTranslation = Tween(
      begin: Offset(-0.5, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 0.5, curve: Curves.fastOutSlowIn),
      ),
    );
    backgroundOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 0.5, curve: Curves.easeIn),
      ),
    );
    layer1Translation = Tween(
      begin: Offset(-0.5, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.4, 0.8, curve: Curves.fastOutSlowIn),
      ),
    );
    layer1Opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.4, 0.8, curve: Curves.easeIn),
      ),
    );
    layer2Translation = Tween(
      begin: Offset(-0.5, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.9, curve: Curves.fastOutSlowIn),
      ),
    );
    layer2Opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.9, curve: Curves.easeIn),
      ),
    );
    textTranslation = Tween(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.9, curve: Curves.ease),
      ),
    );
    textOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.9, curve: Curves.linear),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        var screenSize = MediaQuery.of(context).size;
        return AspectRatio(
          aspectRatio: 16 / 9,
          //padding: EdgeInsets.all(100),
          //color: Colors.green,
//            constraints: BoxConstraints(
//                maxHeight: screenSize.height, maxWidth: screenSize.width),
          //color: Colors.amberAccent,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                child: SlideTransition(
                  position: backgroundTranslation,
                  child: FadeTransition(
                    opacity: backgroundOpacity,
                    child: BackgroundLayer(),
                  ),
                ),
              ),
              Align(
                child: SlideTransition(
                  position: phoneTranslation,
                  child: FadeTransition(
                    opacity: phoneOpacity,
                    child: PhoneLayer(),
                  ),
                ),
              ),
              Align(
                child: SlideTransition(
                  position: layer1Translation,
                  child: FadeTransition(
                    opacity: layer1Opacity,
                    child: Layer1(),
                  ),
                ),
              ),
              Align(
                child: SlideTransition(
                  position: layer2Translation,
                  child: FadeTransition(
                    opacity: layer2Opacity,
                    child: Layer2(),
                  ),
                ),
              ),
              Align(
                child: SlideTransition(
                  position: textTranslation,
                  child: FadeTransition(
                    opacity: textOpacity,
                    child: TextLayer(),
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
