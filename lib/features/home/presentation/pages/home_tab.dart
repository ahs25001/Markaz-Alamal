import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';
import 'package:markaz_elamal/features/home/presentation/widgets/category_list_item.dart';
import 'package:markaz_elamal/features/home/presentation/widgets/doctor_slider_item.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../doctors_category/domain/entities/doctor_entity.dart';
import '../bloc/home_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        appLogo,
                        width: 25.w,
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        appName,
                        style: TextStyle(
                            fontFamily: peraltaFont,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: secondaryColor),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.notficationScreen);
                        },
                        child: Container(
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.black54, blurRadius: 5.r)
                              ],
                              borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(
                                colors: [
                                  primaryColor,
                                  secondaryColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.chatsScreen);
                        },
                        child: Container(
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.black54, blurRadius: 5.r)
                              ],
                              borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(
                                colors: [
                                  primaryColor,
                                  secondaryColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),),
                          child: Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        cursorColor: secondaryColor,
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: secondaryColor),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            prefixIcon: Icon(Icons.search,
                                color: secondaryColor, size: 35.sp),
                            hintText: search,
                            hintStyle: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide(
                                color: secondaryColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide(
                                color: secondaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(
                                  color: secondaryColor,
                                ))),
                      )),
                      SizedBox(
                        width: 24.w,
                      ),
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          gradient: LinearGradient(
                              colors: [
                                primaryColor,
                                secondaryColor,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),),
                        child:
                            Icon(Icons.tune, color: Colors.white, size: 30.sp),
                      ),
                    ],
                  ),
                  Image.asset(
                    childImage,
                    width: double.infinity,
                    height: 204.h,
                  ),
                  Row(
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          HomeBloc.get(context).add(ChangeTab(index: 1));
                        },
                        child: Text(
                          seeAll,
                          style: TextStyle(
                              color: secondaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HomeBloc.get(context).add(ChangeTab(index: 1));
                        },
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
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 65.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 18.w,
                      ),
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryListItem(categories[index]);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Row(
                    children: [
                      Text(
                        doctors,
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          HomeBloc.get(context).add(ChangeTab(index: 2));
                        },
                        child: Text(
                          seeAll,
                          style: TextStyle(
                              color: secondaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HomeBloc.get(context).add(ChangeTab(index: 2));
                        },
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
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 300.h,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 318.h,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [
                         DoctorSliderItem(DoctorEntity(
                             description:
                             "Figma ipsum component variant main layer. Library figma reesizing invite mask arrow ipsum community. Prototype main ellipse opacity community auto flatten link. List device rectangle figjam subtract. Font pixel selection image rotate. Outline asset arrow library flatten blur. Style plugin union edit align.",
                             name: "Sara Mahmoud",
                             speciality: "Speech",
                             image: saraImage,
                             experience: "14 Years Experiece",
                             rating: 3.5)),
                         DoctorSliderItem(DoctorEntity(
                             description:
                             "Figma ipsum component variant main layer. Library figma reesizing invite mask arrow ipsum community. Prototype main ellipse opacity community auto flatten link. List device rectangle figjam subtract. Font pixel selection image rotate. Outline asset arrow library flatten blur. Style plugin union edit align.",
                             name: "Sara Mahmoud",
                             speciality: "Speech",
                             image: saraImage,
                             experience: "14 Years Experiece",
                             rating: 3.5)),
                         DoctorSliderItem(DoctorEntity(
                             description:
                             "Figma ipsum component variant main layer. Library figma reesizing invite mask arrow ipsum community. Prototype main ellipse opacity community auto flatten link. List device rectangle figjam subtract. Font pixel selection image rotate. Outline asset arrow library flatten blur. Style plugin union edit align.",
                             name: "Sara Mahmoud",
                             speciality: "Speech",
                             image: saraImage,
                             experience: "14 Years Experiece",
                             rating: 3.5)),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
