import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';
import 'package:markaz_elamal/features/login/presentation/widgets/login_text_input_field.dart';

import '../bloc/login_bloc.dart';
import 'forget_password_bottom_sheet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            key: LoginBloc.get(context).loginFormKey,
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
                    body: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return SingleChildScrollView(
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
                                      login,
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
                                        end: Alignment.bottomRight),
                                   ),
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
                                    LoginTextInputField(
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return emailRequired;
                                              } else if (!RegExp(
                                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(value)) {
                                                return emailInvalid;
                                              }
                                              return null;
                                            },
                                            labelText: email,
                                            controller: LoginBloc.get(context)
                                                .emailController,
                                            isPassword: false,
                                            isPasswordHidden: false)
                                        .animate()
                                        .slideX(
                                            duration: 500.ms, begin: 1, end: 0),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    LoginTextInputField(
                                            changePasswordVisibility: () {
                                              LoginBloc.get(context).add(
                                                  ChangePasswordVisibility());
                                            },
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return passwordRequired;
                                              }
                                              return null;
                                            },
                                            labelText: password,
                                            controller: LoginBloc.get(context)
                                                .passwordController,
                                            isPassword: true,
                                            isPasswordHidden:
                                                !(state.isPasswordVisible ??
                                                    false))
                                        .animate()
                                        .slideX(
                                            duration: 500.ms,
                                            begin: -1,
                                            end: 0),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.r)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 109.w,
                                              vertical: 10.h),
                                          backgroundColor: Colors.white),
                                      onPressed: () {
                                        // if (LoginBloc.get(context)
                                        //     .loginFormKey
                                        //     .currentState!
                                        //     .validate()) {
                                        //   print("Logged in");
                                        // }
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          AppRoutes.home,
                                          (route) => false,
                                        );
                                      },
                                      child: Text(
                                        login,
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
                                    InkWell(
                                      onTap: () {
                                        showBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.white,
                                          showDragHandle: true,
                                          builder: (context) {
                                            return ForgetPasswordBottomSheet();
                                          },
                                        );
                                      },
                                      child: Text(
                                        forgotPassword,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 150.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    notHaveAccount,
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
                                      Navigator.pushNamed(
                                          context, AppRoutes.register);
                                    },
                                    child: Text(
                                      signUp,
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
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
