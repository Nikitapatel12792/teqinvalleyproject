import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/Screen/on_boarding_one_screen/on_boarding_one_screen.dart';
import 'package:teqinvalleyproject/utils/custom_color.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';
import 'package:teqinvalleyproject/widget/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      Get.to(OnBoardingOneScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Spacer(),
          Center(
            child: CustomImageView(
              imagePath: "assets/images/app_logo.png",
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: Text(
              "Welcome to Cust exp project",
              style: AppTextStyle.pw800.copyWith(fontSize: 20.px, color: black),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "Your all-in-one social media management platform",
            style: AppTextStyle.pw400.copyWith(color: black),
          )
        ],
      ),
    );
  }
}
