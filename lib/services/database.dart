import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_buddy/models/user_model.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String program, String course1,
                        String course2, String course3, String course4,
                        String course5) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'program': program,
      'course1': course1,
      'course2': course2,
      'course3': course3,
      'course4': course4,
      'course5': course5,
    });
  }

  // user listt from snapshot
  List <AllUsers> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return AllUsers(
        name: doc['name'] ?? '',
        program: doc['program'] ?? '',
        course1: doc['course1'] ?? '',
        course2: doc['course2'] ?? '',
        course3: doc['course3'] ?? '',
        course4: doc['course4'] ?? '',
        course5: doc['course5'] ?? ''
      );
    }).toList();
  }
  // get users streams
  Stream<List<AllUsers>> get users {
      return userCollection.snapshots()
      .map(_userListFromSnapshot);
  }
}