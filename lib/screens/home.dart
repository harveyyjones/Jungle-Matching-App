import 'package:chat_new/business_logic/model/user_model.dart';
import 'package:chat_new/business_logic/service/user_service.dart';
import 'package:chat_new/components/home%20components/carousel_slider.dart';
import 'package:chat_new/components/home%20components/custom_button.dart';
import 'package:chat_new/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/home components/bottom_bar.dart';
import '../components/home components/carousel_slider.dart';

List<UsersModelKisiler?> users = [];

class HomePage extends StatefulWidget {
  HomePage({super.key, selectedIndex});
  int? selectedIndex;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserService service;
  @override
  void initState() {
    service = UserService();
    super.initState();
    service.fetchUsers().then((value) {
      users = value!.kisiler!;
      if (mounted) {
        setState(() {});
      }
      print("**************************************************************");
      print(users);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 230.h,
          elevation: 0,
          backgroundColor: Color.fromRGBO(99, 23, 102, 1),
          title: Padding(
            padding: EdgeInsets.only(left: 170.w, top: 40.h),
            child: Text(
              "Girls you've \n talked before!",
              style: TextStyle(
                  color: Colors.white, fontSize: 60.sp, fontFamily: "Calisto"),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 80.h),
          child: CustomButton(
            backgroundImage: "assets/Rectangle_button.png",
          ),
        ),
        extendBody: true,
        bottomNavigationBar:
            BottomBar(color: Colors.transparent, selectedIndex: 0),
        body: users.isEmpty
            ? LoadingScreen()
            : CarouselSliderList(
                users: users,
              ));
  }
}
