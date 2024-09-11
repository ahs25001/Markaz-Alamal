import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markaz_elamal/core/utils/app_colors.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/features/doctors_category/domain/entities/doctor_entity.dart';
import 'package:intl/intl.dart' as intl;
import '../widgets/massage_item.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> massages = [
    "bbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ccccccccccccccccccaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "vvvvvvvvvvvvvvvvvvaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "zzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "111111111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
  ];
  late TextEditingController massageController;
  late ScrollController scrollController;

  @override
  void initState() {
    massageController = TextEditingController();
    scrollController = ScrollController();
    super.initState();
  }
  @override
  void dispose() {
    massageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DoctorEntity args =
        ModalRoute.of(context)!.settings.arguments as DoctorEntity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30.r,
            backgroundImage: AssetImage(args.image),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
        title: Text(
          args.name,
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
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
              reverse: true,
              separatorBuilder: (context, index) => SizedBox(
                height: 14.h,
              ),
              itemCount: massages.length,
              controller: scrollController,
              itemBuilder: (context, index) => MassageItem(
                  massage: massages[(massages.length - 1) - index],
                  fromMe: !(index % 5 == 0)),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height*.25,
                minHeight: 95.h
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 26.w),
              color: unselectedColor,
              // height: ,
              child: Row(
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt,
                    size: 36.sp,
                  ),
                  Expanded(
                    child: ValueListenableBuilder<TextDirection>(
                      valueListenable: textDir,
                      builder: (context, value, child) => TextField(
                        maxLines: null,
                        controller: massageController,
                        textDirection: value,
                        onChanged: (v) {
                          if (getDirection(v) != value) {
                            textDir.value = getDirection(v);
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Type message",
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: hintTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            border: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent)),
                            disabledBorder: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent))),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      if(massageController.text.isNotEmpty) {
                        setState(() {
                          massages.add(massageController.text.trim());
                          massageController.clear();
                          scrollController.animateTo(
                            scrollController.position.minScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.fastOutSlowIn,
                          );
                        });
                      }

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 7.h),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(100.r),
                       gradient: LinearGradient(colors: [
                         primaryColor,
                         secondaryColor
                       ])
                     ),
                      child: SvgPicture.asset(sendIcon,width: 60.w,height: 60.h,),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  ValueNotifier<TextDirection> textDir = ValueNotifier(TextDirection.ltr);

  TextDirection getDirection(String text) {
    return intl.Bidi.detectRtlDirectionality(text)
        ? TextDirection.rtl
        : TextDirection.ltr;
  }
}
