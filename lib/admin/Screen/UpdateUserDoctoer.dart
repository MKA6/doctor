import 'package:doctor/Profile/TextProfile.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Widgets/CustomTextFormFieldUser.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateUserDoctoer extends StatelessWidget {
  UserDoctorCategory userDoctorCategory;

  UpdateUserDoctoer(this.userDoctorCategory);

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Update User Doctoer'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      provider.pickCategoryImage();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(500),
                          color: Colors.white),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: provider.pickedImage == null
                          ? Image.network(
                              userDoctorCategory.imageUrl!,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              provider.pickedImage!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormFieldUser(
                    'Name',
                    provider.catNameController,
                  ),
                  CustomTextFormFieldUser(
                    'Specialization',
                    provider.catSpecializationController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bool isValid = formKey.currentState!.validate();
                      if (isValid) {
                        provider.createNewUserCategory();
                        //provider.CreatNewCategory();
                        // Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      'Update',
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
  }
}
