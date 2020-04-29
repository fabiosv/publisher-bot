import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/User.dart';
class UserAPI {
  UserAPI();

  static User _modelFactory (DocumentSnapshot result) {
    return new User(
        uid: result['uid'],
        lastName: result['surname'],
        firstName: result['fname'],
        email: result['email']
    );
  }

  static Future create (String email, String password) async =>
    FirebaseAuth.instance
      .createUserWithEmailAndPassword(
        email: email,
        password: password)
      .then((currentUser) => Firestore.instance
        .collection('users')
        .document(currentUser.user.uid)
        .get()
        .then((DocumentSnapshot result) {
          return _modelFactory(result);
        })
      );

  static Future<User> get(uid) async =>
    Firestore.instance
      .collection('users')
      .document(uid)
      .get()
      .then((DocumentSnapshot result) {
        return _modelFactory(result);
      });

  static Future<User> verify (String email, String password) async =>
    FirebaseAuth.instance
      .signInWithEmailAndPassword(
        email: email,
        password: password)
      .then((currentUser) => get(currentUser.user.uid));
}