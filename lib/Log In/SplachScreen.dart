import 'package:doctor/Provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatelessWidget {

  // NavigatToScreen() {
  //   Future.delayed(Duration(seconds: 4)).then((value) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => Cinema()));
  //   });
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   NavigatToScreen();
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AuthProvider>(
          builder: (context , provider , _) {
            return Scaffold(
              body: Container(
                color: Colors.blue,
                alignment: AlignmentDirectional.center,
                child: Container(
                  width: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        'images/01@2x.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        'Doctor',
                        style: TextStyle(
                          fontSize: 50.sp,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        );
      },
    );
  }
}
