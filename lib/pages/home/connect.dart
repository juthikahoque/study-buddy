import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/models/user_model.dart';
import 'package:study_buddy/pages/home/user_list.dart';
import 'package:study_buddy/pages/home/user_tile.dart';
import 'package:study_buddy/services/database.dart';

class Connect extends StatefulWidget {

  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<AllUsers>>.value(
      value: DatabaseService().users,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(''
            'Other Study Buddies',
            style: TextStyle(
              color: Colors.cyan[700],
            )
          ),
          centerTitle: true
        ),
        body: UserList()
      ),
    );
  }
}
