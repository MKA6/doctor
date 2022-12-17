import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StoragHelper {
  StoragHelper._();

  static StoragHelper storagHelper = StoragHelper._();
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadImage(String folderName,File file) async {
    String path = file.path;
    String name = path.split('/').toString();
    Reference reference = storage.ref('profile_images/$name');
    await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }

}
