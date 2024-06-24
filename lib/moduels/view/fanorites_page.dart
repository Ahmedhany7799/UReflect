/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';
import '../../services/layout/layout_cubit/layout_cubit.dart';
import '../../services/layout/layout_cubit/layout_states.dart';
import '../widgets/componants/cart.dart';
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
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: userToken != null
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
                                    fontFamily: "ProtestRiot-Regular.ttf",
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold))),
                        IconButton(
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen())),
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
                      SizedBox(
                        height: 50.h,
                      ),
                      const Categories(),

                      // const Image(image: AssetImage("assets/111.png")),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          //  physics: const ScrollPhysics(),
                          // itemCount: likedProduct.length,
                          itemCount: cubit.favorites.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 20,
                            //crossAxisSpacing: 20,
                            childAspectRatio: 2.85,
                          ),
                          itemBuilder: (context, index) => ItemCardVertical(
                            //  product: likedProduct[index],
                            model: cubit.favorites[index],
                            press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  model: cubit.favorites[index],
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
      },
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';
import '../../services/layout/layout_cubit/layout_cubit.dart';
import '../../services/layout/layout_cubit/layout_states.dart';
import 'loginPage.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: userToken == null
                ? Center(
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
                  )
                : Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 12.5),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 7.5, horizontal: 12),
                              prefixIcon: const Icon(Icons.search),
                              hintText: "Search",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 12.5),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        cubit.favorites[index].image!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              cubit.favorites[index].name!,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 16.5,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    "${cubit.favorites[index].price!} \$"),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${cubit.favorites[index].price!} \$",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            MaterialButton(
                                              onPressed: () {
                                                // add | remove
                                                cubit.addOrRemoveFromFavorites(
                                                    productID: cubit
                                                        .favorites[index].id
                                                        .toString());
                                              },
                                              child: Text("Remove"),
                                              textColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ));
      },
    );
  }
}
