import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/Models/AppUser.dart';
import 'package:doctor/admin/models/ActivitiesDoctor.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:doctor/admin/models/Produact.dart';
import 'package:doctor/admin/models/UserDoctorCategory.dart';

class FirestoreHelper {
  FirestoreHelper._();

  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> doctorsCollection =
      FirebaseFirestore.instance.collection('doctors');

  createNewUser(AppUser appUser) async {
    firebaseFirestore.collection('users').doc(appUser.id).set(appUser.toMap());
  }

  Future<AppUser> getUserFromFirestore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('users').doc(id).get();
    Map<String, dynamic>? data = document.data();
    AppUser appUser = AppUser.forMap(data!);
    return appUser;
  }

  updateUserInfo(AppUser appUser) async {
    await firebaseFirestore
        .collection('users')
        .doc(appUser.id)
        .update(appUser.toMap());
  }
/// ///////////////////////////
  RRRR(UserDoctorCategory userDoc) async {
    await firebaseFirestore
        .collection('categories')
        .doc(userDoc.id)
        .set(userDoc.toMap());
  }

  ///  admin functions

  Future<String> createNewCategory(CategoryDoctor category) async {
    DocumentReference<Map<String, dynamic>> document =
        await firebaseFirestore.collection('categories').add(category.toMap());

    return document.id;
  }

  Future<List<CategoryDoctor>> getAllCategory1() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseFirestore.collection('categories').get();
    List<CategoryDoctor> category = querySnapshot.docs.map((e) {
      CategoryDoctor cat = CategoryDoctor.fromMap(e.data());
      cat.id = e.id;
      return cat;
    }).toList();
    log(category.length.toString());
    return category;
  }


  Future<List<UserDoctorCategory>> getAllUserCategory1() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseFirestore.collection('UserDoctor').get();
    List<UserDoctorCategory> category1 = querySnapshot.docs.map((e) {
      UserDoctorCategory cat = UserDoctorCategory.fromMap(e.data());
      cat.id = e.id;
      return cat;
    }).toList();
    //log(category1.length.toString());
    return category1;
  }

  Future<String> createNewUserCategory(UserDoctorCategory category) async {
    DocumentReference<Map<String, dynamic>> document =
        await firebaseFirestore.collection('UserDoctor').add(category.toMap());
    return document.id;
  }

  deleteUserCategory(String id) async {
    await firebaseFirestore.collection('UserDoctor').doc(id).delete();
  }

  deleteActivitiesDoctor(String id) async {
    await firebaseFirestore.collection('UserDoctor').doc(id).delete();
  }
  updateUserRating(CategoryDoctor categoryDoctor) async {
    await firebaseFirestore
        .collection('categories')
        .doc(categoryDoctor.id)
        .update(categoryDoctor.toMap());
  }

  Future<String> AddNewActivitiesDoctor(
      ActivitiesDoctor activitiesDoctor) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await firebaseFirestore
            .collection('UserDoctor')
            .doc(activitiesDoctor.catId)
            .collection('Activities')
            .add(activitiesDoctor.toMap());
    return documentReference.id;
  }
/**
  Future<String> createNewCategoryDoctor(Produact produa) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await firebaseFirestore
            .collection('UserDoctor')
            .doc(produa.catId)
            .collection('produacts')
            .add(produa.toMap());
    return documentReference.id;
  }
    */

  Future<List<ActivitiesDoctor>?> getAllActivitiesDoctor(String catId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore
              .collection('UserDoctor')
              .doc(catId)
              .collection('Activities')
              .get();
      return querySnapshot.docs.map((e) {
        ActivitiesDoctor activities = ActivitiesDoctor.fromMap(e.data());
        activities.id = e.id;
        return activities;
      }).toList();
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<List<Produact>?> getAllCategoryDoctor(String catId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await firebaseFirestore
          .collection('UserDoctor')
          .doc(catId)
          .collection('produacts')
          .get();
      return querySnapshot.docs.map((e) {
        Produact produact = Produact.fromMap(e.data());
        produact.id = e.id;
        return produact;
      }).toList();
    } on Exception catch (e) {
      // TODO
    }
  }

  deleteCategory(String id) async {
    await firebaseFirestore.collection('UserDoctor').doc(id).delete();
    log(id);
  }

  updateCategory(ActivitiesDoctor activitiesDoctor) async {}
}
