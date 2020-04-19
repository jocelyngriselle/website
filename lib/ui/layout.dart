import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'navigation.dart';
import 'theme.dart';
import 'dart:math';

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

class _LayoutState extends State<Layout> {
  final double targetElevation = 3;
  double _elevation = 0;
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.removeListener(_scrollListener);
    _controller?.dispose();
  }

  void _scrollListener() {
    double newElevation = _controller.offset > 1 ? targetElevation : 0;
    if (_elevation != newElevation) {
      setState(() {
        _elevation = newElevation;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                controller: _controller,
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: maxWidth,
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    padding: const EdgeInsets.fromLTRB(
                        marginLeft, 0.0, marginRight, 0.0),
                    alignment: Alignment.topCenter,
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: max(widget.contentHeight,
                                  viewportConstraints.maxHeight - navBarHeight),
                              //color: Colors.orange,
                              child: widget.content,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
