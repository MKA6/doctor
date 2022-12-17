import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Models/slide.dart';
import 'package:doctor/Profile/Profile.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Provider/AuthProvider.dart';
import 'package:doctor/admin/Screen/AddNewCategory.dart';
import 'package:doctor/admin/Screen/DisplayAllActivitiesDoctor.dart';
import 'package:doctor/admin/Screen/DisplayAllDataDoctor.dart';
import 'package:doctor/admin/Screen/UpdateUserDoctoer.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserPopularDoctor extends StatelessWidget {
  UserDoctorCategory userDoctorCategory;

  UserPopularDoctor(this.userDoctorCategory);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AdminProvider>(builder: (context, provider, _) {
          return InkWell(
            onTap: () {
              /// or  /// provider.getAllActivitiesDoctor(userDoctorCategory.id!);
              Provider.of<AdminProvider>(context, listen: false)
                  .getAllActivitiesDoctor(userDoctorCategory.id!);
              AppRouter.navigateToScreen(
                  DisplayAllActivitiesDoctor(userDoctorCategory.id!));
            },
            child: Container(
              width: 150.w,
              height: 182.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
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
                        child:  provider.userDoctorCategory!.isNotEmpty == 0
                            ? Center(
                          child: CircularProgressIndicator(),
                        )
                            :Image.network(
                          userDoctorCategory.imageUrl!,
                          width: double.infinity,
                          height: 150.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Container(
                      //   alignment: AlignmentDirectional.topEnd,
                      //   margin: EdgeInsetsDirectional.only(
                      //     top: 43.h,
                      //     end: 10.w,
                      //   ),
                      //   child: InkWell(
                      //     child: const CircleAvatar(
                      //       backgroundColor: Colors.white,
                      //       radius: 15,
                      //       child: Icon(Icons.edit),
                      //     ),
                      //     onTap: () {
                      //       Provider.of<AdminProvider>(context,
                      //           listen: false)
                      //           .catNameController
                      //           .text = userDoctorCategory.name!;
                      //       AppRouter.navigateToScreen(
                      //           UpdateUserDoctoer(userDoctorCategory));
                      //       //  Provider.of<AdminProvider>(context , listen: false).catNameController.text = userDoctorCategory.name!;
                      //       // // provider.UpdateUserDoctoer();
                      //       //  AppRouter.navigateToScreen(UpdateUserDoctoer(userDoctorCategory));
                      //     },
                      //   ),
                      // ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        margin: EdgeInsetsDirectional.only(
                          top: 5.h,
                          end: 10.w,
                        ),
                        child: InkWell(
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Icon(Icons.delete , size: 30,),
                          ),
                          onTap: () {
                            Provider.of<AdminProvider>(context, listen: false)
                                .deleteUserCategory(userDoctorCategory);
                            provider.deleteUserCategory(userDoctorCategory);
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
            ),
          );
        });
      },
    );
  }
}
