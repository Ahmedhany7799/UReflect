// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeLogin extends StatelessWidget {
  const WelcomeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: Myshape(),
        child: Container(
          height: 550.h,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/welcome22.jpg",
            ),
          )),
          child: Stack(children: const [
            Positioned(
                bottom: 70,
                child: Text(
                  "Log in",
                  style: TextStyle(color: Colors.black),
                )),
          ]),
        ),
      ),
    );
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
