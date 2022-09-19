import 'package:chat_new/components/home%20components/bottom_bar.dart';
import 'package:chat_new/screens/payment_detail_screen.dart';
import 'package:chat_new/screens/single_setting.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'change_password_screen.dart';
import 'personal_info.dart';


class Settingsscreen extends StatefulWidget {
  const Settingsscreen({super.key});

  @override
  State<Settingsscreen> createState() => _SettingsscreenState();
}

class _SettingsscreenState extends State<Settingsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(selectedIndex: 3, color: Colors.black),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(99, 23, 102, 1), Color(0xFF664F70)])),
        child: Container(
          padding: EdgeInsets.only(top: 80.h, left: 30, right: 30),
          child: Column(
            children: [
              Expanded(
                child: SingleSetting(
                  icon: Icons.person,
                  title: "Personal Informations",
                  route: PersonalInfo(),
                ),
              ),
              Expanded(
                child: SingleSetting(
                  icon: Icons.money,
                  title: "  Paymment History ",
                  route: PaymentScreen(),
                ),
              ),
              Expanded(
                child: SingleSetting(
                  icon: Icons.person,
                  title: "  Change Password ",
                  route: ChangePasswordScreen(),
                ),
              ),
              Expanded(
                child: SingleSetting(
                  icon: Icons.notification_add,
                  title: "       Notifications      ",
                  route: PersonalInfo(),
                ),
              ),
              Expanded(
                child: SingleSetting(
                  icon: Icons.info,
                  title: "           About           ",
                  route: PersonalInfo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
