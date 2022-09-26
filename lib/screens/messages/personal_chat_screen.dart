import 'package:bubble/bubble.dart';
import 'package:chat_new/screens/home.dart';
import 'package:chat_new/business_logic/model/message_model.dart';
import 'package:chat_new/screens/loading_screen.dart';
import 'package:chat_new/screens/messages/message_box_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class PersonalChatScreen extends StatefulWidget {
  var index;
  var userId;
  var conversationID;
  PersonalChatScreen({this.index, super.key, this.userId, this.conversationID});

  @override
  State<PersonalChatScreen> createState() => _PersonalChatScreenState();
}

final TextEditingController textController = TextEditingController();

class _PersonalChatScreenState extends State<PersonalChatScreen> {
  late CollectionReference? _ref = FirebaseFirestore.instance
      .collection("conversations/${widget.conversationID}/messages");
  // hb0N5rhMp9YNQ4SWKH4l messages belgesine ait Id.
  getRef() {
    CollectionReference? _ref = FirebaseFirestore.instance
        .collection("conversations/${widget.conversationID}/messages");
    return _ref;
  }

  @override
  Widget build(BuildContext context) {
    sendMessage(value) {
      Message messageSentByMe = Message(value, DateTime.now(), true);
      setState(() {
        messages.add(messageSentByMe);
      });
      textController.clear();
      return messageSentByMe;
    }

    @override
    void initState() {
      getRef(); // Conversation Id'nin içinde bir tuhaflık var..

      super.initState();
    }

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 89, 27, 113),
            toolbarHeight: 123.h,
            leading: SizedBox(),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 30.w),
                child: CircleAvatar(
                    maxRadius: 30,
                    minRadius: 30,
                    backgroundImage: NetworkImage(userId ==
                            "uSeYTVhQkfbeIAZ369ayLNfsnE52"
                        ? "https://media-exp1.licdn.com/dms/image/C4D03AQFthx7G4-hMBg/profile-displayphoto-shrink_800_800/0/1663868725065?e=1669852800&v=beta&t=Q8BY-Ji0xXD3HpohMoTFifxRLu1XsDgGFWGfgYmmn1g"
                        : users[1]!.imagePath.toString())),
              ),
              Padding(
                padding: EdgeInsets.only(right: 220.w, top: 27.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        userId == "uSeYTVhQkfbeIAZ369ayLNfsnE52"
                            ? "Ömer"
                            : "Marta",
                        // users[widget.index]!.name! +
                        //     "${users[widget.index]!.surname}",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Calisto",
                            fontWeight: FontWeight.w700,
                            fontSize: 35.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 129.w, top: 5.h),
                      child: Text(
                        "online",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Calisto",
                            fontSize: 22.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 60.w),
                child: IconButton(
                  onPressed: () {
                    // Aşağısı test amaçlıdır.
                    print(widget.conversationID);
                  },
                  icon: const Icon(
                    Icons.phone,
                    size: 50,
                  ),
                ),
              )
            ]),
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
              // **************** EACH MESSAGE  ******************
              child: StreamBuilder(
                  stream:
                      _ref!.orderBy("timeStamp", descending: false).snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    var allMessages = [];
                    if (snapshot.hasData) {
                      return ListView(
                          children: snapshot.data.docs.map<Widget>((document) {
                        return ListTile(
                          title: Align(
                            alignment: widget.userId == document["senderId"]
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 169, 14, 183),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                document["message"],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }).toList());
                    } else {
                      print("snapshotta data yok amk");
                      return LoadingScreen();
                    }
                  })),
          // *********************************** TextField **************************************
          Padding(
            padding: EdgeInsets.only(bottom: 24.h, top: 25.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 160.w,
                  height: 80.h,
                  color: Colors.transparent,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: TextFormField(
                          style: TextStyle(
                            fontSize: 23.sp,
                          ),
                          maxLines: 20,
                          controller: textController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Padding(
                              padding: EdgeInsets.only(left: 22.w),
                              child: Text(
                                "Type here..",
                                style: TextStyle(
                                    color: Color.fromARGB(129, 42, 41, 41)),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 28.w,
                ),
                IconButton(
                    color: Color.fromARGB(255, 117, 5, 161),
                    iconSize: 53,
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        //sendMessage(textController.text);
                        _ref!.add({
                          "senderId": widget.userId,
                          "message": textController.text,
                          "timeStamp": DateTime.now()
                        });
                        textController.clear();
                      }
                    },
                    icon: Icon(Icons.send))
              ],
            ),
          )
        ]));
  }
}
