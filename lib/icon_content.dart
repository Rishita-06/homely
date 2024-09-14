import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final Color? color;
  final Color? cc;
  final String? content;
  final double? t;
  final double? l;

  const IconContent(
      {super.key,
      this.icon,
      this.label,
      this.color,
      this.cc,
      this.content,
      this.t,
      this.l});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 5.0,
            top: 20.0,
          ),
          child: Text(
            label ?? '',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            const SizedBox(
              width: 110.0,
            ),
            Stack(
              children: [
                Icon(
                  icon,
                  size: 30.0,
                  color: color,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 6.0,
                  ),
                  child: Text(
                    content ?? '',
                    style: TextStyle(
                      color: cc,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
