import 'package:flutter/material.dart';
import 'package:study_buddy/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> courses = [
    'MATH 135',
    'MATH 136',
    'MATH 137',
  ];
  final List<String> programs = [
    'Computer Science',
    'Math',
    'AFM',
    'Arbus',
    'Scibus',
  ];

  // form values
  String _currentName;
  String _currentProgram;
  String _currentCourse1;
  String _currentCourse2;
  String _currentCourse3;
  String _currentCourse4;
  String _currentCourse5;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget> [
          SizedBox(height: 20.0),
          Text(
            'Update your profile',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          // dropdown
          DropdownButtonFormField(
            value: _currentProgram ?? 'Computer Science',
            items: programs.map((program) {
              return DropdownMenuItem(
                value: program,
                child: Text('$program'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentProgram = val),
          ),
          // slider
          RaisedButton(
            color: Colors.cyan[400],
            child: Text('Update', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              print(_currentName);
              print(_currentProgram);
              print(_currentCourse1);
              print(_currentCourse2);
              print(_currentCourse3);
              print(_currentCourse4);
              print(_currentCourse5);
            }
          )
        ],
      )
    );
  }
}
