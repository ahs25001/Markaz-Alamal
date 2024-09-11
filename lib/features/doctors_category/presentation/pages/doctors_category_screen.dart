import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/features/doctors_category/domain/entities/doctor_entity.dart';
import 'package:markaz_elamal/features/doctors_category/presentation/bloc/doctors_category_bloc.dart';
import 'package:markaz_elamal/features/doctors_category/presentation/widgets/doctor_grid_item.dart';
import 'package:markaz_elamal/features/home/domain/entities/category_entity.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/doctor_list_item.dart';
import '../widgets/popular_doctor_item.dart';

class DoctorsCategoryScreen extends StatelessWidget {
  const DoctorsCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as CategoryEntity;
    return BlocProvider(
      create: (context) => DoctorsCategoryBloc(),
      child: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white, size: 30.sp),
            centerTitle: true,
            title: Text(args.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600)),
            backgroundColor: primaryColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ]),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18.0.h, vertical: 15.h),
          children: [
            Row(
              children: [
                Text(
                  popularDoctor,
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    seeAll,
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_forward,
                    color: secondaryColor,
                    size: 35.sp,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 235.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 10.w,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return PopularDoctorItem(DoctorEntity(
                    description:
                        "Figma ipsum component variant main layer. Library figma reesizing invite mask arrow ipsum community. Prototype main ellipse opacity community auto flatten link. List device rectangle figjam subtract. Font pixel selection image rotate. Outline asset arrow library flatten blur. Style plugin union edit align.",
                    name: "Sara Mahmoud",
                    speciality: args.name,
                    image: saraImage,
                    experience: "12 Years Experiece",
                    rating: 2.5,
                  ));
                },
              ),
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
            Row(
              children: [
                Text(
                  bookADoctor,
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                BlocSelector<DoctorsCategoryBloc, DoctorsCategoryState, bool?>(
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
                              DoctorsCategoryBloc.get(context)
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
                              DoctorsCategoryBloc.get(context)
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
            SizedBox(
              height: 15.h,
            ),
            BlocSelector<DoctorsCategoryBloc, DoctorsCategoryState, bool?>(
              selector: (state) => state.inListView,
              builder: (context, inListView) {
                if (inListView ?? true) {
                  return ListView.separated(
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
                            speciality: args.name,
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
                            speciality: args.name,
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
