import 'package:flutter/material.dart';
import 'package:multi_role_app/Student_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Admin_Screen.dart';
import 'Teacher_Screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final personController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(child: Text("Sign Up")),
        ),
        body: SafeArea(child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: ageController,
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle_outlined),
                  hintText: "Age",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: personController,
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Student/Teacher/Other",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () async{
                       SharedPreferences sp = await SharedPreferences.getInstance();
                       sp.setString('email', emailController.text.toString());
                       sp.setString('age', ageController.text.toString());
                       sp.setString('person', personController.text.toString());
                       sp.setBool('isLogin', true);
                       if (sp.getString('person') == "student") {
                           Navigator.push(context,
                             MaterialPageRoute(builder: (context) => const StudentScreen(),),);
                       }
                       else if (sp.getString('person') == "teacher") {
                           Navigator.push(context,
                             MaterialPageRoute(builder: (context) => const TeacherScreen(),),);
                       }
                       else if (sp.getString('person') == "other")
                       {
                           Navigator.push(context,
                             MaterialPageRoute(builder: (context) => const AdminScreen(),),);
                       }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.green,
                      ),
                      child: const Center(
                        child: Text("Sign Up", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),),
      ),
    );
  }
}
