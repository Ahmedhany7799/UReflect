// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/componants/categories.dart';
import '../widgets/componants/detailedproduct.dart';
import '../widgets/componants/itemCard.dart';
import '../widgets/componants/product_model.dart';
import 'HomePage.dart';

class SearchPage2 extends StatefulWidget {
  const SearchPage2({super.key});

  @override
  State<SearchPage2> createState() => _SearchPage2State();
}

class _SearchPage2State extends State<SearchPage2> {
  var intController = TextEditingController();
  var int2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Search",
            style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(10, 207, 131, 1)),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MainHomeScreen())),
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 310.w,
                      child: const TSearchContainer(
                        text: "Search yaa bashaa...",
                        enabled: true,
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 700.h,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Filter",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.sp,
                                          ),
                                        ),

                                        Text(
                                          "Categories",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.black),
                                        ),

                                        const Categories(),
                                        Text('Sort by',
                                            style: TextStyle(fontSize: 18.sp)),
                                        SizedBox(
                                          height: 5.h,
                                        ),

                                        const FilterChipExample(),

                                        //  filt2(),
                                        SizedBox(
                                          height: 5.h,
                                        ),

                                        Text(
                                          "Price Range",
                                          style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 20.sp,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),

                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: intController,
                                                decoration: InputDecoration(
                                                  labelText: "Min Price",
                                                  labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    //fontWeight: FontWeight.bold,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                              child: TextFormField(
                                                controller: int2Controller,
                                                decoration: InputDecoration(
                                                  labelText: "max Price",
                                                  labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(19),
                                            color: const Color.fromRGBO(
                                                10, 207, 131, 1),
                                          ),
                                          child: MaterialButton(
                                            onPressed: () {},
                                            minWidth: double.infinity,
                                            child: Text(
                                              "Apply Filter",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.sp,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              );
                            });
                      },
                      icon: const Icon(Icons.sort),
                      iconSize: 35,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  color: Colors.white,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: MainHomeScreen.previousSearches.length,
                      itemBuilder: (context, index) =>
                          previousSearchitems(index)),
                ),
                SizedBox(
                  height: 90.h,
                ),
                Text(
                  "Popular Products",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  //  physics: const ScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.82,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  previousSearchitems(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Dismissible(
          key: GlobalKey(),
          onDismissed: (DismissDirection dir) {
            MainHomeScreen.previousSearches.removeAt(index);
          },
          child: Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.clock,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                MainHomeScreen.previousSearches[index],
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.call_made_outlined,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum SortByFilter { children, men, women, highPrice, lowPrice }

enum SortByFilter2 { children, men, women, highPrice, lowPrice }

class FilterChipExample extends StatefulWidget {
  const FilterChipExample({super.key});

  @override
  State<FilterChipExample> createState() => _FilterChipExampleState();
}

class _FilterChipExampleState extends State<FilterChipExample> {
  Set<SortByFilter> filters = <SortByFilter>{};

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5.h),
          Wrap(
            spacing: 5.0,
            children: SortByFilter.values.map((SortByFilter exercise) {
              return FilterChip(
                selectedColor: const Color.fromRGBO(10, 207, 131, 1),
                label: Text(exercise.name),
                selected: filters.contains(exercise),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      filters.add(exercise);
                    } else {
                      filters.remove(exercise);
                    }
                  });
                },
              );
            }).toList(),
          ),

          //   Text(
          //     'Looking for: ${filters.map((Filter e) => e.name).join(', ')}',
          //     style: textTheme.labelLarge,
          //   ),
        ],
      ),
    );
  }
}

class Filt2 extends StatefulWidget {
  const Filt2({super.key});

  @override
  State<Filt2> createState() => _Filt2State();
}

class _Filt2State extends State<Filt2> {
  Set<SortByFilter2> filters = <SortByFilter2>{};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 5.h),
        Wrap(
          spacing: 5.0,
          children: SortByFilter2.values.map((SortByFilter2 exercise) {
            return FilterChip(
              label: Text(exercise.name),
              selected: filters.contains(exercise),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    filters.add(exercise);
                  } else {
                    filters.remove(exercise);
                  }
                });
              },
            );
          }).toList(),
        ),
        SizedBox(height: 10.h),
        //   Text(
        //     'Looking for: ${filters.map((Filter e) => e.name).join(', ')}',
        //     style: textTheme.labelLarge,
        //   ),
      ],
    );
  }
}








// showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                                 content: SizedBox(
//                                   height: 600,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(20.0),
//                                     child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             "Filter",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 30,
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           const Text(
//                                             "Categories",
//                                             style: TextStyle(
//                                                 fontSize: 20,
//                                                 color: Colors.black),
//                                           ),
//                                           const SizedBox(
//                                             height: 2,
//                                           ),

//                                           Categories(),
//                                           const Text('Sort by',
//                                               style: TextStyle(fontSize: 20)),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),

//                                           const FilterChipExample(),
//                                           //  filt2(),
//                                           const Text(
//                                             "Price Range",
//                                             style: TextStyle(
//                                                 //fontWeight: FontWeight.bold,
//                                                 fontSize: 20,
//                                                 color: Colors.black),
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),

//                                           Row(
//                                             children: [
//                                               Expanded(
//                                                 child: TextFormField(
//                                                   controller: intController,
//                                                   decoration:
//                                                       const InputDecoration(
//                                                     labelText: "Min Price",
//                                                     labelStyle: TextStyle(
//                                                       color: Colors.black,
//                                                       //fontWeight: FontWeight.bold,
//                                                       fontSize: 15,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               const SizedBox(
//                                                 width: 8,
//                                               ),
//                                               Expanded(
//                                                 child: TextFormField(
//                                                   controller: intController,
//                                                   decoration:
//                                                       const InputDecoration(
//                                                     labelText: "max Price",
//                                                     labelStyle: TextStyle(
//                                                       color: Colors.black,
//                                                       // fontWeight: FontWeight.bold,
//                                                       fontSize: 15,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Container(
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(19),
//                                               color: const Color.fromRGBO(
//                                                   133, 201, 109, 1),
//                                             ),
//                                             child: MaterialButton(
//                                               onPressed: () {},
//                                               minWidth: double.infinity,
//                                               child: const Text(
//                                                 "Apply Filter",
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 20,
//                                                     color: Colors.white),
//                                               ),
//                                             ),
//                                           ),
//                                         ]),
//                                   ),
//                                 ),
//                               ));
