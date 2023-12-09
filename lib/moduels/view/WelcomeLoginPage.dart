// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class WelcomeLogin extends StatefulWidget {
  const WelcomeLogin({super.key});

  @override
  State<WelcomeLogin> createState() => _WelcomeLoginState();
}

class _WelcomeLoginState extends State<WelcomeLogin> {
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

  var userController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 350,
                    width: 380,
                    child: Image.asset("assets/welcomelogin.jpg"),
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ],
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Skip",
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: const Size(85, 40),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 17),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        minimumSize: const Size(130, 40),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Dont have an account? Sign Up Now",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            )));
  }
}

class Myshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    // path.moveTo(0, 100);
    path.lineTo(0, h * 0.86);
    path.quadraticBezierTo(w * 0.15, h * 0.80, w * 0.45, h * 0.90);

    //path.quadraticBezierTo(w, h,w*0.6,h*0.20);
    path.quadraticBezierTo(w * 0.75, h * 1, w * 0.65, h * 0.75);
    path.quadraticBezierTo(w * 0.60, h * 0.65, w, h * 0.77);
    path.quadraticBezierTo(w, h * 1, w * 11, h * 5);

    path.lineTo(w, 0);
    // path.moveTo(0, 0);
    //  path.quadraticBezierTo(size.width*39, size.height*0.98, size.width*0.50, size.height*0.77);
    // path.quadraticBezierTo(size.width*0.72, size.height*0.61, size.width, size.height);
//     path.quadraticBezierTo(size.width*0.1, size.height*0.7, size.width*0.3, size.height*0.9);
//     // path.quadraticBezierTo(size.width*0.1, size.height*0.7, size.width*0.3, size.height*0.9);
    //path.lineTo(size.width,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint =Paint();
//     final path =Path();
//     paint.style=PaintingStyle.stroke;
//     paint.strokeWidth=5;
//     paint.color=Colors.green;

//     path.moveTo(0, 0);
//     path.quadraticBezierTo(size.width*39, size.height*0.98, size.width*0.50, size.height*0.77);
//      path.quadraticBezierTo(size.width*0.72, size.height*0.61, size.width, size.height);
//     // path.quadraticBezierTo(size.width*0.1, size.height*0.7, size.width*0.3, size.height*0.9);
//     // path.quadraticBezierTo(size.width*0.1, size.height*0.7, size.width*0.3, size.height*0.9);
//      path.lineTo(size.width,0);
//      path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
// return true;
//   }
}
