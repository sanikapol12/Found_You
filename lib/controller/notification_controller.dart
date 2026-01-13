import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/controller/user_controller.dart';


class NotificationController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // ✅ Add GetService data
  Future<void> addGetServiceData({
    required Map<String, dynamic> data,
    required String businessEmail,
  }) async {
    final email = businessEmail.trim();
    await firebaseFirestore
        .collection("GetServices")
        .doc(email)
        .collection("Requests")
        .add(data);
    log("✅ GetService request added");
  }

  // ✅ Move request to Readonly (Accepted/Rejected)
  Future<void> addReadonlyData({
    required Map<String, dynamic> data,
    required String businessEmail,
  }) async {
    final email = businessEmail.trim();
    await firebaseFirestore
        .collection("Readonly")
        .doc(email)
        .collection("Requests")
        .add(data);
    log("✅ Moved to Readonly");
  }

  // ✅ Fetch GetService requests (multiple)
  Future<QuerySnapshot> getServiceData() async {
    UserController user = UserController();
    await user.getSharePrefrenceData();
    String email = user.email.trim();

    log("📥 Fetch GetServices for: $email");

    return firebaseFirestore
        .collection("GetServices")
        .doc(email)
        .collection("Requests")
        .get();
  }

  // ✅ Fetch Readonly requests (multiple)
  Future<QuerySnapshot> getReadonlyData() async {
    UserController user = UserController();
    await user.getSharePrefrenceData();
    String email = user.email.trim();

    log("📥 Fetch Readonly for: $email");

    return firebaseFirestore
        .collection("Readonly")
        .doc(email)
        .collection("Requests")
        .get();
  }

  // ✅ Delete request after Accept/Reject
  Future<void> deleteService({
    required String businessEmail,
    required String requestDocID,
  }) async {
    final email = businessEmail.trim();
    await firebaseFirestore
        .collection("GetServices")
        .doc(email)
        .collection("Requests")
        .doc(requestDocID)
        .delete();

    log("🗑️ Deleted request: $requestDocID");
  }
}
















