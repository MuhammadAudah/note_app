import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseexample/home_page.dart';
import 'package:firebaseexample/log_in_page.dart';
import 'package:firebaseexample/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "XXX",
        appId: "1:114610193704:android:e1e9f2ba36d8d1b1b93c1d",
        messagingSenderId: "",
        projectId: "note-app-e7557"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInPage(),
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        "LogInPage": (context) => LogInPage(),
        "SignUpPage": (context) => SignUpPage(),
        "HomePage": (context) => HomePage(),
      },
    );
  }
}
