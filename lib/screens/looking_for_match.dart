import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LookingForMatchscreen extends StatefulWidget {
  LookingForMatchscreen({Key? key}) : super(key: key);

  @override
  State<LookingForMatchscreen> createState() => _LookingForMatchscreenState();
}

class _LookingForMatchscreenState extends State<LookingForMatchscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(99, 23, 102, 1), Color(0xFF664F70)])),
        child: Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Text(
              "Looking For A \n Good Match!",
              style: TextStyle(
                  color: Colors.white, fontSize: 80.sp, fontFamily: "Calisto"),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
                width: 110,
                height: 110,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: Colors.purple,
                  strokeWidth: 20,
                )),
            SizedBox(
              height: 200,
            ),
            SizedBox(
              width: 170,
              height: 90,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    "   Call Of \n Matching",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Calisto"),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
