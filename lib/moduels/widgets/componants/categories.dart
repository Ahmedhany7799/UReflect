import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// We need satefull widget for our categories

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Shirts", "Paints", "Shoses", "Dresses"];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 25.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          // vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 80.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? const Color.fromRGBO(10, 207, 131, 1)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == index ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(
            //     top: 2,
            //   ), //top padding 5
            //   height: 3,
            //   width: 42,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color:
            //         selectedIndex == index ? Colors.black : Colors.transparent,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
