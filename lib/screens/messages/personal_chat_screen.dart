import 'package:bubble/bubble.dart';
import 'package:chat_new/screens/home.dart';
import 'package:chat_new/business_logic/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';


class PersonalChatScreen extends StatefulWidget {
  var index;

  PersonalChatScreen({this.index, super.key});

  @override
  State<PersonalChatScreen> createState() => _PersonalChatScreenState();
}

final TextEditingController textController = TextEditingController();

class _PersonalChatScreenState extends State<PersonalChatScreen> {
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

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 117, 5, 161),
            toolbarHeight: 123.h,
            leading: SizedBox(),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 30.w),
                child: CircleAvatar(
                    maxRadius: 40,
                    minRadius: 30,
                    backgroundImage: NetworkImage(
                      users[widget.index]!.imagePath ?? "",
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(right: 280.w, top: 27.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      users[widget.index]!.name! +
                          "${users[widget.index]!.surname}",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Calisto",
                          fontWeight: FontWeight.w700,
                          fontSize: 35.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 129.w, top: 5.h),
                      child: const Text(
                        "online",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Calisto",
                            fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 60.w),
                child: Icon(Icons.call, size: 50),
              )
            ]),
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
              child: GroupedListView(
            reverse: true,
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            floatingHeader: true,
            elements: messages,
            groupBy: (Message message) => DateTime(
                message.date.year, message.date.month, message.date.year),
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 65,
              child: Center(
                child: Container(
                  width: 130,
                  height: 40,
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Calisto",
                            fontWeight: FontWeight.w100,
                            fontSize: 21),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // ***************************** Each Message *************************
            itemBuilder: (context, Message message) => Container(
              width: message.text.length > 10
                  ? MediaQuery.of(context).size.width / 2.2
                  : null,
              child: Bubble(
                nip: message.isSentByMe
                    ? BubbleNip.rightBottom
                    : BubbleNip.leftBottom,
                margin: message.isSentByMe
                    ? BubbleEdges.only(
                        left: MediaQuery.of(context).size.width / 3,
                        top: 60.h,
                        right: 20.w,
                        bottom: 10.h)
                    : BubbleEdges.only(
                        right: MediaQuery.of(context).size.width / 3,
                        left: 20.w,
                        top: 60.h,
                        bottom: 10.h),
                alignment: message.isSentByMe
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                color: message.isSentByMe
                    ? Color.fromARGB(122, 182, 101, 244)
                    : Colors.white,
                child: Text(message.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23.0, fontFamily: "Helvetica")),
              ),
            ),
          )),
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
                              child: const Text(
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
                        sendMessage(textController.text);
                      }
                    },
                    icon: Icon(Icons.send))
              ],
            ),
          )
        ]));
  }
}
