import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';
import 'package:markaz_elamal/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:markaz_elamal/features/settings/presentation/pages/rating_dialog.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/settings_item.dart';
import 'change_password_bottom_sheet.dart';
import 'feed_back_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            centerTitle: true,
            title: Text(
              settings,
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
            actions: [
              const Icon(Icons.settings),
              SizedBox(
                width: 20.w,
              )
            ],
          ),
          body: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            accountSettings,
                            style: TextStyle(
                                color: dividerColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 38.h,
                          ),
                          SettingsItem(
                            onTab: () {},
                            title: "Profile Information",
                            description: "Name, Email, Security",
                            icon: profileInfoIcon,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SettingsItem(
                            onTab: () {
                              Navigator.pushNamed(context, AppRoutes.privacy);
                            },
                            title: privacy,
                            description: "Control your privacy",
                            icon: privacyIcon,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SettingsItem(
                            onTab: () {
                              showBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                showDragHandle: true,
                                builder: (context) {
                                  return ChangePasswordBottomSheet();
                                },
                              );
                            },
                            title: changePassword,
                            description: "Change your current password",
                            icon: changePasswordIcon,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 55.h,
                    ),
                    Divider(
                      color: dividerColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            general,
                            style: TextStyle(
                                color: dividerColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 38.h,
                          ),
                          SettingsItem(
                            onTab: () {
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  backgroundColor: dividerColor,
                                  content: RatingDialog(),
                                );
                              },);
                            },
                            title: rateApp,
                            description: "Rate & Review us",
                            icon: rateAppIcon,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SettingsItem(
                            onTab: () {
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  backgroundColor: dividerColor,
                                  content: FeedBackDialog(),
                                );
                              },);
                            },
                            title: sendFeedback,
                            description: "Share your thought",
                            icon: sendFeedbackIcon,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
