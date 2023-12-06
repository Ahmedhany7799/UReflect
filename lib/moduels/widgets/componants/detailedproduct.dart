import 'product_title_with_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_model.dart';
import 'add_to_cart.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: AddToCart(product: widget.product),

      // each product have a color
      backgroundColor: widget.product.color,
      appBar: AppBar(
        backgroundColor: widget.product.color,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 10.w)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
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

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                             Container(

//                       padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),

//                       decoration: BoxDecoration(

//                         borderRadius: BorderRadius.circular(8),

//                          color: TColors.secondary.withOpacity(0.8),

//                       ),

//                       width: 40,

//                       height: 25,

//                       child: Text(widget.product.discount,style: const TextStyle(fontSize: 12,color: Colors.black),)),

//                              const SizedBox(width: 20 / 2),

//                     Text("\$250",style:Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
//                             const SizedBox(width: 20 / 2),

//                     Text("\$" " ${widget.product.price .toString()}",maxLines: 1,overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

//                       ],
//                     ),
//                     const SizedBox(height: TSizes.spaceBtwItems/1.5,),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: [

//                          Text(
//                                       widget.product.title,
//                                       style: Theme.of(context)
//                         .textTheme
//                         .titleSmall!,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                         textAlign: TextAlign.left,

//                                     ),
//                        ],
//                      ),

                        SizedBox(
                          height: 16.h,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Status :"),
                            Text(
                              widget.product.status,
                              style: Theme.of(context).textTheme.titleLarge!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Image.asset(
                              widget.product.brandlogo,
                              width: 40.w,
                              height: 40.h,
                            ),

                            SizedBox(width: 10.w),

                            Text(
                              widget.product.brand!,
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

//                     // Container(
//                     //   padding: const EdgeInsets.all(16),
//                     //   width: double.infinity,
//                     //   height: 120,
//                     //   decoration: BoxDecoration(
//                     //     color: THelperFunctions.isDarkMode(context)?TColors.darkGrey:Colors.grey.shade300,
//                     //     borderRadius: BorderRadius.circular(16),
//                     //     border: Border.all(color: TColors.borderPrimary),
//                     //   ),
//                     //   child:Column(
//                     //     children: [
//                     //       Row(
//                     //         children: [
//                     //           const Text("Variation",style: TextStyle(fontSize: 20,),),
//                     //           const SizedBox(width: TSizes.spaceBtwItems,),
//                     //           Column(
//                     //             children: [

//                     //               Row(
//                     //                 children: [

//                     //               const Text("Price :",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

//                     //                  const SizedBox(width: TSizes.spaceBtwItems,),

//                     //                   Text("\$25",style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
//                     //                  const SizedBox(width: TSizes.spaceBtwItems,),
//                     //                   Text("\$" "20",style: Theme.of(context).textTheme.titleLarge,),

//                     //                 ],
//                     //               ),
//                     //         Row(
//                     //    mainAxisAlignment: MainAxisAlignment.start,
//                     //    children: [
//                     //       const Text("Stock :     "),

//                     //      Text(
//                     //                   widget.product.Status,
//                     //                   style: Theme.of(context)
//                     //                       .textTheme
//                     //                       .titleLarge!,
//                     //                       overflow: TextOverflow.ellipsis,
//                     //                       maxLines: 2,
//                     //                       textAlign: TextAlign.left,

//                     //                 ),
//                     //    ],
//                     //  ),

//                     //             ],
//                     //           )
//                     //         ],
//                     //       ),
//                     // Text(widget.product.description,maxLines:4 ,style: const TextStyle(fontSize: 10,),),

//                     //     ],
//                     //   ) ,
//                     // ),

//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                      Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                        children: [
//                          Text(
//                         "Colors",
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleSmall!,
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 2,
//                             textAlign: TextAlign.left,

//                       ),

//                        ],
//                      ),
//                                   // SizedBox(height:,),

//                     Wrap(
//                       spacing: 8,

//                       children: [
//                         Choicecolor(text: 'Blue', selected: true,onSelected: (value){},),
//                     Choicecolor(text: 'Red', selected: false,onSelected: (value){},),
//                     Choicecolor(text: 'Yellow', selected: false,onSelected: (value){},),

//                       ],
//                     )
//                       ],
//                     ),

//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                      Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                        children: [
//                          Text(
//                         "Sizes",
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleSmall!,
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 2,
//                             textAlign: TextAlign.left,

//                       ),
//                        ],
//                      ),
//                                    const SizedBox(height: TSizes.spaceBtwItems/2,),

//                     Wrap(
//                       spacing: 8,
//                       children: [

//                         Choicecolor(text: '36', selected: true,onSelected: (value){},),
//                     Choicecolor(text: '38', selected: false,onSelected: (value){},),
//                     Choicecolor(text: '40', selected: false,onSelected: (value){},),
//                       ],
//                     )

//                       ],
//                     ),

//                                    const SizedBox(height: TSizes.spaceBtwItems,),

//                     Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                              const CartCounter(),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon( widget.product.isFavorite? Icons.favorite : Icons.favorite_border,
//                         color: widget.product.isFavorite ? Colors.red : Colors.grey,size: 25,))
//                           ],
//                         ),

//                                  //  const SizedBox(height: TSizes.spaceBtwItems,),

//                    // SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text("  Try Before Buy"),style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromRGBO(0, 101, 111, 1),) ),),),

//                                    const SizedBox(height: TSizes.spaceBtwItems,),

//                      Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                        children: [
//                          Text(
//                                           "Descripton",
//                                           style: Theme.of(context)
//                             .textTheme
//                             .titleLarge!,
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 2,
//                             textAlign: TextAlign.right,

//                                         ),
//                        ],
//                      ),

//                                                    const SizedBox(height: TSizes.spaceBtwItems/2,),
//                     ReadMoreText(
//                       widget.product.description,
//                       trimLines: 2,
//                       trimMode: TrimMode.Line,
//                       trimCollapsedText: "Show more",
//                       trimExpandedText: "Less",
//                       moreStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w800),
//                     lessStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w800),
//                     ),

//                                  const Divider(),
//                                                                   const SizedBox(height: TSizes.spaceBtwItems,),

                        SizedBox(
                          height: 32.h,
                        ),

                        ColorAndSize(product: widget.product),
                        SizedBox(height: 10.h),
                        Description(product: widget.product),
                        SizedBox(height: 10.h),
                        CounterWithFavBtn(
                          product: widget.product,
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                  ProductTitleWithImage(product: widget.product)
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
