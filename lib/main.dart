import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:homely/controller/bottomnavcontroller.dart';
import 'package:homely/controller/homepagecontroller.dart';
import 'package:homely/dashboard.dart';

void main() => runApp(const Homely());

class Homely extends StatelessWidget {
  const Homely({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      home: Homepagecontroller(),
    );
  }
}

