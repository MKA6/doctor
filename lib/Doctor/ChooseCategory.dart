import 'package:doctor/admin/models/Category.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseCategory extends StatelessWidget {
  UserDoctorCategory categoryDoctor;

  ChooseCategory(this.categoryDoctor);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Row(
          children: [
            Container(
              width: 83.w,
              height: 20.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
                color: const Color(0xffCBE3F1),
              ),
              child: MaterialButton(
                onPressed: () {
                },
                child: Text(
                  categoryDoctor.specialization!,
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
