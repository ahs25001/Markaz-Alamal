import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordTextField extends StatelessWidget {
  Function validator;
  Color borderColor;
  TextEditingController controller;
  bool isPasswordHidden;
  Function? changePasswordVisibility;

  ChangePasswordTextField(
      {required this.validator,
      required this.borderColor,
      required this.controller,
      required this.isPasswordHidden,
      this.changePasswordVisibility});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: "*",
      validator: (value) {
        return validator(value);
      },
      style: TextStyle(color: borderColor, fontSize: 16.sp),
      cursorColor: borderColor,
      controller: controller,
      obscureText: isPasswordHidden,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
        labelStyle: TextStyle(color: borderColor, fontSize: 16.sp),
        suffixIconColor: borderColor,
        prefixIconColor: borderColor,
        prefixIcon: Icon(Icons.lock_outline, size: 30.sp),
        suffixIcon: InkWell(
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
        ),
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
      ),
    );
  }
}
