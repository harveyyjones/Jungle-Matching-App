import 'dart:ffi';

import 'package:chat_new/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleSetting extends StatefulWidget {
  IconData icon;
  String title;
  Widget? route;
  SingleSetting(
      {required String this.title,
      required IconData this.icon,
      required Widget this.route,
      super.key});

  @override
  State<SingleSetting> createState() => _SingleSettingState();
}

class _SingleSettingState extends State<SingleSetting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => widget.route ?? HomePage(),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            height: 140.h,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 50),
                        child: Icon(
                          widget.icon,
                          size: 66,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, bottom: 12.h),
                      child: Container(
                        padding: EdgeInsets.only(right: 130.w),
                        //    color: Colors.amber,
                        child: Text(widget.title,
                            style:
                                TextStyle(fontSize: 35, fontFamily: "Calisto")),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
