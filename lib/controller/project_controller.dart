// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:found_you_project/controller/SharedPrefrence_controller.dart';
// import 'package:image_picker/image_picker.dart';

// class ProjectController {
//   final ImagePicker picker = ImagePicker();
//   final UserController usercontroller = UserController();
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//   // Upload file to Firebase Storage and save URL in Firestore
//   Future<String?> uploadproject(File docFile) async {
//     await usercontroller.getSharePrefrenceData();
//     String? userId = usercontroller.email;
//     try {
//       // Create Storage path
//       String fileName =
//           "Project/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg";

//       UploadTask uploadTask = FirebaseStorage.instance
//           .ref(fileName)
//           .putFile(docFile);

//       TaskSnapshot snapshot = await uploadTask;

//       // Get URL
//       String downloadUrl = await snapshot.ref.getDownloadURL();

//       return downloadUrl;
//     } catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }

//   Future<String?> uploadProject(File pdf) async {
//     await usercontroller.getSharePrefrenceData();
//     String? userId = usercontroller.email;

//     try {
//       String fileName =
//           "Project_docs/$userId/${DateTime.now().millisecondsSinceEpoch}.pdf";

//       UploadTask uploadTask = FirebaseStorage.instance
//           .ref(fileName)
//           .putFile(pdf);

//       TaskSnapshot snap = await uploadTask;
//       String url = await snap.ref.getDownloadURL();

//       // Save URL in Firestore
//       await firebaseFirestore
//           .collection("business_verification")
//           .doc(userId)
//           .set({
//             "Project_docs": url,
//             "email": userId,
//             "uploadedAt": DateTime.now(),
//           });

//       return url;
//     } catch (e) {
//       print("PDF Upload Error: $e");
//       return null;
//     }
//   }

//   Future<void> saveBusinessDocsToFirestore(Map<String, dynamic> data) async {
//     await usercontroller.getSharePrefrenceData();
//     String userId = usercontroller.email;

//     await firebaseFirestore.collection("Project_docs").doc(userId).set(data);
//   }
// }
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_project/controller/user_controller.dart';
import 'package:image_picker/image_picker.dart';


class ProjectController {
  final ImagePicker _picker = ImagePicker();
  final UserController userController = UserController();

  File? selectedImage;

  /// Pick Image
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
    }
  }

  /// Upload Image to Firebase Storage
  Future<String?> uploadImage() async {
    if (selectedImage == null) return null;

    await userController.getSharePrefrenceData();
    String userId = userController.email;

    try {
      String filePath =
          "projects/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg";

      final ref = FirebaseStorage.instance.ref().child(filePath);
      await ref.putFile(selectedImage!);

      return await ref.getDownloadURL();
    } catch (e) {
      print("Image upload error: $e");
      return null;
    }
  }

  /// Save Project Data to Firestore
  Future<void> saveProject({required String name, String? description}) async {
    await userController.getSharePrefrenceData();
    String userId = userController.email;

    String? imgUrl = await uploadImage();

    if (imgUrl == null) {
      print("Image upload failed!");
      return;
    }

    await FirebaseFirestore.instance
        .collection("Business_projects")
        .doc(userId)
        .collection("projects")
        .add({
          "name": name.isEmpty ? null : name,
          "description": description,
          "imageUrl": imgUrl,
          "createdAt": FieldValue.serverTimestamp(),
        });
  }

  Future<List<String>> getProjectImages() async {
  await userController.getSharePrefrenceData();
  String userId = userController.email;

  QuerySnapshot snap = await FirebaseFirestore.instance
      .collection("Business_projects")
      .doc(userId)
      .collection("projects")
      .get();

  return snap.docs.map((doc) => doc["imageUrl"].toString()).toList();
}
 Future<List<String>> getProjectImageinbusiness({required String userId}) async {
  await userController.getSharePrefrenceData();
  //String userId = userController.email;

  QuerySnapshot snap = await FirebaseFirestore.instance
      .collection("Business_projects")
      .doc(userId)
      .collection("projects")
      .get();

  return snap.docs.map((doc) => doc["imageUrl"].toString()).toList();
}

}