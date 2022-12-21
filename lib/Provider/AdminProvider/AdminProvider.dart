import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Helper/FirestoreHelper.dart';
import 'package:doctor/Helper/StoragHelper.dart';
import 'package:doctor/Widgets/CustomScarch.dart';
import 'package:doctor/admin/models/ActivitiesDoctor.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:doctor/admin/models/Produact.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AdminProvider extends ChangeNotifier {
  CategoryDoctor? categoryDoctor;
  UserDoctorCategory? usersDoctor;
  File? pickedImage;
  List<CategoryDoctor>? categories;
  List<UserDoctorCategory>? userDoctorCategory;
  List<ActivitiesDoctor>? activitiesDoctor;
  List<Produact>? produact;


  int doctorProfileIndex= 0;

  AdminProvider() {
   getAllUserCategory();

    getAllCategory();
  }

  int bnbindex = 0;

  setBnbIndex(int index) async {
    bnbindex = index;
    notifyListeners();
  }

  TextEditingController catNameController = TextEditingController();
  TextEditingController catSpecializationController = TextEditingController();
  TextEditingController catLcationController = TextEditingController();
  TextEditingController catEmailController = TextEditingController();
  TextEditingController catPhoneController = TextEditingController();
  TextEditingController catRatingController = TextEditingController();
  TextEditingController catWorkDaysController = TextEditingController();
  TextEditingController catWorkTimeController = TextEditingController();
  TextEditingController catBookDoctorController = TextEditingController();
  TextEditingController catLatitudeController = TextEditingController();
  TextEditingController catLongitudeController = TextEditingController();

  /// /////////////
  TextEditingController produactsDescriptionController =
      TextEditingController();

  ///  /////////////////////////////////////
  TextEditingController ProduactCatLcationController = TextEditingController();
  TextEditingController ProduactCatEmailController = TextEditingController();
  TextEditingController ProduactCatPhoneController = TextEditingController();
  TextEditingController ProduactCatRatingController = TextEditingController();
  TextEditingController ProduactCatWorkDaysController = TextEditingController();
  TextEditingController ProduactCatWorkTimeController = TextEditingController();
  TextEditingController ProduactCatBookDoctorController =
      TextEditingController();
  TextEditingController ProduactCatLatitudeController = TextEditingController();
  TextEditingController ProduactCatLongitudeController =
      TextEditingController();

  pickCategoryImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      pickedImage = File(xFile.path);
      notifyListeners();
    }
  }

  CreatNewCategory() async {
    if (pickedImage != null) {
      AppRouter.showLoaderDialog();
      String imageUrl = await StoragHelper.storagHelper
          .uploadImage("Category_Images", pickedImage!);
      CategoryDoctor category = CategoryDoctor(
        imageUrl: imageUrl,
        name: catNameController.text,
        specialization: catSpecializationController.text,
        workDays: catWorkDaysController.text,
        workTime: catWorkTimeController.text,
        Rating: catRatingController.text,
      );

      String id =
          await FirestoreHelper.firestoreHelper.createNewCategory(category);
      category.id = id;
      categories!.add(category);
      pickedImage == null;
      catNameController.clear();
      catSpecializationController.clear();
      catWorkDaysController.clear();
      catWorkTimeController.clear();
      catRatingController.clear();
      notifyListeners();
      AppRouter.hideLoadingDialoug();
      AppRouter.shoeCustomDialog("The category has been successfully");
    }
  }

  createNewUserCategory() async {
    if (pickedImage != null) {
      AppRouter.showLoaderDialog();
      String imageUrl = await StoragHelper.storagHelper
          .uploadImage("UserCategory_Images", pickedImage!);
      UserDoctorCategory category = UserDoctorCategory(
        imageUrl: imageUrl,
        name: catNameController.text,
        specialization: catSpecializationController.text,
        location: catLcationController.text,
        email: catEmailController.text,
        phone: catPhoneController.text,
        workDays: catWorkDaysController.text,
        workTime: catWorkTimeController.text,
        bookDoctor: catBookDoctorController.text,
      );
      String id =
          await FirestoreHelper.firestoreHelper.createNewUserCategory(category);
      category.id = id;
      userDoctorCategory!.add(category);

      imageUrl == null;
      catNameController.clear();
      catSpecializationController.clear();
      catLcationController.clear();
      catEmailController.clear();
      catPhoneController.clear();
      catWorkDaysController.clear();
      catWorkTimeController.clear();
      catBookDoctorController.clear();
      AppRouter.hideLoadingDialoug();
      notifyListeners();
    }
  }

  getAllUserCategory() async {
    userDoctorCategory =
        await FirestoreHelper.firestoreHelper.getAllUserCategory1();
    notifyListeners();
  }

  getAllCategory() async {
    categories = await FirestoreHelper.firestoreHelper.getAllCategory1();
    log(categories.toString());
    notifyListeners();
  }

  deleteUserCategory(UserDoctorCategory category) async {
    AppRouter.showLoaderDialog();
    await FirestoreHelper.firestoreHelper.deleteUserCategory(category.id!);
    AppRouter.hideLoadingDialoug();
    // AppRouter.shoeCustomDiaoug('The delete has been successfully');
    userDoctorCategory!.remove(category);
    notifyListeners();
  }

  deleteActivitiesDoctor(ActivitiesDoctor activi) async {
    AppRouter.showLoaderDialog();
    await FirestoreHelper.firestoreHelper.deleteUserCategory(activi.id!);
    AppRouter.hideLoadingDialoug();
    activitiesDoctor!.remove(activi);
    notifyListeners();
  }

  UpdateUserDoctoer() {
    catNameController.text = usersDoctor!.name!;
    catSpecializationController.text = usersDoctor!.specialization!;
    notifyListeners();
  }

  updateUserRating() async {
    categoryDoctor!.Rating = catRatingController.text;
    FirestoreHelper.firestoreHelper.updateUserRating(categoryDoctor!);

    ///  اكمل
  }

  addActivitiesDoctor(String catId) async {
    if (pickedImage != null) {
      AppRouter.showLoaderDialog();
      String imageUrl = await StoragHelper.storagHelper
          .uploadImage("Activities_Doctor_Images", pickedImage!);
      ActivitiesDoctor activities = ActivitiesDoctor(
        imageUrl: imageUrl,
        description: produactsDescriptionController.text,
        catId: catId,
      );
      String id = await FirestoreHelper.firestoreHelper
          .AddNewActivitiesDoctor(activities);
      activities.id = id;
      activitiesDoctor?.add(activities);
      pickedImage == null;
      produactsDescriptionController.clear();
      AppRouter.hideLoadingDialoug();
      notifyListeners();
    }
  }
