import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/features/login/presentation/pages/reset_password_bottom_sheet.dart';
import 'package:markaz_elamal/features/login/presentation/widgets/login_text_input_field.dart';

import '../../../../core/utils/app_strings.dart';
import '../bloc/login_bloc.dart';

class ForgetPasswordBottomSheet extends StatelessWidget {
  const ForgetPasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: LoginBloc(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.emailVerifiedSuccessfully) {
              Navigator.pop(context);
              showBottomSheet(
                showDragHandle: true,
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                  return ResetPasswordBottomSheet();
                },
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  forgotPassword,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  enterEmail,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: secondaryColor,
                      fontSize: 18.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                LoginTextInputField(
                    borderColor: primaryColor,
                    labelText: email,
                    controller: TextEditingController(),
                    validator: () {},
                    isPassword: false,
                    isPasswordHidden: false),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 60.h,
                    child: ElevatedButton(
                      onPressed: () {
                        LoginBloc.get(context).add(VerifyEmail());
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
                        continueText,
                        style: TextStyle(color: Colors.white, fontSize: 24.sp),
                      ),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
