import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class containerdata extends StatelessWidget {
  const containerdata(
      {super.key,
      required this.text,
      required this.image,
      required this.ontap,
      required this.color});
  final String image;
  final Color color;
  final String text;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 240,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Center(
                child: Image.asset(
              image,
              height: 190,
              width: 130,
            ))
          ],
        ),
      ),
    );
  }
}
