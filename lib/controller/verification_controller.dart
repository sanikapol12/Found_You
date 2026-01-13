import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_project/controller/user_controller.dart';
import 'package:image_picker/image_picker.dart';

class VerifyDocumentController {
  final ImagePicker picker = ImagePicker();
  final UserController usercontroller = UserController();
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Upload file to Firebase Storage and save URL in Firestore
  Future<String?> uploadDocument(File docFile) async {
    await usercontroller.getSharePrefrenceData();
    String? userId = usercontroller.email;
    try {
      // Create Storage path
      String fileName =
          "legal_docs/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg";

      UploadTask uploadTask = FirebaseStorage.instance
          .ref(fileName)
          .putFile(docFile);

      TaskSnapshot snapshot = await uploadTask;

      // Get URL
      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<String?> uploadBusinessPDF(File pdf) async {
  await usercontroller.getSharePrefrenceData();
  String? userId = usercontroller.email;

  try {
    String fileName = "business_docs/$userId/${DateTime.now().millisecondsSinceEpoch}.pdf";

    UploadTask uploadTask = FirebaseStorage.instance
        .ref(fileName)
        .putFile(pdf);

    TaskSnapshot snap = await uploadTask;
    String url = await snap.ref.getDownloadURL();

    // Save URL in Firestore
    await firebaseFirestore.collection("business_verification").doc(userId).set({
      "businessDoc": url,
      "email": userId,
      "status": "Pending", // Admin verify karega
      "uploadedAt": DateTime.now()
    });

    return url;
  } catch (e) {
    print("PDF Upload Error: $e");
    return null;
  }
}
Future<void> saveBusinessDocsToFirestore(Map<String, dynamic> data) async {
  await usercontroller.getSharePrefrenceData();
  String? userId = usercontroller.email;

  await firebaseFirestore.collection("business_verification")
      .doc(userId)
      .set(data);
}



   
}