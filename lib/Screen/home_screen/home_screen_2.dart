import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/utils/custom_color.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';
import 'package:teqinvalleyproject/widget/custom_elevated_button.dart';
import 'package:teqinvalleyproject/widget/custom_image.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:white,
      appBar: AppBar(
        backgroundColor:white,
        automaticallyImplyLeading: false,
        title: Text("Cust exp Project",style: AppTextStyle.pw500.copyWith(
          color: black
        ),),
        actions: [
          CustomElevatedButton(
            width: 100.px,
            height: 35.px,
            buttonColor: appColor,
            textColor: white,
            text: "Demo",),
          SizedBox(
            width: 3.w,
          ),
          GestureDetector(
            onTap: (){},
            child: Icon(Icons.menu),
          ),
          SizedBox(
            width: 3.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xffbF4FAFD),
              child: Column(
                children: [
                  SizedBox(height: 2.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.check_circle, color: appColor),
                          Icon(Icons.check_circle, color: appColor),
                          Icon(Icons.check_circle, color: appColor),
                        ],
                      ),
                      SizedBox(width: 3.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoWidget(title: "Unified Platform"),
                          InfoWidget(title: "Next-gen AI"),
                          InfoWidget(title: "Enterprise-grade"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Center(
                    child: Text("Simplify \nSocial Media Management",textAlign: TextAlign.center,style: AppTextStyle.pw800.copyWith(
                        color: black
                    ),),
                  ),
                  SizedBox(height: 1.h,),
                  SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding:  EdgeInsets.only(left: 3.w),
                      child: Row(
                        children:List.generate(4,(index) {
                          return commaonWidget1(title: "Unified Platform");

                        },),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h,),
            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Padding(
                padding:  EdgeInsets.only(left: 3.w),
                child: Row(
                  children:List.generate(4,(index) {
                    return commaonWidget(title: "Unified Platform");

                  },),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xffbF4FAFD),
              child: Column(
                children: [
                  Text("More engagement,\nless effort",textAlign: TextAlign.center,style: AppTextStyle.pw800.copyWith(
                    fontSize: 24.px
                  ),),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vehicula, mauris ",
                    textAlign: TextAlign.center,style: AppTextStyle.pw400.copyWith(
                      fontSize: 12.px
                  ),),
                  CustomImageView(
                    imagePath: "assets/images/before.png",
                  ),
                  Text("Before",style: AppTextStyle.pw600.copyWith(
                      fontSize: 18.px,color: black
                  ),)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget InfoWidget({String? title}) {
    return Text(
      title ?? "",
      style: AppTextStyle.pw500.copyWith(color: black),
    );
  }
  Widget commaonWidget1({String? title}){
    return  Container(
      width: MediaQuery.of(context).size.width*0.7,
      margin: EdgeInsets.symmetric(horizontal:1.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.px),
          border: Border.all(color: Color(0xffbE4E2E2))
      ),
      child: Column(
        children: [
          CustomImageView(
            imagePath: "assets/images/home2.png",
          ),
          SizedBox(height: 1.h,),
          Text("Next-gen Artificial Intelligence" ,textAlign: TextAlign.center,style: AppTextStyle.pw600.copyWith(
              color: black
          ),),
          SizedBox(height: 1.h,),
          Row(
            children: [
              Icon(Icons.check,color: appColor,),
              Text("Natural Language Processing",textAlign: TextAlign.center,style: AppTextStyle.pw400.copyWith(
                color: black,
              ),),
            ],
          ),
          Row(
            children: [
              Icon(Icons.check,color: appColor,),
              Text("Natural Language Processing",textAlign: TextAlign.center,style: AppTextStyle.pw400.copyWith(
                color: black,
              ),),
            ],
          ),
          Row(
            children: [
              Icon(Icons.check,color: appColor,),
              Text("Natural Language Processing",textAlign: TextAlign.center,style: AppTextStyle.pw400.copyWith(
                color: black,
              ),),
            ],
          )
        ],
      ),
    );
  }
  Widget commaonWidget({String? title}){
    return  Container(
      width: MediaQuery.of(context).size.width*0.7,
      margin: EdgeInsets.symmetric(horizontal:1.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.px),
          border: Border.all(color: Color(0xffbE4E2E2))
      ),
      child: Column(
        children: [
          CustomImageView(
            imagePath: "assets/images/home.png",
          ),
          SizedBox(height: 1.h,),
          Text(title ?? "",style: AppTextStyle.pw600.copyWith(
              color: black
          ),),
          SizedBox(height: 1.h,),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
              " Proin vehicula, mauris vel ",textAlign: TextAlign.center,style: AppTextStyle.pw400.copyWith(
            color: black,

          ),)
        ],
      ),
    );
  }
}
