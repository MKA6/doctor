import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool obscureText;

  CustomTextFormField({required this.controller, required this.label ,required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return TextFormField(
          controller: controller,
          cursorColor: Colors.white,
          keyboardType: TextInputType.emailAddress,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
        );
      },
    );
  }
}
