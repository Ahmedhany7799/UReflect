// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/componants/add_to_cart.dart';
import '../widgets/componants/detailedproduct.dart';
import '../widgets/componants/product_model.dart';
import '../widgets/productReviews.dart';
import 'HomePage.dart';

class ProductOverview extends StatefulWidget {
  const ProductOverview({super.key, required this.product});
  final Product product;

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return SingleChildScrollView(
      child: Scaffold(
        bottomNavigationBar: AddToCart(product: widget.product),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
            Text(
              "Shirts",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(10, 207, 131, 1),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Shirts",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(10, 207, 131, 1),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TabBar(
                indicatorColor: const Color.fromRGBO(10, 207, 131, 1),
                controller: tabController,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                tabs: const [
                  Tab(
                    text: 'Overview',
                  ),
                  Tab(
                    text: 'Spacification',
                  ),
                ]),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CarouselSlider(
                          items: [
                            BannerImage(
                              width: 400.w,
                              height: 200.h,
                              banImg: 'assets/products/promo-banner-1.png',
                            ),
                            BannerImage(
                              width: 400.w,
                              height: 200.h,
                              banImg: 'assets/products/promo-banner-2.png',
                            ),
                            BannerImage(
                              width: 400.w,
                              height: 200.h,
                              banImg: 'assets/products/promo-banner-3.png',
                            ),
                          ],
                          options: CarouselOptions(
                            viewportFraction: 2,
                            autoPlay: true,
                          )),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reviews(199)",
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.right,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Productreviews()));
                                },
                                child: const Text(
                                  "See All Reviews",
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ],
                        ),
                        const Productreviews(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Icon(Icons.edit),
                                      Text("Add Review")
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reviews(199)",
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.right,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Productreviews()));
                                },
                                child: const Text(
                                  "See All Reviews",
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CarouselSlider(
                              items: [
                                BannerImage(
                                  width: 400.w,
                                  height: 200.h,
                                  banImg: 'assets/products/promo-banner-1.png',
                                ),
                                BannerImage(
                                  width: 400.w,
                                  height: 200.h,
                                  banImg: 'assets/products/promo-banner-2.png',
                                ),
                                BannerImage(
                                  width: 400.w,
                                  height: 200.h,
                                  banImg: 'assets/products/promo-banner-3.png',
                                ),
                              ],
                              options: CarouselOptions(
                                viewportFraction: 2,
                                autoPlay: true,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                DetailsScreen(
                  product: widget.product,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
