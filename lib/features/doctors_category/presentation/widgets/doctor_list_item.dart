import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/features/doctors_category/domain/entities/doctor_entity.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';

class DoctorListItem extends StatelessWidget {
  DoctorEntity doctorEntity;

  DoctorListItem(this.doctorEntity);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.doctorProfile,
            arguments: doctorEntity);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          gradient: LinearGradient(
              end: Alignment.bottomRight,
              colors: [secondaryColor, primaryColor]),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Text(
                  doctorEntity.speciality,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white30),
                ),
                SizedBox(
                  height: 8.h,
                ),
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
            ),
            Spacer(),
            Image.asset(
              doctorEntity.image,
              width: 125.w,
              height: 145.h,
            ),
          ],
        ),
      ),
    );
  }
}
