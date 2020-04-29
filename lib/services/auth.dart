import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantit/models/user.dart';
import 'package:plantit/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance; //Private Instanz der Firebase Auth Klasse

  Future<FirebaseUser> getCurrentFirebaseUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  Future<User> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return _getUserFromFirebaseUser(user);
  }

  User _getUserFromFirebaseUser(FirebaseUser user) {
    if(user != null) {
      return User(uid: user.uid);
    } else {
      return null;
    }
  }

  //Stream - Auth Change User
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _getUserFromFirebaseUser(user));
        .map(_getUserFromFirebaseUser);
  }

  Future signInAnonym() async {
    try{
      AuthResult authresult = await _auth.signInAnonymously();
      FirebaseUser user = authresult.user;
      return _getUserFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future LoginWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult authresult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = authresult.user;
      return _getUserFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future RegisterWithEmailAndPassword(String email, String password, String username) async {
    try {
      AuthResult authresult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = authresult.user;

      //Create Firebase Documents for User to store Data -> Score = 0; Sets Username
      await DataBaseService(uid: user.uid).createUser(username, 0);

      return _getUserFromFirebaseUser(user);
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