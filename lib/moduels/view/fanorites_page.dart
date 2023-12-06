import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';
import '../widgets/componants/categories.dart';
import '../widgets/componants/detailedproduct.dart';
import '../widgets/componants/product_model.dart';
import '../widgets/componants/product_vertical.dart';
import 'loginPage.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userToken == null
          ? Column(
              children: [
                SizedBox(
                  height: 70.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                        child: Text("    Wishlist",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold))),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ))
                  ],
                ),
                SizedBox(
                  height: 300.h,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "If you have an account?",
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        child: Text(
                          "login here",
                          style: TextStyle(
                            fontSize: 20.sp,
                            decoration: TextDecoration.underline,
                            color: const Color.fromRGBO(10, 207, 131, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Categories(),

                  // const Image(image: AssetImage("assets/111.png")),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      //  physics: const ScrollPhysics(),
                      itemCount: likedProduct.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 20,
                        //crossAxisSpacing: 20,
                        childAspectRatio: 2.85,
                      ),
                      itemBuilder: (context, index) => ItemCardVertical(
                        product: likedProduct[index],
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

// Padding(
//   padding: EdgeInsets.all(16),

//   child:   Column(
//     children: [
//       Row(

//         children: [

//       ProductCard(imageUrl: "assets/products/tracksuit_blue.png", price: 225, isFavorite: true, rating: 3),

//               ProductCard(imageUrl: "assets/products/tracksuit_blue.png", price: 225, isFavorite: true, rating: 3),

//         ],

//       ),

//        Row(

//         children: [

//       ProductCard(imageUrl: "assets/products/tracksuit_blue.png", price: 225, isFavorite: true, rating: 3),

//               ProductCard(imageUrl: "assets/products/tracksuit_blue.png", price: 225, isFavorite: true, rating: 3),

//         ],

//       ),
//        Row(

//         children: [

//       ProductCard(imageUrl: "assets/products/tracksuit_blue.png", price: 225, isFavorite: true, rating: 3),

//               ProductCard(imageUrl: "assets/products/tracksuit_blue.png", price: 225, isFavorite: true, rating: 3),

//         ],

//       ),
//        Row(

//         children: [

//       ProductCard(imageUrl: "assets/products/tracksuit_blue.png", price: 225, isFavorite: true, rating: 3),

//               ProductCard(imageUrl: "assets/products/tracksuit_blue.png", price: 225, isFavorite: true, rating: 3),

//         ],

//       ),
                ],
              ),

              //
              // GridView.builder(
              //   shrinkWrap: true,
              //    scrollDirection: Axis.vertical,
              //   clipBehavior: Clip.none,
              //   gridDelegate:
              // SliverGridDelegateWithFixedCrossAxisCount(

              //   crossAxisSpacing: 10,
              //   crossAxisCount: 2,childAspectRatio: 1.7,), itemBuilder: (context,index){
              //   return   ProductCard(imageUrl: "assets/products/tracksuit_blue.png", price: 225, isFavorite: true, rating: 3);

              // })
            ),
    );
  }
}
