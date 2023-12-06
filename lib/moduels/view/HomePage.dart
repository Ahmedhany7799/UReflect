// ignore_for_file: file_names

import 'package:UReflect/moduels/view/viewAllProducts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../main.dart';
import '../widgets/Custom_ciculerContainer.dart';
import '../widgets/componants/cart.dart';
import '../widgets/componants/categories.dart';
import '../widgets/componants/product_model.dart';
import '../widgets/componants/detailedproduct.dart';
import '../widgets/componants/itemCard.dart';
import 'SearchPage2.dart';

// ignore: must_be_immutable
class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);
  static List previousSearches = [];

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  var intController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(
              //   image: AssetImage("assets/logo.png"),
              //   width: 35,
              //   height: 35,
              // ),
              Text(
                "Reflect",
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(10, 207, 131, 1)),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            Stack(children: [
              Positioned(
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 25,
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  child: Container(
                      width: 19,
                      height: 17,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(10, 207, 131, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: userToken == null
                              ? Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 13.sp, color: Colors.white),
                                )
                              : Text(
                                  "7",
                                  style: TextStyle(
                                      fontSize: 13.sp, color: Colors.white),
                                ))))
            ]),
          ],
          automaticallyImplyLeading: false,
        ),
        //backgroundColor: const Color(0xfFE9EBEA),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello !",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  "What are you looking for today?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),

                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchPage2())),
                      child: SizedBox(
                        width: 350.w,
                        child: const TSearchContainer(
                          text: "Search yaa bashaa...",
                          enabled: false,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 700.h,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Filter",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          "Categories",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),

                                        const Categories(),
                                        Text('Sort by',
                                            style: TextStyle(fontSize: 20.sp)),
                                        SizedBox(
                                          height: 5.h,
                                        ),

                                        const FilterChipExample(),
                                        //  filt2(),
                                        Text(
                                          "Price Range",
                                          style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 20.sp,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),

                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: intController,
                                                decoration: InputDecoration(
                                                  labelText: "Min Price",
                                                  labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    //fontWeight: FontWeight.bold,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                              child: TextFormField(
                                                controller: intController,
                                                decoration: InputDecoration(
                                                  labelText: "max Price",
                                                  labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(19),
                                            color: const Color.fromRGBO(
                                                10, 207, 131, 1),
                                          ),
                                          child: MaterialButton(
                                            onPressed: () {},
                                            minWidth: double.infinity,
                                            child: Text(
                                              "Apply Filter",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.sp,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              );
                            });
                      },
                      icon: const Icon(Icons.sort),
                      iconSize: 35,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "   Popular Categories",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    height: 80.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: const [
                              CategorieCard(
                                image: 'assets/CategoriesIcon/shirt.png',
                                type: "T-Shirt",
                              ),
                              CategorieCard(
                                image: 'assets/CategoriesIcon/jeans.png',
                                type: "Jeans",
                              ),
                              CategorieCard(
                                image: 'assets/CategoriesIcon/jacket.png',
                                type: "Jacket",
                              ),
                              CategorieCard(
                                image: 'assets/CategoriesIcon/dress.png',
                                type: "dress",
                              ),
                              CategorieCard(
                                image: 'assets/CategoriesIcon/shose.png',
                                type: "Shose",
                              ),
                              CategorieCard(
                                image:
                                    'assets/CategoriesIcon/icons8-bowling-game-100.png',
                                type: "Sport",
                              ),
                              CategorieCard(
                                image: 'assets/icons/coupon.png',
                                type: "Coupons",
                              ),
                            ],
                          );
                        }),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CarouselSlider(
                      items: const [
                        BannerImage(
                          banImg: 'assets/products/promo-banner-1.png',
                        ),
                        BannerImage(
                          banImg: 'assets/products/promo-banner-2.png',
                        ),
                        BannerImage(
                          banImg: 'assets/products/promo-banner-3.png',
                        ),
                      ],
                      options: CarouselOptions(
                        viewportFraction: 2,
                        autoPlay: true,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      CircullerContainer(
                        width: 25.w,
                        height: 5.h,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor: const Color.fromRGBO(10, 207, 131, 1),
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
                      "Trends",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ViewAllProducts()));
                        },
                        child: Text(
                          "view all",
                          style: TextStyle(
                              fontSize: 17.sp, color: Colors.blueGrey),
                        )),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // CurvedEdgeWidget(
                //   child: Container(
                //     color: const Color.fromRGBO(0, 101, 111, 1),
                //     child: SizedBox(
                //       height: 350,
                //       child: Stack(
                //         children: [
                //           Positioned(
                //             top: -200,
                //             right: -250,
                //             child: CircullerContainer(
                //               backgroundColor: Colors.white.withOpacity(0.1),
                //             ),
                //           ),
                //           Positioned(
                //             top: 40,
                //             right: -300,
                //             child: CircullerContainer(
                //               backgroundColor: Colors.white.withOpacity(0.1),
                //             ),
                //           ),
                //           Column(
                //             children: [
                //               TAppBar(
                //                 title: Column(
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   children: const [
                //                     Text(
                //                       "Hello !",
                //                       textAlign: TextAlign.center,
                //                       style: TextStyle(
                //                         color: Colors.grey,
                //                         fontWeight: FontWeight.bold,
                //                         fontSize: 12,
                //                       ),
                //                     ),
                //                     Text(
                //                       "Ahmed Hany",
                //                       style: TextStyle(
                //                         color: Colors.white,
                //                         fontWeight: FontWeight.bold,
                //                         fontSize: 20,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 actions: [
                //                   Stack(
                //                     children:[ IconButton( onPressed: () {  }, icon: const Icon(Icons.shopping_bag,size: 25,color: Colors.white,),

                //                     ),

                //                   Positioned(
                //                    right: 0,
                //                     child: Container(
                //                       width: 19,
                //                       height: 17,
                //                     decoration: const BoxDecoration(
                //                       color: Colors.black,
                //                       shape: BoxShape.circle,
                //                     ),
                //                     child: const Center(child: Text("2",style: TextStyle(fontSize: 13,color: Colors.white),))))
                //                    ] ),
                //                 ],

                //               ),

                //               const TSearchContainer(
                //                 text: "Search yaa bashaa...",
                //               ),

                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: Column(
                //     children: [

                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
    this.width = double.infinity,
    this.height,
    required this.banImg,
    this.border,
    this.backgroundColor = Colors.white,
    this.fit,
    this.padding,
    this.oNPressed,
    this.borderRadius,
    this.applyraduis = true,
  });

  final double? width, height;
  final bool applyraduis;
  final String banImg;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsets? padding;
  final VoidCallback? oNPressed;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: oNPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage(
              banImg,
            ),
            fit: fit,
          ),
        ),
      ),
    );
  }
}

class CategorieCard extends StatelessWidget {
  const CategorieCard({
    super.key,
    required this.image,
    this.type,
    this.ontap,
  });

  final String? image;
  final String? type;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(left: 18.w),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                    image: AssetImage(image!),
                    fit: BoxFit.cover,
                    color: const Color.fromRGBO(10, 207, 131, 1)),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
                width: 55.w,
                child: Text(
                  type!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ),
    );
  }
}

class TSearchContainer extends StatefulWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search,
    this.showBackground = true,
    this.showBorder = true,
    required this.enabled,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder, enabled;

  @override
  State<TSearchContainer> createState() => _TSearchContainerState();
}

class _TSearchContainerState extends State<TSearchContainer> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Center(
        child: TextFormField(
          controller: searchController,
          onTap: () => searchController.clear(),
          onChanged: (pure) {
            setState(() {});
          },
          onEditingComplete: () {
            MainHomeScreen.previousSearches.add(searchController.text);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MainHomeScreen()));
          },
          decoration: InputDecoration(
            filled: true,
            enabled: widget.enabled,
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: searchController.text.isEmpty
                ? null
                : const Icon(Icons.cancel_sharp),
            hintText: "Search yaa bashaa....",
            hintStyle: TextStyle(
              fontSize: 15.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
