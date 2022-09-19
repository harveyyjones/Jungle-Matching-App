import 'package:chat_new/Constants/constants.dart';
import 'package:chat_new/business_logic/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  String? messageText;
  @override
  void initState() {
    getCurrentUser();

    super.initState();
  }

  // getMessages() async {
  //   // messages değişkeninde mesajlar bulunuyor. What a fact eh?
  //   final messages = await _fireStore.collection("messages").get();
  //   for (var messages in messages.docs) {
  //     print(messages.data());
  //   }
  // }

  getMessagesFromStream() async {
    await for (var snapshot in _fireStore.collection("messages").snapshots()) {
      for (var messages in snapshot.docs) {
        print(messages.data());
      }
    }
  }

  void getCurrentUser() async {
    try {
      final user =
          await _auth.currentUser; // O an mevcut olan kullanıcıyı alıyor.
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser?.email.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                getMessagesFromStream();
                //  _auth.signOut();
                // Navigator.of(context).pop();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
              stream: _fireStore.collection("messages").snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<Text> messageWidgets = [];
                if (snapshot.hasData) {
                  final messages = snapshot.data.docs;
                  for (var message in messages) {
                    final messageText = message.data()["text"];
                    final messageSender = message.data()["sender"];
                    final messageWidget = Text(
                      "$messageText from $messageSender",
                      style: TextStyle(fontSize: 35),
                    );
                    messageWidgets.add(messageWidget);
                  }
                }
                return Column(
                  children: [...messageWidgets],
                );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _fireStore.collection("messages").add(
                          {"text": messageText, "sender": loggedInUser!.email});
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
