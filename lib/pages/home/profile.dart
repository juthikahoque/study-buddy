import 'package:flutter/material.dart';
import 'package:study_buddy/pages/home/settings.dart';
import 'package:study_buddy/services/auth.dart';
import 'package:study_buddy/services/database.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/models/user_model.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm()
        );
      });
    }
    return StreamProvider<List<AllUsers>>.value(
      value: DatabaseService().users,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget> [
            FlatButton.icon(
                textColor: Colors.cyan[700],
                icon: Icon(Icons.logout),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                }
            ),
            FlatButton.icon(
                textColor: Colors.cyan[700],
                icon: Icon(Icons.settings),
                label: Text('settings'),
                onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm()
        )
      ),
    );
  }
}
