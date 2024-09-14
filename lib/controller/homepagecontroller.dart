import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:homely/Widgets/navigationbarfloat.dart';
import 'package:homely/controller/bottomnavcontroller.dart';
//import 'package:newskaapp/Components/NavigationBar.dart';
//import 'package:newskaapp/Controller/BottomNavigationController.dart';

class Homepagecontroller extends StatelessWidget {
  const Homepagecontroller({super.key});

  @override
  Widget build(BuildContext context) {
    Bottomnavigationcontroller controller =
        Get.put(Bottomnavigationcontroller());

    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarExample(),
      body: Obx(
        () => controller.pages[controller.index.value],
      ),
    );
  }
}
