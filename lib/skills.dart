import 'package:flutter/material.dart';
import 'skill_model.dart';
import 'skill.dart';
import 'navigation.dart';
import 'centered_view.dart';

class SkillsPage extends StatelessWidget {
  final List<SkillModel> _skilllist = [
    SkillModel(1, "Anthony", "images/bootstrap.png"),
    SkillModel(2, "Lea Agustine", "images/python.png"),
    SkillModel(3, "Mickey", "images/django.png"),
    SkillModel(4, "Donald Newman", "images/django.png"),
    SkillModel(5, "Pedro Andrado", "images/postgresql.png"),
    SkillModel(6, "Tony Stark", "images/vue.png"),
    SkillModel(7, "Diana Levato", "images/kubernetes.png"),
    SkillModel(8, "Lively Claudia", "images/react.png"),
    SkillModel(9, "Solid Snake", "images/scrapy.png"),
    SkillModel(10, "Superman", "images/rest.png"),
    SkillModel(11, "Anthony", "images/sentry.png"),
    SkillModel(12, "Lea Agustine", "images/heroku.png"),
    SkillModel(13, "Mickey", "images/docker.png"),
    SkillModel(14, "Donald Newman", "images/flask.png"),
    SkillModel(15, "Pedro Andrado", "images/elk.png"),
  ];

  /// Main Widget Build
  @override
  Widget build(BuildContext context) {
    return Grid(_skilllist);
    //return Skills(_skilllist);
  }
}

class Skills extends StatelessWidget {
  final List<SkillModel> _skilllist;

  Skills(this._skilllist,);

  @override
  Widget build(BuildContext context) {

    var largeScreen = MediaQuery
        .of(context)
        .size
        .width > 600;
    var backend = GridView.count(
      shrinkWrap: true,
      crossAxisCount: largeScreen ? 5 : 3,
      children: _skilllist.getRange(0, 5).map((skill) => Skill(skill)).toList(),
    );
    var mobile = GridView.count(
      shrinkWrap: true,
      crossAxisCount: largeScreen ? 5 : 3,
      children: _skilllist
          .getRange(5, 9)
          .map((skill) =>
          Image.asset(
            skill.avatar,
            height: 25,
          ))
          .toList(),
    );
    var devops = GridView.count(
      shrinkWrap: true,
      crossAxisCount: largeScreen ? 5 : 3,
      children:
      _skilllist.getRange(10, 14).map((skill) => Skill(skill)).toList(),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: CenteredView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  NavigationBar(),
                  Expanded(
                    child: Row(children: <Widget>
                    [
                     backend, mobile, devops
                    ]),),
                ]
            )
        )
    );
  }
}

class Grid extends StatelessWidget {
  final List<SkillModel> _skilllist;

  Grid(this._skilllist,);

  @override
  Widget build(BuildContext context) {
    var largeScreen = MediaQuery
        .of(context)
        .size
        .width > 600;
    var backend = GridView.count(
      shrinkWrap: true,
      crossAxisCount: largeScreen ? 5 : 3,
      children: _skilllist.getRange(0, 5).map((skill) => Skill(skill)).toList(),
    );
    var mobile = GridView.count(
      shrinkWrap: true,
      crossAxisCount: largeScreen ? 5 : 3,
      children: _skilllist
          .getRange(5, 9)
          .map((skill) =>
          Image.asset(
            skill.avatar,
            height: 25,
          ))
          .toList(),
    );
    var devops = GridView.count(
      shrinkWrap: true,
      crossAxisCount: largeScreen ? 5 : 3,
      children:
      _skilllist.getRange(10, 14).map((skill) => Skill(skill)).toList(),
    );

    final List<String> types = <String>['Mobile', 'Backend', 'Devops'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            NavigationBar(),
            Expanded(
              child: Row(children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child:
                    Row(children: <Widget>[
                      Expanded(child: Divider()),
                      Text(
                        "MOBILE",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 50,
                            height: 0.9),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(child: Divider()),
                    ])),
                Expanded(child: mobile),
                Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child:
                    Row(children: <Widget>[
                      Expanded(child: Divider()),
                      Text(
                        "BACKEND",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 50,
                            height: 0.9),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(child: Divider()),
                    ])),
                Expanded(child: backend),
                Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Text(
                    "FRONTEND",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 50,
                        height: 0.9),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(child: Divider()),
                ]),
                Expanded(child: devops),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
