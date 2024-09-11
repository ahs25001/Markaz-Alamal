import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';

import '../widgets/history_item.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          historyDetails,
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
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemBuilder: (context, index) {
            return HistoryItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.h,);
          },
          itemCount: 10),
    );
  }
}
