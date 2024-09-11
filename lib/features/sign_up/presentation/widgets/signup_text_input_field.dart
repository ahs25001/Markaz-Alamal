import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupTextInputField extends StatelessWidget {
  String labelText;
  TextEditingController controller;
  bool isPassword;
  bool isPasswordHidden;
  bool isEmail;
  Function validator;
  Function? changePasswordVisibility;

  SignupTextInputField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.isEmail = false,
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
      style: TextStyle(color: Colors.white, fontSize: 16.sp),
      cursorColor: Colors.white,
      controller: controller,
      obscureText: (isPassword) ? isPasswordHidden : false,
      keyboardType: (isPassword)
          ? TextInputType.visiblePassword
          : isEmail
              ? TextInputType.emailAddress
              : TextInputType.name,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
        labelStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
        suffixIconColor: Colors.white,
        prefixIconColor: Colors.white,
        prefixIcon: (isPassword)
            ? Icon(Icons.lock_outline, size: 30.sp)
            : isEmail
                ? Icon(
                    Icons.email_outlined,
                    size: 30.sp,
                  )
                : Icon(Icons.person_outline, size: 30.sp),
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
          borderSide: BorderSide(color: Colors.white, width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide(color: Colors.white, width: 2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide(color: Colors.white, width: 2.w),
        ),
        labelText: labelText,
      ),
    );
  }
}
