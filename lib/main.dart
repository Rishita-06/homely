import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homely/controller/homepagecontroller.dart';
import 'package:homely/da24login.dart';
// import 'package:homely/firebase_options.dart';
import 'package:homely/requestlistscreen.dart';

void main() async {
  runApp(const Homely());
}

class Homely extends StatelessWidget {
  const Homely({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Check the authentication state asynchronously
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for Firebase Authentication
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          // Determine which screen to show based on the authentication state
          if (snapshot.hasData && snapshot.data != null) {
            // User is authenticated, show Homepagecontroller
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark().copyWith(
                primaryColor: Colors.lightBlue,
                scaffoldBackgroundColor: Colors.white,
              ),
              home: Homepagecontroller(),
            );
          } else {
            // User is not authenticated, show constDay24Authentication
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark().copyWith(
                primaryColor: Colors.lightBlue,
                scaffoldBackgroundColor: Colors.white,
              ),
              home: Day24Authentication(),
              //home: RequestListScreen()
              //home: Homepagecontroller(),
            );
          }
        }
      },
    );
  }
}
