import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
            onPressed: (context) {
            },
            icon: Icons.delete,
            label: "Delete",
            backgroundColor: secondaryColor,
            borderRadius: BorderRadius.circular(18.r))
      ]),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            gradient: LinearGradient(colors: [
              secondaryColor,
              primaryColor,
            ])),
        child: Row(
          children: [
            Image.asset(
              saraImage,
              width: 114.w,
              height: 128.h,
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr.sara mahmod",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "9 MAR",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "9:00 PM",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
