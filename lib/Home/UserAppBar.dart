import 'package:doctor/Profile/search_widget_dialog.dart';
import 'package:doctor/Provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return Consumer<AuthProvider>(builder: (context, provider, _) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            AppBar(
              elevation: 0.0.r,
              backgroundColor: const Color(0xff54C0FF),
              title: Padding(
                padding: EdgeInsetsDirectional.only(start: 27.r, top: 37.r),
                child: Text('Home'),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    useSafeArea: false,
                    context: context,
                    builder: (_) => SearchWidgetDialog());
              },
              child: provider.loggedAppUser == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      width: 70.w,
                      height: 65.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(100.r),
                        color: Colors.black38,
                      ),
                      margin: EdgeInsetsDirectional.only(
                        top: 30.h,
                        end: 15.w,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: provider.loggedAppUser!.imagUrl == null 
                          ? Image.asset('images/profile.png')
                          : CircleAvatar(
                              radius: 30.r,
                              child: Image.network(
                                provider.loggedAppUser!.imagUrl ?? 'images/profile.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
            ),
          ],
        );
      });
    });
  }
}
