import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  Future<void> _signInAnonymously() async {
    final auth = FirebaseAuth.instance;
    final user = await auth.signInAnonymously();
    print('User signed in anonymously: $user');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('Sign In Anonymously'),
                onPressed: _signInAnonymously ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
