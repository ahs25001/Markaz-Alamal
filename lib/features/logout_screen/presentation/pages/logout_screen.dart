import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';

import '../../../../core/utils/app_colors.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 132.w,
                  height: 132.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Image.asset(
                    profileImage,
                    width: 106.w,
                    height: 99.h,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Ahmed Hassen",
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 30.h),
                decoration: BoxDecoration(
                    color: dividerColor,
                    borderRadius: BorderRadius.circular(30.r)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 44.h,
                    ),
                    Text(
                      seeYouSoon,
                      style: TextStyle(
                          fontFamily: oleoScriptSwashCapsFont,
                          fontSize: 40.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Text(
                      "You are about to logout. Are you sure this is what you want ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          splashColor: Colors.transparent,
                          child: Text(cancel,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700)),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutes.login,
                                (route) => false,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 20.w),
                            ),
                            child: Text(
                              confirmLogout,
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checkBoxValue,
                          checkColor: secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              checkBoxValue = value!;
                            });
                          },
                          fillColor: MaterialStateProperty.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.white;
                              }
                              return Colors.transparent;
                            },
                          ),
                          side: BorderSide(color: Colors.white),
                        ),
                        Text(
                          "Logout from all devices",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
