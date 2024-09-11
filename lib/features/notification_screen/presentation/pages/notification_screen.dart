import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/features/notification_screen/domain/entities/notifecation_entity.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/notifiaction_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          notifications,
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
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return NotificationItem(NotificationEntity(
                time: "12:30pm",
                body:
                    "The payment mission has been done for booking an appointment",
                profileImage: saraImage));
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: unselectedColor,
            );
          },
          itemCount: 10),
    );
  }
}
