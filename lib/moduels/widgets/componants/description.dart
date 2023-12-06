import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import 'product_model.dart';

class Description extends StatefulWidget {
  const Description({super.key, required this.product});

  final Product product;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ReadMoreText(
        widget.product.description,
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimCollapsedText: "Show more",
        trimExpandedText: "Less",
        moreStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w800,
            color: Colors.blueAccent),
        lessStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w800,
            color: Colors.blueAccent),
      ),
    );
  }
}
