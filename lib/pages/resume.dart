import 'package:flutter/material.dart';

class ResumePage extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<ResumePage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          SizedBox(
            width: 800,
            child: Container(
              color: Colors.green,
              child: Stepper(
                steps: [
                  Step(
                    title: Text("Novembre 2018 - Maintenant"),
                    content: Text("Freelance Web Developer"),
                  ),
                  Step(
                    title: Text("Mars 2028 - Novembre 2018"),
                    content: Text("Web Developer"),
                  ),
                  Step(
                    title: Text("Third"),
                    content: Text("This is our third example."),
                  ),
                  Step(
                    title: Text("Forth"),
                    content: Text("This is our forth example."),
                  ),
                ],
                currentStep: _index,
                onStepTapped: (index) {
                  setState(() {
                    _index = index;
                  });
                },
                controlsBuilder: (BuildContext context,
                        {VoidCallback onStepContinue,
                        VoidCallback onStepCancel}) =>
                    Container(),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
