// dashboard.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homely/remainderapp/remdash.dart';
import 'package:homely/requestlistscreen.dart';
import 'package:homely/reusable_card.dart';
import 'package:homely/icon_content.dart';
import 'package:homely/card_content.dart';
import 'package:homely/reminder.dart'; // Import the reminder list
import 'package:homely/searchpage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9f9),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Welcome, Vikram',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            Row(
              children: [
                ReusableCard(
                  onPress: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Searchpage()),
                      );
                    });
                  },
                  colour: const Color(0xFF30b79c),
                  height: 80.0,
                  width: 150.0,
                  cardChild: const IconContent(
                    cc: Color(0xFF30b79c),
                    content: '240',
                    label: 'Total Residents',
                    color: Colors.white,
                    icon: Icons.circle_rounded,
                  ),
                ),
                ReusableCard(
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RequestListScreen())); // Action on Resident Requests
                  },
                  colour: const Color(0xFFec6a58),
                  height: 80.0,
                  width: 150.0,
                  cardChild: const IconContent(
                    cc: Color(0xFFec6a58),
                    content: '101',
                    label: 'Resident Requests',
                    color: Colors.white,
                    icon: Icons.circle_rounded,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ReusableCard(
                  onPress: () {
                    setState(() {}); // Action on Donations Received
                  },
                  height: 150.0,
                  width: 150.0,
                  colour: Colors.white,
                  cardChild: const CardContent(
                    icon: Icons.wallet,
                    label: 'Donations Received',
                    content: 'Rs 73000/-',
                    color: Colors.black,
                    c: Colors.orange,
                  ),
                ),
                ReusableCard(
                  onPress: () {
                    setState(() {}); // Action on Family Visit Requests
                  },
                  height: 150.0,
                  width: 150.0,
                  colour: Colors.white,
                  cardChild: const CardContent(
                    icon: CupertinoIcons.eye,
                    color: Colors.blue,
                    label: 'Family Visit Requests',
                    content: '12',
                    c: Colors.orange,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {}); // Action for Reminder List
                      },
                      colour: Colors.white,
                      cardChild: const Expanded(
                        child: ReminderList(), // Show the top 5 reminders here
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
