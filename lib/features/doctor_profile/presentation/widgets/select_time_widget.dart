import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../bloc/doctor_profile_bloc.dart';

class SelectTimeWidget extends StatelessWidget {
  List<String> times = ['8:00', '11:00', '13:00', '18:00', '20:00'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return BlocBuilder<DoctorProfileBloc, DoctorProfileState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    if (!(state.selectedTime == times[index])) {
                      DoctorProfileBloc.get(context)
                          .add(SelectTimeEvent(times[index]));
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 32.w),
                    decoration: BoxDecoration(
                      gradient: (state.selectedTime == times[index])
                          ?LinearGradient(
                          colors: [
                            primaryColor,
                            secondaryColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight):null,
                      borderRadius: BorderRadius.circular(10.r),
                      color: unselectedColor,
                    ),
                    child: Text(
                      times[index],
                      style: TextStyle(
                          color: (state.selectedTime == times[index])
                              ? Colors.white
                              : secondaryColor,
                          fontSize: 16.sp),
                    ),
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 12.w,
            );
          },
          itemCount: times.length),
    );
  }
}
