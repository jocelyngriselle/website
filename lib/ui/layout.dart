import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'navigation.dart';
import 'theme.dart';
import 'dart:math';

class Layout extends StatelessWidget {
  final Widget content;
  final Widget navbar;
  final double contentHeight;
  const Layout({
    Key key,
    this.content,
    this.contentHeight,
    this.navbar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? NavigationDrawer()
              : null,
          backgroundColor: Colors.white,
          body: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
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
                          Container(
                            // A fixed-height child.
                            height: navBarHeight,
                            child: navbar,
                          ),
                          Expanded(
                            child: Container(
                              height: max(contentHeight,
                                  viewportConstraints.maxHeight - navBarHeight),
                              //color: Colors.orange,
                              child: content,
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

class Page extends StatelessWidget {
  final Widget content;
  final double contentHeight;
  const Page({Key key, this.content, this.contentHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      navbar: NavigationBar(),
      content: content,
      contentHeight: contentHeight,
    );
  }
}
