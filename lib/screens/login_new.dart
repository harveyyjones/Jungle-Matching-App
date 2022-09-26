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
  getScreenInfos() {
    ScreenUtil? fuck = ScreenUtil();
    print('Device width dp:${fuck!.screenWidth}'); //Device width
    print('Device height dp:${fuck.screenHeight}'); //Device height
    print(
        'Ratio of actual width dp to design draft px:${ScreenUtil().scaleWidth}');
    print(
        'Ratio of actual height dp to design draft px:${ScreenUtil().scaleHeight}');
    print(
        'Device pixel density:${ScreenUtil().pixelRatio}'); //Device pixel density
    print(
        'Bottom safe zone distance dp:${ScreenUtil().bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    print(
        'Status bar height px:${ScreenUtil().statusBarHeight}dp'); //Status bar height , Notch will be higher Unit px
    print(
        'Ratio of actual width dp to design draft px:${ScreenUtil().scaleWidth}');
    print(
        'Ratio of actual height dp to design draft px:${ScreenUtil().scaleHeight}');
    print(
        'The ratio of font and width to the size of the design:${ScreenUtil().scaleWidth * ScreenUtil().pixelRatio!.toDouble()}');
    print(
        'The ratio of  height width to the size of the design:${ScreenUtil().scaleHeight * ScreenUtil().pixelRatio!.toDouble()}');
    print('System font scaling:${ScreenUtil().textScaleFactor}');
    print('0.5 times the screen width:${0.5.w}');
    print('0.5 times the screen height:${0.5.h}');
  }

  @override
  void initState() {
    getScreenInfos();
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
            InkWell(onTap: () => getScreenInfos(), child: MyWidget()),
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
                            filter: ImageFilter.blur(sigmaX: 5.w, sigmaY: 5.h),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 2.w,
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  top: 240.h, right: 20.w, left: 20.w),
                              child: _buildForm(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
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
            _buildEmailField(),
            SizedBox(
              height: 16.h,
            ),
            _buildPasswordField(),
            SizedBox(height: 16.h),
            _buildSignInButton(context),
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
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
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
      child: Text("Sign In",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          )),
    );
  }

  Future signInEmailandpassword() async {
    try {
      var newUser = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (newUser != null) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      }
    } catch (e) {
      print(e);
    }
  }
}
