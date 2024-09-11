import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ReviewTextField extends StatelessWidget {
  TextEditingController controller;
String hint;
  ReviewTextField({required this.controller,required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: TextStyle(
          color: hintTextColor,
          fontSize: 16.sp,
        ),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(18.r)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(18.r)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18.r)),
      ),
    );
  }
}
