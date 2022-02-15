import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import hunde notifications 



class GetTokens extends StatefulWidget {
  GetTokens({Key? key}) : super(key: key);

  @override
  State<GetTokens> createState() => _GetTokensState();
}

CollectionReference users = FirebaseFirestore.instance.collection('users');

class _GetTokensState extends State<GetTokens> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Send notification"),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    color: Color.fromARGB(255, 252, 189, 0),
                    height: 250,
                    child: ListTile(
                      title: Text(snapshot.data!.docs[index].get('uid')),
                      subtitle: Text(snapshot.data!.docs[index].get('token')),
                      onTap: () {
                        print(snapshot.data!.docs[index].get('token'));
                        sendNotification(
                            snapshot.data!.docs[index].get('token'));
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }



  void sendNotification(param0) {
    
  }
}
