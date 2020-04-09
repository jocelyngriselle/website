import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'navigation.dart';
import 'layout.dart';
import 'footer.dart';

class PortofolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Page(
      content: ScreenTypeLayout(
        desktop: ServicesContentDesktop(),
        tablet: ServicesContentMobile(),
        mobile: ServicesContentMobile(),
      ),
    );
  }
}

class ServicesContentMobile extends StatelessWidget {
  const ServicesContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Project(1, 'lala', 'images/mac.png', 'lala'),
      ],
    );
  }
}

class ServicesContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Project(1, 'lala', 'images/mac.png', 'lala'),
            ),
            Expanded(
              child: Project(2, 'lala', 'images/iphone.png', 'lala'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Project(3, 'lala', 'images/iphone.png', 'lala'),
            ),
            Expanded(
              child: Project(4, 'lala', 'images/mac.png', 'lala'),
            ),
          ],
        ),
      ],
    );
  }
}

class Project extends StatelessWidget {
  final String name;
  final String description;
  final int id;
  final String image;

  Project(this.id, this.name, this.image, this.description);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ProjectDetail(this.id, this.name, this.image, this.description),
        ),
      ),
      child: Container(
        /// Give nice padding
        padding: EdgeInsets.all(10),
        child:

            /// This is the important part, we need [Hero] widget with unique tag for this item.
            Hero(
          tag: "avatar_" + this.id.toString(),
          child: Image.asset(
            this.image,
            height: 280,
          ),
        ),
      ),
    );
  }
}

class ProjectDetail extends StatelessWidget {
  final String description;
  final int id;
  final String image;
  final String name;

  ProjectDetail(this.id, this.name, this.image, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Retour",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: //CenteredView(
          //child:
          Column(
        children: <Widget>[
          //NavigationBar(),
          Expanded(
            child: Hero(
              tag: "avatar_" + this.id.toString(),
              child: Image.asset(this.image),
            ),
          ),
          Text(
            this.name,
            style: TextStyle(fontSize: 22),
          ),
        ],
        // ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
