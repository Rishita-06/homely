import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final Color? color;

  const IconContent({super.key, this.icon, this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0, top: 20.0),
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
                    '240',
                    style: TextStyle(
                      color: color,
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
