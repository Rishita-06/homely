import 'package:flutter/material.dart';
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
      home: const Dashboard(),
    );
  }
}
