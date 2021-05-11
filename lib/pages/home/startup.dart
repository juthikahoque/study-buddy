import 'package:flutter/material.dart';
import 'package:study_buddy/pages/authenticate/signup.dart';

import '../wrapper.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Center(
            child: Image(
              image: AssetImage('images/studybuddy.png'),
            ),
          ),
          Text(
            'study buddy',
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.cyan[700],
              //fontFamily: 'Sacramento',
            ),
          ),
          SizedBox(height: 8.0),
          SizedBox(
            height: 50.0,
            width: 200.0,
            child: RaisedButton(
              child: Text(
                'LOG IN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                )
              ),
              color: Colors.cyan[700],
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Wrapper()));
              }),
          ),
          SizedBox(
            height: 50.0,
            width: 200.0,
            child: TextButton(
                child: Text(
                    'Sign up here!',
                    style: TextStyle(
                      color: Colors.cyan[700],
                      fontSize: 22.0,
                    )
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Wrapper(showSignUp: true)));
                }),
          ),
        ],
      ),
    );
  }
}
