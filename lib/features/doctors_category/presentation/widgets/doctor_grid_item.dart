import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/features/doctors_category/domain/entities/doctor_entity.dart';

import '../../../../core/utils/app_colors.dart';

class DoctorGridItem extends StatelessWidget {
  DoctorEntity doctorEntity;

  DoctorGridItem(this.doctorEntity);

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
                  end: Alignment.bottomRight,
                  colors: [primaryColor, secondaryColor]),
              color: primaryColor,
              borderRadius: BorderRadius.circular(18.r)),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                doctorEntity.image,
                width: 100.w,
                height: 115.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                doctorEntity.name,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(doctorEntity.speciality,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white30)),
              Spacer(),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.transparent),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(doctorEntity.rating.toString(),
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.star,
                      color: amberColor,
                      size: 15.sp,
                    ),
                  ])),
            ],
          )),
    );
  }
}
