import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileItem extends StatelessWidget {
  String label;
  String content;
  TextEditingController controller;
  CustomProfileItem(this.label, this.content , this.controller);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Container(
              child: Expanded(
                child: TextFormField(
                  validator: (String? x){
                    if(x == null || x.isEmpty){
                      return "Enter a value"; //
                    }
                  },
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
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
