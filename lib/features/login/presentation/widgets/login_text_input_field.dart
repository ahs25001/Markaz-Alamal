import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextInputField extends StatelessWidget {
  String labelText;
  TextEditingController controller;
  bool isPassword;
  bool isPasswordHidden;
  Function validator;
  Function? changePasswordVisibility;
  Color borderColor;

  LoginTextInputField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.borderColor = Colors.white,
      this.changePasswordVisibility,
      required this.validator,
      required this.isPassword,
      required this.isPasswordHidden});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator(value);
      },
      style: TextStyle(color: borderColor, fontSize: 16.sp),
      cursorColor: borderColor,
      controller: controller,
      obscureText: (isPassword) ? isPasswordHidden : false,
      keyboardType: (isPassword)
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
        labelStyle: TextStyle(color: borderColor, fontSize: 16.sp),
        suffixIconColor: borderColor,
        prefixIconColor: borderColor,
        prefixIcon: (isPassword)
            ? Icon(Icons.lock_outline, size: 30.sp)
            : Icon(
                Icons.email_outlined,
                size: 30.sp,

              ),
        suffixIcon: (isPassword)
            ? InkWell(
                onTap: () {
                  if (changePasswordVisibility != null) {
                    changePasswordVisibility!();
                  }
                },
                child: Icon(
                    (!isPasswordHidden)
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 30.sp),
              )
            : SizedBox(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide(color: borderColor, width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide(color: borderColor, width: 2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide(color: borderColor, width: 2.w),
        ),
        labelText: labelText,
      ),
    );
  }
}
