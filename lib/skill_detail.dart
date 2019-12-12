import "package:flutter/material.dart";
import "skill_model.dart";

class SkillDetail extends StatelessWidget {
  final SkillModel _skill;

  SkillDetail(this._skill);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_skill.name),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              /// This is the important part, we need [Hero] widget with unique tag but same as Hero's tag in [User] widget.
              child: Hero(
                tag: "avatar_" + _skill.id.toString(),
                child: Image.asset(_skill.avatar),
              ),
            ),
            Text(_skill.name,
              style: TextStyle(
                  fontSize: 22
              ),
            ),
          ],
        ),
      ),
    );
  }
}