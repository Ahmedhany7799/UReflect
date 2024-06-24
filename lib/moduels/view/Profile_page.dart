import 'RegisterPage.dart';
import 'profile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../services/layout/layout_cubit/layout_cubit.dart';
import '../../services/layout/layout_cubit/layout_states.dart';
import '../../main.dart';
import 'loginPage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          if (cubit.userModel == null) cubit.getUserData();
          return Scaffold(
            //  backgroundColor: const Color(0xFFACACAC),
            // appBar: AppBar(
            //   title: Text(
            //     "Profile",
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 20.sp,
            //         fontWeight: FontWeight.bold),
            //   ),
            //   centerTitle: true,
            //   elevation: 0,
            //   automaticallyImplyLeading: false,
            // ),
            body: userToken == null
                ? SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 150.h,
                            child: userToken == null
                                ? Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            AssetImage("assets/user.png"),
                                      ),
                                      SizedBox(width: 40.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Invest With Us !",
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text("create an account"),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const RegisterPage()));
                                            },
                                            child: Container(
                                              width: 180.w,
                                              height: 35.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color.fromRGBO(
                                                    10, 207, 131, 1),
                                              ),
                                              child: const Center(
                                                  child: Text("Register Now")),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Container(
                                    height: 50.h,
                                    color: const Color.fromRGBO(0, 101, 111, 1),
                                    child: SizedBox(
                                      height: 50.h,
                                      child: UserProfiletile(
                                          name: cubit.userModel!.name!,
                                          email: cubit.userModel!.email!,
                                          img: cubit.userModel!.image!),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "If you have an account?",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                                child: Text(
                                  "login here",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    decoration: TextDecoration.underline,
                                    color:
                                        const Color.fromRGBO(10, 207, 131, 1),
                                  ),
                                ),
                              )
                            ],
                          ),

                          const Divider(),
                          const Text(
                            "Personal",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextButton(
                            onPressed: () {
                              userToken != null
                                  ? null
                                  : Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProfileDetails()));
                            },
                            child: Text(
                              "Edit profile",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const Divider(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Notifications",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const Divider(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Wishlist",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const Divider(),
                          Text(
                            "Legal",
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Terms Of Use",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const Divider(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const Divider(),
                          Text(
                            "General",
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Help Center",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const Divider(),
                          TextButton(
                            onPressed: () {},
                            child: Text("Logout",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          const Divider(),

                          // Padding(padding: const EdgeInsets.all(16),
                          // child: Column(
                          //   children: [

                          // Row(children: [
                          //   Text("Account Settings",style:Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.black,
                          //   ),maxLines: 1 ,
                          //   overflow: TextOverflow.ellipsis,)
                          // ],),

                          // const SizedBox(height: 16,),
                          // const User_details(icon: Icons.home, title:"My Addresses", subtitle: "Set shipping delivery address"),

                          // const User_details(icon: Icons.shopping_bag, title:"My Cart", subtitle: "Add, remove products and move to checkout"),

                          // const User_details(icon: Icons.shopping_basket, title:"My Orders", subtitle: "In progress and Complete Orders"),

                          // const User_details(icon: Icons.money, title:"Bank Account", subtitle: "Withdraw balance to registered bank account"),

                          // const User_details(icon: Icons.discount_sharp, title:"My Coupons", subtitle: "List of all the discounted coupons"),

                          // const User_details(icon: Icons.notification_add, title:"Notifications", subtitle: "Set any kind of notifications message"),

                          // const User_details(icon: Icons.security, title:"Account Privacy", subtitle: "Manage data usage and connected accounts"),

                          // const SizedBox(height: 16,),

                          // Row(children: [
                          //   Text("App Settings",style:Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.black,
                          //   ),maxLines: 1 ,
                          //   overflow: TextOverflow.ellipsis,)
                          // ],),

                          // const SizedBox(height: 16,),

                          // const User_details(icon: Icons.edit_document, title:"Load Data" , subtitle: "Upload Data to your Cloud ",),
                          // User_details(icon: Icons.location_city, title:"GeoLocation" , subtitle: "Set recommendation based on location",trailing:Switch(value: true, onChanged: (value){}) ,),
                          // User_details(icon: Icons.security_update, title:"Safe Mode" , subtitle: "Search result is safe for all ages ",trailing:Switch(value: false, onChanged: (value){}) ,),
                          // User_details(icon: Icons.image, title:"HD Image Quality" , subtitle: "Set image quality to be seen ",trailing:Switch(value: false, onChanged: (value){}) ,),

                          //   ],
                          // ),

                          // ),

                          // const Center(
                          //     child: Padding(
                          //   padding: EdgeInsets.all(20.0),
                          //   child: Text(
                          //     "You are not Sign in with  us Sign In NOw!",
                          //     style: TextStyle(color: Colors.black, fontSize: 30),
                          //   ),
                          // )),
                          // const SizedBox(
                          //   height: 30,
                          // ),
                          // Container(
                          //   width: 250,
                          //   child: MaterialButton(
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(4)),
                          //     onPressed: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => const loginPage()));
                          //     },
                          //     color: const Color.fromRGBO(0, 101, 111, 1),
                          //     minWidth: double.infinity,
                          //     child: const Text(
                          //       "Sign In",
                          //       style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 20,
                          //           color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // Container(
                          //   width: 250,
                          //   child: MaterialButton(
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(4)),
                          //     onPressed: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => const RegisterPage()));
                          //     },
                          //     color: Colors.white,
                          //     minWidth: double.infinity,
                          //     child: const Text(
                          //       "Sign Up",
                          //       style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 20,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                        ],
                      ),
                    ),
                  )
                : const ProfileDetails(),
          );
        });
  }
}

class UserProfiletile extends StatelessWidget {
  const UserProfiletile({
    super.key,
    required this.name,
    required this.email,
    required this.img,
  });
  final String name;
  final String email;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        leading: CircleAvatar(radius: 45, child: Image.network(img)),
        title: Text(name,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: Colors.white)),
        subtitle: Text(
          email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: Colors.white),
        ),
        trailing: IconButton(
            onPressed: () {
              userToken != null
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileDetails()))
                  : const ProfileDetails();
            },
            icon: const Icon(
              Icons.edit_note_outlined,
              color: Colors.white,
            )),
      ),
    );
  }
}
