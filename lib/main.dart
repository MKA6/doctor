import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Provider/AuthProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Log In/SplachScreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(providers: [
          ChangeNotifierProvider(
            create: (context){
              return AuthProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (context){
              return AdminProvider();
            },
          ),
        ],
          child: MaterialApp(
            navigatorKey: AppRouter.navKey,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            home: SplachScreen(),
          ),
        );
      },
    );
  }
}
