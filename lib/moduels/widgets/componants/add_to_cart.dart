import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../main.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../view/loginPage.dart';
import 'cart.dart';
import 'product_model.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key, required this.product});

  final Product product;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    Uint8List? _image;
    void selectImage() async {
      Uint8List? imgg = await pickImage(ImageSource.camera);
      setState(() {
        _image = imgg;
      });
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: TSizes.defaultSpace / 2,
        horizontal: TSizes.defaultSpace,
      ),
      decoration: BoxDecoration(
          // color: THelperFunctions.isDarkMode(context)
          //     ? TColors.darkGrey
          //     : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          ),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 0.3)]),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 20),
            //height: 30,
            //width: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                  //color: product.color,
                  ),
            ),
            child: IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: selectImage,
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => userToken == null
                            ? const LoginPage()
                            : const CartScreen()));
              },
              style: ElevatedButton.styleFrom(
                //minimumSize: const Size(double.infinity, 30),
                backgroundColor: const Color.fromRGBO(10, 207, 131, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                //backgroundColor: product.color,
              ),
              child: Text(
                "Add to cart".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
