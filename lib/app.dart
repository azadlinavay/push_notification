import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/getTokenClass.dart';
import 'package:push_notification/local_notification.dart';
import 'package:push_notification/signIn.dart';
import 'package:push_notification/token.dart';

class AppView extends StatefulWidget {
  AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPage(),
        '/local': (context) => LocalNoification(),
        '/token': (context) => GetTokens(),
      },
    );
  }
}
