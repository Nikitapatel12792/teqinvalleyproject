import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/Screen/s_get_start_screen/s_get_started_screen.dart';
import 'package:teqinvalleyproject/Screen/sign_in_screen/sign_in_screen.dart';
import 'package:teqinvalleyproject/Screen/sign_up_screen/controller/sign_up_controller.dart';
import 'package:teqinvalleyproject/constants/image_constants.dart';
import 'package:teqinvalleyproject/utils/custom_color.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';
import 'package:teqinvalleyproject/widget/custom_elevated_button.dart';
import 'package:teqinvalleyproject/widget/custom_image.dart';
import 'package:teqinvalleyproject/widget/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  var controller = Get.put(SignUpController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xffb81e7d5),
                    Color(0xffb81e7d5),
                    Color(0xffb81e7d5),
                    appColor,
                    appColor
                  ])),
            ),
            Positioned(
              top: 7.h, // Move image down by 7.h
              left: 0,
              right: 0,
              child: Center(
                // Ensures image is centered horizontally
                child: CustomImageView(
                  fit: BoxFit.cover,
                  imagePath: ImageConstant.app_logo,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.18,
              bottom: 0.0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: AppTextStyle.pw600
                            .copyWith(fontSize: 30.px, color: white),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Let’s get you all set up so you can access your personal account.",
                        style: AppTextStyle.pw400.copyWith(color: white),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Form(
                        key: formKey,
                        child: textFieldWidget(context, validator: (value) {
                          String p =
                              "[a-zA-Z0-9+._%-+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+";
                          RegExp regExp = RegExp(p);
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else {
                            //If email address matches pattern
                            if (regExp.hasMatch(value)) {
                              return null;
                            } else {
                              //If it doesn't match
                              return 'Email is not valid';
                            }
                          }
                        },
                            obsecure: false,
                            icon: Icons.email_outlined,
                            controller: controller.email,
                            hint: "Enter your email",
                            title: "Email Address"),
                      ),
                      // textFieldWidget(
                      //   controller: controller.email,
                      //   child: Icon(Icons.email_outlined),
                      //   readonly: false,
                      //   hint: "Sign up with Email"
                      // ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: Colors.grey.shade300,
                          )),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "Sign up with",
                            style: AppTextStyle.pw400.copyWith(
                                color: Colors.grey.shade600, fontSize: 16.px),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Expanded(
                              child: Divider(
                            color: Colors.grey.shade300,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomImageView(
                            onTap: () {
                              controller.googleSignIn();
                            },
                            imagePath: ImageConstant.icon_google,
                            height: 40.px,
                            width: 40.px,
                          ),
                          // CustomImageView(
                          //   onTap: () {},
                          //   imagePath: ImageConstant.icon_linkedin,
                          //   height: 40.px,
                          //   width: 40.px,
                          // ),
                          CustomImageView(
                            onTap: () {},
                            imagePath: ImageConstant.icon_microsoft,
                            height: 40.px,
                            width: 40.px,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomElevatedButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Get.to(() => SGetStartedScreen());
                          }
                        },
                        height: 50.px,
                        text: "Get Started",
                        buttonColor: appColor,
                        textColor: white,
                        decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(10.px),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: AppTextStyle.pw400
                                .copyWith(color: black, fontSize: 14.px),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SignInScreen());
                            },
                            child: Text(
                              " Login",
                              style: AppTextStyle.pw400
                                  .copyWith(color: Colors.red, fontSize: 14.px),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
