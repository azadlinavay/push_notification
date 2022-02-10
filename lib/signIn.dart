import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  _signInAnonymously() async {
    final auth = FirebaseAuth.instance;
    final user = await auth.signInAnonymously();
    print('User signed in anonymously: $user');
  }

  @override
  void initState() {
    super.initState();
    _signInAnonymously();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome To Token Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("AZAD"),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> saveTokenToDatabase(String token) async {
  // Assume user is logged in for this example
  
  String userId = FirebaseAuth.instance.currentUser!.uid;

  await FirebaseFirestore.instance.collection('users').doc(userId).update({
    'tokens': FieldValue.arrayUnion([token]),
  });
}

class Application extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<Application> {
  String? _token;

  @override
  void initState() async {
    super.initState();
    // Get the token each time the application loads
    String? token = await FirebaseMessaging.instance.getToken();
    debugPrint('Token: $token');

    // Save the initial token to the database
    await saveTokenToDatabase(token ?? '');

    // Any time the token refreshes, store this in the database too.
    FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  }

  @override
  Widget build(BuildContext context) {
    return Text(_token ?? '');
  }
}
