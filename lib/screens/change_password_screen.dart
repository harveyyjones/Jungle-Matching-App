import 'package:chat_new/components/personal_info_name_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 350.h),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(99, 23, 102, 1), Color(0xFF664F70)])),
        child: Column(
          children: [
            PersonalInfoNameBar(
              label: "Current Password",
              controller: passwordController,
              isObscure: true,
            ),
            PersonalInfoNameBar(
                label: "New Password", controller: newPasswordController),
            PersonalInfoNameBar(
              label: "New Password Again",
              isObscure: true,
              controller: newPasswordController2,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 250.w,
              height: 70.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: Color.fromARGB(255, 182, 99, 174),
                    primary: Colors.black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    minimumSize: Size(230.w, 60.h)),
                onPressed: () {},
                child: const Text("Submit",
                    style: TextStyle(
                      fontFamily: 'Calisto',
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ));
  }
}
