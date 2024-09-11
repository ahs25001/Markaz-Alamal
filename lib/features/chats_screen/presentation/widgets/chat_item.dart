import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/features/chat_screen/presentation/pages/chat_screen.dart';
import 'package:markaz_elamal/features/doctors_category/domain/entities/doctor_entity.dart';

class ChatItem extends StatelessWidget {
  DoctorEntity doctorEntity;

  ChatItem(this.doctorEntity);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.chatScreen,
            arguments: doctorEntity);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(doctorEntity.image),
                radius: 30.r),
            SizedBox(
              width: 36.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorEntity.name,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Text("Hi",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            Spacer(),
            Text("12:30 pm", style: TextStyle(
              color: secondaryColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            )),
          ],
        ),
      ),
    );
  }
}
