import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'navigation.dart';
import 'footer.dart';

class Layout extends StatelessWidget {
  final Widget content;
  final Widget footer;
  final Widget navbar;
  const Layout({Key key, this.content, this.navbar, this.footer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return Scrollbar(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? NavigationDrawer()
              : null,
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              Container(
                height: size.height,
                width: size.width,
                //color: Colors.blue,
                //padding: const EdgeInsets.symmetric(horizontal: 70.0),
                //alignment: Alignment.topCenter,
//          child: Expanded(
//            child: DecoratedBox(
//              position: DecorationPosition.background,
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage(
//                    "images/background.png",
//                  ),
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
//          ),
              ),
              Container(
                color: Colors.blue,
                height: size.height + 600,
                //padding: const EdgeInsets.symmetric(horizontal: 70.0),
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 1200),
                      child: navbar,
                    ),
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 1200),
                            child: content,
                          ),
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 1200),
                      child: footer,
                    ),
                  ],
                ),
              ),
            ],
          ),
          //bottomNavigationBar: Footer(),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final Widget content;
  const Page({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      content: content,
      footer: Footer(),
      navbar: NavigationBar(),
    );
  }
}
