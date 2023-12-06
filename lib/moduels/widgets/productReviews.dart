// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/reviewModelProduct.dart';
import '../../utils/constants/sizes.dart';
import 'UserReviewCard.dart';

class Productreviews extends StatelessWidget {
  const Productreviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const TAppBar(title: Text("Reviews"),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new)),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  "Reviews & Ratings",
                  style:
                      TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            const Text(
                "Ratings and Reviews are verified and from people who use the same type of device that you use.Share your rating and review. "),
            SizedBox(
              height: 16.h,
            ),
            const OverallProductrating(),
            const RatingbarIdnticator(
              rating: 4.8,
            ),
            Text(
              "12.611",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                //  physics: const ScrollPhysics(),
                itemCount: reviews.length,

                itemBuilder: (context, index) => UserReview(
                  review: reviews[index],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class RatingbarIdnticator extends StatelessWidget {
  const RatingbarIdnticator({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: Colors.grey,
      itemBuilder: (BuildContext context, int index) => const Icon(
        Icons.star_rate,
        color: Color.fromRGBO(10, 207, 131, 1),
      ),
    );
  }
}

class OverallProductrating extends StatelessWidget {
  const OverallProductrating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '4.8',
              style: Theme.of(context).textTheme.displayLarge,
            )),
        Expanded(
          flex: 7,
          child: Column(
            children: const [
              RatingProgressIndicator(
                text: '5',
                value: 1.0,
              ),
              RatingProgressIndicator(
                text: '4',
                value: 0.8,
              ),
              RatingProgressIndicator(
                text: '3',
                value: 0.6,
              ),
              RatingProgressIndicator(
                text: '2',
                value: 0.4,
              ),
              RatingProgressIndicator(
                text: '1',
                value: 0.2,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        Expanded(
            flex: 11,
            child: SizedBox(
              width: MediaQuery.of(context).devicePixelRatio * 0.8,
              child: LinearProgressIndicator(
                value: value,
                minHeight: 7,
                // borderRadius:BorderRadius.circular(7),
                backgroundColor: Colors.grey,

                valueColor: const AlwaysStoppedAnimation(
                  Color.fromRGBO(10, 207, 131, 1),
                ),
              ),
            )),
      ],
    );
  }
}
