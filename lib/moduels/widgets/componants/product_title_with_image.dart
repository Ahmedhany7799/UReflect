import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/model_product.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'RoundedImage.dart';

class ProductTitleWithImage extends StatefulWidget {
  const ProductTitleWithImage({super.key, required this.model});

  //final Product product;
  final ProductModel model;

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
              bottom: 720.h,
              left: 100.w,
              child: SizedBox(
                height: 40.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300,
                      image: DecorationImage(
                        image: NetworkImage(widget.model.image.toString()),
                      ),
                      //color: const Color.fromRGBO(10, 207, 131, 1),
                    ),
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
                  widget.model.name!,
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
                            text: "\$${widget.model.price}",
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
                        tag: "${widget.model.id}",
                        child: Image.network(
                          widget.model.image.toString(),
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
