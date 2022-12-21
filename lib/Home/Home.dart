import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Helper/FirestoreHelper.dart';
import 'package:doctor/Home/HomePopularDoctor.dart';
import 'package:doctor/Home/StoryRec.dart';
import 'package:doctor/Home/UserAppBar.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Provider/AuthProvider.dart';
import 'package:doctor/Widgets/CustomScarch.dart';
import 'package:doctor/admin/Screen/AddUserDoctor.dart';
import 'package:doctor/admin/Screen/DisplayAllUserDoctor.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Profile/search_widget_dialog.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AdminProvider>(builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: const Color(0xff54C0FF),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(92.r),
              child: UserAppBar(),
            ),
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(40.r),
                    topEnd: Radius.circular(40.r),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20.r,
                              horizontal: 27.r,
                            ),
                            child: Container(
                              width: 320.w,
                              height: 40.h,
                              padding: EdgeInsetsDirectional.all(
                                10.r,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(5.r),
                                ),
                                color: Colors.white,
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    name = value;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Scarch',
                                  hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color(0xff878C99),
                                  ),
                                  prefixIcon: const Icon(Icons.search),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  color: Color(0xff878C99),
                                ),
                              ),
                            ),
                          ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 27.0.r,
                        // vertical: 20.r
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Recommended',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xff3B3A43),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      height: 230.h,
                      child: provider.categories == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.categories!.length,
                              //widget.doctors2.length
                              itemBuilder: (context, index) {
                                return StoryRec(provider.categories![index]);
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                width: 20.w,
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 27.0.r,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Popular Doctor',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xff3B3A43),
                                ),
                              ),
                              // Spacer(),
                              // ElevatedButton(
                              //   child: Icon(Icons.add),
                              //   onPressed: () {
                              //     // provider.getAllUserCategory();
                              //     AppRouter.navigateToScreen(
                              //         DisplayAllUserDoctor());
                              //   },
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 21.h,
                          ),
                          provider.userDoctorCategory == null
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      provider.userDoctorCategory!.length,
                                  //widget.doctors2.length
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 190.h,
                                    crossAxisSpacing: 20.w,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        provider.doctorProfileIndex = index;
                                        // UserDoctorCategory u = provider.userDoctorCategory![index];
                                        provider.setBnbIndex(3);
                                        provider.getAllUserCategory();
                                      },
                                      child: HomePopularDoctor(
                                        provider.userDoctorCategory![index],
                                      ),
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
