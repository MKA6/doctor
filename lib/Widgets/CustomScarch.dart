import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomScarch extends StatefulWidget {
  @override
  State<CustomScarch> createState() => _CustomScarchState();
}

class _CustomScarchState extends State<CustomScarch> {
  String name = '';
  TextEditingController controller = TextEditingController();

  List<CategoryDoctor>? category;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) {
        return Consumer<AdminProvider>(
          builder: (context, provider, _) {
            return provider.categoryDoctor == 0
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : TextField(
                    controller: controller,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Scarch',
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff878C99),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Color(0xff878C99),
                    ),
                  );
          },
        );
      },
    );
  }
}
