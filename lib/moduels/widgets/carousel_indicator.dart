import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'banner.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    super.key,
    required this.bannerImage,
    required CarouselController carouselController,
    required this.currentCarousel,
  }) : _carouselController = carouselController;

  final List<BannerWidget> bannerImage;
  final CarouselController _carouselController;
  final int currentCarousel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: bannerImage.asMap().entries.map((e) {
        return GestureDetector(
          onTap: () => _carouselController.animateToPage(e.key),
          child: Container(
            width: 6.w,
            height: 7.h,
            margin: EdgeInsets.symmetric(
              vertical: 5.h,
              horizontal: 2.w,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black
                  .withOpacity(currentCarousel == e.key ? 0.5 : 0.3),
            ),
          ),
        );
      }).toList(),
    );
  }
}
