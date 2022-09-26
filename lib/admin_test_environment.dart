
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestEnvironment extends StatefulWidget {
  const TestEnvironment({super.key});

  @override
  State<TestEnvironment> createState() => _TestEnvironmentState();
}

class _TestEnvironmentState extends State<TestEnvironment> {
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  getUserId() {
    String userId = _auth.currentUser!.uid;
    return userId;
  }

  getContactsFromStream() async {
    await for (var snapshot in db.collection("chats").snapshots()) {
      for (var messages in snapshot.docs) {
        print(messages.data());
      }
    }
  }

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          StreamBuilder(
            // Yalnızca içine dahil olduğumuz konuşmaları çekmek için where() metodunu kullanacağız.
            stream: db
                .collection("conversations")
                .where("members", arrayContains: getUserId())
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List allCards = [
                SizedBox(
                  height: 100,
                )
              ];
              if (snapshot.hasData) {
                final contacts = snapshot.data.docs;
                for (var individiual in contacts) {
                  final nameOfPerson = individiual.data()["name"];
                  final message = individiual.data()["displayMessage"];
                  var individiualCard = ListTile(
                    title: Text("Dali"),
                    subtitle: Text(message),
                  );
                  allCards.add(individiualCard);
                }
              }
              return Column(
                children: [...allCards],
              );
            },
          ),
        ],
      )),
    );
  }
}
