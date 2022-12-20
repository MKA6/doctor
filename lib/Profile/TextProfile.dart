import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TextProfile extends StatelessWidget {
  int id;
  TextProfile(this.id);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AdminProvider>(builder: (context, provider, _) {
          return Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book Dr',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    provider.userDoctorCategory?[id].bookDoctor ??
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
                        'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
                        'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
                        'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
                        'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint '
                        'occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color(0xFF464552),
                      fontSize: 12.sp,
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
