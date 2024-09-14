import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final Function()? onPress;
  final double? height;
  final double? width;
  const ReusableCard(
      {super.key,
      required this.colour,
      this.cardChild,
      this.onPress,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: height,
        width: width,
        child: cardChild,
      ),
    );
  }
}
