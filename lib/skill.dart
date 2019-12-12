import "package:flutter/material.dart";
import "skill_model.dart";
import "skill_detail.dart";


class Skill extends StatelessWidget {
  final SkillModel _skill;

  Skill(this._skill);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => SkillDetail(_skill))),
      child: Container(
        /// Give nice padding
        padding: EdgeInsets.all(10),
        child:
            /// This is the important part, we need [Hero] widget with unique tag for this item.
            Hero(
              tag: "avatar_" + _skill.id.toString(),
              child:  Image.asset(_skill.avatar, height: 20,),
            ),
        ),
    );
  }
}