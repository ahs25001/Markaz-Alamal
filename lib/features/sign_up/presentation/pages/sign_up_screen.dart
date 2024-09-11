import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markaz_elamal/features/sign_up/presentation/bloc/sign_up_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/signup_text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Form(
            key: SignUpBloc.get(context).signUpFormKey,
            child: SafeArea(
              child: Stack(
                children: [
                  Container(
                    color: primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100.r),
                                  topRight: Radius.circular(100.r))),
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * .6,
                        )
                      ],
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.w, horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  letsStartWith,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  signUp,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 84.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 44.h),
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 20.w),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white, width: 10.w),
                                borderRadius: BorderRadius.circular(30.r),
                              gradient: LinearGradient(
                                  colors: [
                                    primaryColor,
                                    secondaryColor,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  appLogo,
                                  width: 74.w,
                                  height: 95.h,
                                )
                                    .animate()
                                    .slideY(
                                        begin: -1,
                                        end: 0,
                                        duration: 500.ms,
                                        delay: 500.ms)
                                    .fade(duration: 1000.ms),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  appName,
                                  style: TextStyle(
                                      fontFamily: peraltaFont,
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SignupTextInputField(
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return nameRequired;
                                          }
                                          return null;
                                        },
                                        labelText: name,
                                        controller: SignUpBloc.get(context)
                                            .nameController,
                                        isPassword: false,
                                        isPasswordHidden: false)
                                    .animate()
                                    .slideX(duration: 500.ms, begin: 1, end: 0),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SignupTextInputField(
                                        isEmail: true,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return emailRequired;
                                          } else if (!RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)) {
                                            return emailInvalid;
                                          }
                                          return null;
                                        },
                                        labelText: email,
                                        controller: SignUpBloc.get(context)
                                            .emailController,
                                        isPassword: false,
                                        isPasswordHidden: false)
                                    .animate()
                                    .slideX(
                                        duration: 500.ms, begin: -1, end: 0),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SignupTextInputField(
                                        changePasswordVisibility: () {
                                          SignUpBloc.get(context).add(
                                              ChangePasswordVisibilityEvent());
                                        },
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return passwordRequired;
                                          }
                                          return null;
                                        },
                                        labelText: password,
                                        controller: SignUpBloc.get(context)
                                            .passwordController,
                                        isPassword: true,
                                        isPasswordHidden:
                                            !(state.isPasswordVisible ?? false))
                                    .animate()
                                    .slideX(duration: 500.ms, begin: 1, end: 0),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SignupTextInputField(
                                        changePasswordVisibility: () {
                                          SignUpBloc.get(context).add(
                                              ChangeConfirmPasswordVisibilityEvent());
                                        },
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return confirmPasswordRequired;
                                          }
                                          return null;
                                        },
                                        labelText: confirmPassword,
                                        controller: SignUpBloc.get(context)
                                            .confirmPasswordController,
                                        isPassword: true,
                                        isPasswordHidden:
                                            !(state.isConfirmPasswordVisible ??
                                                false))
                                    .animate()
                                    .slideX(
                                        duration: 500.ms, begin: -1, end: 0),
                                SizedBox(
                                  height: 40.h,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.r)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 95.w, vertical: 10.h),
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    if (SignUpBloc.get(context)
                                        .signUpFormKey
                                        .currentState!
                                        .validate()) {
                                      print("Sign up button pressed");
                                    }
                                  },
                                  child: Text(
                                    signUp,
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor),
                                  ),
                                )
                                    .animate(delay: 500.ms)
                                    .slideY(begin: 1, end: 0)
                                    .fade(duration: 500.ms),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                alreadyHaveAccount,
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  login,
                                  style: TextStyle(
                                      color: secondaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
