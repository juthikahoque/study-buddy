import 'package:flutter/material.dart';
import 'package:study_buddy/pages/home/home.dart';
import 'package:study_buddy/pages/wrapper.dart';
import 'package:study_buddy/services/auth.dart';
import 'package:study_buddy/shared/constants.dart';
import 'package:study_buddy/shared/loading.dart';

class Login extends StatefulWidget {

  final Function toggleView;
  Login({ this.toggleView });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
            color: Colors.cyan[700]
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Image(
                  image: AssetImage('images/studybuddy.png')
                ),
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Text(
                  'sign in',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.cyan[700],
                  )
                ),
              ),
              SizedBox(height: 20.0),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                    setState(() => email = val);
                  },
                  decoration: textInputDecoration.copyWith(hintText:'Email')
                ),
              ),
              SizedBox(height: 20.0),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: TextFormField(
                  obscureText: true,
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    onChanged: (val) {
                    setState(() => password = val);
                  },
                  decoration: textInputDecoration.copyWith(hintText:'Password')
                ),
              ),
              SizedBox(height: 20.0),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: RaisedButton(
                  color: Colors.cyan[700],
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      print('valid');
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null) {
                        setState(() => {
                          error = 'could not sign in with these credentials',
                          loading = false
                        });
                      }
                      print(email);
                      print(password);
                    }
                  }
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                  )
              )
            ]
          )
        )
      ),
    );
  }
}
