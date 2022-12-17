import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Helper/FirestoreHelper.dart';
import 'package:doctor/Home/Home.dart';
import 'package:doctor/Log%20In/signIn.dart';
import 'package:doctor/Models/AppUser.dart';
import 'package:doctor/Provider/AuthProvider.dart';
import 'package:doctor/Widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../BottomNavigationScreen/BottomNavigationBar.dart';

class SignUp extends StatelessWidget {
  // String _name = '';
  //
  // String _email = '';
  //
  // String _password = '';
  //
  // String _re_Type_Password = '';

  void showToast() => Fluttertoast.showToast(
        msg: 'You must fill in the data',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: Color(0xFF0093FF),
          appBar: AppBar(
            elevation: 0.0.r,
            backgroundColor: Color(0xFF0093FF),
          ),
          body: Consumer<AuthProvider>(
            builder: (context, provider, _) {
              return Container(
                alignment: AlignmentDirectional.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 38.r,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        CustomTextFormField(
                          controller: provider.signUpNameController,
                          label: 'Name',
                          obscureText: false,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          controller: provider.signUpEmailController,
                          label: 'Email',
                          obscureText: false,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          controller: provider.signUpPhoneNumberController,
                          label: 'PhoneNumber',
                          obscureText: false,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          controller: provider.signUpPasswordController,
                          label: 'Password',
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 37.h,
                        ),
                        Container(
                          width: 300.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(50.r),
                            ),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff6FC3FB),
                                Color(0xff419CF9),
                              ],
                            ),
                          ),
                          child: Center(
                            child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: () {
                                provider.signUp();
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 300.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(50.r),
                            ),
                            border: Border.all(
                              width: 1.h,
                              color: Colors.white,
                            ),
                            color: Color(0xff0093FF),
                          ),
                          child: Center(
                            child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: () {
                                AppRouter.navigateAndReplaceScreen(SignIn());
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
