import 'package:flutter/material.dart';
import 'package:website/ui/layout.dart';
import 'dart:html';
import 'package:flutter/scheduler.dart';
import '../ui/buttons.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      contentHeight: 600,
      content: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 320,
              width: 240,
              child: Image.asset('images/contact.png'),
            ),
          ),
          ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  ContactFormState createState() {
    return ContactFormState();
  }
}

class ContactFormState extends State<ContactForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  AnimationController _controller;
  List<Animation<Offset>> fieldTranslations;
  List<Animation<double>> fieldOpacities;
  Animation<Offset> buttonTranslation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    fieldTranslations = [];
    fieldOpacities = [];

    for (var i = 1; i < 5; i++) {
      fieldTranslations.add(
        Tween(
          begin: Offset(1.0, 0),
          end: Offset(0.0, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.1 * (i), 0.20 * (i), curve: Curves.easeInCirc),
          ),
        ),
      );
      fieldOpacities.add(
        Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.1 * (i), 0.2 * (i), curve: Curves.easeIn),
          ),
        ),
      );
    }

    buttonTranslation = Tween(
      begin: Offset(0.5, 0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.7, 1, curve: Curves.bounceOut),
      ),
    );

    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) =>
          Future.delayed(Duration(milliseconds: 500))
              .then((onValue) => _controller.forward()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SlideTransition(
                position: fieldTranslations[0],
                child: FadeTransition(
                  opacity: fieldOpacities[0],
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: const InputDecoration(
                      hintText: 'Quel est votre nom ?',
                      labelText: "Nom",
                      labelStyle: TextStyle(fontSize: 21, height: 1.7),
                      hintStyle: TextStyle(fontSize: 21, height: 1.7),
                      errorStyle: TextStyle(fontSize: 21),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez renseigner ce champ';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SlideTransition(
                position: fieldTranslations[1],
                child: FadeTransition(
                  opacity: fieldOpacities[1],
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: const InputDecoration(
                      labelText: 'Prénom ( optionnel )',
                      labelStyle: TextStyle(fontSize: 21, height: 1.7),
                      hintText: 'Quel est votre prénom ?',
                      hintStyle: TextStyle(fontSize: 21, height: 1.7),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SlideTransition(
                position: fieldTranslations[2],
                child: FadeTransition(
                  opacity: fieldOpacities[2],
                  child: TextFormField(
                    minLines: 4,
                    maxLines: null,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: const InputDecoration(
                      hintText: 'Que voulez vous me dire ?',
                      labelText: "Message",
                      labelStyle: TextStyle(fontSize: 21, height: 1.7),
                      hintStyle: TextStyle(fontSize: 21, height: 1.7),
                      errorStyle: TextStyle(fontSize: 21),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez renseigner ce champ';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SlideTransition(
                position: buttonTranslation,
                child: FadeTransition(
                  opacity: fieldOpacities[3],
                  child: Center(
                    child: FilledButton(
                      title: 'Envoyer',
                      color: Theme.of(context).accentColor,
                      small: false,
                      action: () {
                        // Validate returns true if the form is valid, or false
                        // otherwise.
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a Snackbar.
                          // TODO send me an email
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Votre message a bien été envoyé'),
                              backgroundColor: Theme.of(context).accentColor,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 380,
        width: 280,
        child: Image.asset('images/contact.png'),
      ),
    );
  }
}
