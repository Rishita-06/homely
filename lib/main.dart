import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:homely/controller/bottomnavcontroller.dart';
import 'package:homely/controller/homepagecontroller.dart';
import 'package:homely/da24login.dart';
import 'package:homely/dashboard.dart';
import 'package:homely/firebase_options.dart';
//import 'package:homely/remainderapp/task_screen.dart';
import 'package:homely/remainderapp/todo_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const Homely());
}

class Homely extends StatelessWidget {
  const Homely({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      //home: Homepagecontroller(),
      home: Day24Authentication(),
    );
  }
}
