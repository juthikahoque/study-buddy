import 'package:flutter/material.dart';
import 'package:study_buddy/models/user_model.dart';

class UserTile extends StatelessWidget {

  final AllUsers user;
  UserTile({ this.user });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.cyan[700],
          ),
          title: Text(user.name),
          subtitle: Text('In ${user.program}'),
        )
      )
    );
  }
}
