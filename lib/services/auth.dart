import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_buddy/models/user.dart';

import 'package:study_buddy/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  CurrentUser _userFromFirebaseUser(User user) {
    return user != null ? CurrentUser(uid: user.uid) : null;
  }

  // listen for changes through auth change user streams
  Stream<CurrentUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //
  // Future signInAnon() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     FirebaseUser user = result.user;
  //     print(user);
  //     return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData('New buddy', 'Program name', 'Course 1', 'Course 2',
                          'Course 3', 'Course 4', 'Course 5');
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}