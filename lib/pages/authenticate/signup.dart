import 'package:flutter/material.dart';
import 'package:study_buddy/services/auth.dart';
import 'package:study_buddy/shared/constants.dart';
import 'package:study_buddy/shared/loading.dart';

class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({ this.toggleView });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
                        'sign up',
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
                      decoration: textInputDecoration.copyWith(hintText:'Email'),
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
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                          if(result == null) {
                            setState(() => {
                              error = 'please supply a valid email',
                              loading = false,
                            });
                          }
                          print(email);
                          print(password);
                        }
                      }
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(height: 12.0)
                  ),
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
