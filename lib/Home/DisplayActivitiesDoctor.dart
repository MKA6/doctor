import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/admin/Screen/AddNewActivitiesDoctor.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DisplayActivitiesDoctor extends StatelessWidget {
  String catId;
  UserDoctorCategory userDoctorCategory;

  DisplayActivitiesDoctor(this.catId , this.userDoctorCategory);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) {
        return Consumer<AdminProvider>(
          builder: (context, provider, _) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(userDoctorCategory.name!),
                ),
                body: ListView.builder(
                    itemCount: provider.activitiesDoctor?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(13),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(15),
                            border: Border.all(
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.only(
                                  topStart: Radius.circular(15),
                                  topEnd: Radius.circular(15),
                                )),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.network(
                                  provider.activitiesDoctor?[index].imageUrl ??
                                      '',
                                  height: 200.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                  start: 10.w,
                                  end: 10.w,
                                ),
                                child: Text(
                                  textAlign: TextAlign.justify,
                                  provider.activitiesDoctor?[index].description ??
                                      '',
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    }));
          },
        );
      },
    );
  }
}