/**
  addDoctorProduacts(String catId) async {
      AppRouter.showLoaderDialog();
      Produact produacts = Produact(
        location: ProduactCatLcationController.text,
        email: ProduactCatEmailController.text,
        phone: ProduactCatPhoneController.text,
        workDays: ProduactCatWorkDaysController.text,
        workTime: ProduactCatWorkTimeController.text,
        bookDoctor: ProduactCatBookDoctorController.text,
        Rating: ProduactCatRatingController.text,
      );
      String id = await FirestoreHelper.firestoreHelper
          .createNewCategoryDoctor(produacts);
      produacts.id = id;
      produact?.add(produacts);
      ProduactCatLcationController.clear();
      ProduactCatEmailController.clear();
      ProduactCatPhoneController.clear();
      ProduactCatWorkDaysController.clear();
      ProduactCatWorkTimeController.clear();
      ProduactCatBookDoctorController.clear();
      ProduactCatRatingController.clear();
      AppRouter.hideLoadingDialoug();
      notifyListeners();
  }
*/
  

  getAllActivitiesDoctor(String catId) async {
    // AppRouter.showLoaderDialog();
    activitiesDoctor =
        await FirestoreHelper.firestoreHelper.getAllActivitiesDoctor(catId);
    // AppRouter.hideLoadingDialoug();
    notifyListeners();
  }

}
