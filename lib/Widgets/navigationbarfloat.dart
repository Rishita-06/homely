import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homely/addpage.dart';
import 'package:homely/profilepagehe.dart';
//import 'package:homely/controller/bottomnavcontroller.dart';
import 'package:homely/config/colors.dart';
import 'package:homely/config/theme.dart';
import 'package:homely/dashboard.dart';
import 'package:homely/remainderapp/todo_list.dart';
import 'package:homely/reminder.dart';
//import 'package:homely/remainderapp/task_screen.dart';
import 'package:homely/searchpage.dart';
//import 'package:homely/todo.dart';
//import 'package:homely/todolist.dart';
//import 'package:homely/todolist/screens/homepage.dart';
//import 'package:newskaapp/Controller/BottomNavigationController.dart';

//devswip

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    Dashboard(),
    //TaskScreen(),
    Searchpage(),
    Addpage(),
    ReminderApp(),
    Profilepage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromRGBO(255, 255, 255, 1),
              size: 35,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Color.fromRGBO(255, 255, 255, 1),
              size: 35,
            ),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Color.fromRGBO(255, 255, 255, 1),
              size: 35,
            ),
            label: 'add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.today_outlined,
              color: Color.fromRGBO(255, 255, 255, 1),
              size: 35,
            ),
            label: 'todolist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Color.fromRGBO(255, 255, 255, 1),
              size: 35,
            ),
            label: 'setting',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        selectedItemColor: Color.fromARGB(255, 0, 68, 255),
        onTap: _onItemTapped,
      ),
    );
  }
}
