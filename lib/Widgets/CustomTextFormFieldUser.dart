import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldUser extends StatelessWidget {
  TextEditingController controller;
  String label;

  CustomTextFormFieldUser(this.label, this.controller);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          alignment: Alignment.bottomCenter,
          child: TextFormField(
            cursorColor: Colors.black,
            controller: controller,
            validator: (String? x) {
              if (x == null || x.isEmpty) {
                return "The value is empty";
              }
            },
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(500),
              ),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}
