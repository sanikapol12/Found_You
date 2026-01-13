import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project/controller/user_controller.dart';


class Addtofavoriteclass {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //Add Data
  Future<void> addtofavorite({required Map<String, dynamic> data}) async {
    UserController usercontrollerObj = UserController();
    await usercontrollerObj.getSharePrefrenceData();
    debugPrint(" Before Add Data to favorite");
    await firebaseFirestore
        .collection("Favorite Business")
        .doc(usercontrollerObj.email)
        .collection("UserFavorites")
        .add(data);
    log(" After Add Data to database");
  }

  //get data
  Future<QuerySnapshot<Object?>> getfavoritebuisnessData() async {
    UserController usercontrollerObj = UserController();
    await usercontrollerObj.getSharePrefrenceData();
    final userEmail = usercontrollerObj.email;

    final snapshot = await firebaseFirestore
        .collection("Favorite Business")
        .doc(userEmail)
        .collection("UserFavorites")
        .get();

    return snapshot;
  }

  //  Delete specific favorite business by document ID
  Future<void> deleteFavoriteBusiness(String docId) async {
    try {
      UserController usercontrollerObj = UserController();
      await usercontrollerObj.getSharePrefrenceData();

      final userEmail = usercontrollerObj.email;

      await firebaseFirestore
          .collection("Favorite Business")
          .doc(userEmail)
          .collection("UserFavorites")
          .doc(docId)
          .delete();

      log(" Favorite deleted successfully: $docId");
    } catch (e) {
      debugPrint(" Error deleting favorite: $e");
    }
  }
}