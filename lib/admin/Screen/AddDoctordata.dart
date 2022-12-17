import 'package:doctor/Helper/FirestoreHelper.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Widgets/CustomTextFormFieldUser.dart';
import 'package:doctor/admin/models/Produact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddDoctorData extends StatelessWidget {
  String catId;

  AddDoctorData(this.catId);

  GlobalKey<FormState> produactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AdminProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              appBar: AppBar(),
              body: Form(
                key: produactKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormFieldUser(
                        'location',
                        provider.ProduactCatLcationController,
                      ),
                      CustomTextFormFieldUser(
                        'email',
                        provider.ProduactCatEmailController,
                      ),
                      CustomTextFormFieldUser(
                        'Phone',
                        provider.ProduactCatPhoneController,
                      ),
                      CustomTextFormFieldUser(
                        'work Days',
                        provider.ProduactCatWorkDaysController,
                      ),
                      CustomTextFormFieldUser(
                        'work Time',
                        provider.ProduactCatWorkTimeController,
                      ),
                      CustomTextFormFieldUser(
                        'book Doctor',
                        provider.ProduactCatBookDoctorController,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bool isValid = produactKey.currentState!.validate();
                          if (isValid) {
                           //provider.addDoctorProduacts(catId);
                            //FirestoreHelper.firestoreHelper.AddNewCategoryDoctor(Produact());
                            //provider.addDoctorProduacts(catId);
                            // Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          'Add Doctor Data',
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
