import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.backgroundImage})
      : super(key: key);
  final String backgroundImage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("go button pressed"),
      child: Container(
        height: 145.h,
        width: 300.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(backgroundImage),
          ),
        ),
        child: Text('Go!', style: TextStyle(color: Colors.white, fontSize: 26)),
      ),
    );
  }
}
