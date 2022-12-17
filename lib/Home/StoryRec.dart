import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Models/slide.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Widgets/BottomSheet/doctorEvaluation.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StoryRec extends StatelessWidget {
  CategoryDoctor categoryDoctor;

  StoryRec(this.categoryDoctor);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AdminProvider>(builder: (context, provider, _) {
          return provider.categoryDoctor == 0
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200.w,
                      height: 230.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        children: [
                          Image.network(
                            categoryDoctor.imageUrl!,
                            width: double.infinity,
                            height: 120.h,
                            fit: BoxFit.cover,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  end: 10.2.r,
                                  top: 6.r,
                                  start: 10.r,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          categoryDoctor.name!,
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Color(0xff3B3A43),
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            AppRouter.showCustomDialogRating(
                                              double.parse(
                                                  categoryDoctor.Rating!),
                                            );
                                            // showModalBottomSheet(
                                            //   context: context,
                                            //   shape: const RoundedRectangleBorder(
                                            //     borderRadius: BorderRadius.only(
                                            //       topLeft: Radius.circular(40),
                                            //       topRight: Radius.circular(40),
                                            //     ),
                                            //   ),
                                            //   builder: (context) =>
                                            //       doctorEvaluation(),
                                            // );
                                          },
                                          child: RatingBar.builder(
                                            initialRating: 2,//double.parse('${categoryDoctor.Rating!}'),
                                            // حسب تقييم المستخدم
                                            minRating: 1,
                                            itemSize: 12,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            ignoreGestures: true,
                                            // بوقف العملية
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(
                                                  rating); // ودي التقيم هاد على البروفايل
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      categoryDoctor.specialization!,
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        color: Color(0xffA9B8C1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 1.h,
                                width: double.infinity,
                                color: Color(0xffA9B8C1),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 10, bottom: 9, end: 14, top: 5),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'images/calendar(1)@2x.png',
                                      height: 12.h,
                                      width: 10.8.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      categoryDoctor.workDays!,
                                      style: TextStyle(
                                        fontSize: 6.sp,
                                        color: Color(0xffA9B8C1),
                                      ),
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      'images/Group 2@2x.png',
                                      height: 12.h,
                                      width: 12.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      categoryDoctor.workTime!,
                                      style: TextStyle(
                                        fontSize: 6.sp,
                                        color: Color(0xffA9B8C1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        });
      },
    );
  }
}
