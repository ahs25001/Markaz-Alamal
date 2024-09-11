import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';

class SettingsItem extends StatelessWidget {
  String title;
  String description;
  String icon;
Function onTab;

  SettingsItem(
      {required this.title, required this.description, required this.icon,required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTab();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
            border: Border.all(color: secondaryColor),
            borderRadius: BorderRadius.circular(18.r)),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios,color: secondaryColor,)
          ],
        ),
      ),
    );
  }
}
