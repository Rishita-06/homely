import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Addpage extends StatelessWidget {
  const Addpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Icon(
                                  Icons.arrow_back,
                                  size: 24,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                        255,
                                        0,
                                        0,
                                        0,
                                      ),
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  "Homely",
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [Image.asset("assets/Group 470.png")],
                    ),
                    
                  ],
                )))));
  }
}
