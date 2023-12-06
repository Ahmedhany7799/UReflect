// ignore_for_file: file_names

import 'product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: 150.w,
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
              ),
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "${product.rating}",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ])),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text("${product.reviewsNum}" " Reviews"),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 160,
            right: 22,
            child: Container(
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle),
                width: 40.w,
                height: 30.h,
                child: userToken == null
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border_outlined),
                      )
                    : IconButton(
                        onPressed: () {},
                        icon: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: product.isFavorite ? Colors.red : Colors.grey,
                          size: 25,
                        ),
                      )),

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
