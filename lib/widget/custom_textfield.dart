
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/utils/custom_color.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';

Widget textFieldWidget(BuildContext context,{required bool obsecure,required IconData icon,
  TextInputType? textinput,Widget? child,  required FormFieldValidator<String> validator,
  required TextEditingController controller,required String hint,required String title}){
  return       Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(3.w),
    decoration: BoxDecoration(
        color: white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.px)),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.grey.shade400,
        ),
        SizedBox(
          width: 3.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               title ??"",
                style: AppTextStyle.pw400.copyWith(
                    color: Colors.grey.shade600,
                    fontSize: 12.px),
              ),
              TextFormField(
                obscureText: obsecure,
                validator: validator,
                controller: controller,
                style: AppTextStyle.pw400
                    .copyWith(color: black, fontSize: 12.px),
                decoration: InputDecoration(
                    hintStyle: AppTextStyle.pw400.copyWith(
                        color: black, fontSize: 12.px),
                    border: InputBorder.none,
                    suffix: child,
                    hintText: hint),
              )
            ],
          ),
        )
      ],
    ),
  );
}