import 'package:flutter/material.dart';
import 'package:website/ui/layout.dart';
import 'dart:html';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      contentHeight: 600,
      content: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 380,
              width: 280,
              child: Image.asset('images/contact.png'),
            ),
          ),
          ContactForm(),
        ],
      ),
    );
  }
}

// Create a Form widget.
class ContactForm extends StatefulWidget {
  @override
  ContactFormState createState() {
    return ContactFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class ContactFormState extends State<ContactForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      //color: Colors.blue,
      width: 700,
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
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
              SizedBox(
                height: 30,
              ),
              TextFormField(
                style: Theme.of(context).textTheme.bodyText1,
                decoration: const InputDecoration(
                  labelText: 'Prénom ( optionnel )',
                  labelStyle: TextStyle(fontSize: 21, height: 1.7),
                  hintText: 'Quel est votre prénom ?',
                  hintStyle: TextStyle(fontSize: 21, height: 1.7),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
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
              SizedBox(
                height: 30,
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
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
                  color: Theme.of(context).accentColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 15),
                    child: Text(
                      "Envoyer",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white),
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
