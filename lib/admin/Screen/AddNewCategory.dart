
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Widgets/CustomTextFormFieldUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddNewCategory extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AdminProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              appBar: AppBar(),
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          provider.pickCategoryImage();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(200),
                              color: Colors.white
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: provider.pickedImage == null
                              ? Icon(Icons.camera_alt)
                              : Image.file(provider.pickedImage! ,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      CustomTextFormFieldUser(
                        'Name',
                        provider.catNameController,
                      ),
                      CustomTextFormFieldUser(
                        'Specialization',
                        provider.catSpecializationController,
                      ),
                      CustomTextFormFieldUser(
                        'work Days',
                        provider.catWorkDaysController,
                      ),
                      CustomTextFormFieldUser(
                        'work Time',
                        provider.catWorkTimeController,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bool isValid = formKey.currentState!.validate();
                          if (isValid) {
                            provider.CreatNewCategory();
                            // Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
