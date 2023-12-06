import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../componants/cart_counter.dart';
import '../componants/product_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
    required this.press,
  });

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          SizedBox(
            // width: double.infinity,
            height: 150.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150.w,
                  height: 150.h,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Hero(
                    tag: "${product.id}",
                    child: Image.asset(product.image),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20 / 4),
                      child: Text(
                        product.title,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        // Text(
                        //   "\$${product.discount}",
                        //   style: const TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),
                        // ),

                        // const SizedBox(width: 10,),
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       Icons.star,
                    //       color: Colors.amber,
                    //       size: 18,
                    //     ),
                    //     const SizedBox(
                    //       width: 2,
                    //     ),
                    //     Text.rich(TextSpan(children: [
                    //       TextSpan(
                    //           text: "${product.rating}",
                    //           style: Theme.of(context).textTheme.bodyLarge),
                    //     ])),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     Text("${product.reviewsNum}" " Reviews"),
                    //   ],
                    // ),
                    //           Container(
                    //             width: 120,
                    //             height: 40,
                    //             child: ElevatedButton(
                    //               onPressed: () {
                    //                 Navigator.push(context,
                    //                     MaterialPageRoute(builder: (context) => cart()));
                    //               },
                    //               style: ElevatedButton.styleFrom(
                    //                 //minimumSize: const Size(double.infinity, 30),
                    //                 backgroundColor: const Color.fromRGBO(0, 101, 111, 1),
                    //                 shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(18)),
                    //                 //backgroundColor: product.color,
                    //               ),
                    //               child: Text(
                    //                 "Add to cart".toUpperCase(),
                    //                 style: const TextStyle(
                    //                   // fontWeight: FontWeight.bold,
                    //                   color: Colors.white,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 55.h,
            right: 07.w,
            child: Row(
              children: [
                const CartCountdetail(),
                SizedBox(
                  width: 30.w,
                ),
                Container(
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle),
                  width: 40.w,
                  height: 40.h,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.delete_outline)),
                ),
              ],
            ),

            // Row(
            //   children: [
            //     // Icon(
            //     //   Icons.star,
            //     //   color: Colors.yellow,
            //     //   size: 20,
            //     // ),
            //     SizedBox(width: 4),
            //     Text(
            //       product.rating.toString(),
            //       style: TextStyle(
            //         fontSize: 15,
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}