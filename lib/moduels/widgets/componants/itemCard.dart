import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/model_product.dart';
import '../../../services/layout/layout_cubit/layout_cubit.dart';
import '../../../services/layout/layout_cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    // required this.product,
    required this.press,
    required this.model,
  });

  //final Product product;
  final VoidCallback press;
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);

    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
                        // color: const Color.fromRGBO(235, 235, 235, 1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color.fromRGBO(10, 207, 131, 1),
                        ),
                        color: Colors.grey.shade100,
                      ),
                      child: Hero(
                        tag: "${model.id}",
                        child: Image.network(model.image.toString()),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20 / 4),
                    child: Text(
                      model.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${model.id}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$${model.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "${model.price!}",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ])),
                      Text("${model.views}" " Reviews"),
                    ],
                  ),
                ],
              ),
              Positioned(
                  bottom: 170,
                  right: 25,
                  child: Container(
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle),
                      width: 40.w,
                      height: 30.h,
                      child: GestureDetector(
                        child: Icon(
                          Icons.favorite,
                          size: 20,
                          color: cubit.favoritesID.contains(model.id.toString())
                              ? Colors.red
                              : Colors.grey,
                        ),
                        onTap: () {
                          // Add | remove product favorites
                          cubit.addOrRemoveFromFavorites(
                              productID: model.id.toString());
                        },
                      ))

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
      },
    );
  }
}
