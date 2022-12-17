import 'package:doctor/admin/models/Produact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ScreenProfile extends StatelessWidget {
  Produact produact;

  ScreenProfile(this.produact);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, _) {
      return Consumer(builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.r,
                backgroundImage: NetworkImage(
                  //produact.imageUrl ?? '',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0BKO2XDG9XrOr7w1MmVOm54oWonC-JB0jvg&usqp=CAU',
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Christine Jones',
                //produact.name ?? '',
                // categoryDoctor.name!,
                // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.name!,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xff3B3A43),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Dentist',
                // produact.specialization ?? '',
                // categoryDoctor.specialization!,
                // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.specialization!,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Color(0xffA9B8C1),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.red,
                    size: 18.r,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    // 'john@gmail.com',
                    produact.email ?? '',
                    // categoryDoctor.email!,
                    // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.email!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xffA9B8C1),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_ic_call_outlined,
                    color: Colors.blue,
                    size: 18.r,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    //'+01 111 222 333',
                    produact.phone ?? '',
                    // categoryDoctor.phone!,
                    // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.phone!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xffA9B8C1),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_pin,
                    color: Colors.grey,
                    size: 18.r,
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    //  'New York City',
                    produact.location ?? '',
                    // categoryDoctor.location!,
                    // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.location!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xffA9B8C1),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_outlined,
                    color: Color(0xffF5A623),
                    size: 18.r,
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    //'4.5',
                    produact.Rating ?? '',
                    //  categoryDoctor.Rating!,
                    //  Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.Rating!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xffA9B8C1),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Book Dr',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        produact.bookDoctor ?? '',
                        // categoryDoctor,
                        // widget.sliders[index].description!,
                        // Provider.of<AdminProvider>(context , listen: false).categoryDoctor!.bookDoctor!,
                        /**
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
                            'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
                            'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
                            'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
                            'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint '
                            'occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            // overflow: TextOverflow.ellipsis,
                         */
                        // maxLines: 20,
                        // categoryDoctor.bookDoctor!,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFF464552),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}
