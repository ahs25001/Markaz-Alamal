import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/rewiewTextField.dart';

class FeedBackDialog extends StatefulWidget {
  const FeedBackDialog({super.key});

  @override
  State<FeedBackDialog> createState() => _FeedBackDialogState();
}

class _FeedBackDialogState extends State<FeedBackDialog> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            sendUsFeedback,
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Do you have a suggestion or found some bug! ",
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
            hint: "Describe your issue or idea",
          ),
          SizedBox(
            height: 20.h,
          ),
          Wrap(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<int>(
                    activeColor: Colors.white,
                    value: 1,
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.white; // Color when selected
                          }
                          return unselectedColor; // Color when unselected
                        }),
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                  Text(
                    bug,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<int>(
                    value: 2,
                    activeColor: Colors.white,
                    groupValue: selectedValue,
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.white; // Color when selected
                          }
                          return unselectedColor; // Color when unselected
                        }),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                  Text(
                    comment,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<int>(
                    value: 3,
                    activeColor: Colors.white,
                    groupValue: selectedValue,
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.white; // Color when selected
                          }
                          return unselectedColor; // Color when unselected
                        }),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                  Text(
                    other,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r)),
                  padding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                ),
                child: Text(
                    sendFeedback,
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                )),
          )
        ]);
  }
}
