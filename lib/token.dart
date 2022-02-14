import 'package:flutter/material.dart';

class GetTokens extends StatefulWidget {
  GetTokens({Key? key}) : super(key: key);

  @override
  State<GetTokens> createState() => _GetTokensState();
}

class _GetTokensState extends State<GetTokens> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get Tokens'),
        ),
        body: Center(
          child: Text('Get Tokens'),
        ),
      ),
    );
  }
}
