import 'package:flutter/material.dart';
import 'package:study_buddy/pages/authenticate/login.dart';
import 'package:study_buddy/pages/authenticate/signup.dart';

class Authenticate extends StatefulWidget {

  final bool showSignUp;
  Authenticate ({ Key key, this.showSignUp = false }) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void showSignUpScreen() {
    if(widget.showSignUp == true) {
      setState(() => showSignIn = false);
    }
  }
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    showSignUpScreen();
    if(showSignIn) {
      return Login(toggleView: toggleView);
    } else {
      return SignUp(toggleView: toggleView);
    }
  }
}
