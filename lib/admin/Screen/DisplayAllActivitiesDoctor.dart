import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Helper/FirestoreHelper.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/admin/Screen/AddNewActivitiesDoctor.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DisplayAllActivitiesDoctor extends StatelessWidget {
  String catId;
  UserDoctorCategory userDoctorCategory;

  DisplayAllActivitiesDoctor(this.catId , this.userDoctorCategory);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) {
        return Consumer<AdminProvider>(
          builder: (context, provider, _) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(userDoctorCategory.name!),
                  actions: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 15,
                      ),
                      child: IconButton(
                          onPressed: () {
                            AppRouter.navigateToScreen(
                                AddNewActivitiesDoctor(catId));
                          },
                          icon: Icon(Icons.add)),
                    ),
                  ],
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
                              Stack(
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
                                  // Container(
                                  //   alignment: AlignmentDirectional.topEnd,
                                  //   margin: EdgeInsetsDirectional.only(
                                  //     top: 15.h,
                                  //     end: 10.w,
                                  //   ),
                                  //   child: InkWell(
                                  //     child: const CircleAvatar(
                                  //       backgroundColor: Colors.grey,
                                  //       radius: 20,
                                  //       child: Icon(Icons.delete , size: 30,),
                                  //     ),
                                  //     onTap: () {
                                  //     // FirestoreHelper.firestoreHelper.deleteCategory(catId);
                                  //     },
                                  //   ),
                                  // ),
                                  // Container(
                                  //   alignment: AlignmentDirectional.topEnd,
                                  //   margin: EdgeInsetsDirectional.only(
                                  //     top: 60.h,
                                  //     end: 10.w,
                                  //   ),
                                  //   child: InkWell(
                                  //     child: const CircleAvatar(
                                  //       backgroundColor: Colors.grey,
                                  //       radius: 20,
                                  //       child: Icon(Icons.edit , size: 30,),
                                  //     ),
                                  //     onTap: () {
                                  //       //  Provider.of<AdminProvider>(context , listen: false).catNameController.text = userDoctorCategory.name!;
                                  //       // // provider.UpdateUserDoctoer();
                                  //       //  AppRouter.navigateToScreen(UpdateUserDoctoer(userDoctorCategory));
                                  //     },
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                  start: 5.w,
                                  end: 5.w,
                                ),
                                // ابحث عن كيف اخلى طول ال هايت حسب النص الموجود
                                height: 50.h,
                                child: SingleChildScrollView(
                                  child: Text(
                                    textAlign: TextAlign.justify,
                                    provider.activitiesDoctor?[index].description ??
                                        '',
                                  ),
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
