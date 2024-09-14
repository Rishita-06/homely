import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final String? content;
  final Color? color;
  final Color? c;
  const CardContent(
      {super.key, this.icon, this.label, this.content, this.color, this.c});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70.0,
          color: color,
        ),
        Text(
          label ?? '',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        Text(
          content ?? '',
          style: TextStyle(
            color: c,
          ),
        ),
      ],
    );
  }
}
