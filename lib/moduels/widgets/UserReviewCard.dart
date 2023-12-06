// ignore_for_file: file_names

import 'productReviews.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../models/reviewModelProduct.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class UserReview extends StatefulWidget {
  const UserReview({super.key, required this.review});
  final RatingReviewmodel review;

  @override
  State<UserReview> createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.review.img),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  widget.review.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            RatingbarIdnticator(rating: widget.review.rating),
            SizedBox(
              width: 10.w,
            ),
            Text(
              widget.review.date,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        ReadMoreText(
          widget.review.comment,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: "show less",
          trimCollapsedText: "show more",
          moreStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(10, 207, 131, 1),
          ),
          lessStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(10, 207, 131, 1),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: 120.h,
          decoration: BoxDecoration(
            color: THelperFunctions.isDarkMode(context)
                ? TColors.darkGrey
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: TColors.borderPrimary),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vendor ",
                    style: TextStyle(
                      fontSize: 19.sp,
                    ),
                  ),
                  Text(
                    "04 Nov,2023 ",
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              ReadMoreText(
                "El montag mia el mia bs yaa reet ybcaa  fy aloan tania .Well done!",
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: "show less",
                trimCollapsedText: "show more",
                moreStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(10, 207, 131, 1),
                ),
                lessStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(10, 207, 131, 1),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 32.h,
        )
      ],
    );
  }
}
