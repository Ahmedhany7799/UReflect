import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/layout/layout_cubit/layout_cubit.dart';
import '../../services/layout/layout_cubit/layout_states.dart';
import 'productReviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import '../../models/reviewModelProduct.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';

class UserReview extends StatefulWidget {
  const UserReview({required this.review});
  final RatingReviewmodel review;
  //final User userReview;
  // final Reviews reeview;

  @override
  State<UserReview> createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
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
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert)),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    RatingbarIdnticator(rating: widget.review.rating.toInt()),
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
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  height: 70.h,
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
                            "Vendor",
                            style: TextStyle(
                              fontSize: 19.sp,
                              color: const Color.fromRGBO(10, 207, 131, 1),
                            ),
                          ),
                          Text(
                            widget.review.vendorDate,
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      ReadMoreText(
                        "Thank you.Have a nice day, Sir",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
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
                  height: 15.h,
                )
              ],
            ),
          );
        });
  }
}
