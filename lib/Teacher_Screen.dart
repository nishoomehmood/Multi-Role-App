import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignUp_Screen.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  String email = '';
  String age = '';
  String person = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      loadData();
    });
  }

  void loadData() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    person = sp.getString('person') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(child: Text("Teacher Screen")),
        ),
        body: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("This is Teacher Screen"),
            const SizedBox(
              height: 20,
            ),
            Text("Email         =   $email", style: const TextStyle(color: Colors.black),),
            Text("Age           =   $age."),
            Text("Person        =   $person"),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: InkWell(
                  onTap: () async{
                    SharedPreferences sp = await SharedPreferences.getInstance();
                    sp.clear();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen(),),);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Text("Log out", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
