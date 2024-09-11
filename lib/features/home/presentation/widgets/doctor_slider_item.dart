import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/features/doctors_category/domain/entities/doctor_entity.dart';

import '../../../../config/routes/routes.dart';

class DoctorSliderItem extends StatelessWidget {
  DoctorEntity doctorEntity;

  DoctorSliderItem(this.doctorEntity);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.doctorProfile,
            arguments: doctorEntity);
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  primaryColor,
                  secondaryColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(34.r),
            border: Border.all(color: primaryColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34.r),
                    topRight: Radius.circular(34.r)),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Image.asset(
                      saraImage,
                      width: 290.w,
                      height: 124.h,
                    ),
                    Positioned(
                        right: 10.w,
                        top: 10.h,
                        child: Icon(
                          Icons.favorite,
                          color: primaryColor,
                        )),
                    Positioned(
                        bottom: 6.w,
                        left: 6.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(18.r)),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 10.w),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: amberColor, size: 20.sp),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "4.8",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Sara",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text("12 expertise",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.8),
                      )),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    "\$ 20 ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text("Know more...",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(.8),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
