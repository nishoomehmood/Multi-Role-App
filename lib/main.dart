import 'package:flutter/material.dart';
import 'Splash_Screen.dart';

void main() {
  runApp(const MultiRoleApp());
}


class MultiRoleApp extends StatefulWidget {
  const MultiRoleApp({Key? key}) : super(key: key);



  @override
  State<MultiRoleApp> createState() => _MultiRoleAppState();
}

class _MultiRoleAppState extends State<MultiRoleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(color: Colors.green),
      ),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: Scaffold(
        body: SplashScreen(),
      ),),
    );
  }
}

