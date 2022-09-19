import 'package:chat_new/screens/login_new.dart';
import 'package:chat_new/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../flash_chat_to_migrate/flash_chat_to_apply_later/welcome_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1280),
      //deneme1
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          initialRoute: '/',
          routes: {
            '/': (context) => WelcomeScreen(),
            '/register': (context) => const RegisterPage(),
            '/login': ((context) => const LoginPage())
      
          },
        );
      },
    );
  }
}
