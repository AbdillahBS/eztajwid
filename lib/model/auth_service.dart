import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final _auth = FirebaseAuth.instance;

  Future<User?> registerWithEmailPassword(
      String email, password, String username, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await users.doc(username).set({
        'email': email,
        'username': username,
      });

      return userCredential.user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }

  Future<User?> loginWithEmailPassword(
      String emailOrUsername, String password, BuildContext context) async {
    try {
      UserCredential userCredential;

      // Cek apakah input adalah email atau username
      bool isEmail = emailOrUsername.contains('@');

      if (isEmail) {
        userCredential = await _auth.signInWithEmailAndPassword(
          email: emailOrUsername,
          password: password,
        );
      } else {
        // Jika input adalah username, cari user dengan username tersebut
        QuerySnapshot query =
            await users.where('username', isEqualTo: emailOrUsername).get();

        if (query.docs.isNotEmpty) {
          String userEmail = query.docs.first['email'];
          userCredential = await _auth.signInWithEmailAndPassword(
            email: userEmail,
            password: password,
          );
        } else {
          throw 'user / password salah ';
        }
      }

      return userCredential.user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }
}
