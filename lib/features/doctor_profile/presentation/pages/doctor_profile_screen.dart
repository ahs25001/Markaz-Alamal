import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';
import 'package:markaz_elamal/features/doctor_profile/presentation/bloc/doctor_profile_bloc.dart';
import 'package:markaz_elamal/features/doctors_category/domain/entities/doctor_entity.dart';

import '../widgets/book_a_date_widget.dart';
import '../widgets/select_time_widget.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as DoctorEntity;
    return BlocProvider(
      create: (context) => DoctorProfileBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white, size: 30.sp),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                args.image,
                width: 179.w,
                height: 200.h,
              ),
              Container(
                padding: EdgeInsets.only(top: 16.h),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r)),
                ),
                child: Column(
                  children: [
                    Text(
                      args.experience,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            args.name,
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            args.speciality,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  args.rating.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Icon(
                                  Icons.star,
                                  color: amberColor,
                                  size: 16.sp,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            args.description,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            bookADate,
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          BookADateWidget(),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            selectATime,
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          SelectTimeWidget(),
                          SizedBox(
                            height: 42.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundBuilder:
                                        (context, states, child) {
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
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    backgroundColor: unselectedColor,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 20.w),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, AppRoutes.chatScreen,arguments: args);
                                  },
                                  child: Text(
                                    sendMessage,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundBuilder:
                                        (context, states, child) {
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
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 20.w),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.paymentMethod);
                                  },
                                  child: Text(bookNow,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white))),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
