import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ureflect/Features/checkout/presentation/views/widgets/my_cart_view_body.dart';
import 'package:ureflect/core/widgets/custom_button.dart';
import '../../../services/layout/layout_cubit/layout_cubit.dart';
import '../../../services/layout/layout_cubit/layout_states.dart';
import '../../view/HomePage.dart';
import '../bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../main.dart';
import '../../view/loginPage.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavigationbar())),
                icon: const Icon(Icons.arrow_back_ios)),
            actions: [
              IconButton(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainHomeScreen())),
                  icon: const Icon(Icons.delete_outline)),
            ],
          ),
          body: userToken == null
              ? Row(
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
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
                  child: Column(
                    children: [
                      Expanded(
                          child: cubit.carts.isNotEmpty
                              ? ListView.separated(
                                  itemCount: cubit.carts.length,
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 12,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            cubit.carts[index].image!,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 12.5),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cubit.carts[index].name!,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        "${cubit.carts[index].price!} \$"),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    if (cubit.carts[index]
                                                            .price !=
                                                        cubit
                                                            .carts[index].price)
                                                      Text(
                                                        "${cubit.carts[index].price!} \$",
                                                        style: const TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough),
                                                      ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    OutlinedButton(
                                                        onPressed: () {
                                                          cubit.addOrRemoveFromFavorites(
                                                              productID: cubit
                                                                  .carts[index]
                                                                  .id
                                                                  .toString());
                                                        },
                                                        child: Icon(
                                                          Icons.favorite,
                                                          color: cubit
                                                                  .favoritesID
                                                                  .contains(cubit
                                                                      .carts[
                                                                          index]
                                                                      .id
                                                                      .toString())
                                                              ? Colors.red
                                                              : Colors.grey,
                                                        )),
                                                    GestureDetector(
                                                      onTap: () {
                                                        cubit.addOrRemoveFromCarts(
                                                            productID: cubit
                                                                .carts[index].id
                                                                .toString());
                                                      },
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  })
                              : const Center(
                                  child: Text("Cart is Empty"),
                                )),
                      Text(
                        "TotalPrice : ${cubit.totalPrice} \$",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      CustomButton(
                        text: 'Complete Payment',
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          //   return const PaymentDetailsView();
                          // }));

                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              builder: (context) {
                                return const PaymentMethodsBottomSheet();
                              });
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
