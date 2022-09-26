import 'package:chat_new/screens/home.dart';
import 'package:chat_new/screens/messages/personal_chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_new/components/home%20components/bottom_bar.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({
    Key? key,
    required List usersLastMessage,
  }) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
} 
 late String userId = _auth.currentUser!.uid;
  final _auth = FirebaseAuth.instance;


class _MessageScreenState extends State<MessageScreen> {
  ScaffoldMessengerState snackBar = ScaffoldMessengerState();
  final _auth = FirebaseAuth.instance;
  final dataBase = FirebaseFirestore.instance;
  late String userId = _auth.currentUser!.uid;
  @override
//  getContactsFromStream() async {
//     await for (var snapshot in db.collection("chats").snapshots()) {
//       for (var messages in snapshot.docs) {
//         print(messages.data());
//       }
//     }
//   }

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(selectedIndex: 2, color: Colors.black),
        body: Padding(
          padding: EdgeInsets.only(top: 22.h),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                    stream: dataBase
                        .collection("conversations")
                        .where("members", arrayContains: userId)
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      var allCards = [];
                      if (snapshot.hasData) {
                        final contacts = snapshot.data?.docs;

                        for (var individiual in contacts) {
                          final nameOfPerson = individiual.data()["name"];
                          final message = individiual.data()["displayMessage"];
                          // Sergilenen mesaj kutusundaki her bir kart.
                          var individiualCard = InkWell(
                            onTap: () async {
                              var docRef = dataBase.collection("conversations");
                              // get() metodu ile koleksiyonun içindeki tüm dökümanları aldık.
                              var docSnap = await docRef.get();
                              var docId;
                              for (var snapshots in docSnap.docs) {
                                docId = snapshots.id;
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return PersonalChatScreen(
                                      index: 1,
                                      userId: userId,
                                      conversationID: docId);
                                },
                              ));
                            },
                            child: Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 9.h),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 18.w),
                                          child: CircleAvatar(
                                              maxRadius: 37,
                                              minRadius: 20,
                                              backgroundImage: NetworkImage(
                                                  userId ==
                                                          "uSeYTVhQkfbeIAZ369ayLNfsnE52"
                                                      ? "https://media-exp1.licdn.com/dms/image/C4D03AQFthx7G4-hMBg/profile-displayphoto-shrink_800_800/0/1663868725065?e=1669852800&v=beta&t=Q8BY-Ji0xXD3HpohMoTFifxRLu1XsDgGFWGfgYmmn1g"
                                                      : users[1]!
                                                          .imagePath
                                                          .toString()

                                                  //  ??
                                                  //     "URL that doesn't exist"
                                                  )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.w, bottom: 12.h),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    right: 420.w),
                                                //    color: Colors.amber,
                                                child: Text(
                                                    userId ==
                                                            "uSeYTVhQkfbeIAZ369ayLNfsnE52"
                                                        ? "Ömer"
                                                        : "Marta",
                                                    style: TextStyle(
                                                        fontSize: 39.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: "Calisto")),
                                              ),
                                              Container(
                                                width: 540.w,
                                                //  color: Colors.blue,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20.w, top: 20.h),
                                                  child: Text(
                                                    message.toString(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 34.sp,
                                                        color: Color.fromARGB(
                                                            255, 117, 113, 113),
                                                        fontFamily: "Calisto"),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.4),
                                )
                              ],
                            ),
                          );

                          allCards.add(individiualCard);
                          // ListTile(
                          //   title: Text("Dali"),
                          //   subtitle: Text(message),
                          // );
                        }
                      }
                      return ListView(
                        children: [...allCards],
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
