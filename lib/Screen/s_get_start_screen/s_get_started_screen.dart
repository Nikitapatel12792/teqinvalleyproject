import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/Screen/home_container_screen/home_container_screen.dart';
import 'package:teqinvalleyproject/Screen/s_get_start_screen/controller/g_startes_controller.dart';
import 'package:teqinvalleyproject/constants/image_constants.dart';
import 'package:teqinvalleyproject/utils/custom_color.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';
import 'package:teqinvalleyproject/widget/custom_drop_down_widget.dart';
import 'package:teqinvalleyproject/widget/custom_elevated_button.dart';
import 'package:teqinvalleyproject/widget/custom_image.dart';
import 'package:teqinvalleyproject/widget/custom_textfield2.dart';

class SGetStartedScreen extends StatelessWidget {
  SGetStartedScreen({super.key});
  var controller = Get.put(SstartedController());
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
            width: MediaQuery.of(context).size.width,
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
            top: MediaQuery.of(context).size.height * 0.25,
            bottom: 0, // Allow it to stretch to the bottom of the screen
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.px),
                      topLeft: Radius.circular(30.px))),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Center(
                        child: Text(
                          "Welcome to Cust exp Project",
                          style: AppTextStyle.pw600
                              .copyWith(color: Colors.grey.shade700),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomtextField(
                          validator: (val){
                            if(val!.isEmpty || val.isNull){
                              return "Please enter fullname";
                            }
                            return null;
                          },
                          child: SizedBox(),
                          obsecure: false,
                          hint: "Full Name",
                          controller: controller.fullname,
                          title: "Full Name"),
                      SizedBox(
                        height: 2.h,
                      ),
                      Obx(
                            () => CustomtextField(
                              validator: (val){
                                if(val!.isEmpty || val.isNull){
                                  return "Please enter password";
                                }
                                return null;
                              },
                          obsecure: controller.obsecure.value,
                          hint: "Password",
                          controller: controller.password,
                          title: "Password",
                          child: GestureDetector(
                            onTap: () {
                              controller.obsecure.value =
                              !controller.obsecure.value;
                            },
                            child: Icon(
                              controller.obsecure.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 20,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomDropdown(
                        message:"Please select the job function" ,

                        title: "Job Function",
                        hintText: "Select Job Function",
                        items: controller.jobFunction,
                        selectedValue: controller.selectedjobFunction,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomDropdown(
                        message:"Please select the job level" ,

                        title: "Job Level",
                        hintText: "Select Job Level",
                        items: controller.jobLevel,
                        selectedValue: controller.selectedJobLevel,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomtextField(
                          validator: (val){
                            if(val!.isEmpty || val.isNull){
                              return "Please enter mobile number";
                            }
                            else if(val.length!=10){
                              return "Please enter valid mobile number";
                            }
                            return null;
                          },
                          hint: "Mobile Number",
                          controller: controller.mobile,
                          child: SizedBox(),
                          obsecure: false,
                          title: "Mobile Number"),
                      SizedBox(
                        height: 2.h,
                      ),
                      Obx(() => Row(
                        children: [
                          Checkbox(
                            value: controller.isChecked.value,
                            onChanged: (value) {
                              controller.isChecked.value = value!;
                            },
                            activeColor: appColor,
                          ),
                          Text(
                            "I Agree Terms & Condition",
                            style: AppTextStyle.pw400.copyWith(fontSize: 16.px),
                          ),
                        ],
                      )),
                      if (formKey.currentState?.validate() == false)
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "You must accept the terms to proceed",
                            style: AppTextStyle.pw400.copyWith(
    fontSize: 12.px,
    color: Colors.red,
    ),
                          ),
                        ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomElevatedButton(text: "Get Started",
                        height: 50.px,
                        onTap: (){
                       if(formKey.currentState!.validate()){
                         Get.to(()=>HomeContainerScreen());
                       }
                        },
                        buttonColor: appColor,
                        textColor: white,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
