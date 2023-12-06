import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';

class CartCounter extends StatelessWidget {
  const CartCounter(
      {super.key, required this.oNpressed, required this.iconColor});
  final Color iconColor;
  final VoidCallback oNpressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: oNpressed,
            icon: Icon(
              Icons.shopping_bag,
              color: iconColor,
            )),
        Positioned(
            child: Container(
          width: 17.w,
          height: 17.h,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: userToken == null
                ? const Text("")
                : Text(
                    "6",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                    ),
                  ),
          ),
        ))
      ],
    );
  }
}
