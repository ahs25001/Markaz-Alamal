import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/config/routes/routes.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_json.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';
import 'package:markaz_elamal/features/on_boarding/presentation/pages/on_boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../bloc/on_boarding_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingBloc(),
      child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: primaryColor,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EN",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        (state.currentIndex < 2)
                            ? InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                                },
                                child: Text(
                                  skip,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: OnBoardingBloc.get(context).pageController,
                      children: [
                        OnBoardingItem(
                            lottie: choseYourDoctorJson,
                            title: firstTitle,
                            description: firstDesc),
                        OnBoardingItem(
                            lottie: dateJson,
                            title: secondTitle,
                            description: secondDesc),
                        OnBoardingItem(
                            lottie: connectJson,
                            title: thirdTitle,
                            description: thirdDesc),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    color: Colors.white,
                    child: Row(
                      children: [
                        SmoothPageIndicator(
                          controller:
                              OnBoardingBloc.get(context).pageController,
                          count: 3,
                          effect: ExpandingDotsEffect(
                              activeDotColor: primaryColor,
                              dotColor: Colors.grey),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            if(state.currentIndex < 2){
                              OnBoardingBloc.get(context).add(GoToNextPage());
                            }else{
                              Navigator.pushReplacementNamed(context, AppRoutes.login);
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                (state.currentIndex < 2) ? next : start,
                                style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 30.sp,
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
          );
        },
      ),
    );
  }
}
