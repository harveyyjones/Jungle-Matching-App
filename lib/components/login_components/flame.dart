import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 75,
      ),
      Container(
        height: 50,
      ),
      Lottie.asset(
        'assets/87498-fire.json',
        width: 652.w,
        height: 261.h,
      ),
    ]);
  }
}
