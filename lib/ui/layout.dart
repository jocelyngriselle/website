import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'navigation.dart';
import 'theme.dart';
import 'dart:math';
import 'package:flutter/scheduler.dart';

class Layout extends StatefulWidget {
  final Widget content;
  final double contentHeight;
  final Widget leading;
  final Widget title;
  final List<Widget> actions;

  const Layout({
    Key key,
    this.content,
    this.contentHeight,
    this.leading,
    this.title,
    this.actions,
  }) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> with SingleTickerProviderStateMixin {
  final double targetElevation = 3;
  double _elevation = 0;
  ScrollController _scrollController;

  AnimationController _controller;
  Animation<Offset> textTranslation;
  Animation<Offset> navbarTranslation;
  Animation<Offset> footerTranslation;
  Animation<double> textOpacity;
  Animation<double> imageOpacity;
  Animation<Offset> imageTranslation;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    imageTranslation = Tween(
      begin: Offset(0.0, 2.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.fastOutSlowIn),
      ),
    );
    imageOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.easeIn),
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
//    if (SchedulerBinding.instance.schedulerPhase ==
//        SchedulerPhase.persistentCallbacks) {
//      SchedulerBinding.instance.addPostFrameCallback((_) =>
//          Future.delayed(Duration(milliseconds: 100))
//              .then((onValue) => _controller.forward()));
//    }
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    _controller?.dispose();
  }

  void _scrollListener() {
    double newElevation = _scrollController.offset > 1 ? targetElevation : 0;
    if (_elevation != newElevation) {
      setState(() {
        _elevation = newElevation;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ;
    return Scrollbar(
      //isAlwaysShown: true,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          appBar: AppBar(
            leading: widget.leading,
            title: widget.title,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: false,
            elevation: _elevation,
            actions: widget.actions,
          ),
          drawer: sizingInformation.deviceScreenType != DeviceScreenType.Desktop
              ? NavigationDrawer()
              : null,
          backgroundColor: Theme.of(context).backgroundColor,
          body: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                controller: _scrollController,
                child: Center(
                  child: IntrinsicHeight(
                    //child: Expanded(
                    child: Container(
                      //color: Colors.green,
                      padding: const EdgeInsets.fromLTRB(
                          marginLeft / 2, 0.0, marginRight / 2, 0.0),
                      constraints: BoxConstraints(
                        maxWidth: maxWidth,
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      //color: Colors.red,
                      height: max(
                          widget.contentHeight, viewportConstraints.maxHeight),
                      //color: Colors.orange,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          SlideTransition(
                            position: imageTranslation,
                            child: FadeTransition(
                              opacity: imageOpacity,
                              child: Container(
                                //color: Colors.red,
                                child: Image.asset(
                                  'images/flutter_slide_2-layer_2bis.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: widget.content,
                            padding: const EdgeInsets.fromLTRB(
                                marginLeft / 2, 0.0, marginRight / 2, 0.0),
                          ),
                        ],
                      ),
                    ),
                    // ),
                  ),
                ),
                //),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PageLayout extends StatelessWidget {
  final Widget content;
  final double contentHeight;
  const PageLayout({Key key, this.content, this.contentHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      leading: NavBarLogo(),
      title: Socials(),
      actions: [
        ButtonBarItem(
          'Intro',
          key: UniqueKey(),
        ),
        ButtonBarItem(
          'Services',
          key: UniqueKey(),
        ),
        SizedBox(
          width: 10,
        ),
        ButtonBarItem(
          'Projets',
          key: UniqueKey(),
        ),
        SizedBox(
          width: 10,
        ),
        ButtonBarItem(
          'Contact',
          key: UniqueKey(),
        ),
      ],
      content: content,
      contentHeight: contentHeight,
    );
  }
}
