import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class FeatureItem extends StatelessWidget {
  String title;
  IconData icon;

  Function onTap;

  FeatureItem({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      onTap: () {
        onTap();
      },
      leading: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(100.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Icon(icon, color: Colors.white)),
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
