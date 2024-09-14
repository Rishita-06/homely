import 'package:flutter/material.dart';
import 'package:homely/reusable_card.dart';
import 'package:homely/icon_content.dart';
import 'package:homely/card_content.dart';
import 'package:flutter/cupertino.dart';

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
      appBar: AppBar(
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFf9f9f9),
      ),
      body: Column(
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
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  onPress: () {
                    setState(() {});
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
                    setState(() {});
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
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {});
                    },
                    colour: Colors.white,
                    cardChild: const CardContent(
                      icon: Icons.wallet,
                      label: 'Donations Received',
                      content: 'Rs 73000/-',
                      color: Colors.black,
                      c: Colors.orange,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {});
                    },
                    colour: Colors.white,
                    cardChild: const CardContent(
                      icon: CupertinoIcons.eye,
                      color: Colors.blue,
                      label: 'Family Visit Requests',
                      content: '12',
                      c: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {});
                    },
                    colour: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {});
                    },
                    colour: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
