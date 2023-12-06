import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'Screen_Two.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Center(
              child: Text(
                " Verification Code",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Image(
              image: AssetImage("assets/screen.png"),
            ),
            SizedBox(
              height: 70.h,
            ),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              appContext: context,
              length: 4,
              onChanged: (v) => print(v),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 50.h,
                fieldWidth: 50.w,
                activeFillColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 180.h,
            ),
            const Counter(),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 300.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditPassword()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(10, 207, 131, 1),
                  minimumSize: const Size(
                    90,
                    50,
                  ),
                ),
                child: const Text("Confirm code"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void startCount() {
    count = 20;
    setState(() {});
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count--;
      setState(() {});
      if (count == 0) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (count <= 0) {
      return TextButton(
        onPressed: startCount,
        child: const Text('Resend code'),
      );
    }
    return Text(
      "00:$count resend confirmation code.",
      style: TextStyle(fontSize: 18.sp, color: Colors.black),
    );
  }
}
