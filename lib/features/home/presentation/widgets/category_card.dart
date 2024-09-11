import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/features/home/domain/entities/category_entity.dart';

class CategoryCard extends StatelessWidget {
  CategoryEntity categoryEntity;

  CategoryCard(this.categoryEntity);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.categoryDoctors, arguments: categoryEntity);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: primaryColor,
          gradient: LinearGradient(
              end: Alignment.bottomRight,
              colors: [
                primaryColor,
                secondaryColor
              ]
          ),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          children: [
            Image.asset(
              categoryEntity.image,
              width: 176.w,
              height: 131.h,
            ),
            Text(
              categoryEntity.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 24.sp),
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 35.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
