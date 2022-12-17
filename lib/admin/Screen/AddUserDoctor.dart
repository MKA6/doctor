import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Widgets/CustomTextFormField.dart';
import 'package:doctor/Widgets/CustomTextFormFieldUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddUserDoctor extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, _) {
      return Consumer<AdminProvider>(builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'User Doctor',
            ),
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      provider.pickCategoryImage();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(200),
                          color: Colors.white),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: provider.pickedImage == null
                          ? Icon(Icons.camera_alt)
                          : Image.file(
                              provider.pickedImage!,
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
                    'City',
                    provider.catLcationController,
                  ),
                  CustomTextFormFieldUser(
                    'Email',
                    provider.catEmailController,
                  ),
                  CustomTextFormFieldUser(
                    'Phone',
                    provider.catPhoneController,
                  ),
                  CustomTextFormFieldUser(
                    'Work Days',
                    provider.catWorkDaysController,
                  ),
                  CustomTextFormFieldUser(
                    'Work Time',
                    provider.catWorkTimeController,
                  ),
                  CustomTextFormFieldUser(
                    'Book Doctor',
                    provider.catBookDoctorController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bool isValid = formKey.currentState!.validate();
                      if (isValid) {
                        provider.createNewUserCategory();
                        // Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add User Doctor'),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
