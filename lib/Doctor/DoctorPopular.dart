import 'dart:developer';

import 'package:doctor/admin/models/Category.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorPopular extends StatelessWidget {
  UserDoctorCategory categoryDoctor;

  DoctorPopular(this.categoryDoctor);

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: 320.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(8.r),
            ),
            border: Border.all(
              strokeAlign: StrokeAlign.center,
              color:const Color(0xffE3E9ED),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 76.w,
                height: 76.h,
                margin: EdgeInsetsDirectional.all(10.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(8.r),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  categoryDoctor.imageUrl!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                  top: 20.r,
                  start: 5.r,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryDoctor.name!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color:const Color(0xff3B3A43),
                      ),
                    ),
                    Text(
                      categoryDoctor.specialization!,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color:const Color(0xffA9B8C1),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.location_pin,
                            size: 15.sp,
                            color:const Color(0xffA9B8C1),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          categoryDoctor.location!,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color:const Color(0xffA9B8C1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 25.r,
                  end: 19.r,
                ),
                child: IconButton(
                  onPressed: () async {
                     final number = categoryDoctor.phone!;
                     log(number);
                     await FlutterPhoneDirectCaller.callNumber(number);
                     ///    or
                    // var smsUrl = Uri.parse("tel:${categoryDoctor.phone!}");
                    // if (await canLaunchUrl(smsUrl)) {
                    //   await launchUrl(smsUrl);
                    // } else {
                    //   throw "Error occured trying to call that number.";
                    // }
                  },
                  icon: CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Colors.green,
                    child: const Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
