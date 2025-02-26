import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/Screen/on_boarding_two_screen/on_bording_two_screen.dart';
import 'package:teqinvalleyproject/utils/custom_color.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';
import 'package:teqinvalleyproject/widget/custom_elevated_button.dart';
import 'package:teqinvalleyproject/widget/custom_image.dart';

class OnBoardingOneScreen extends StatelessWidget {
  const OnBoardingOneScreen({super.key});

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
              imagePath: "assets/images/after.png",
            ),
          ),
          SizedBox(height: 2.h,),
          Center(
            child: Text("Simplify Your Social Media",style: AppTextStyle.pw800.copyWith(
                fontSize: 20.px,
                color: black
            ),),
          ),
          SizedBox(height: 2.h,),
          Text("Manage multiple accounts, schedule posts, "
              "and track performance in one place",textAlign: TextAlign.center,
            style: AppTextStyle.pw400.copyWith(
              color: black
          ),),
          SizedBox(height: 2.h,),
          CustomElevatedButton(
            onTap: (){
              Get.to(()=>OnBoardingTwoScreen());
            },
             margin: EdgeInsets.symmetric(horizontal: 5.w),
            text: "Next",height: 50.px,buttonColor: white,
            textColor: black,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.px),
            border: Border.all(
              color: Color(0xffb848484)
            )
          ),)
        ],
      ),
    );
  }
}
