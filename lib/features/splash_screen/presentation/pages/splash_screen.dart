import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              appLogo,
              height: 226.17.h,
              width: 178.w,
            )
                .animate(
                  onComplete: (controller) => Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.onBoarding, (route) => false),
                )
                .slideX(
                    duration: 1500.ms,
                    begin: 1,
                    end: 0,
                    curve: Curves.easeInOutBack),
            SizedBox(height: 12.sp),
            Text(
              appName,
              style: TextStyle(
                  fontSize: 24.sp,
                  color: secondaryColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: peraltaFont),
            ).animate().slideX(
                duration: 1500.ms,
                begin: -1,
                end: 0,
                curve: Curves.easeInOutBack),
          ],
        ),
      ),
    );
  }
}
