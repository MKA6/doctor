import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SrarchDoctor extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            Container(
              width: 190.w,
              height: 85.h,
              margin: EdgeInsetsDirectional.only(
                top: 30.r,
              ),
              alignment: AlignmentDirectional.bottomEnd,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(8.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 10.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // widget._doctor1.name,
                              'Christine Jones',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff3B3A43),
                              ),
                            ),
                            Text(
                              // widget._doctor1.Specialization,
                              'Radiologist',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xffA9B8C1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'images/Group 1@2x.png',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'images/masseges2x.png',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 1.h,
                    color: Color(0xffA9B8C1),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 10.r,
                      end: 10.r,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.location_pin,
                            size: 15.r,
                            color: Color(0xffA9B8C1),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          // widget._doctor1.location,
                          'New York City',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Color(0xffA9B8C1),
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.star_sharp,
                              color: Color(0xffF5A623),
                              size: 15.r,
                            ),
                            Icon(
                              Icons.star_sharp,
                              color: Color(0xffF5A623),
                              size: 15.r,
                            ),
                            Icon(
                              Icons.star_sharp,
                              color: Color(0xffF5A623),
                              size: 15.r,
                            ),
                            Icon(
                              Icons.star_half,
                              color: Color(0xffF5A623),
                              size: 15.r,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Color(0xffF5A623),
                              size: 15.r,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(
                      6.r,
                    ),
                    color: Colors.white,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 53.w,
                  height: 53.h,
                  margin: EdgeInsetsDirectional.only(
                    start: 10.r,
                  ),
                ),
                Container(
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0BKO2XDG9XrOr7w1MmVOm54oWonC-JB0jvg&usqp=CAU',
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(6.r),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 50.w,
                  height: 50.h,
                  margin: EdgeInsetsDirectional.only(
                    start: 10.r,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
