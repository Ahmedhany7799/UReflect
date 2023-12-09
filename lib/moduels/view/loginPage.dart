// ignore_for_file: file_names

import 'package:UReflect/moduels/view/resetpassword/resetScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/autntication/authcubit/authcubit_cubit.dart';
import '../../services/autntication/authcubit/authcubit_state.dart';
import '../widgets/bottomnavigationbar.dart';
import 'HomePage.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _clearFields() {
    setState(() {
      emailController.clear();
      passwordController.clear();
    });
  }

  var userController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPassword = true;

  Future<void> setEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(219, 219, 219, 1),

      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomNavigationbar()));
          } else if (state is FailedToLoginState) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      icon: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        alignment: AlignmentDirectional.topEnd,
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.red,
                      content: Text(
                        state.message,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200.h,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image(
                            //   image: AssetImage("assets/logo.png"),
                            //   width: 60,
                            //   height: 60,
                            // ),
                            Text(
                              "Reflect",
                              style: TextStyle(
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromRGBO(10, 207, 131, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 20.h,
                        ),

                        //                         const Text(
                        //   "Sign IN",
                        //   style: TextStyle(
                        //     fontSize: 25,
                        //     fontWeight: FontWeight.bold,
                        //     color: Color.fromRGBO(0, 101, 111, 1),
                        //   ),
                        // ),
                        SizedBox(
                          height: 30.h,
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
                          height: 20.h,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                    activeColor:
                                        const Color.fromRGBO(10, 207, 131, 1)),
                                Text(
                                  "Remember me ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 50.w,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ResetPassword()));
                                  },
                                  child: Text(
                                    "Reset Password? ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 280.w,
                          height: 50.h,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: const Color.fromRGBO(10, 207, 131, 1),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate() == true) {
                                  BlocProvider.of<AuthCubit>(context).login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  (_) {
                                    _clearFields();
                                  };
                                }
                              },
                              minWidth: double.infinity,
                              child: Text(
                                state is LoginLoadingState
                                    ? ".....اهدا ي  باشاا"
                                    : "Sign In",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have any account?",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage()));
                                },
                                child: Text(
                                  "Sign Up here",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 15.sp,
                                    color:
                                        const Color.fromRGBO(10, 207, 131, 1),
                                  ),
                                )),
                          ],
                        ),

                        // SizedBox(
                        //   width: 280,
                        //   height: 50,
                        //   child: MaterialButton(

                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   const RegisterPage()));
                        //     },
                        //     color: Colors.white,
                        //     minWidth: double.infinity,
                        //     child: const Text(
                        //       // state is LoginLoadingState
                        //       //     ? ".....اهدا ي  باشاا"
                        //       //     :
                        //       "NewMember?Sign Up",
                        //       style: TextStyle(
                        //         fontSize: 20,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const Text("-Or Sign with"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        //   color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        // boxShadow: [BoxShadow(
                                        //   color: Colors.black.withOpacity(0.1),
                                        //   blurRadius: 10,
                                        // ),]
                                      ),
                                      child: SvgPicture.asset(
                                        "assets/g.svg",
                                        height: 100.h,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        //color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        // boxShadow: [BoxShadow(
                                        //   color: Colors.black.withOpacity(0.1),
                                        //   blurRadius: 10,
                                        // ),]
                                      ),
                                      child: SvgPicture.asset(
                                        "assets/f.svg",
                                        height: 100.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
