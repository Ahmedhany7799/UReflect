// ignore_for_file: file_names

import 'package:UReflect/moduels/widgets/bottomnavigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/autntication/authcubit/authcubit_cubit.dart';
import '../../services/autntication/authcubit/authcubit_state.dart';
import 'HomePage.dart';
import 'loginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var userController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  //final _formKey = GlobalKey<FormState>();
  bool isPassword = true;

  Future<void> setEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    final phoneController = TextEditingController();

    final nameController = TextEditingController();

    final passwordController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
      if (state is RegisterLoadingState) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigationbar()));
      } else if (state is FailedToRegisterState) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text(
                    state.message,
                    style: const TextStyle(
                        color: Colors.white, backgroundColor: Colors.red),
                  ),
                ));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Text(""),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 22.5.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  textFormItem(
                    hintTitle: "User Name",
                    controller: nameController,
                    sIcon: const Icon(
                      Icons.person,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  textFormItem(
                    hintTitle: "Email",
                    controller: emailController,
                    sIcon: const Icon(
                      Icons.email,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  textFormItem(
                    hintTitle: "Phone",
                    controller: phoneController,
                    sIcon: const Icon(Icons.phone),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  textFormItem(
                    isPassword: true,
                    hintTitle: "Password",
                    controller: passwordController,
                    sIcon: isPassword
                        ? const Icon(
                            CupertinoIcons.eye,
                          )
                        : const Icon(
                            CupertinoIcons.eye_slash,
                          ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: MaterialButton(
                      minWidth: 250.w,
                      elevation: 0,
                      height: 40.h,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      color: const Color.fromRGBO(10, 207, 131, 1),
                      onPressed: () {
                        if (formKey.currentState!.validate() == true) {
                          BlocProvider.of<AuthCubit>(context).register(
                              email: emailController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                              password: passwordController.text);
                        }
                      },
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            state is RegisterLoadingState
                                ? "Loading"
                                : "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.5.sp,
                                color: Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          )),
                      SizedBox(
                        width: 4.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        child: Text('Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "-Or Join us with -",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  //color: Colors.white,
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
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 60.h,
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
                          ],
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
    });
  }
}

Widget textFormItem(
    {bool? isPassword,
    required String hintTitle,
    required TextEditingController controller,
    required Icon sIcon}) {
  return TextFormField(
    obscureText: isPassword ?? false,
    controller: controller,
    decoration: InputDecoration(
      hintText: hintTitle,
      filled: true,
      fillColor: Colors.white,
      suffixIcon: sIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: Colors.blue,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
    ),
    validator: (input) {
      if (controller.text.isNotEmpty) {
        return null;
      } else {
        return " Invalid $hintTitle ";
      }
    },
  );
}
