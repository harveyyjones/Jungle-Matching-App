import 'package:chat_new/business_logic/model/user_model.dart';
import 'package:chat_new/business_logic/service/user_service.dart';
import 'package:chat_new/components/home%20components/carousel_slider.dart';
import 'package:chat_new/components/home%20components/custom_button.dart';
import 'package:chat_new/screens/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/home components/bottom_bar.dart';

List<UsersModelKisiler?> users = [];

class HomePage extends StatefulWidget {
  HomePage({super.key, selectedIndex, newUser});
  int? selectedIndex;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  late final UserService service;
  @override
  void initState() {
    getCurrentUser();
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

  getCurrentUser() async {
    try {
      final user =
          await _auth.currentUser; // O an mevcut olan kullanıcıyı alıyor.
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser?.email.toString());
        print(loggedInUser!.displayName.toString());
        print(loggedInUser!.uid);
        print(loggedInUser!.photoURL);
      }
    } catch (e) {
      print(e);
    }
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
          padding: EdgeInsets.only(bottom: 0.h),
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
