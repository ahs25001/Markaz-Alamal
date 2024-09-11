import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/features/doctor_profile/presentation/pages/doctor_profile_screen.dart';

import '../bloc/payment_method_bloc.dart';
import '../widgets/payment_method_item.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentMethodBloc(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 25.sp),
          backgroundColor: primaryColor,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
            ),
          ),
          actions: [
            Text(
              "Add",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 15.w),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Method",
                style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: secondaryColor),
              ),
              SizedBox(
                height: 21.h,
              ),
              Text(
                "Choose desired vehicle type. We offer cars suitable for most every day needs.",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: secondaryColor),
              ),
              SizedBox(
                height: 44.h,
              ),
              BlocSelector<PaymentMethodBloc, PaymentMethodState, int?>(
                selector: (state) {
                  return state.selectedMethod;
                },
                builder: (context, state) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      PaymentMethodBloc.get(context)
                          .add(SelectPaymentMethodEvent(1));
                    },
                    child: PaymentMethodItem(
                      logoLink: masterCardIcon,
                      paymentMethodTitle: "Master card payment.",
                      isSelected: state == 1,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocSelector<PaymentMethodBloc, PaymentMethodState, int?>(
                selector: (state) {
                  return state.selectedMethod;
                },
                builder: (context, state) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      PaymentMethodBloc.get(context)
                          .add(SelectPaymentMethodEvent(2));
                    },
                    child: PaymentMethodItem(
                      logoLink: visaIcon,
                      paymentMethodTitle: "Visa payment.",
                      isSelected: state == 2,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocSelector<PaymentMethodBloc, PaymentMethodState, int?>(
                selector: (state) {
                  return state.selectedMethod;
                },
                builder: (context, state) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      PaymentMethodBloc.get(context)
                          .add(SelectPaymentMethodEvent(3));
                    },
                    child: PaymentMethodItem(
                        logoLink: cashLogo,
                        paymentMethodTitle: "Cash payment.",
                        isSelected: state == 3),
                  );
                },
              ),
              SizedBox(
                height: 90.h,
              ),
              BlocSelector<PaymentMethodBloc, PaymentMethodState, int?>(
                selector: (state) {
                  return state.selectedMethod;
                },
                builder: (context, state) {
                  return Center(
                    child: ElevatedButton(
                      onPressed:  () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundBuilder: (context, states, child) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      primaryColor,
                                      secondaryColor,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: child,
                            );
                          },
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.w, vertical: 7.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r))),
                      child: Text("Done",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
