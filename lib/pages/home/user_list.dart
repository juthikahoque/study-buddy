import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/models/user_model.dart';
import 'package:study_buddy/pages/home/user_tile.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<AllUsers>>(context);

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserTile(user: users[index]);
      },
    );
  }
}
