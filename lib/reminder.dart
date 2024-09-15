import 'package:flutter/material.dart';

class Reminder extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final String? content;
  final Color? color;
  final Color? c;
  const Reminder(
      {super.key, this.icon, this.label, this.content, this.color, this.c});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 10.0,
            ),
            child: Text(
              'Reminders',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Row(
          children: [
            SizedBox(
              width: 30.0,
            ),
            Text(
              'Resident',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 50.0,
            ),
            Text(
              'Reminders',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 50.0,
            ),
            Text(
              'Severity',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        Container(
          color: const Color(0xFFd1cfd7),
          child: const SizedBox(
            height: 2.0,
            width: 500.0,
          ),
        ),
        const Row(
          children: [
            SizedBox(
              width: 30.0,
            ),
            Text(
              'Ramesh D.',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 40.0,
            ),
            Text(
              'Give Alzhe....',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 50.0,
            ),
            Icon(
              Icons.circle_rounded,
              size: 15.0,
              color: Colors.green,
            ),
          ],
        ),
        Container(
          color: const Color(0xFFd1cfd7),
          child: const SizedBox(
            height: 1.0,
            width: 500.0,
          ),
        ),
        const Row(
          children: [
            SizedBox(
              width: 30.0,
            ),
            Text(
              'Devendra K.',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 26.0,
            ),
            Text(
              'Physiothera...',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 50.0,
            ),
            Icon(
              Icons.circle_rounded,
              size: 15.0,
              color: Colors.blue,
            ),
          ],
        ),
        Container(
          color: const Color(0xFFd1cfd7),
          child: const SizedBox(
            height: 1.0,
            width: 500.0,
          ),
        ),
        const Row(
          children: [
            SizedBox(
              width: 30.0,
            ),
            Text(
              'Kanti B.',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 50.0,
            ),
            Text(
              'Asthma Med..',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 51.0,
            ),
            Icon(
              Icons.circle_rounded,
              size: 15.0,
              color: Colors.orange,
            ),
          ],
        ),
        Container(
          color: const Color(0xFFd1cfd7),
          child: const SizedBox(
            height: 1.0,
            width: 500.0,
          ),
        ),
        const Row(
          children: [
            SizedBox(
              width: 30.0,
            ),
            Text(
              'Shanta S.',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 40.0,
            ),
            Text(
              'Bypass Upco..',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 49.0,
            ),
            Icon(
              Icons.circle_rounded,
              size: 15.0,
              color: Colors.red,
            ),
          ],
        ),
        Container(
          color: const Color(0xFFd1cfd7),
          child: const SizedBox(
            height: 1.0,
            width: 500.0,
          ),
        ),
        const Row(
          children: [
            SizedBox(
              width: 30.0,
            ),
            Text(
              'Ravinder',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 44.0,
            ),
            Text(
              'Give Diabete...',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 49.0,
            ),
            Icon(
              Icons.circle_rounded,
              size: 15.0,
              color: Colors.yellow,
            ),
          ],
        ),
        Container(
          color: const Color(0xFFd1cfd7),
          child: const SizedBox(
            height: 1.0,
            width: 500.0,
          ),
        ),
        const Row(
          children: [
            SizedBox(
              width: 30.0,
            ),
            Text(
              'Rajesh k.',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 40.0,
            ),
            Text(
              'Bp check-up..',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 56.0,
            ),
            Icon(
              Icons.circle_rounded,
              size: 15.0,
              color: Colors.green,
            ),
          ],
        ),
        Container(
          color: const Color(0xFFd1cfd7),
          child: const SizedBox(
            height: 1.0,
            width: 500.0,
          ),
        ),
        const Row(
          children: [
            SizedBox(
              width: 30.0,
            ),
            Text(
              'Reena S.',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 40.0,
            ),
            Text(
              ' Physiother....',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 61.0,
            ),
            Icon(
              Icons.circle_rounded,
              size: 15.0,
              color: Colors.red,
            ),
          ],
        ),
        Container(
          color: const Color(0xFFd1cfd7),
          child: const SizedBox(
            height: 1.0,
            width: 500.0,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: [
              SizedBox(
                width: 270.0,
              ),
              Text(
                'ALL',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
              )
            ],
          ),
        )
      ],
    );
  }
}
