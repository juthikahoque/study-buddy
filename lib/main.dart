import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/pages/home/startup.dart';
import 'package:study_buddy/pages/home/home.dart';
import 'package:study_buddy/pages/authenticate/signup.dart';
import 'package:study_buddy/pages/authenticate/login.dart';
import 'package:study_buddy/pages/wrapper.dart';
import 'package:study_buddy/services/auth.dart';
import 'package:study_buddy/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Firebase Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('firebase')
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: () => FirebaseFirestore.instance
    //                 .collection('testing')
    //                 .add({'timestamp': Timestamp.fromDate(DateTime.now())}),
    //       child: Icon(Icons.add)
    //     ),
    //     body: StreamBuilder(
    //       stream: FirebaseFirestore.instance.collection('users').snapshots(),
    //       builder: (context, snapshot) {
    //         if(!snapshot.hasData) return const SizedBox.shrink();
    //         return ListView.builder(
    //           itemCount: snapshot.data.docs.length,
    //           itemBuilder: (context, idx) {
    //             final docData = snapshot.data.docs[idx].data();
    //             final dateTime = (docData['timestamp'] as Timestamp).toDate();
    //             return ListTile(
    //               title:Text(dateTime.toString())
    //             );
    //           },
    //         );
    //       }
    //     ),
    //   )
    // );
    return StreamProvider<CurrentUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: StartUp(),
          // initialRoute: '/wrapper',
          // routes: {
          //   '/wrapper': (context) => Wrapper(),
          //   '/startup': (context) => StartUp(),
          //   '/home': (context) => Home(),
          //   '/login': (context) => Login(),
          //   '/signup': (context) => SignUp(),
          // }
      ),
      initialData: CurrentUser()
    );
  }
}
