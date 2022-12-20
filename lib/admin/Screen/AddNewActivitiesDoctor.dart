import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Widgets/CustomTextFormFieldUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewActivitiesDoctor extends StatelessWidget {
  String catId;

  AddNewActivitiesDoctor(this.catId);

  GlobalKey<FormState> produactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Add Activities Doctor'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: produactKey,
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
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: provider.pickedImage == null
                          ? Icon(Icons.camera_alt)
                          : Image.file(
                              provider.pickedImage!,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormFieldUser(
                    'Description',
                    provider.produactsDescriptionController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bool isValid = produactKey.currentState!.validate();
                      if (isValid) {
                        provider.addActivitiesDoctor(catId);
                      }
                    },
                    child: const Text(
                      'Add Activities',
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
