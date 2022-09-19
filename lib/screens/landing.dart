import 'package:chat_new/components/landing%20components/loginButton.dart';
import 'package:chat_new/components/landing%20components/registerButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(99, 23, 102, 1), Color(0xFF664F70)])),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  flex: 3,
                  child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 125),
                      child: Text(
                        "Welcome to \n the Jungle",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontFamily: 'Calisto',
                            fontWeight: FontWeight.w400),
                      ))),
              Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                    child: Text("",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Calisto',
                            fontWeight: FontWeight.w400)),
                  )),
              Flexible(
                  flex: 3,
                  child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 125),
                      child: LoginButton())),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text("or",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Calisto',
                          fontWeight: FontWeight.w400)),
                ),
              ),
              Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: RegisterButton(),
                  )),
            ],
          )),
    );
  }
}
