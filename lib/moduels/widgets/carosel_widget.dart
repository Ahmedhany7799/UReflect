import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'banner.dart';

class CarouselWidget extends StatefulWidget {
  final CarouselController carouselController;
  final Function(int) onPageChanged;
  final List<BannerWidget> bannerImage;

  const CarouselWidget({
    super.key,
    required this.carouselController,
    required this.onPageChanged,
    required this.bannerImage,
  });

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: widget.carouselController,
      options: CarouselOptions(
        viewportFraction: 1.0,
        aspectRatio: 21 / 9.75,
        autoPlay: true,
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          widget.onPageChanged(index);
        },
      ),
      items: widget.bannerImage,
    );
  }
}
