import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController _controllerEmailAddress = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 17.0, right: 17.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://static.vecteezy.com/system/resources/previews/000/357/279/non_2x/vector-notes-icon.jpg",
              width: 150.0,
            ),
            SizedBox(height: 60),
            TextFormField(
              controller: _controllerEmailAddress,
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Please Type a Valid E-mail Addres";
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("SignUpPage");
                  },
                  child: Text(
                    "Create a New Account",
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgotten Password!",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  var response = await LogInPage();
                  if (response != null) {
                    Navigator.of(context).pushReplacementNamed("HomePage");
                  } else {
                    print("Sign Up Faild");
                  }
                },
                child: Text("Log In"),
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
    );
  }
}
