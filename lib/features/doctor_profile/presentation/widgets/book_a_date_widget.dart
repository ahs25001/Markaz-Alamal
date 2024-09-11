import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/features/doctor_profile/presentation/pages/doctor_profile_screen.dart';

import '../bloc/doctor_profile_bloc.dart';

class BookADateWidget extends StatefulWidget {
  @override
  State<BookADateWidget> createState() => _BookADateWidgetState();
}

class _BookADateWidgetState extends State<BookADateWidget> {
  List<String> months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];

  int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[
      31,
      -1,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    return daysInMonth[month - 1];
  }

  final ScrollController _scrollController = ScrollController();
  int startIndex = DateTime.now().day;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController
          .jumpTo(startIndex * 70.0); // Adjust 50.0 based on item height
    });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return BlocBuilder<DoctorProfileBloc, DoctorProfileState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    if (!((state.selectedDay ?? DateTime.now().day) == index) &&
                        index >= DateTime.now().day) {
                      DoctorProfileBloc.get(context).add(SelectDayEvent(index));
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 32.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      gradient:
                          ((state.selectedDay ?? DateTime.now().day) == index)
                              ? LinearGradient(
                                  colors: [
                                      primaryColor,
                                      secondaryColor,
                                    ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)
                              : null,
                      color: unselectedColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          (index + 1).toString(),
                          style: TextStyle(
                              color:
                                  ((state.selectedDay ?? DateTime.now().day) ==
                                          index)
                                      ? Colors.white
                                      : secondaryColor,
                              fontSize: 16.sp),
                        ),
                        Text(
                          months[DateTime.now().month - 1],
                          style: TextStyle(
                              color:
                                  ((state.selectedDay ?? DateTime.now().day) ==
                                          index)
                                      ? Colors.white
                                      : secondaryColor,
                              fontSize: 16.sp),
                        ),
                      ],
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
          itemCount: getDaysInMonth(DateTime.now().year, DateTime.now().month)),
    );
  }
}
