import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';
import 'package:markaz_elamal/features/login/presentation/widgets/login_text_input_field.dart';

import '../../../../core/utils/app_colors.dart';

class ResetPasswordBottomSheet extends StatelessWidget {
  const ResetPasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            resetPassword,
            style: TextStyle(
              color: secondaryColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(enterCode,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: secondaryColor,
                  fontSize: 18.sp)),
          SizedBox(
            height: 20.h,
          ),
          Text(
            enterDigits,
            style: TextStyle(
                color: secondaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          OtpTextField(
            cursorColor: primaryColor,
            numberOfFields: 5,
            borderColor: primaryColor,
            showFieldAsBox: true,
            focusedBorderColor: primaryColor,
            keyboardType: TextInputType.number,
            borderRadius: BorderRadius.circular(18.r),
          ),
          SizedBox(
            height: 20.h,
          ),
          LoginTextInputField(
              labelText: password,
              controller: TextEditingController(),
              validator: () {},
              isPassword: true,
              borderColor: primaryColor,
              isPasswordHidden: true),
          SizedBox(
            height: 20.h,
          ),
          LoginTextInputField(
              labelText: confirmPassword,
              controller: TextEditingController(),
              validator: () {},
              isPassword: true,
              borderColor: primaryColor,
              isPasswordHidden: true),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
              width: double.infinity,
              height: 60.h,
              child: ElevatedButton(
                onPressed: () {
                  // LoginBloc.get(context).add(VerifyEmail());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                backgroundBuilder: (context, states, child) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            primaryColor,
                            secondaryColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                    child: child,
                  );
                },
                ),
                child: Text(
                  resetPassword,
                  style: TextStyle(color: Colors.white, fontSize: 24.sp),
                ),
              ))
        ],
      ),
    );
  }
}
