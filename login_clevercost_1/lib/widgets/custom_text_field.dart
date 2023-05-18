import 'package:login_clevercost_1/configs/app_theme.dart';
import 'package:login_clevercost_1/configs/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final String name;
  final int? maxLines;
  final TextEditingController? textcontoller;
  final String? hint, helperText, errorText, initialValue;
  final TextStyle? helperStyle;
  final bool? isPass, readOnly, enabled, autoFocus, isSuffixIcon;
  final double? width;
  final FocusNode? node;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final VoidCallback? onTap;
  final String? Function(String?)? validatorFtn;
  final String? Function(String?)? onChangeFtn;
  final String? Function(String?)? onSubmitFtn;

  const CustomTextField({
    Key? key,
    this.node,
    this.enabled,
    this.errorText,
    this.autoFocus,
    this.prefixIcon,
    this.onChangeFtn,
    this.initialValue,
    this.validatorFtn,
    required this.name,
    required this.hint,
    this.isPass = false,
    this.textCapitalization = TextCapitalization.none,
    this.isSuffixIcon = false,
    required this.textInputType,
    this.width = double.infinity,
    this.textInputAction = TextInputAction.done,
    this.readOnly,
    this.onTap,
    this.maxLines,
    this.textcontoller,
    this.onSubmitFtn,
    this.helperText,
    this.helperStyle,
    this.suffixIcon,
  }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool show = false;

  @override
  void initState() {
    show = widget.isPass!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      cursorColor: Colors.black,
      style: TextStyle(fontSize: Get.width * FontSizes.eighteen),
      autocorrect: false,
      controller: widget.textcontoller,
      onTap: widget.onTap,
      textCapitalization: widget.textCapitalization,
      enabled: widget.enabled ?? true,
      initialValue: widget.initialValue,
      name: widget.name,
      autofocus: widget.autoFocus ?? false,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      focusNode: widget.node,
      readOnly: widget.readOnly ?? false,
      obscureText: show,
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
        helperMaxLines: 2,
        helperStyle: widget.helperStyle,
        helperText: widget.helperText,
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPass!
            ? IconButton(
                splashRadius: 8,
                onPressed: () {
                  setState(() {
                    show = !show;
                  });
                },
                icon: Icon(
                  show ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                  color: AppColor.primaryColor,
                ),
              )
            : widget.suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hint,
        hintStyle: TextStyle(
            fontSize: Get.width * FontSizes.eighteen,
            color: AppColor.hintTextColor),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
        ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: BorderSide(
        //     color: Colors.red.withAlpha(200),
        //     width: 2,
        //   ),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: BorderSide(
        //     color: Colors.red.withAlpha(200),
        //     width: 2,
        //   ),
        // ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
        ),
      ),
      validator: widget.validatorFtn,
      onChanged: widget.onChangeFtn,
      onSubmitted: widget.onSubmitFtn,
    );
  }
}
