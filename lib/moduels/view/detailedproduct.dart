import 'package:readmore/readmore.dart';
import '../../models/model_product.dart';
import '../widgets/componants/product_title_with_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../widgets/componants/counter_with_fav_btn.dart';
import '../widgets/componants/add_to_cart.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.model});

  //final Product product;
  final ProductModel model;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: AddToCart(model: widget.model),

      // each product have a color

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 750.h,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: const EdgeInsets.only(
                      // top: size.height * 0.12,
                      left: 20,
                      right: 20,
                    ),
                    // height: 500,
                    decoration: BoxDecoration(
                        // color: const Color(0x007f7f7f),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, blurRadius: 0.3)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "5.0",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  const TextSpan(text: "(199)"),
                                ]))
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.share,
                                  size: TSizes.iconMd,
                                ))
                          ],
                        ),

                        SizedBox(
                          height: 16.h,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Status :"),
                            Text(
                              widget.model.name!,
                              style: Theme.of(context).textTheme.titleLarge!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            // Image.network(
                            //   widget.model.image.toString(),
                            //   width: 40.w,
                            //   height: 40.h,
                            // ),
                            Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade300,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      widget.model.image.toString()),
                                ),
                                //color: const Color.fromRGBO(10, 207, 131, 1),
                              ),
                            ),
                            SizedBox(width: 5.w),

                            Text(
                              widget.model.name!,
                              style: TextStyle(fontSize: 18.sp),
                            ),

                            // SizedBox(width: 10),

                            const Icon(
                              Icons.verified,
                              color: Colors.blue,
                              size: 15,
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 16.h / 1.5.h,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Colors",
                                  style:
                                      Theme.of(context).textTheme.titleSmall!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            // SizedBox(height:,),

                            Wrap(
                              spacing: 8,
                              children: [
                                Choicecolor(
                                  text: 'Blue',
                                  selected: true,
                                  onSelected: (value) {},
                                ),
                                Choicecolor(
                                  text: 'Red',
                                  selected: false,
                                  onSelected: (value) {},
                                ),
                                Choicecolor(
                                  text: 'Yellow',
                                  selected: false,
                                  onSelected: (value) {},
                                ),
                              ],
                            )
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Sizes",
                                  style:
                                      Theme.of(context).textTheme.titleSmall!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems / 2,
                            ),
                            Wrap(
                              spacing: 8,
                              children: [
                                Choicecolor(
                                  text: '36',
                                  selected: true,
                                  onSelected: (value) {},
                                ),
                                Choicecolor(
                                  text: '38',
                                  selected: false,
                                  onSelected: (value) {},
                                ),
                                Choicecolor(
                                  text: '40',
                                  selected: false,
                                  onSelected: (value) {},
                                ),
                              ],
                            )
                          ],
                        ),

                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        //  const SizedBox(height: TSizes.spaceBtwItems,),

                        // SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text("  Try Before Buy"),style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromRGBO(0, 101, 111, 1),) ),),),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Descripton",
                              style: Theme.of(context).textTheme.titleLarge!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        ReadMoreText(
                          widget.model.description!,
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: "Show more",
                          trimExpandedText: "Less",
                          moreStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                          lessStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                        ),

                        //  const Divider(),
//                                                                   const SizedBox(height: TSizes.spaceBtwItems,),

                        SizedBox(
                          height: 25.h,
                        ),

                        // ColorAndSize(product: widget.product),
                        // SizedBox(height: 10.h),
                        // Description(product: widget.product),
                        //   SizedBox(height: 10.h),
                        CounterWithFavBtn(
                          model: widget.model,
                        ),
                        // SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                  ProductTitleWithImage(model: widget.model)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Choicecolor extends StatelessWidget {
  const Choicecolor({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: THelperFunctions.getColor(text) != null
            ? const SizedBox()
            : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        backgroundColor: THelperFunctions.getColor(text) != null
            ? THelperFunctions.getColor(text)!
            : null,
        avatar: THelperFunctions.getColor(text) != null
            ? SizedBox(
                width: 40.w,
                height: 40.h,
                //color:THelperFunctions.getColor(text)!
              )
            : null,
        shape: THelperFunctions.getColor(text) != null
            ? const CircleBorder()
            : null,
        labelPadding: THelperFunctions.getColor(text) != null
            ? const EdgeInsets.all(0)
            : null,
        padding: THelperFunctions.getColor(text) != null
            ? const EdgeInsets.all(0)
            : null,
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40.w,
          height: 32.h,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              setState(() {
                if (numOfItems > 1) {
                  setState(() {
                    numOfItems--;
                  });
                }
              });
            },
            child: const Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20 / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          width: 40.w,
          height: 32.h,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              if (numOfItems <= 100) {
                setState(() {
                  numOfItems++;
                });
              }
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
