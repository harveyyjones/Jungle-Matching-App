import 'package:chat_new/screens/home.dart';
import 'package:chat_new/business_logic/data/shared_stories.dart';
import 'package:chat_new/components/personal_info_name_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoForGirls extends StatefulWidget {
  const PersonalInfoForGirls({super.key});

  @override
  State<PersonalInfoForGirls> createState() => _PersonalInfoForGirlsState();
}

TextEditingController nameController = TextEditingController(text: "Hailey");
TextEditingController eMailController =
    TextEditingController(text: "haileyelse@gmail.com");

class _PersonalInfoForGirlsState extends State<PersonalInfoForGirls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 160.h),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(99, 23, 102, 1), Color(0xFF664F70)])),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    color: Colors.transparent,
                    width: 300,
                    child: CircleAvatar(
                        maxRadius: 130,
                        minRadius: 37,
                        backgroundImage: AssetImage(sharedStories[0][2])),
                  ),
                  Positioned(
                      right: 39.w,
                      top: 195,
                      child: IconButton(
                          iconSize: 75,
                          onPressed: () {
                            //TODO: Image picker ile foto değiştirilebiliyor olacak. Muhtemelen localde saklanabilir.
                          },
                          icon: Icon(color: Colors.white, Icons.settings)))
                ],
              ),
              SizedBox(
                height: 110.h,
                width: MediaQuery.of(context).size.width,
              ),
              PersonalInfoNameBar(
                label: "Name",
                controller: nameController,
              ),
              PersonalInfoNameBar(label: "E Mail", controller: eMailController),
              PersonalInfoNameBar(
                label: "Password",
                isObscure: true,
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
                  child: Text("Submit",
                      style: TextStyle(
                        fontFamily: 'Calisto',
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          )),
    );
  }
}
