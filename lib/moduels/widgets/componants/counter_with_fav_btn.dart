import 'product_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import 'cart_counter.dart';

class CounterWithFavBtn extends StatefulWidget {
  const CounterWithFavBtn({super.key, required this.product});

  final Product product;

  @override
  State<CounterWithFavBtn> createState() => _CounterWithFavBtnState();
}

class _CounterWithFavBtnState extends State<CounterWithFavBtn> {
  static const likedKey = "liked_Key";
  late bool liked = false;

  @override
  void initState() {
    super.initState();
    _restorePresistedPreference();
  }

  void _restorePresistedPreference() async {
    var preference = await SharedPreferences.getInstance();
    var liked = preference.getBool(likedKey);
    setState(() => this.liked != liked);
  }

  void _presistPreference() async {
    setState(() => liked = !liked);
    var preference = await SharedPreferences.getInstance();
    preference.setBool(likedKey, liked);
  }

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
                : Icon(
                    liked ? Icons.favorite : Icons.favorite_border,
                    color: liked ? Colors.red : Colors.grey,
                    size: 25,
                  ))
      ],
    );
  }
}
