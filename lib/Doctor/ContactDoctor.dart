import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDoctor extends StatelessWidget {
  UserDoctorCategory userDoctorCategory;

  ContactDoctor(this.userDoctorCategory);

  @override
  Widget build(BuildContext context) {
    //double rating = double.parse(userDoctorCategory.Rating!);   // خطا هين

    // final Uri _url = Uri.parse('https://flutter.dev');
    // Future<void> _launchUrl() async {
    //   if (!await launchUrl(_url)) {
    //     throw 'Could not launch $_url';
    //   }
    // }

    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AdminProvider>(builder: (context, provider, _) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 230.w,
                height: 197.h,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20.r),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: provider.usersDoctor == 0
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Image.network(
                              userDoctorCategory.imageUrl!,
                              width: double.infinity,
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Container(
                      width: 190.w,
                      height: 80.h,
                      margin: EdgeInsetsDirectional.only(
                        top: 115.r,
                        start: 20.r,
                        end: 20.r,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15.r),
                        color: Colors.white,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                  start: 15.r,
                                  top: 6.r,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // widget._doctor1.name,
                                      userDoctorCategory.name!,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: const Color(0xff3B3A43),
                                      ),
                                    ),
                                    Text(
                                      // widget._doctor1.Specialization,
                                      userDoctorCategory.specialization!,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: const Color(0xffA9B8C1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      final number = userDoctorCategory.phone!;
                                      await FlutterPhoneDirectCaller.callNumber(
                                          number);
                                      // var smsUrl =Uri.parse(
                                      //     "tel:${categoryDoctor.phone!}");
                                      // if (await canLaunchUrl(smsUrl)) {
                                      //   await launchUrl(smsUrl);
                                      // } else {
                                      //   throw "Error occured trying to call that number.";
                                      // }
                                    },
                                    child: CircleAvatar(
                                      radius: 9.r,
                                      backgroundColor: Colors.green,
                                      child: const Icon(
                                        Icons.call,
                                        color: Colors.white,
                                        size: 9,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Container(
                                    margin: const EdgeInsetsDirectional.only(
                                        end: 5),
                                    child: InkWell(
                                      onTap: () async {
                                        var url = Uri.parse(
                                            "whatsapp://send?phone=${userDoctorCategory.phone!}");
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "WhatsApp is not installed on the device"),
                                            ),
                                          );
                                        }
                                      },
                                      child: CircleAvatar(
                                        radius: 9.r,
                                        backgroundColor: Colors.blue,
                                        child: const Icon(
                                          Icons.maps_ugc,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 1.h,
                            color: const Color(0xffA9B8C1),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                              start: 10.r,
                              end: 10.r,
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  child: Icon(
                                    Icons.location_pin,
                                    size: 15.r,
                                    color: const Color(0xffA9B8C1),
                                  ),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  // widget._doctor1.location,
                                  userDoctorCategory.location!,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: const Color(0xffA9B8C1),
                                  ),
                                ),
                                const Spacer(),
                                RatingBar.builder(
                                  //initialRating: rating ,
                                  initialRating: 3 ,
                                  /// بدنا نعمل هين تحديث زي ما عملنا في التعديل على بيانات اليوزر
                                  minRating: 1,
                                  itemSize: 12,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    rating; // ودي التقيم هاد على البروفايل
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
