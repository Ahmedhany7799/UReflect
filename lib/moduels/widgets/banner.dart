import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWidget extends StatelessWidget {
  final String text, image, btnText;
  final TextDirection textDirection;
  final double imgWidth;
  final Color titleColor, backgroundColor, buttonColor, btnBgColor;

  const BannerWidget({
    super.key,
    required this.text,
    required this.image,
    required this.btnText,
    required this.textDirection,
    required this.imgWidth,
    required this.titleColor,
    required this.backgroundColor,
    required this.buttonColor,
    required this.btnBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, right: 16.0.w, left: 16.w),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            textDirection: textDirection,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 60.h,
                ),
                child: Container(
                  color: Colors.grey,
                  width: 50.w,
                  height: 40.h,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: titleColor,
                    ),
                  ),
                ),
              ),
              Image.asset(
                image,
                alignment: Alignment.bottomRight,
                fit: BoxFit.cover,
                width: imgWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
