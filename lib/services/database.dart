import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {

  final String uid;

  DataBaseService({this.uid});

  //Data Stored of Each User
  final CollectionReference plantDataCollection = Firestore.instance.collection("plants");

  Future createUser(String username, int score) async {
    return await plantDataCollection.document(uid).setData( {
      'username': username,
      'score': score,
    });
  }

  Future updateUserScore(int score) async {
    return await plantDataCollection.document(uid).setData( {
      'score': score,
    });
  }

  Stream<QuerySnapshot> get plants {
    return plantDataCollection.snapshots();
  }

  Future getUserDoc() async {
    return await plantDataCollection.document(uid);
      /*
    await plantDataCollection.document(uid).get().then((DocumentSnapshot ds) {
      int score = ds['score'];
      print(score);
      return score;
    });

       */
  }

}