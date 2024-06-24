// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ureflect/moduels/view/RegisterPage.dart';
import 'package:ureflect/moduels/view/registerVendor.dart';
import 'package:ureflect/moduels/widgets/componants/add_to_cart.dart';
import 'package:ureflect/moduels/widgets/componants/contaier.dart';

class RegisterChoose extends StatefulWidget {
  const RegisterChoose({
    super.key,
  });

  @override
  State<RegisterChoose> createState() => _RegisterChooseState();
}

class _RegisterChooseState extends State<RegisterChoose> {
  // void initState() {
  //   super.initState();
  //   emailController = TextEditingController();
  //   passwordController = TextEditingController();
  // }

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  // var userController = TextEditingController();
  // var emailController = TextEditingController();
  // var passwordController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  // bool isPassword = true;
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/image.jpg",
            height: 182,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(width: 37),
              containerdata(
                text: "Vendor",
                image: "assets/vendor-removebg-preview.png",
                ontap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterVendor()));
                    isSelected = false;
                  });
                },
                color:
                    isSelected ? const Color(0xff0ACF83) : Colors.grey.shade300,
              ),
              const SizedBox(
                width: 25,
              ),
              containerdata(
                text: "User",
                image: "assets/user-removebg-preview.png",
                ontap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                    isSelected = true;
                  });
                },
                color:
                    isSelected ? const Color(0xff0ACF83) : Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0ACF83),
              minimumSize: const Size(300, 40),
            ),
            child: const Text(
              "Continue",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),

      //  Form(
      //     key: _formKey,
      //     child: Column(
      //       children: [
      //         Expanded(
      //           child: SizedBox(
      //             height: 350,
      //             width: 380,
      //             child: Image.asset("assets/welcomelogin.jpg"),
      //           ),
      //         ),
      //         const Row(
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.only(left: 16),
      //               child: Text(
      //                 "Log In",
      //                 style: TextStyle(
      //                     color: Colors.black,
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 25),
      //               ),
      //             ),
      //           ],
      //         ),
      //         TextFormField(
      //           keyboardType: TextInputType.emailAddress,
      //           controller: emailController,
      //           validator: (value) {
      //             if (value!.isEmpty | !value.contains("@")) {
      //               return 'Enter valid Email';
      //             } else {
      //               return null;
      //             }
      //           },
      //           decoration: InputDecoration(
      //             filled: true,
      //             fillColor: Colors.white,
      //             prefixIcon: const Icon(
      //               Icons.email,
      //               color: Color.fromRGBO(10, 207, 131, 1),

      //               //  color: Color.fromRGBO(255, 160, 65, 1),
      //             ),
      //             labelText: "E-mail",
      //             labelStyle: TextStyle(
      //               color: Colors.grey,
      //               fontSize: 20.sp,
      //             ),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20.0),
      //               borderSide: const BorderSide(
      //                 color: Color.fromRGBO(10, 207, 131, 1),
      //               ),
      //             ),
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20.0),
      //               borderSide: const BorderSide(
      //                 color: Color.fromRGBO(10, 207, 131, 1),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 20.h,
      //         ),
      //         TextFormField(
      //           controller: passwordController,
      //           obscureText: isPassword,
      //           validator: (value) {
      //             if (value!.isEmpty || value.length < 8) {
      //               return ("Invalid password");
      //             } else {
      //               return null;
      //             }
      //           },
      //           decoration: InputDecoration(
      //             filled: true,
      //             fillColor: Colors.white,
      //             prefixIcon: const Icon(
      //               Icons.lock_outline_rounded,
      //               color: Color.fromRGBO(10, 207, 131, 1),
      //             ),
      //             suffixIcon: IconButton(
      //                 onPressed: () {
      //                   setState(() {
      //                     isPassword = !isPassword;
      //                   });
      //                 },
      //                 icon: isPassword
      //                     ? const Icon(
      //                         CupertinoIcons.eye,
      //                         color: Color.fromRGBO(10, 207, 131, 1),
      //                       )
      //                     : const Icon(
      //                         color: Color.fromRGBO(10, 207, 131, 1),
      //                         CupertinoIcons.eye_slash,
      //                       )),
      //             labelText: "Password",
      //             labelStyle: TextStyle(
      //               fontSize: 20.sp,
      //               color: Colors.grey,
      //             ),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20.0),
      //               borderSide: const BorderSide(
      //                 color: Color.fromRGBO(10, 207, 131, 1),
      //               ),
      //             ),
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20.0),
      //               borderSide: const BorderSide(
      //                 color: Color.fromRGBO(10, 207, 131, 1),
      //               ),
      //             ),
      //           ),
      //         ),
      //         Row(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.only(left: 30),
      //               child: ElevatedButton(
      //                 onPressed: () {},
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor: Colors.white,
      //                   minimumSize: const Size(85, 40),
      //                 ),
      //                 child: const Text(
      //                   "Skip",
      //                   style: TextStyle(fontSize: 17, color: Colors.green),
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 50,
      //               width: 50,
      //             ),
      //             ElevatedButton(
      //               onPressed: () {},
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: Colors.green,
      //                 minimumSize: const Size(130, 40),
      //               ),
      //               child: const Text(
      //                 "Login",
      //                 style: TextStyle(fontSize: 17),
      //               ),
      //             ),
      //           ],
      //         ),
      //         const Text(
      //           "Dont have an account? Sign Up Now",
      //           style: TextStyle(color: Colors.black, fontSize: 15),
      //         ),
      //       ],
      //     ))
    );
  }
}
