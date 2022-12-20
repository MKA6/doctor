import 'dart:convert';

import 'package:doctor/Doctor/ChooseCategory.dart';
import 'package:doctor/Doctor/ContactDoctor.dart';
import 'package:doctor/Doctor/DoctorPopular.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Search/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: const Color(0xff54C0FF),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(92.r),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                AppBar(
                  elevation: 0.0.r,
                  backgroundColor: const Color(0xff54C0FF),
                  title: Padding(
                    padding: EdgeInsetsDirectional.only(start: 27.r, top: 37.r),
                    child: Text('Doctor'),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(
                    top: 48.h,
                    end: 20.w,
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) {
                      //   return Search();
                      // }));
                    },
                    icon: const Icon(
                      Icons.location_pin,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Consumer<AdminProvider>(builder: (context, provider, _) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(40.r),
                    topEnd: Radius.circular(40.r),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 27.r,
                        top: 27.r,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Choose Category',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xff3B3A43),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 55.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.r),
                                    ),
                                    color: Color(0xff0093FF)),
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Text(
                                    'All',
                                    style: TextStyle(
                                      fontSize: 8.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                child: Container(
                                  height: 20.h,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        provider.userDoctorCategory!.length,
                                    //widget.doctors.length
                                    itemBuilder: (context, index) {
                                      return ChooseCategory(
                                          provider.userDoctorCategory![index]);
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 15.w,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 210.h,
                      child: ListView.separated(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.userDoctorCategory!.length,
                        itemBuilder: (context, index) {
                          return ContactDoctor(
                            provider.userDoctorCategory![index],
                          ); //widget.doctors[index]
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          width: 20.w,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 27.r,
                        top: 2.r,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Popular Doctor',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xff3B3A43),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                              end: 27.r,
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: provider.userDoctorCategory!.length,
                              itemBuilder: (context, index) {
                                return DoctorPopular(
                                    provider.userDoctorCategory![
                                        index]); //widget.doctors[index]
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
