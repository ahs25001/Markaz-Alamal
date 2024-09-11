import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/features/chats_screen/presentation/widgets/chat_item.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../doctors_category/domain/entities/doctor_entity.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          chats,
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
            return ChatItem(DoctorEntity(
                description:
                "Figma ipsum component variant main layer. Library figma reesizing invite mask arrow ipsum community. Prototype main ellipse opacity community auto flatten link. List device rectangle figjam subtract. Font pixel selection image rotate. Outline asset arrow library flatten blur. Style plugin union edit align.",
                name: "Sara Mahmoud",
                speciality: "Speech",
                image: saraImage,
                experience: "14 Years Experiece",
                rating: 3.5));
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: unselectedColor,
            );
          },
          itemCount: 20),
    );
  }
}
