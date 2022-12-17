import 'package:doctor/Provider/AuthProvider.dart';
import 'package:doctor/Widgets/CustomTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class doctorEvaluation extends StatelessWidget {
  TextEditingController? hh;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AuthProvider>(
          builder: (context, provider, _) {
            return SingleChildScrollView(
              child: Container(
                height: 250.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(40.r),
                    topEnd: Radius.circular(40.r),
                  ),
                  color: Color(0xff54C0FF).withOpacity(0.2),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
                  padding: EdgeInsetsDirectional.all(25.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RatingBar.builder(
                        initialRating: 3.3,
                        // حسب تقييم المستخدم
                        minRating: 1,
                        itemSize: 30,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        // بوقف العملية
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating); // ودي التقيم هاد على البروفايل
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Enter Rating",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                          ),
                          // helperText: 'Gmail is required',
                          // errorBorder: InputBorder.none,
                          // border: ,
                          enabled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.6),
                                width: .8.w),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.black,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(
                              20.r,
                            ),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Rating',
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.white),
                          ),
                        ),
                      ),
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
