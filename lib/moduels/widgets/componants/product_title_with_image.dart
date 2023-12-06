import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'RoundedImage.dart';
import 'product_model.dart';

class ProductTitleWithImage extends StatefulWidget {
  const ProductTitleWithImage({super.key, required this.product});

  final Product product;

  @override
  State<ProductTitleWithImage> createState() => _ProductTitleWithImageState();
}

class _ProductTitleWithImageState extends State<ProductTitleWithImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              right: 20.w,
              bottom: 620.h,
              left: 100.w,
              child: SizedBox(
                height: 70.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => RoundedImage(
                    imageUrl: "assets/products/leather_jacket_2.png",
                    width: 80.w,
                    height: 200.h,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.dark
                        : TColors.dark,
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: 20,
                    padding: const EdgeInsets.all(4),
                  ),
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 16.w,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.product.title,
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: "Price: \n ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: "\$${widget.product.price}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Hero(
                        tag: "${widget.product.id}",
                        child: Image.asset(
                          widget.product.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
