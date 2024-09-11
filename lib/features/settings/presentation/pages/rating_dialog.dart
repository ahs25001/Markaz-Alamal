import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_strings.dart';

import '../widgets/rewiewTextField.dart';

class RatingDialog extends StatelessWidget {
  const RatingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          sendRating,
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30.h,
        ),
        Center(
          child: RatingBar.builder(
            unratedColor: unselectedColor,
            onRatingUpdate: (value) {},
            itemCount: 5,
            initialRating: 3,
            itemBuilder: (context, index) {
              return Icon(
                Icons.star,
                color: amberColor,
              );
            },
          ),
        ),
        SizedBox(
          height: 26.h,
        ),
        Text(
          writeReview,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20.h,
        ),
        ReviewTextField(
          controller: TextEditingController(),
          hint: "Enter your review",
        ),
        SizedBox(
          height: 30.h,
        ),
        Center(
            child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            submit,
            style: TextStyle(
                color: secondaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          ),
        ))
      ],
    );
  }
}
