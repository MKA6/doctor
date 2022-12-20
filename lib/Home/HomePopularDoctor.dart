import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Helper/FirestoreHelper.dart';
import 'package:doctor/Home/DisplayActivitiesDoctor.dart';
import 'package:doctor/Models/slide.dart';
import 'package:doctor/Profile/Profile.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Provider/AuthProvider.dart';
import 'package:doctor/admin/Screen/DisplayAllActivitiesDoctor.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePopularDoctor extends StatelessWidget {
  UserDoctorCategory userDoctorCategory;

  HomePopularDoctor(this.userDoctorCategory);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AdminProvider>(builder: (context, provider, _) {
          return Container(
            width: 150.w,
            height: 182.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: AlignmentDirectional.centerStart,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(8.r),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        userDoctorCategory.imageUrl!,
                        width: double.infinity,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                        top: 5.h,
                        end: 5.w,
                      ),
                      child: InkWell(
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(Icons.view_agenda),
                        ),
                        onTap: () {
                          Provider.of<AdminProvider>(context, listen: false)
                              .getAllActivitiesDoctor(userDoctorCategory.id!);
                          AppRouter.navigateToScreen(DisplayActivitiesDoctor(
                              userDoctorCategory.id!, userDoctorCategory));
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  userDoctorCategory.name!,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xff3B3A43),
                  ),
                ),
                Text(
                  userDoctorCategory.specialization!,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xffA9B8C1),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
