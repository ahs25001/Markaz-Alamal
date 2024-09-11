import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:markaz_elamal/features/on_boarding/presentation/pages/on_boarding_screen.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class OnBoardingItem extends StatelessWidget {
  String lottie;
  String title;
  String description;

  OnBoardingItem(
      {Key? key,
      required this.lottie,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Lottie.asset(
          lottie,
          width: 340.w,
          height: 340.h,
          repeat: false
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r))),
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                description,
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
      ],
    );
  }
}
