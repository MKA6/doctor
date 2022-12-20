import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PersonalProfile extends StatelessWidget {
  int  id;
  PersonalProfile(this.id);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AdminProvider>(
          builder: (context, provider, _) {
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage: NetworkImage(
                          provider.userDoctorCategory?[id].imageUrl ??
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0BKO2XDG9XrOr7w1MmVOm54oWonC-JB0jvg&usqp=CAU',
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        provider.userDoctorCategory?[id].name ?? 'Mohammed',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff3B3A43),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        provider.userDoctorCategory?[id].specialization ??
                            'Heart',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Color(0xffA9B8C1),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.red,
                            size: 18.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            provider.userDoctorCategory?[id].email ??
                                'mmm@gmail.com',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xffA9B8C1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.add_ic_call_outlined,
                            color: Colors.blue,
                            size: 18.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            provider.userDoctorCategory?[id].phone ??
                                '+01 111 222 333',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xffA9B8C1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.grey,
                            size: 18.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            provider.userDoctorCategory?[id].location ??
                                'New York City',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xffA9B8C1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_outlined,
                            color: Color(0xffF5A623),
                            size: 18.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '3.4',
                            //provider.userDoctorCategory?[int.parse(id)].Rating ?? '3.4',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xffA9B8C1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
