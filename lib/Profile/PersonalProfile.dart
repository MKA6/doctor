import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PersonalProfile extends StatelessWidget {
  // UserDoctorCategory userDoctorCategory;
  // PersonalProfile(this.userDoctorCategory);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AdminProvider>(
          builder: (context, provider, _) {
            return Row(
              children: [
                Expanded(
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage: NetworkImage(
                          //userDoctorCategory.imageUrl ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0BKO2XDG9XrOr7w1MmVOm54oWonC-JB0jvg&usqp=CAU',
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0BKO2XDG9XrOr7w1MmVOm54oWonC-JB0jvg&usqp=CAU',
                          // categoryDoctor.imageUrl!,
                          // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.imageUrl!,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        // userDoctorCategory.name ?? 'Christine Jones',
                        'Christine Jones',
                        // categoryDoctor.name!,
                        // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.name!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff3B3A43),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        // userDoctorCategory.specialization ?? 'Dentist',
                        'Dentist',
                        // categoryDoctor.specialization!,
                        // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.specialization!,
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
                           // userDoctorCategory.email ?? 'john@gmail.com',
                            'john@gmail.com',
                            // categoryDoctor.email!,
                            // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.email!,
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
                            // userDoctorCategory.phone ?? '+01 111 222 333',
                            '+01 111 222 333',
                            // categoryDoctor.phone!,
                            // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.phone!,
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
                            // userDoctorCategory.location ?? 'New York City',
                            'New York City',
                            // categoryDoctor.location!,
                            // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.location!,
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
                            ' 4.5',
                            //userDoctorCategory.Rating!,// ?? ,
                            //  categoryDoctor.Rating!,
                            //  Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.Rating!,
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
