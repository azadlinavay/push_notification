import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> GetToken() async {
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
      SetOptions(merge: true);
    });
  });
}
