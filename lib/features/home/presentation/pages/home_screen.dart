import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_constants.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';
import 'package:markaz_elamal/features/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Scaffold(
              body: tabs[state.currentTeb],
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        primaryColor,
                        secondaryColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: BottomNavigationBar(
                    onTap: (value) {
                      HomeBloc.get(context).add(ChangeTab(index: value));
                    },
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.white30,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    currentIndex: state.currentTeb,
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          homeIcon,
                          width: 28.w,
                          height: 28.h,
                          color: (state.currentTeb == 0)
                              ? Colors.white
                              : Colors.white30,
                        ),
                        label: home,
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          categoryIcon,
                          width: 35.w,
                          height: 35.h,
                          color: (state.currentTeb == 1)
                              ? Colors.white
                              : Colors.white30,
                        ),
                        label: category,
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(bookIcon, width: 28.w,
                          height: 28.h,
                          color: (state.currentTeb == 2) ? Colors.white: Colors.white30,),
                        label: book,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_2_outlined),
                        label: profile,
                      ),
                    ]),
              ),
            );
          },
        ));
  }
}
