import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/controller/user_controller.dart';


class RegesterBusinesscontroller {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> uploadImage({
    required String filename,
    required File selectedFile,
  }) async {
    log("Upload image to firebase");
    await firebaseStorage.ref().child(filename).putFile(selectedFile);
    log("After upload image to firebase");
  }

  //Download File

  Future<String> downloadImage({required String fileName}) async {
    log("download Image");
    String url = await firebaseStorage.ref().child(fileName).getDownloadURL();
    return url;
  }

  //Add Data
  Future<void> addData({required Map<String, dynamic> data}) async {
    UserController usercontrollerObj = UserController();
    await usercontrollerObj.getSharePrefrenceData();
    log(" Before Add Data to database");
    await firebaseFirestore
        .collection("Regester Project")
        .doc(usercontrollerObj.email)
        .set(data);
    log(" After Add Data to database");
  }

  //Get Data

  Future<DocumentSnapshot<Object?>> getbuisnessDataforprofile() async {
    UserController usercontrollerObj = UserController();
    await usercontrollerObj.getSharePrefrenceData();
    DocumentSnapshot<Object?> businessData = await firebaseFirestore
        .collection("Regester Project")
        .doc(usercontrollerObj.email)
        .get();
    debugPrint("$businessData");
    return businessData;
  }

  Future<QuerySnapshot<Object?>> getbuisnessData() async {
    UserController usercontrollerObj = UserController();
    await usercontrollerObj.getSharePrefrenceData();
    QuerySnapshot<Object?> businessData = await firebaseFirestore
        .collection("Regester Project")
        .get();
    debugPrint("$businessData");
    return businessData;
  }
}