import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/Screen/on_boarding_three_screen/on_boarding_three_screen.dart';
import 'package:teqinvalleyproject/utils/custom_color.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';
import 'package:teqinvalleyproject/widget/custom_elevated_button.dart';
import 'package:teqinvalleyproject/widget/custom_image.dart';

class OnBoardingTwoScreen extends StatelessWidget {
  const OnBoardingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Key Features"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(3.w),
              padding: EdgeInsets.all(3.w),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.px),
                  border: Border.all(color: Color(0xffbC2C2C2))),
              child: Column(
                children: [
                  CustomImageView(
                    height: 150.px,
                    width: 150.px,
                    imagePath: "assets/images/before.png",
                  ),
                  Text(
                    "Schedule posts across multiple \nsocial media platforms",
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyle.pw400.copyWith(color: Color(0xffb585858)),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(3.w),
              padding: EdgeInsets.all(3.w),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.px),
                  border: Border.all(color: Color(0xffbC2C2C2))),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: "assets/images/before.png",
                  ),
                  Text(
                    "Schedule posts across multiple \nsocial media platforms",
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyle.pw400.copyWith(color: Color(0xffb585858)),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(3.w),
              padding: EdgeInsets.all(3.w),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.px),
                  border: Border.all(color: Color(0xffbC2C2C2))),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: "assets/images/before.png",
                  ),
                  Text(
                    "Schedule posts across multiple \nsocial media platforms",
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyle.pw400.copyWith(color: Color(0xffb585858)),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(3.w),
              padding: EdgeInsets.all(3.w),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.px),
                  border: Border.all(color: Color(0xffbC2C2C2))),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: "assets/images/before.png",
                  ),
                  Text(
                    "Schedule posts across multiple \nsocial media platforms",
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyle.pw400.copyWith(color: Color(0xffb585858)),
                  )
                ],
              ),
            ),
            CustomElevatedButton(
              onTap: () {
                Get.to(() => OnBoardingThreeScreen());
              },
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              text: "Next",
              height: 50.px,
              buttonColor: white,
              textColor: black,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.px),
                  border: Border.all(color: Color(0xffb848484))),
            ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
      ),
    );
  }
}
