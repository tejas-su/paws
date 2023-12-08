import 'package:flutter/material.dart';
import '../themes/themes.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.radius = 35,
      this.color = containerColor,
      this.height = 340,
      required this.child,
      this.width,
      this.right = 20,
      this.left = 20});
  final double radius;
  final Color? color;
  final double right;
  final double left;
  final double height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: right, left: left),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
