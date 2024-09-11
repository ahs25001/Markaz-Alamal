import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';

class PrivacyItem extends StatelessWidget {
  String title;
  String content;
  bool isActive;
Function onChange;
  PrivacyItem(
      {required this.title, required this.content, required this.isActive,required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * .7,
                    child: Text(
                      content,
                      style: TextStyle(
                          color: hintTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ))
              ],
            ),
            Spacer(),
            Switch(
              activeTrackColor: primaryColor,
              value: isActive, onChanged: (value) {
                onChange(value);
            },)
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Divider(
          color: dividerColor,
        )
      ],
    );
  }
}
