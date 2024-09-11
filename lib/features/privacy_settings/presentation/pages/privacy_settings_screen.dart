import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';
import 'package:markaz_elamal/features/privacy_settings/presentation/bloc/privacy_bloc.dart';

import '../widgets/privacy_item.dart';

class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrivacyBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text(
            privacy,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Text(
                  privacyPreferences,
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Text(
                  "Hi there, we don't want to keep any info that you're not comfortable sharing. We want our users to have 100% control of their informariton 100% of the time. Toggle below what you'd like to share and not share baring in mind the more you share with us the more tailored user experience you'll receive - thanks!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 43.h,
                ),
                BlocSelector<PrivacyBloc, PrivacyState, bool>(
                  selector: (state) {
                    return state.nameIsActive;
                  },
                  builder: (context, state) {
                    return PrivacyItem(
                      onChange: (value) {
                        PrivacyBloc.get(context).add(ChaneNameActivity(value));
                      },
                      title: name,
                      content: "Ahmed Hassen",
                      isActive: state,
                    );
                  },
                ),
                BlocSelector<PrivacyBloc, PrivacyState, bool>(
                  selector: (state) {
                    return state.phoneIsActive;
                  },
                  builder: (context, state) {
                    return PrivacyItem(
                      onChange: (value) {
                        PrivacyBloc.get(context).add(ChanePhoneActivity(value));
                      },
                      title: phoneNumber,
                      content: "01203682237",
                      isActive: state,
                    );
                  },
                ),
                BlocSelector<PrivacyBloc, PrivacyState, bool>(
                  selector: (state) {
                    return state.emailIsActive;
                  },
                  builder: (context, state) {
                    return PrivacyItem(
                      onChange: (value) {
                        PrivacyBloc.get(context).add(ChaneEmailActivity(value));
                      },
                      title: email,
                      content: "hTqo8@example.com",
                      isActive: state,
                    );
                  },
                ),
                BlocSelector<PrivacyBloc, PrivacyState, bool>(
                  selector: (state) {
                    return state.recommendationsIsActive;
                  },
                  builder: (context, state) {
                    return PrivacyItem(
                      onChange: (value) {
                        PrivacyBloc.get(context)
                            .add(ChaneRecommendationsActivity(value));
                      },
                      title: recommendations,
                      content:
                          "f we see you interact with something more, we will recommend more of that content.",
                      isActive: state,
                    );
                  },
                ),
                SizedBox(
                  height: 80.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundBuilder: (context, states, child) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      primaryColor,
                                      secondaryColor,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: child,
                            );
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 20.w),
                        ),
                        child: Text("Save preferences",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: unselectedColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                      ),
                      child: Text("Cancel",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: secondaryColor)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
