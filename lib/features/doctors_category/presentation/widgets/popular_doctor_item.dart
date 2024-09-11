import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:markaz_elamal/features/doctors_category/domain/entities/doctor_entity.dart';

import '../../../../config/routes/routes.dart';

class PopularDoctorItem extends StatelessWidget {
  DoctorEntity doctorEntity;

  PopularDoctorItem(this.doctorEntity);

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
            colors: [
              primaryColor,
             secondaryColor
            ]
          ),
          color: primaryColor,
          borderRadius: BorderRadius.circular(18.r)
        ),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                doctorEntity.image,
                width: 100.w,
                height: 115.h,
              ),
              SizedBox(height: 8.h,),
              Text(
                doctorEntity.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
             SizedBox(height: 8.h,),
              Text(doctorEntity.experience,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600)),
              Spacer(),
              RatingBarIndicator(
                itemCount: 5,
                itemSize: 20.sp,
                rating: doctorEntity.rating,
                unratedColor: Colors.white30,
                itemBuilder: (BuildContext context, int index) {
                  return Icon(
                    Icons.star,
                    color: amberColor,
                  );
                },
              )
            ],
          )),
    );
  }
}
