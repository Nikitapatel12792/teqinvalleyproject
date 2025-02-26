import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/Screen/forget_password_screen/forget_password_screen.dart';
import 'package:teqinvalleyproject/Screen/home_container_screen/home_container_screen.dart';
import 'package:teqinvalleyproject/Screen/sign_in_screen/controller/sign_in_controller.dart';
import 'package:teqinvalleyproject/Screen/sign_up_screen/sign_up_screen.dart';
import 'package:teqinvalleyproject/constants/image_constants.dart';
import 'package:teqinvalleyproject/utils/custom_color.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';
import 'package:teqinvalleyproject/widget/custom_elevated_button.dart';
import 'package:teqinvalleyproject/widget/custom_image.dart';
import 'package:teqinvalleyproject/widget/custom_textfield.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  var controller = Get.put(SignInController());
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
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
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
                        textFieldWidget(context, validator: (value) {
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
                        SizedBox(
                          height: 3.h,
                        ),
                        Obx(
                          () => textFieldWidget(context, validator: (val) {
                            if (val!.isEmpty || val.isNull) {
                              return "Please enter password";
                            }
                            return null;
                          },
                              obsecure: controller.obsecure.value,
                              icon: Icons.lock_open,
                              child: GestureDetector(
                                onTap: () {
                                  controller.obsecure.value =
                                      !controller.obsecure.value;
                                },
                                child: Icon(
                                  controller.obsecure.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              controller: controller.pass,
                              hint: "Enter your password",
                              title: "Password"),
                        ),
                        // textFieldWidget(
                        //   controller: controller.email,
                        //   child: Icon(Icons.email_outlined),
                        //   readonly: false,
                        //   hint: "Sign up with Email"
                        // ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => ForgetPasswordScreen());
                            },
                            child: Text(
                              "Forgot Password ?",
                              style:
                                  AppTextStyle.pw400.copyWith(fontSize: 12.px),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),

                        CustomElevatedButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Get.to(() => HomeContainerScreen());
                            }
                          },
                          height: 50.px,
                          text: "Login",
                          buttonColor: appColor,
                          textColor: white,
                          decoration: BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(10.px),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have account? ",
                              style: AppTextStyle.pw400
                                  .copyWith(color: black, fontSize: 14.px),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SignUpScreen());
                              },
                              child: Text(
                                " Sign Up",
                                style: AppTextStyle.pw400.copyWith(
                                    color: Colors.red, fontSize: 14.px),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
