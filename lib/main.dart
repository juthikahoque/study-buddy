import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/pages/home/startup.dart';
import 'package:study_buddy/pages/home/home.dart';
import 'package:study_buddy/pages/authenticate/signup.dart';
import 'package:study_buddy/pages/authenticate/login.dart';
import 'package:study_buddy/pages/wrapper.dart';
import 'package:study_buddy/services/auth.dart';
import 'package:study_buddy/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: StartUp(),
          // initialRoute: '/wrapper',
          // routes: {
          //   '/wrapper': (context) => Wrapper(),
          //   '/startup': (context) => StartUp(),
          //   '/home': (context) => Home(),
          //   '/login': (context) => Login(),
          //   '/signup': (context) => SignUp(),
          // }
      ),
    );
  }
}
