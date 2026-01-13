import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_project/controller/user_controller.dart';

import '../model/profile_model.dart';

class ProfileController {
  ProfileModel _profile = ProfileModel(
    name: "Sanika Construction",
    //category: "Real Estate",
    // website: "www.sanikapol.com",
    // bio: "Building trust with every brick ",
    profileImage:
        "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180",
  );

  ProfileModel get profile => _profile;

  void updateProfile(ProfileModel updatedProfile) {
    _profile = updatedProfile;
  }

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
    log(" Before Add Data to database");
    await firebaseFirestore
        .collection("User Profile")
        .doc(data['email'])
        .set(data);
    log(" After Add Data to database");

    //get singup date

    void getSignupDate() {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        print("Signup date: ${user.metadata.creationTime}");
      }
    }
  }

  //Get Data

  Future<DocumentSnapshot<Object?>> getUserData() async {
    UserController usercontrollerObj = UserController();
    await usercontrollerObj.getSharePrefrenceData();
    DocumentSnapshot<Object?> userData = await firebaseFirestore
        .collection("User Profile")
        .doc(usercontrollerObj.email)
        .get();

    log(userData['name']);

    return userData;
  }
}
