import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';
import 'package:markaz_elamal/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:markaz_elamal/features/settings/presentation/widgets/change_password_text_field.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: SettingsBloc.get(context),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  changePassword,
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 48.h,
                ),
                Text(
                  currentPassword,
                  style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
                ChangePasswordTextField(
                    controller:
                        SettingsBloc.get(context).currentPasswordController,
                    borderColor: secondaryColor,
                    validator: () {},
                    isPasswordHidden: state.isCurrentPasswordVisible ?? false,
                    changePasswordVisibility: () {
                      SettingsBloc.get(context)
                          .add(ChangeCurrentPasswordVisibilityEvent());
                    }),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  newPassword,
                  style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
                ChangePasswordTextField(
                    controller:
                        SettingsBloc.get(context).newPasswordController,
                    borderColor: secondaryColor,
                    validator: () {},
                    isPasswordHidden: state.isNewPasswordVisible ?? false,
                    changePasswordVisibility: () {
                      SettingsBloc.get(context)
                          .add(ChangeNewPasswordVisibilityEvent());
                    }),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  confirmPassword,
                  style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
                ChangePasswordTextField(
                    controller:
                        SettingsBloc.get(context).confirmPasswordController,
                    borderColor: secondaryColor,
                    validator: () {},
                    isPasswordHidden: state.isConfirmPasswordVisible ?? false,
                    changePasswordVisibility: () {
                      SettingsBloc.get(context)
                          .add(ChangeConfirmPasswordVisibilityEvent());
                    }),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 20.w),
                        ),
                        child: Text(confirm,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: unselectedColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                      ),
                      child: Text("Cancel",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: secondaryColor)),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
