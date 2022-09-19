import 'package:chat_new/screens/single_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationSettingsScreen extends StatefulWidget {
  NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}
  bool isSelected = true;

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(99, 23, 102, 1), Color(0xFF664F70)])),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 125.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.white),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 30),
                      child: const Icon(
                        Icons.message,
                        size: 66,
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Container(
                      padding: EdgeInsets.only(right: 57.w),
                      //    color: Colors.amber,
                      child: Text("Message Notifications",
                          style:
                              TextStyle(fontSize: 35, fontFamily: "Calisto")),
                    ),
                  ),
                  SizedBox(
                    width: 119.w,
                    height: 89.h,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                          value: isSelected,
                          onChanged: (value) =>
                              setState(() => isSelected = value)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
