import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _controllerEmailAddress = TextEditingController();
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  var EmailAddress, Username, Password;

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  SignUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: EmailAddress, password: Password);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'Weak Password') {
          print("The Password provided is too weak");
        } else if (e.code == 'E-mail is already in use') {
          print("The Account already exists for that E-mail");
        }
      } catch (e) {
        print(e);
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creating a New Account"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 17.0, right: 17.0),
        child: Form(
          key: formstate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onSaved: (text) {
                  EmailAddress = text;
                },
                controller: _controllerEmailAddress,
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Please Type a Correct E-mail Address";
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                  hintText: "E-mail Address",
                  fillColor: Color.fromARGB(255, 216, 237, 255),
                ),
              ),
              SizedBox(height: 18),
              TextFormField(
                onSaved: (text) {
                  Username = text;
                },
                controller: _controllerUsername,
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Please Type a Correct Username";
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  hintText: "Username",
                  fillColor: Color.fromARGB(255, 216, 237, 255),
                ),
              ),
              SizedBox(height: 18),
              TextFormField(
                onSaved: (text) {
                  Password = text;
                },
                controller: _controllerPassword,
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Please Type a Suitable Password";
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.password_outlined,
                  ),
                  hintText: "Password",
                  fillColor: Color.fromARGB(255, 216, 237, 255),
                ),
              ),
              SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    UserCredential response = await SignUp();
                    if (response != null) {
                      Navigator.of(context).pushReplacementNamed("HomePage");
                    } else {
                      print("Sign Up Faild");
                    }
                  },
                  child: Text("Sign Up Now!"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33),
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
