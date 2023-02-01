import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_app/Admin_Screen.dart';
import 'package:multi_role_app/Student_Screen.dart';
import 'package:multi_role_app/SignUp_Screen.dart';
import 'package:multi_role_app/Teacher_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String person = sp.getString('person') ?? '';

    if (isLogin) {
      if (person == "student") {
        Timer(const Duration(seconds: 6), () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StudentScreen(),),);
        }
        );
      }
      else if (person == "teacher") {
        Timer(const Duration(seconds: 6), () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TeacherScreen(),),);
        }
        );
      }
      else if (person == "other")
      {
        Timer(const Duration(seconds: 6), () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AdminScreen(),),);
        }
        );
      }
      else {
        {
          Timer(const Duration(seconds: 6), () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignUpScreen(),),);
          }
          );
        }
      }
    }
    else {
      Timer(const Duration(seconds: 6), () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignUpScreen(),),);
      }
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Scaffold(
        body: Image(
          height: double.infinity,
          fit: BoxFit.fill,
          image: NetworkImage('https://tse2.mm.bing.net/th?id=OIP.Wj9OTjlEVKOmeYUXIryewQHaJS&pid=Api&P=0'),),
      ),),
    );
  }
}
