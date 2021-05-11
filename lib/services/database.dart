import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_buddy/models/user_model.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(String name, String program, String course1,
                        String course2, String course3, String course4,
                        String course5) async {
    return await userCollection.document(uid).setData({
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
    return snapshot.documents.map((doc) {
      return AllUsers(
        name: doc.data['name'] ?? '',
        program: doc.data['program'] ?? '',
        course1: doc.data['course1'] ?? '',
        course2: doc.data['course2'] ?? '',
        course3: doc.data['course3'] ?? '',
        course4: doc.data['course4'] ?? '',
        course5: doc.data['course5'] ?? ''
      );
    }).toList();
  }
  // get users streams
  Stream<List<AllUsers>> get users {
      return userCollection.snapshots()
      .map(_userListFromSnapshot);
  }
}