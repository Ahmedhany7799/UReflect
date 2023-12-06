// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isConfirmPassword = true;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Create new Password",
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 160.h,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: isPassword,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return ("Invalid password");
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: Color.fromRGBO(10, 207, 131, 1),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                              icon: isPassword
                                  ? const Icon(
                                      CupertinoIcons.eye,
                                      color: Color.fromRGBO(10, 207, 131, 1),
                                    )
                                  : const Icon(
                                      color: Color.fromRGBO(10, 207, 131, 1),
                                      CupertinoIcons.eye_slash,
                                    )),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(10, 207, 131, 1),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(10, 207, 131, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: isConfirmPassword,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return ("Invalid password");
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: Color.fromRGBO(10, 207, 131, 1),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isConfirmPassword = !isConfirmPassword;
                                });
                              },
                              icon: isConfirmPassword
                                  ? const Icon(
                                      CupertinoIcons.eye,
                                      color: Color.fromRGBO(10, 207, 131, 1),
                                    )
                                  : const Icon(
                                      color: Color.fromRGBO(10, 207, 131, 1),
                                      CupertinoIcons.eye_slash,
                                    )),
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(10, 207, 131, 1),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(10, 207, 131, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 130.h,
                        width: 100.w,
                      ),
                      const Text(
                        "Please write your new password",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(10, 207, 131, 1),
                            minimumSize: const Size(90, 50),
                          ),
                          child: const Text("Reset Password"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
