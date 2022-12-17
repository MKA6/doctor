import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool obscureText;

  CustomTextField({
    required this.controller,
    required this.label,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Container(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
              // helperText: 'Gmail is required',
              // errorBorder: InputBorder.none,
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.black,
          ),
        );
      },
    );
  }
}
