import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/layout/layout_cubit/layout_cubit.dart';
import '../../services/layout/layout_cubit/layout_states.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import 'HomePage.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          if (cubit.userModel == null) cubit.getUserData();
          if (cubit.address == null) cubit.getUserData();

          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                automaticallyImplyLeading: false,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: Colors.grey,
                    )),
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              body: cubit.userModel != null
                  ? SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        width: double.infinity,
                        child: Column(
                          children: [
                            _image != null
                                ? CircleAvatar(
                                    radius: 45,
                                    backgroundImage: MemoryImage(_image!),
                                  )
                                : CircleAvatar(
                                    radius: 45,
                                    child:
                                        Image.network(cubit.userModel!.name!)),
                            TextButton(
                                onPressed: selectImage,
                                child: const Text(
                                  "Change Profile Image",
                                  style: TextStyle(color: Colors.teal),
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            const Divider(),

                            Row(
                              children: [
                                Text(
                                  "Profile Information",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .apply(
                                        color: Colors.black,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),

                            ProfileModel(
                              title: 'name',
                              value: cubit.userModel!.name!,
                            ),
                            ProfileModel(
                              title: 'Address',
                              value:
                                  "${cubit.address!.streetAddress} , ${cubit.address!.city} , ${cubit.address!.state}",
                            ),

                            const Divider(),

                            Row(
                              children: [
                                Text(
                                  "Personal Information",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .apply(
                                        color: Colors.black,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),

                            // profile_model(onPRessed: () {  }, title: 'User ID', value: '111',iconn: Icons.copy,),

                            ProfileModel(
                              title: 'E-mail',
                              value: cubit.userModel!.email!,
                            ),

                            ProfileModel(
                              title: 'Phone Number',
                              value: cubit.userModel!.phone!,
                            ),
                            ProfileModel(
                              title: 'Second Phone number',
                              value: cubit.userModel!.secondphone!,
                            ),
                            ProfileModel(
                              title: 'street',
                              value: cubit.address!.streetAddress,
                            ),
                            ProfileModel(
                              title: 'city',
                              value: cubit.address!.city,
                            ),
                            ProfileModel(
                              title: 'state',
                              value: cubit.address!.state,
                            ),

                            const Divider(),
                            SizedBox(
                              height: 3.h,
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Close Account",
                                    style: TextStyle(color: Colors.red),
                                  )),
                            )
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ));
        });
  }
}

// ignore: must_be_immutable
class ProfileModel extends StatefulWidget {
  ProfileModel({
    super.key,
    required this.title,
    required this.value,
    this.iconn = Icons.arrow_forward_ios,
  });
  String title, value;
  final IconData iconn;
//final VoidCallback onPRessed;

  @override
  State<ProfileModel> createState() => _ProfileModelState();
}

class _ProfileModelState extends State<ProfileModel> {
  String userName = '';
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update ${widget.title}'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter your ${widget.title}',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () {
                setState(() {
                  widget.value = _controller.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPopup(context),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text("${widget.title} :",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp,
                    ))),
            Expanded(
                flex: 5,
                child: Text(widget.value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ))),
            Expanded(
                child: Icon(
              widget.iconn,
              color: Colors.black,
              size: 18,
            )),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../layout/layout_cubit/layout_cubit.dart';
// import '../layout/layout_cubit/layout_states.dart';

// class ProfileDetails extends StatelessWidget {
//   const ProfileDetails({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BlocProvider(
//         create: (context) => LayoutCubit()..getUserData(),
//         child: BlocConsumer<LayoutCubit, LayoutStates>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             final cubit = BlocProvider.of<LayoutCubit>(context);
//             if (cubit.userModel == null) cubit.getUserData();
//             return Scaffold(
//                 backgroundColor: Colors.white,
//                 appBar: AppBar(
//                   elevation: 0.0,
//                   backgroundColor: Colors.white,
//                   leading: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.arrow_back,
//                         color: Colors.black,
//                       )),
//                   title: Center(
//                     child: Title(
//                       color: Colors.black,
//                       child: const Text(
//                         "Profile",
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   actions: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.shopping_cart,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 body: ListView(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Center(
//                           child: CircleAvatar(
//                             radius: 45,
//                             backgroundImage: AssetImage("assets/screen.png"),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: Row(
//                         children: const [
//                           Text(
//                             "Personal Details",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: Row(
//                         children: const [
//                           Text(
//                             "User name",
//                             style: TextStyle(fontSize: 15, color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: Row(
//                         children: [
//                           Text(
//                             "${cubit.userModel?.email}",
//                             style: const TextStyle(
//                                 color: Colors.grey, fontSize: 15),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: Row(
//                         children: [
//                           Text(
//                             cubit.userModel!.mobileNumber1!,
//                             style: TextStyle(color: Colors.grey, fontSize: 15),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: Row(
//                         children: [
//                           Text(
//                             cubit.userModel!.mobileNumber2!,
//                             style: TextStyle(color: Colors.grey, fontSize: 15),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Divider(
//                       thickness: 1,
//                       color: Colors.grey,
//                       indent: 15,
//                       endIndent: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: Row(
//                         children: const [
//                           Text(
//                             "Address Details",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: Row(
//                         children: const [
//                           Text(
//                             "Address",
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: Row(
//                         children: const [
//                           Text(
//                             "City",
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: Row(
//                         children: const [
//                           Text(
//                             "Country",
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 40,
//                       width: 40,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.green,
//                           minimumSize: const Size(60, 50),
//                         ),
//                         child: const Text(
//                           "Save Change",
//                           style: TextStyle(fontSize: 17),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ));
//           },
//         ),
//       ),
//     );
//   }
// }
