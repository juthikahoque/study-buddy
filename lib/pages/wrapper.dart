import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/models/user.dart';
import 'package:study_buddy/pages/authenticate/authenticate.dart';
import 'package:study_buddy/pages/home/home.dart';

class Wrapper extends StatelessWidget {

  final bool showSignUp;
  Wrapper({ this.showSignUp });

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    if(user == null) {
      return Authenticate(showSignUp: showSignUp);
    } else {
      return Home();
    }
  }
}
