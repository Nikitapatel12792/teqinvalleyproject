
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/Screen/new_password_screen/new_password_screen.dart';
import 'package:teqinvalleyproject/constants/image_constants.dart';
import 'package:teqinvalleyproject/utils/custom_color.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';
import 'package:teqinvalleyproject/widget/custom_elevated_button.dart';
import 'package:teqinvalleyproject/widget/custom_image.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      top: MediaQuery.of(context).size.height*0.25,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.px),
                            topRight:  Radius.circular(30.px),
                          )
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
                            Center(
                              child: Text(
                                "Verification",
                                style: AppTextStyle.pw600
                                    .copyWith(color: Colors.grey.shade600),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Center(
                              child: Text(
                                "Enter Verification Code",
                                style: AppTextStyle.pw500
                                    .copyWith(color: Colors.grey.shade500),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            OtpPinField(

                              key: _otpPinFieldController,
                              autoFillEnable: false,
                              autoFocus: false,
                              onSubmit: (text) {
                                print('Entered pin is $text');
                              },
                              onChange: (text) {
                                print('Enter on change pin is $text');
                              },
                              onCodeChanged: (code) {
                                print('onCodeChanged is $code');
                              },
                              otpPinFieldStyle: OtpPinFieldStyle(
                                showHintText: true,
                                filledFieldBorderColor: appColor,
                                activeFieldBackgroundColor: white,
                                filledFieldBackgroundColor: white,
                                defaultFieldBackgroundColor: white,
                                fieldBorderWidth: 1,
                                activeFieldBorderColor: appColor,
                                defaultFieldBorderColor: Colors.grey.shade400,
                                textStyle: AppTextStyle.pw500,
                              ),
                              maxLength: 4,
                              showCursor: true,
                              cursorColor: appColor,
                              showCustomKeyboard: false,
                              cursorWidth: 3,
                              mainAxisAlignment: MainAxisAlignment.center,
                              highlightBorder: true,
                              showDefaultKeyboard: true,
                              otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("If you don't receive code. ",style: AppTextStyle.pw400.copyWith(
                                    color: Colors.grey.shade400
                                ),),
                                Text("Resend",style: AppTextStyle.pw400.copyWith(
                                  color: Colors.blueAccent
                                ),)
                              ],
                            ),
                            SizedBox(height: 15.h,),
                            CustomElevatedButton(text: "Submit",
                              height: 50.px,
                              onTap: (){
                               if(formKey.currentState!.validate()){
                                 Get.to(()=>NewPasswordScreen());
                               }
                              },
                              buttonColor: appColor,
                              textColor: white,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Center(
                              child: TextButton(onPressed: (){}, child: Text("Cancel",style: AppTextStyle.pw500.copyWith(
                                  color: Colors.grey
                              ),)),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
    );
  }
}
