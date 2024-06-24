// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ureflect/moduels/view/resetpassword/verification.dart';

import '../../../services/autntication/authcubit/authcubit_cubit.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text(
            " Forget Password",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage("assets/screen.png"),
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty | !value.contains("@")) {
                              return 'Enter valid Email';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color.fromRGBO(10, 207, 131, 1),

                              //  color: Color.fromRGBO(255, 160, 65, 1),
                            ),
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.sp,
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
                          height: 180.h,
                        ),
                        const Center(
                            child: Text(
                          "Please write your email to receive a\nconfirmation code to set a new password",
                          style: TextStyle(color: Colors.grey),
                        )),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 300.w,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate() == true) {
                                BlocProvider.of<AuthCubit>(context).login(
                                  email: emailController.text,
                                  password: '',
                                );
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Verification()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(10, 207, 131, 1),
                              minimumSize: const Size(90, 50),
                            ),
                            child: const Text("Confirm Mail"),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
