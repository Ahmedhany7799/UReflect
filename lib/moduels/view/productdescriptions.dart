import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/model_product.dart';
import '../../services/layout/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/reviewModelProduct.dart';
import '../widgets/UserReviewCard.dart';
import '../widgets/bottomnavigationbar.dart';
import '../widgets/componants/add_to_cart.dart';
import 'detailedproduct.dart';
import '../widgets/productReviews.dart';

class ProductDecription extends StatefulWidget {
  const ProductDecription({super.key, required this.model});

  @override
  State<ProductDecription> createState() => _ProductDecriptionState();

  //final Product product;
  final ProductModel model;
}

class _ProductDecriptionState extends State<ProductDecription> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          // title: Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       "${widget.product.title}",
          //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          //     ),
          //   ],
          // ),
          // centerTitle: true,
          leading: IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigationbar(),
                  )),
              icon: const Icon(Icons.arrow_back_ios)),

          backgroundColor: Colors.white,
          elevation: 0,

          bottom: const TabBar(
              indicatorColor: Color.fromRGBO(10, 207, 131, 1),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Text(
                    "Overview",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "ProtestRiot-Regular.ttf",
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Spacification",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "ProtestRiot-Regular.ttf",
                    ),
                  ),
                ),
              ]),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Overview(
              model: widget.model,
            ),
            DetailsScreen(
              model: widget.model,
            ),
          ],
        ),
      ),
    );
  }
}

class Overview extends StatefulWidget {
  const Overview({super.key, required this.model});
  //final Product product;
  final ProductModel model;

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);

    return Scaffold(
      bottomNavigationBar: AddToCart(model: widget.model),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.model.name}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  fontFamily: "ProtestRiot-Regular.ttf",
                  color: const Color.fromRGBO(10, 207, 131, 1),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                widget.model.name!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                  fontFamily: "ProtestRiot-Regular.ttf",
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            height: 180.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black),
                              color: Colors.grey.shade100,
                              image: DecorationImage(
                                image: NetworkImage(widget.model.image!),
                              ),
                              //color: const Color.fromRGBO(10, 207, 131, 1),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                            width: 30.w,
                          ),
                          Container(
                            height: 180.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black),
                              color: Colors.grey.shade100,
                              image: DecorationImage(
                                image:
                                    NetworkImage(widget.model.image.toString()),
                              ),
                              //color: const Color.fromRGBO(10, 207, 131, 1),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                            width: 30.w,
                          ),
                          Container(
                            height: 180.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black),
                              color: Colors.grey.shade100,
                              image: DecorationImage(
                                image:
                                    NetworkImage(widget.model.image.toString()),
                              ),
                              //color: const Color.fromRGBO(10, 207, 131, 1),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Review(${widget.model.views.toString()})",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontFamily: "ProtestRiot-Regular.ttf",
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Productreviews(),
                        )),
                    child: Text(
                      " See all >>",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color.fromRGBO(10, 207, 131, 1),
                        fontFamily: "ProtestRiot-Regular.ttf",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) => UserReview(
                    review: reviews[index],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(10, 207, 131, 1),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Add Review",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProtestRiot-Regular.ttf",
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Another Product",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontFamily: "ProtestRiot-Regular.ttf",
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromRGBO(10, 207, 131, 1),
                        size: 20,
                      )),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              // SizedBox(
              //   height: 160.h,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: 3,
              //     itemBuilder: (context, index) => Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 10),
              //       child: ItemCard(
              //         model: cubit.products[index],
              //         press: () => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => ProductDecription(
              //                     model: cubit.products[index],
              //                   )),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
