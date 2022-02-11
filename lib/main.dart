import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:push_notification/signIn.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() {
    print("Firebase initialized");
  });

  await FirebaseAuth.instance.signInAnonymously().then((UserCredential) async {
    await FirebaseMessaging.instance.getToken().then((token) async {
      print("Token: $token");
      await FirebaseFirestore.instance
          .collection("users")
          .doc(UserCredential.user!.uid)
          .set({
        "token": token,
        "uid": UserCredential.user!.uid,
      });
    });
  });

  runApp(const SignInPage());
}
