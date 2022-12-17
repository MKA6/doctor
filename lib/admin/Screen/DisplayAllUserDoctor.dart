import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Home/HomePopularDoctor.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/admin/Screen/AddNewCategory.dart';
import 'package:doctor/admin/Screen/AddUserDoctor.dart';
import 'package:doctor/admin/Screen/UserPopularDoctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DisplayAllUserDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, _) {
      return Consumer<AdminProvider>(builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Display All User Doctor'),
            actions: [
              // IconButton(
              //   onPressed: () {
              //     AppRouter.navigateToScreen(AddNewCategory());
              //   },
              //   icon: const Icon(
              //     Icons.account_circle_outlined,
              //     color: Colors.white,
              //     size: 37,
              //   ),
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 10,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 15,
                ),
                child: IconButton(
                  onPressed: () {
                    // AppRouter.navigateToScreen(AddNewCategory());
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AddUserDoctor();
                    }));
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                ),
              ),
              // Container(
              //   width: 15.w,
              //   height: 15.h,
              //   alignment: AlignmentDirectional.topStart,
              //   margin: EdgeInsetsDirectional.only(
              //     top: 5.h,
              //     end: 30.w,
              //   ),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadiusDirectional.circular(100),
              //       color: Colors.white),
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   child: InkWell(
              //     child: Image.asset('images/data-protection.png'),
              //     onTap: () {
              //       // Provider.of<AdminProvider>(context, listen: false)
              //       //     .getAllDataDoctor(userDoctorCategory.id!);
              //       AppRouter.navigateToScreen(AddNewCategory());
              //
              //       // AppRouter.navigateToScreen(
              //       //     DisplayAllDataDoctor(userDoctorCategory.id!));
              //     },
              //   ),
              // ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: provider.userDoctorCategory!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 190.h,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return provider.userDoctorCategory == 0
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : UserPopularDoctor(
                        provider.userDoctorCategory![index],
                      ); //widget.doctors2[index]
              },
            ),
          ),
        );
      });
    });
  }
}
