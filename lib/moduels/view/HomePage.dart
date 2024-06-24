import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ureflect/moduels/view/viewAllProducts.dart';
import '../../main.dart';
import '../../services/layout/layout_cubit/layout_cubit.dart';
import '../../services/layout/layout_cubit/layout_states.dart';
import '../widgets/Custom_ciculerContainer.dart';
import 'CategoriesHomepage/ShirtsPage.dart';
import '../widgets/componants/cart.dart';
import '../widgets/componants/categories.dart';
import '../widgets/componants/itemCard.dart';
import 'SearchPage2.dart';
import 'productdescriptions.dart';

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
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "UReflect",
                  style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProtestRiot-Regular.ttf",
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
                        width: 19.w,
                        height: 17.h,
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
                                    cubit.carts.length.toString(),
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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello !",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProtestRiot-Regular.ttf",
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
                          width: 335.w,
                          child: const TSearchContainer(
                            text: "Search yaa bashaa...",
                            enabled: false,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 510.h,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
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
                                            height: 5.h,
                                          ),
                                          Text(
                                            "Category",
                                            style: TextStyle(
                                                fontSize: 25.sp,
                                                color: Colors.black),
                                          ),
                                          const Categories(),
                                          Text('Sort By',
                                              style:
                                                  TextStyle(fontSize: 25.sp)),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          const FilterChipExample(),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            "Price Range",
                                            style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                fontSize: 25.sp,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: intController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    labelText: "Min Price",
                                                    labelStyle: TextStyle(
                                                      //fontWeight: FontWeight.bold,
                                                      fontSize: 20.sp,
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
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    labelText: "Max Price",
                                                    labelStyle: TextStyle(
                                                      // fontWeight: FontWeight.bold,
                                                      fontSize: 20.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 9.h,
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
                        child: Container(
                          width: 60.w,
                          height: 37.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            // color: const Color.fromRGBO(10, 207, 131, 1),
                          ),
                          child: SvgPicture.asset(
                            "assets/filter.svg",
                          ),
                        ),
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
                          "  Popular Categories",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProtestRiot-Regular.ttf",
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                CategorieCard(
                                  image: 'assets/CategoriesIcon/shirt.png',
                                  type: "T-Shirt",
                                  ontappeed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ShirtsPage()),
                                  ),
                                ),
                                const CategorieCard(
                                  image: 'assets/icons/1.png',
                                  type: "Disabled",
                                ),
                                const CategorieCard(
                                  image: 'assets/CategoriesIcon/jeans.png',
                                  type: "Jeans",
                                ),
                                const CategorieCard(
                                  image: 'assets/CategoriesIcon/jacket.png',
                                  type: "Jacket",
                                ),
                                const CategorieCard(
                                  image: 'assets/CategoriesIcon/dress.png',
                                  type: "dress",
                                ),
                                const CategorieCard(
                                  image: 'assets/CategoriesIcon/shose.png',
                                  type: "Shose",
                                ),
                                const CategorieCard(
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
                          backgroundColor:
                              const Color.fromRGBO(10, 207, 131, 1),
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
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProtestRiot-Regular.ttf",
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
                    child: cubit.products.isEmpty
                        ? Center(
                            child: LoadingAnimationWidget.threeRotatingDots(
                              color: const Color.fromRGBO(10, 207, 131, 1),
                              size: 50,
                            ),
                          )
                        : GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.filteredProducts.isEmpty
                                ? cubit.products.length
                                : cubit.filteredProducts.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) => ItemCard(
                              model: cubit.filteredProducts.isEmpty
                                  ? cubit.products[index]
                                  : cubit.filteredProducts[index],
                              press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDecription(
                                          model: cubit.filteredProducts.isEmpty
                                              ? cubit.products[index]
                                              : cubit.filteredProducts[index],
                                        )),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
    this.ontappeed,
  });

  final String? image;
  final String? type;
  final void Function()? ontappeed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontappeed,
      child: Padding(
        padding: EdgeInsets.only(left: 18.w),
        child: Column(
          children: [
            Container(
              width: 70.w,
              height: 60.h,
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
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
          child: Center(
            child: TextFormField(
              controller: searchController,
              onTap: () => searchController.clear(),
              onChanged: (input) {
                cubit.filterProducts(input: input);
              },
              onEditingComplete: () {
                MainHomeScreen.previousSearches.add(searchController.text);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainHomeScreen()));
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
                  fontSize: 18.sp,
                  fontFamily: "ProtestRiot-Regular.ttf",
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
      },
    );
  }
}
