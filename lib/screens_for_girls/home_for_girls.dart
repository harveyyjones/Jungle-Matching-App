import 'package:chat_new/screens/looking_for_match.dart';
import 'package:chat_new/screens/notification_settings_screen.dart';
import 'package:chat_new/screens/personal_info_for_girls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/change_password_screen.dart';
import '../screens/payment_detail_screen.dart';
import '../screens/personal_info.dart';
import '../screens/single_setting.dart';

class HomeForGirls extends StatefulWidget {
  const HomeForGirls({super.key});

  @override
  State<HomeForGirls> createState() => _HomeForGirlsState();
}

class _HomeForGirlsState extends State<HomeForGirls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 23, 102, 1),
        toolbarHeight: 130,
        title: Text(
          "Content Creator Studio",
          style: TextStyle(
              fontFamily: "Calisto", fontWeight: FontWeight.w500, fontSize: 43.sp),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(99, 23, 102, 1), Color(0xFF664F70)])),
        child: Container(
          padding: EdgeInsets.only(top: 80.h, left: 30.w, right: 30.w),
          child: Column(
            children: [
              Expanded(
                child: SingleSetting(
                  icon: Icons.animation_outlined,
                  // TODO: Burayı image picker ile hallederim.
                  title: "         Share Story     ",
                  route: PersonalInfo(),
                ),
              ),
              Expanded(
                child: SingleSetting(
                  icon: Icons.camera,
                  title: "          Go Live          ",
                  route: LookingForMatchscreen(),
                ),
              ),
              Expanded(
                child: SingleSetting(
                  icon: Icons.person,
                  title: "Personal Informations",
                  route: PersonalInfoForGirls(),
                ),
              ),
              Expanded(
                child: SingleSetting(
                  icon: Icons.money,
                  title: "  Paymment History ",
                  // TODO: Sonradan farklı bir UI tasarlanabilir.
                  route: PaymentScreen(),
                ),
              ),
              Expanded(
                child: SingleSetting(
                  icon: Icons.person,
                  title: "    Change Password ",
                  route: ChangePasswordScreen(),
                ),
              ),
              Expanded(
                child: SingleSetting(
                  icon: Icons.notification_add,
                  title: "       Notifications      ",
                  route: NotificationSettingsScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
