import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/features/home/domain/entities/user_entity.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_strings.dart';

class ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserEntity user = ModalRoute.of(context)!.settings.arguments as UserEntity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          profileDetails,
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 30.sp),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: Container(
                width: 132.w,
                height: 132.h,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Image.asset(
                  user.image,
                  width: 106.w,
                  height: 99.h,
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              fullName,
              style: TextStyle(
                  color: labelTextColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              color: labelTextColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(user.name,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
            SizedBox(height: 20.h,),
            Text(
              phoneNumber,
              style: TextStyle(
                  color: labelTextColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              color: labelTextColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(user.phone,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
            SizedBox(height: 20.h,),
            Text(
              email,
              style: TextStyle(
                  color: labelTextColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              color: labelTextColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(user.email,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
