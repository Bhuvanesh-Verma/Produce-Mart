import 'package:fresh_mart/models/user.dart' as myuser;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create User object

  myuser.User _userFromFirebaseUser(User user) {
    return user != null ? myuser.User(uid: user.uid) : null;
  }

  @override
  Future<String> currentUser() async {
    final User user = await _auth.currentUser;
    return user?.uid;
  }

// Sign in Anonymously

  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();

      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//auth change user stream

  Stream<myuser.User> get user {
    return _auth.onAuthStateChanged
        //.map((User user) => _userFromFirebaseUser(user)); same as below
        .map(_userFromFirebaseUser);
  }
//Sign in with Email Password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      email = email.trim();
      password = password.trim();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // if (userCredential.runtimeType == PlatformException) {
      //   return null;
      // }
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      return e;
    } on PlatformException catch (e) {
      print(e);
      return null;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

//Register with Email Password

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      email = email.trim();
      password = password.trim();
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // if (userCredential.runtimeType == PlatformException) {
      //   return null;
      // }
      User user = userCredential.user;
      //c save data to cloud
      // await DatabaseService(uid: user.uid)
      //     .updateUserData('0', 'New Crew Member', 100);
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      return e;
    } on PlatformException catch (e) {
      print(e);
      return null;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

//Sign Out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
