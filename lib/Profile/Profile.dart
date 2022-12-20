import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/BottomNavigationScreen/BottomNavigationBar.dart';
import 'package:doctor/Helper/FirestoreHelper.dart';
import 'package:doctor/Profile/PersonalProfile.dart';
import 'package:doctor/Profile/TextProfile.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Provider/AuthProvider.dart';
import 'package:doctor/Search/Search.dart';
import 'package:doctor/admin/Screen/DisplayAllUserDoctor.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AdminProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              backgroundColor: const Color(0xff54C0FF),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(92.r),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    AppBar(
                      elevation: 0.0,
                      backgroundColor: const Color(0xff54C0FF),
                      title: Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 27.r,
                          top: 37.r,
                        ),
                        child: Text('Profile'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                        top: 50.h,
                        end: 20,
                      ),
                      child: PopupMenuButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.more_vert_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem<int>(
                                value: 0,
                                child: Row(
                                  children: const [
                                    Text(
                                      "Log Out",
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.logout,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem<int>(
                                value: 1,
                                child: Row(
                                  children: const [
                                    Text(
                                      "Add User Doctor",
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              /**
                                  PopupMenuItem<int>(
                                  value: 1,
                                  child: Row(
                                  children: [
                                  Text(
                                  "Theme",
                                  ),
                                  Spacer(),
                                  Switch(
                                  value: false,
                                  onChanged: ((value) {
                                  }),
                                  ),
                                  ],
                                  ),
                                  ),
                               */
                            ];
                          },
                          onSelected: (value) {
                            if (value == 0) {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .signOut();
                              // Provider.of<AuthProvider>(context, listen: false)
                              //     .loginEmailController
                              //     .clear();
                              // Provider.of<AuthProvider>(context, listen: false)
                              //     .loginPasswordController
                              //     .clear();
                            } else if (value == 1) {
                              AppRouter.navigateToScreen(
                                  DisplayAllUserDoctor());
                            }
                          }),
                    ),
                  ],
                ),
              ),
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(40.r),
                    topEnd: Radius.circular(40.r),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 28.r,
                    top: 30.r,
                    end: 27.r,
                    bottom: 20.r,
                  ),
                  child: Column(
                    children: [
                      PersonalProfile(0), ///
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        height: 1.h,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextProfile(0), ///
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
