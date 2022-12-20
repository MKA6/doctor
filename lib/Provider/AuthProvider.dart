import 'dart:io';
import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/BottomNavigationScreen/BottomNavigationBar.dart';
import 'package:doctor/Helper/AuthHelper.dart';
import 'package:doctor/Helper/FirestoreHelper.dart';
import 'package:doctor/Helper/StoragHelper.dart';
import 'package:doctor/Log%20In/Cinema.dart';
import 'package:doctor/Log%20In/SignUp.dart';
import 'package:doctor/Log%20In/signIn.dart';
import 'package:doctor/Models/AppUser.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    checkUser();
  }

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpPhoneNumberController = TextEditingController();

  TextEditingController initialRating = TextEditingController();

  TextEditingController profileUserNameController = TextEditingController();
  TextEditingController profileUserPhoneController = TextEditingController();

  AppUser? loggedAppUser;
  late User loggedUser;

  login() async {
    String? userId = await AuthHelper.authHelper
        .login(loginEmailController.text.trim(), loginPasswordController.text);
    if (userId != null) {
      getUserFromFirestore(userId);
      AppRouter.navigateAndReplaceScreen(BottoNavigationScreen()); //Cinema()
    }
  }

  getUserFromFirestore(String id) async {
    loggedAppUser =
        await FirestoreHelper.firestoreHelper.getUserFromFirestore(id);
    loggedAppUser!.id = id;
    profileUserNameController.text = loggedAppUser!.name ?? '';
    profileUserPhoneController.text = loggedAppUser!.phoneNumber ?? '';
    notifyListeners();
  }

  signUp() async {
    bool isSuccess = await AuthHelper.authHelper.signUp(
        signUpEmailController.text.trim(), signUpPasswordController.text);
    // getUserFromAuth();
    if (isSuccess) {
      getUserFromAuth();
      AppUser appUser = AppUser(
        loggedUser.uid,
        signUpNameController.text,
        loggedUser.email,
        signUpPhoneNumberController.text,
      );
      FirestoreHelper.firestoreHelper.createNewUser(appUser);
      AppRouter.navigateAndReplaceScreen(BottoNavigationScreen()); //Cinema()
    }
  }

  getUserFromAuth() {
    loggedUser = AuthHelper.authHelper.checkUser()!;
  }

  checkUser() async {
    await Future.delayed(Duration(seconds: 3));
   // AppRouter.navigateAndReplaceScreen(Cinema());
    User? user = AuthHelper.authHelper.checkUser();
    if (user == null) {
      /// navigation to auth screen
      AppRouter.navigateAndReplaceScreen(SignUp());
    } else {
      /// navigation to main screen
      getUserFromFirestore(user.uid); // new
      AppRouter.navigateAndReplaceScreen(BottoNavigationScreen()); // //Cinema()
    }
  }

  signOut() {
    AuthHelper.authHelper.signout();
    AppRouter.navigateAndReplaceScreen(SignIn());
  }

  updateUserImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      String imageUrl =
          await StoragHelper.storagHelper.uploadImage("prifile_images", file);
      AppRouter.shoeCustomDialog('The image has been uploaded successfully');
      loggedAppUser!.imagUrl = imageUrl;
      await FirestoreHelper.firestoreHelper.updateUserInfo(loggedAppUser!);
      getUserFromFirestore(loggedAppUser!.id!);
    }
  }

  updateUserInfo() async {
    loggedAppUser!.name = profileUserNameController.text;
    loggedAppUser!.phoneNumber = profileUserPhoneController.text;
    FirestoreHelper.firestoreHelper.updateUserInfo(loggedAppUser!);
    getUserFromFirestore(loggedAppUser!.id!);
    AppRouter.shoeCustomDialog('Data has been modified');
  }


}
