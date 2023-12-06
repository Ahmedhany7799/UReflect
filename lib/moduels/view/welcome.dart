import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';
import '../widgets/bottomnavigator.dart';
import 'onboardingScreens.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(219, 219, 219, 1),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.elliptical(600, 250),
                bottomLeft: Radius.elliptical(600, 250)),
            child: Image.asset(
              "assets/welcome22.jpg",
              width: double.infinity,
              height: 400.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Center(
              child: Text(
            "Look Good , Feel Good",
            style: TextStyle(
                fontSize: 30.sp,
                fontFamily: "Montserrat-VariableFont_wght.ttf",
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
              child: Text(
            "   Create your unique style and\n     explore hundreds of outfits",
            style: TextStyle(fontSize: 22.sp, color: Colors.black),
          )),
          // ElevatedButton(onPressed: (){}, child: Text("Let's Go",style: TextStyle(fontSize: 30,),))
          SizedBox(
            height: 40.h,
          ),
          Container(
            width: 350.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: const Color.fromRGBO(10, 207, 131, 1),
            ),
            child: MaterialButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => userToken == null
                            ? const OnboardingScreens()
                            : const Home1()));
              },
              child: Text(
                " Let's Go",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
