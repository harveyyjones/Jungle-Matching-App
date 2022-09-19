import 'package:chat_new/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  RegisterButton({Key? key}) : super(key: key);

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: Color.fromARGB(255, 182, 99, 174),
          primary: Colors.white,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegisterPage()));
      },
      child: Text("Register",
          style: TextStyle(
            fontFamily: 'Calisto',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          )),
    );
  }
}
