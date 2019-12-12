import 'package:flutter/material.dart';
import 'navigation.dart';
import 'centered_view.dart';
import 'footer.dart';

class ContactPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: <Widget>[
            NavigationBar(),
            Expanded(
              child:
                ContactForm(),
            )
          ],
        ),
      ),
        bottomNavigationBar: Footer(),
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
      width: 600,
      child: Center(child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              style:  TextStyle(fontSize: 21, height: 1.7),
              decoration: const InputDecoration(
                hintText: 'Comment vous appelez vous?',
                labelText: "Nom",
                labelStyle : TextStyle(fontSize: 21, height: 1.7),
                hintStyle : TextStyle(fontSize: 21, height: 1.7),
                errorStyle : TextStyle(fontSize: 21),
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
              style:  TextStyle(fontSize: 21, height: 1.7),
              decoration: const InputDecoration(
                labelText: 'Prénom ( optionnel )',
                  labelStyle : TextStyle(fontSize: 21, height: 1.7),
                hintText: 'Comment vous appelez vous?',
                hintStyle : TextStyle(fontSize: 21, height: 1.7),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              minLines: 4,
              maxLines: null,
              style:  TextStyle(fontSize: 21, height: 1.7),
              decoration: const InputDecoration(
                hintText: 'Comment vous appelez vous?',
                labelText: "Message",
                labelStyle : TextStyle(fontSize: 21, height: 1.7),
                hintStyle : TextStyle(fontSize: 21, height: 1.7),
                errorStyle : TextStyle(fontSize: 21),
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
            Center(child:
            InkWell(
              onTap: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(
                    content: Text('Votre message a bien été envoyé'),
                    backgroundColor: Color.fromARGB(255, 31, 229, 146),),);
                }
              },
              child:
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 60, vertical: 15),
                child: Text(
                  "Envoyer",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 229, 146),
                  borderRadius: BorderRadius.circular(5)),
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