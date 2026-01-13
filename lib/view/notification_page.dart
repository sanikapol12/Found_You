import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/controller/notification_controller.dart';
import 'package:flutter_project/controller/register_business_controller.dart';
import 'package:flutter_project/controller/user_controller.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationController controller = NotificationController();
  final RegesterBusinesscontroller regesterBusinesscontroller =
      RegesterBusinesscontroller();
  String businessEmail = "";

  @override
  void initState() {
    super.initState();
    _getUserEmail();
  }

  _getUserEmail() async {
    UserController user = UserController();
    await user.getSharePrefrenceData();
    setState(() {
      businessEmail = user.email.trim();
    });
  }

  Future<DocumentSnapshot<Object?>> getBusinessData() async {
    DocumentSnapshot<Object?> regesterData = await regesterBusinesscontroller
        .getbuisnessDataforprofile();
    return regesterData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            "Notifications",
            style: TextStyle(
              color: Colors.white, // Needed for ShaderMask to apply gradient
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: businessEmail.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // ✅ Get Service Requests
                  FutureBuilder<QuerySnapshot>(
                    future: controller.getServiceData(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      var docs = snapshot.data!.docs;
                      if (docs.isEmpty) {
                        return const SizedBox();
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          var data = docs[index].data() as Map<String, dynamic>;
                          String docId = docs[index].id;

                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage:
                                            data['profilePic'] != ""
                                            ? NetworkImage(
                                                "https://media.istockphoto.com/id/1477583639/vector/user-profile-icon-vector-avatar-or-person-icon-profile-picture-portrait-symbol-vector.jpg?s=612x612&w=0&k=20&c=OWGIPPkZIWLPvnQS14ZSyHMoGtVTn1zS8cAgLy1Uh24=",
                                              )
                                            : null,
                                        child: data['profilePic'] == ""
                                            ? const Icon(Icons.person)
                                            : null,
                                      ),

                                      const SizedBox(width: 10),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['userName'] ?? "",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(data['phoneNo'] ?? ""),
                                        ],
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [Colors.green, Colors.teal],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            DocumentSnapshot<Object?>
                                            registerData =
                                                await getBusinessData();
                                            await controller.addReadonlyData(
                                              businessEmail: data['userEmail'],
                                              data: {
                                                "businessName":
                                                    registerData['businessName'],
                                                "businessImage":
                                                    registerData['imageUrl'],
                                                "status": "Accepted",
                                              },
                                            );
                                            setState(() {});
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 24,
                                              vertical: 12,
                                            ),
                                          ),
                                          child: const Text(
                                            "Accept",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [Colors.red, Colors.orange],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            DocumentSnapshot<Object?>
                                            registerData =
                                                await getBusinessData();
                                            await controller.addReadonlyData(
                                              businessEmail: data['userEmail'],
                                              data: {
                                                "businessName": [
                                                  'businessName',
                                                ],
                                                "businessImage":
                                                    registerData['imageUrl'],
                                                "status": "Accepted",
                                              },
                                            );
                                            await controller.deleteService(
                                              businessEmail: businessEmail,
                                              requestDocID: docId,
                                            );
                                            setState(() {});
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 24,
                                              vertical: 12,
                                            ),
                                          ),
                                          child: const Text(
                                            "Delete",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  //const Divider(thickness: 2),

                  // ✅ Readonly Requests
                  FutureBuilder<QuerySnapshot>(
                    future: controller.getReadonlyData(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      var docs = snapshot.data!.docs;
                      if (docs.isEmpty) return const SizedBox();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          var data = docs[index].data() as Map<String, dynamic>;

                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 26,
                                backgroundImage: data['businessImage'] != ""
                                    ? NetworkImage(data['businessImage'])
                                    : null,
                                child: (data['businessImage'] == "")
                                    ? const Icon(Icons.store)
                                    : null,
                              ),
                              title: Text(
                                data['businessName'] ?? "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "Status: ${data['status']}",
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
