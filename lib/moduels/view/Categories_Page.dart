// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                      child: Text("Categories",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.sp,
                              fontFamily: "ProtestRiot-Regular.ttf",
                              fontWeight: FontWeight.bold))),
                  // IconButton(
                  //     onPressed: () =>
                  //     // Navigator.pushReplacement(
                  //     //     context,
                  //     //     MaterialPageRoute(
                  //     //         builder: (context) => const CartScreen())),
                  //     icon: const Icon(
                  //       Icons.shopping_cart,
                  //       color: Colors.black,
                  //     ))
                ],
              ),

              // Categories(),
              SizedBox(
                height: 20.h,
              ),
              const CategorieItem(
                image: 'assets/ca5.png',
                productNum: '208',
                title: 'Men        ',
              ),
              SizedBox(
                height: 20.h,
              ),
              const CategorieRev(
                image: "assets/ca3.png",
                productNum: '358',
                title: 'clothes',
              ),
              SizedBox(
                height: 20.h,
              ),
              const CategorieItem(
                image: 'assets/ca4.png',
                productNum: '160',
                title: 'Women      ',
              ),

              SizedBox(
                height: 20.h,
              ),
              const CategorieRev(
                image: "assets/ca2.png",
                productNum: '230',
                title: 'Shoese',
              ),

              SizedBox(
                height: 20.h,
              ),
              const CategorieItem(
                image: 'assets/ca1.png',
                productNum: '130',
                title: 'Electronics',
              ),
              SizedBox(
                height: 20.h,
              ),

              const CategorieItem(
                image: 'assets/ca5.png',
                productNum: '208',
                title: 'Men        ',
              ),
              SizedBox(
                height: 20.h,
              ),
              const CategorieRev(
                image: "assets/ca3.png",
                productNum: '358',
                title: 'clothes',
              ),
              SizedBox(
                height: 20.h,
              ),
              const CategorieItem(
                image: 'assets/ca4.png',
                productNum: '160',
                title: 'Women      ',
              ),

              SizedBox(
                height: 20.h,
              ),
              const CategorieRev(
                image: "assets/ca2.png",
                productNum: '230',
                title: 'Shoese',
              ),

              SizedBox(
                height: 20.h,
              ),
              const CategorieItem(
                image: 'assets/ca1.png',
                productNum: '130',
                title: 'Electronics',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategorieItem extends StatelessWidget {
  const CategorieItem({
    super.key,
    required this.title,
    required this.productNum,
    required this.image,
  });

  final String? title, productNum, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
          //color: Colors.grey,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  title!,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                Text("$productNum Product")
              ],
            ),
          ),
          SizedBox(
            width: 218.w,
            height: 100.h,
            child: Image.asset(
              image!,
              height: 80.h,
            ),
          ),
        ],
      ),
    );
  }
}

class CategorieRev extends StatelessWidget {
  const CategorieRev({
    super.key,
    required this.title,
    required this.productNum,
    required this.image,
  });

  final String? title, productNum, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
          //color: Colors.grey,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 218.w,
            height: 100.h,
            child: Image.asset(
              image!,
              height: 80.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  title!,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                Text("$productNum Product"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
