// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../services/layout/layout_cubit/layout_cubit.dart';
import '../../services/layout/layout_cubit/layout_states.dart';
import '../widgets/bottomnavigationbar.dart';
import 'detailedproduct.dart';
import '../widgets/componants/itemCard.dart';

class ViewAllProducts extends StatelessWidget {
  const ViewAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);

    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Best Seller"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavigationbar()),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                )),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  DropdownButtonFormField(
                    decoration:
                        const InputDecoration(prefixIcon: Icon(Icons.sort)),
                    items: [
                      "Name",
                      "Newest",
                      "Popularity",
                      "Sale",
                      "Higer Price",
                      "Lower Price",
                      "Men Clothes",
                      "Women Clothes",
                      "Children"
                    ]
                        .map((option) => DropdownMenuItem(
                            value: option, child: Text(option)))
                        .toList(),
                    onChanged: ((value) {}),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.80,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      model: cubit.products[index],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            model: cubit.products[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
