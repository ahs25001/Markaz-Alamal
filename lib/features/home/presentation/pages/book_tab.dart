import 'package:animate_do/animate_do.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../doctors_category/domain/entities/doctor_entity.dart';
import '../../../doctors_category/presentation/widgets/doctor_grid_item.dart';
import '../../../doctors_category/presentation/widgets/doctor_list_item.dart';
import '../bloc/home_bloc.dart';

class BookTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: primaryColor,
              padding: EdgeInsets.symmetric(vertical: 18.h),
              child: Center(
                  child: Text(
                selectDateAndTime,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700),
              )),
            ),
            SizedBox(
              height: 32.h,
            ),
            BlocSelector<HomeBloc, HomeState, DateTime>(
              selector: (state) {
                return state.selectedDate ?? DateTime.now();
              },
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    DateFormat.yMMMMd().format(state),
                    style: TextStyle(
                        fontSize: 22.0.sp,
                        fontWeight: FontWeight.w700,
                        color: primaryColor),
                  ),
                );
              },
            ),
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              activeColor: primaryColor,
              dayProps: EasyDayProps(todayHighlightColor: primaryColor,),
              headerProps:  EasyHeaderProps(
                  padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
                  showMonthPicker: false,
                  selectedDateStyle: TextStyle(
                      color: primaryColor,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w600)),
              onDateChange: (selectedDate) {
                HomeBloc.get(context)
                    .add(SelectDate(selectedDate));
              },
            ),
            SizedBox(
              height: 25.h,
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2.h,
              thickness: 2.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text(
                    availableDoctors,
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  BlocSelector<HomeBloc,HomeState, bool?>(
                    selector: (state) {
                      return state.inListView;
                    },
                    builder: (context, inListView) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(18.r)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                HomeBloc.get(context)
                                    .add(ChangeViewTypeEvent(true));
                              },
                              child: Icon(
                                Icons.list,
                                size: 35.sp,
                                color: (inListView ?? true)
                                    ? secondaryColor
                                    : primaryColor.withOpacity(.5),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                HomeBloc.get(context)
                                    .add(ChangeViewTypeEvent(false));
                              },
                              child: Icon(
                                Icons.grid_view_outlined,
                                size: 35.sp,
                                color: (inListView ?? true)
                                    ? primaryColor.withOpacity(.5)
                                    : secondaryColor,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            BlocSelector<HomeBloc, HomeState, bool?>(
              selector: (state) => state.inListView,
              builder: (context, inListView) {
                if (inListView ?? true) {
                  return ListView.separated(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return FadeInRight(
                        from: (index == 0) ? 50 : index * 100,
                        child: DoctorListItem(DoctorEntity(
                            name: "Sara Mahmoud",
                            speciality: "Speech",
                            description:
                            "Figma ipsum component variant main layer. Library figma reesizing invite mask arrow ipsum community. Prototype main ellipse opacity community auto flatten link. List device rectangle figjam subtract. Font pixel selection image rotate. Outline asset arrow library flatten blur. Style plugin union edit align.",
                            image: saraImage,
                            experience: "14 Years Experiece",
                            rating: 3.5)),
                      );
                    },
                  );
                } else {
                  return GridView.builder(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 167 / 220,
                        crossAxisSpacing: 21.w,
                        mainAxisSpacing: 25.h,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return FadeInUp(
                        from: (index == 0) ? 50 : index * 100,
                        child: DoctorGridItem(DoctorEntity(
                            description:
                            "Figma ipsum component variant main layer. Library figma reesizing invite mask arrow ipsum community. Prototype main ellipse opacity community auto flatten link. List device rectangle figjam subtract. Font pixel selection image rotate. Outline asset arrow library flatten blur. Style plugin union edit align.",
                            name: "Sara Mahmoud",
                            speciality: "Speech",
                            image: saraImage,
                            experience: "14 Years Experiece",
                            rating: 3.5)),
                      );
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
