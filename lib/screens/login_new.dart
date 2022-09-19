import 'dart:ui';
import 'package:chat_new/components/login_components/flame.dart';
import 'package:chat_new/screens/forgot_password.dart';
import 'package:chat_new/screens/home.dart';
import 'package:chat_new/screens/register.dart';
import 'package:chat_new/screens_for_girls/home_for_girls.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chat_new/components/home%20components/or_divider.dart';
import 'package:chat_new/components/login_components/sign_in_social.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = false;
  late FirebaseAuth auth;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            MyWidget(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 95.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              width: size.width.w * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 2.w,
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  top: 20.h, right: 20.w, left: 20.w),
                              child: _buildForm(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 16.h),
                      _buildForgotPassword(context),
                      SizedBox(height: 16.h),
                      buildNoAccount(context),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 16.h),
            _buildEmailField(),
            SizedBox(height: 16.h),
            _buildPasswordField(),
            SizedBox(height: 16.h),
            _buildSignInButton(context),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ));
                },
                child: Text("shortcut")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return HomeForGirls();
                    },
                  ));
                },
                child: Text("shortcut for girls")),
            const OrDivider(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // iconlarin basladigi yer
                  SignInSocial.buildSocial(
                      context,
                      const FaIcon(
                        FontAwesomeIcons.apple,
                        color: Colors.black,
                      )),
                  SizedBox(width: 16.w),
                  SignInSocial.buildSocial(
                      context,
                      const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      height: 20.h,
      thickness: 1,
      indent: 20,
      endIndent: 20,
      color: Colors.black,
    );
  }

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  Widget _buildEmailField() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white.withOpacity(0.6),
        ),
        child: TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value!.isEmpty) {
              callSnackbar('Email boş olamaz.');
              return '';
            } else if (!isValidEmail(value)) {
              callSnackbar('Email formatı hatalı');
              return '';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: "Email",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  callSnackbar(String error, [Color? color, VoidCallback? onVisible]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      backgroundColor: color ?? Colors.red,
      duration: Duration(milliseconds: 500),
      onVisible: onVisible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: SizedBox(
        width: 40.w,
        height: 40.h,
        child: Center(
          child: Text(error, style: const TextStyle(color: Colors.white)),
        ),
      ),
    ));
  }

  Widget _buildPasswordField() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextFormField(
        controller: passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            callSnackbar('Şifre alanı boş olamaz.');
            return '';
          } else if (value.length < 6) {
            callSnackbar('Şifreniz minimum 6 haneli olmalıdır.');
            return '';
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            border: InputBorder.none,
            label: Padding(
              padding: EdgeInsets.only(left: 22.w),
              child: Text("Password"),
            ),
            suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child:
                    Icon(isVisible ? Icons.visibility : Icons.visibility_off))),
        obscureText: !isVisible,
      ),
    );
  }

  GestureDetector _buildForgotPassword(BuildContext context) {
    return GestureDetector(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
              decoration: TextDecoration.underline, color: Colors.black54),
        ),
        // şifre unuttum kismi burda birazdan yap
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ForgotPassword()));
        });
  }

  RichText buildNoAccount(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: const TextStyle(color: Colors.black54),
            text: "No Account? ",
            children: [
          TextSpan(
              // hesabın olmaması burda
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                },
              text: 'Sign Up',
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black54,
              )),
        ]));
  }

  ElevatedButton _buildSignInButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: Colors.black,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          minimumSize: const Size(double.infinity, 50)),
      onPressed: () async {
        await signInEmailandpassword();
      },
      child: Text("Sign Up",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          )),
    );
  }

  Future signInEmailandpassword() async {
    if (emailController.text.isEmpty) {
      callSnackbar('E-mail alanı boş bırakılamaz!');
      return '';
    } else if (passwordController.text.isEmpty) {
      callSnackbar('Şifre alanı boş bırakılamaz!');
      return '';
    } else {
      if (emailController.text.contains("*")) {
        callSnackbar("Geçersiz e-mail!");
        return '';
      } else if (2 == 3) {
        callSnackbar('Bu e-mail için kullanıcı bulunamadı!');
        return '';
      } else if (2 == 3) {
        callSnackbar('Invalid password!');
        return '';
      }
    }
  }
}
