// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CircullerContainer extends StatelessWidget {
  const CircullerContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.padding,
    this.radius = 400,
    this.child,
    this.backgroundColor = Colors.white,
    this.margin,
  });
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double radius;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}
