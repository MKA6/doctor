import 'package:doctor/Provider/AuthProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../Widgets/CustomProfileItem.dart';

class SearchWidgetDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(40.r),
                bottomEnd: Radius.circular(40.r),
              ),
            ),
            color: const Color(0xff54C0FF),
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 270.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
                  // alignment: Alignment.topCenter,
                  child: Consumer<AuthProvider>(
                    builder: (context, provider, _) {
                      return provider.loggedAppUser == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        provider.updateUserImage();
                                      },
                                      child: provider.loggedAppUser!.imagUrl ==
                                              0
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : Container(
                                              width: 90.w,
                                              height: 82.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(100.r),
                                                color: Colors.black38,
                                              ),
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              child: provider.loggedAppUser!
                                                          .imagUrl ==
                                                      null
                                                  ? const Icon(
                                                      Icons.camera_alt,
                                                      color: Colors.white,
                                                    )
                                                  : CircleAvatar(
                                                      radius: 60,
                                                      child: Image.network(
                                                        provider.loggedAppUser!
                                                            .imagUrl!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                            ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Email ',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Text(
                                          provider.loggedAppUser!.email!,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    CustomProfileItem(
                                      "Name ",
                                      provider.loggedAppUser!.name!,
                                      provider.profileUserNameController,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    CustomProfileItem(
                                      "Telephone ",
                                      provider.loggedAppUser!.phoneNumber!,
                                      provider.profilePhoneController,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsetsDirectional.only(top: 15.h),
                                  child: InkWell(
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 20,
                                      child: Icon(Icons.edit),
                                    ),
                                    onTap: () {
                                      provider.updateUserInfo();
                                    },
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
