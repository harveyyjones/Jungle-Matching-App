import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat_new/business_logic/model/user_model.dart';
import 'package:chat_new/screens/messages/personal_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderList extends StatefulWidget {
  CarouselSliderList({Key? key, required this.users}) : super(key: key);
  final List<UsersModelKisiler?> users;

  @override
  State<CarouselSliderList> createState() => _CarouselSliderListState();
}

class _CarouselSliderListState extends State<CarouselSliderList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(99, 23, 102, 1), Color(0xFF664F70)])),
      child: Column(children: [
        Expanded(
            child: CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 50.w, right: 50.w, top: 70.h),
                        child: InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                PersonalChatScreen(index: index),
                          )),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(26),
                            child: Image.network(
                                widget.users[index]!.imagePath.toString()),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 280.w, top: 50.h),
                        //   color: Colors.black,
                        child: Text(
                          widget.users[index]!.name.toString() +
                              widget.users[index]!.surname.toString(),
                          style:
                              TextStyle(color: Colors.white, fontSize: 36.sp),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 130.w, top: 20.h),
                            child: Text(
                              widget.users[index]!.location.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 27),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 9.w, top: 20.h),
                              width: 40.w,
                              height: 40.h,
                              child: Image.asset(
                                "assets/locationiconn.png",
                                fit: BoxFit.contain,
                              ))
                        ],
                      ),
                     
                    ],
                  );
                },
                itemCount: widget.users.length,
                options: CarouselOptions(
                    scrollDirection: Axis.vertical, viewportFraction: 1))),
      ]),
    );
  }
}
