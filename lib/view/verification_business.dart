import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_project/controller/user_controller.dart';
import 'package:flutter_project/controller/verification_controller.dart';

class VerifyBusinessScreen extends StatefulWidget {
  const VerifyBusinessScreen({super.key});

  @override
  State<VerifyBusinessScreen> createState() => _VerifyBusinessScreenState();
}

class _VerifyBusinessScreenState extends State<VerifyBusinessScreen> {
  final VerifyDocumentController controller = VerifyDocumentController();
  final UserController usercontrollerobj = UserController();

  File? businessFile;
  File? gstFile;
  File? panFile;
  File? shopActFile;
  File? addressFile;
  bool isLoading = false;

  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );
    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  Future<void> submitDocs() async {
    if (businessFile == null ||
        gstFile == null ||
        panFile == null ||
        shopActFile == null ||
        addressFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please upload all required documents")),
      );
      return;
    }

    setState(() => isLoading = true);

    String? businessURL = await controller.uploadBusinessPDF(businessFile!);
    String? gstURL = await controller.uploadBusinessPDF(gstFile!);
    String? panURL = await controller.uploadBusinessPDF(panFile!);
    String? shopActURL = await controller.uploadBusinessPDF(shopActFile!);
    String? addressURL = await controller.uploadBusinessPDF(addressFile!);

    await usercontrollerobj.getSharePrefrenceData();
    String email = usercontrollerobj.email;

    await controller.saveBusinessDocsToFirestore({
      "docs": {
        "businessLicense": businessURL,
        "gstCertificate": gstURL,
        "panCard": panURL,
        "shopAct": shopActURL,
        "addressProof": addressURL,
      },
      "status": "Pending",
      "uploadedAt": DateTime.now(),
      "email": email,
    });

    setState(() => isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Documents submitted successfully ✅")),
    );
  }

  Widget docPicker(String title, File? file, Function() pickFn) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        trailing: ElevatedButton.icon(
          onPressed: pickFn,
          icon: Icon(
            file == null ? Icons.upload_file : Icons.check_circle,
            color: file == null ? Colors.white : Colors.greenAccent,
            size: 18,
          ),
          label: Text(file == null ? "Upload" : "Uploaded"),
          style: ElevatedButton.styleFrom(
            backgroundColor: file == null ? Colors.black : Colors.grey[800],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)], // purple to blue
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            "Business Verification",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white, // required so gradient shows properly
              fontSize: 20,
            ),
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              "Please upload the required documents below to verify your business.",
              style: TextStyle(fontSize: 15, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            docPicker("Business License", businessFile, () async {
              businessFile = await pickFile();
              setState(() {});
            }),
            docPicker("GST Certificate", gstFile, () async {
              gstFile = await pickFile();
              setState(() {});
            }),
            docPicker("PAN Card", panFile, () async {
              panFile = await pickFile();
              setState(() {});
            }),
            docPicker("Shop Act", shopActFile, () async {
              shopActFile = await pickFile();
              setState(() {});
            }),
            docPicker("Address Proof", addressFile, () async {
              addressFile = await pickFile();
              setState(() {});
            }),

            const SizedBox(height: 30),

            isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: submitDocs,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero, // important for gradient
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF6A11CB),
                              Color(0xFF2575FC),
                            ], // purple to blue
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Submit Verification",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
