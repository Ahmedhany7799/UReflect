import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../models/model_product.dart';
import 'cart_counter.dart';

class CounterWithFavBtn extends StatefulWidget {
  const CounterWithFavBtn({super.key, required this.model});

  //final Product product;
  final ProductModel model;

  @override
  State<CounterWithFavBtn> createState() => _CounterWithFavBtnState();
}

class _CounterWithFavBtnState extends State<CounterWithFavBtn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const CartCountdetail(),
        IconButton(
            onPressed: () {},
            icon: userToken == null
                ? const Icon(Icons.favorite)
                : const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 25,
                  ))
      ],
    );
  }
}
