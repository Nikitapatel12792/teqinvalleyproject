

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/widget/base_button.dart';



class CustomElevatedButton extends BaseButton {
  CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    VoidCallback? onTap,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    Color? buttonColor,
    Color? textColor,
    required String text,
  }) : super(
      text: text,
      buttonColor: buttonColor,
      onTap: onTap,
      buttonStyle: buttonStyle,
      isDisabled: isDisabled,
      buttonTextStyle: buttonTextStyle,
      height: height,
      width: width,
      alignment: alignment,
      margin: margin,
      textColor:textColor
  );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: buildElevatedButtonWidget,
    )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
    height: this.height ?? 7.h,
    width: this.width ?? double.maxFinite,
    margin: margin,
    decoration: decoration,
    child: ElevatedButton(
      style: buttonStyle ??ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          )

      ),
      onPressed: isDisabled ?? false ? null : onTap ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftIcon ?? const SizedBox.shrink(),
          Text(
            text,
            style: buttonTextStyle?? TextStyle(
                color: textColor,
                fontFamily:"poppins",
                fontWeight: FontWeight.w500,
                fontSize: 16.px
            ),
          ),
          rightIcon ?? const SizedBox.shrink(),
        ],
      ),
    ),
  );
}