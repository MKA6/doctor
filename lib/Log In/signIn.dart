import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Log%20In/SignUp.dart';
import 'package:doctor/Provider/AuthProvider.dart';
import 'package:doctor/Widgets/CustomTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  // String _emailController = '';
  // String _passwordController = '';

  void showToast() => Fluttertoast.showToast(
        msg: 'Invalid values entered',
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
            elevation: 0.0,
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
                            'SIGN IN',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 65.h,
                        ),
                        CustomTextField(
                          controller: provider.loginEmailController,
                          label: 'Email',
                          obscureText: false,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CustomTextField(
                          controller: provider.loginPasswordController,
                          label: 'Password',
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 31.h,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 80.h,
                        ),
                        Container(
                          width: 300.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(40.r),
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
                              height: double.infinity,
                              onPressed: () {
                                provider.login();
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
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 300.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(50.r)),
                              border: Border.all(
                                width: 1.w,
                                color: Colors.white,
                              )),
                          child: Center(
                            child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: () {
                                AppRouter.navigateAndReplaceScreen(SignUp());
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
