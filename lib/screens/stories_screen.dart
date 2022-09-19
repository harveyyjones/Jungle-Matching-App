import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat_new/business_logic/model/user_model.dart';
import 'package:chat_new/components/home%20components/bottom_bar.dart';
import 'package:chat_new/screens/single_story_screen.dart';
import 'package:flutter/material.dart';
import '';
import '../business_logic/service/user_service.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  List<UsersModelKisiler?> users = [];
  @override
  void initState() {
    var service = UserService();
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar:
            BottomBar(color: Colors.transparent, selectedIndex: 1),
        body: Center(
          child: SingleStoryScreen(users: users),
        ));
  }
}
