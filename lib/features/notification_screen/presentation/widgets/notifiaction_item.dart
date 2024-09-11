import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/features/notification_screen/domain/entities/notifecation_entity.dart';

import '../../../../core/utils/app_colors.dart';

class NotificationItem extends StatelessWidget {
  NotificationEntity notificationEntity;

  NotificationItem(this.notificationEntity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: AssetImage(notificationEntity.profileImage),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 300.w,
                  child: Text(
                    notificationEntity.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Text(
                notificationEntity.time,
                 style: TextStyle(
                    color: secondaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }
}
