import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/features/home/domain/entities/category_entity.dart';

import '../../../../core/utils/app_colors.dart';

class CategoryListItem extends StatelessWidget {
  CategoryEntity categoryEntity;

  CategoryListItem(this.categoryEntity);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.categoryDoctors, arguments: categoryEntity);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 17.h),
        height: 60.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomRight,
                colors: [primaryColor, secondaryColor]),
            borderRadius: BorderRadius.circular(18.r)),
        child: Text(
          categoryEntity.name,
          style: TextStyle(
              color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
