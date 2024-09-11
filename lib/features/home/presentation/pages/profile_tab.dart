import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';
import 'package:markaz_elamal/features/chat_screen/presentation/pages/chat_screen.dart';
import 'package:markaz_elamal/features/home/domain/entities/user_entity.dart';
import 'package:markaz_elamal/features/home/presentation/widgets/feature_item.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Text(
                'Profile',
                style: TextStyle(
                    fontSize: 26.sp,
                    color: secondaryColor,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: 132.w,
                height: 132.h,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Image.asset(
                  profileImage,
                  width: 106.w,
                  height: 99.h,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Ahmed Hassen",
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30.h,
              ),
              FeatureItem(
                  title: history,
                  icon: Icons.history,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.historyDetails);
                  }),
              SizedBox(
                height: 10.h,
              ),
              FeatureItem(
                  title: profileDetails,
                  icon: Icons.person,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.profileDetails,
                        arguments: UserEntity(
                            name: "Ahmed Hassen",
                            email: "assas@asas",
                            image: profileImage,
                            phone: "01203682237"));
                  }),
              SizedBox(
                height: 10.h,
              ),
              FeatureItem(
                  title: chats,
                  icon: Icons.chat_bubble_outline_sharp,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.chatsScreen);
                  }),
              SizedBox(
                height: 10.h,
              ),
              FeatureItem(
                  title: settings, icon: Icons.settings, onTap: () {
                    Navigator.pushNamed(context, AppRoutes.settings);
              }),
              SizedBox(
                height: 10.h,
              ),
              FeatureItem(
                  title: help, icon: Icons.help_outline, onTap: () {}),
              SizedBox(
                height: 10.h,
              ),
              FeatureItem(title: logOut, icon: Icons.logout, onTap: () {
                Navigator.pushNamed(context, AppRoutes.logout,);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
