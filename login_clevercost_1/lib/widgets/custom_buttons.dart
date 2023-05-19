import 'package:login_clevercost_1/configs/app_theme.dart';
import 'package:login_clevercost_1/configs/font_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ButtonVariant {
  filled,
  bordered,
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonName,
      this.height,
      this.width,
      this.type,
      this.onPressed,
      this.color})
      : isFilled = type == ButtonVariant.filled,
        super(key: key);

  final ButtonVariant? type;
  final VoidCallback? onPressed;
  final Color? color;
  final String buttonName;
  final double? height;
  final double? width;
  final bool isFilled;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: isFilled
              ? color ?? AppColor.primaryColor
              : AppColor.primaryBackgroundColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: isFilled ? 0 : 2,
            color: color ?? AppColor.primaryColor,
          ),
        ),
        child: Center(
            child: Text(
          buttonName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Get.width * FontSizes.twenty,
            color: isFilled
                ? AppColor.primaryBackgroundColor
                : color ?? AppColor.primaryColor,
          ),
        )),
      ),
    );
  }
}
