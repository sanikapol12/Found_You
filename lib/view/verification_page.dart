import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class BusinessDocumentUploadPage extends StatefulWidget {
  const BusinessDocumentUploadPage({super.key});

  @override
  State<BusinessDocumentUploadPage> createState() =>
      _BusinessDocumentUploadPageState();
}

class _BusinessDocumentUploadPageState
    extends State<BusinessDocumentUploadPage> {
  final TextEditingController businessNameController = TextEditingController();

  // List of document types required for registration
  final List<String> documentTypes = [
    "Business License",
    "GST Certificate",
    "PAN Card",
    "Shop Act",
    "Address Proof",
  ];

  // Map to hold selected files for each document type
  final Map<String, File?> selectedFiles = {};

  @override
  void initState() {
    super.initState();
    for (var doc in documentTypes) {
      selectedFiles[doc] = null; // initialize all as null
    }
  }

  Future<void> pickDocument(String docType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFiles[docType] = File(result.files.single.path!);
      });
    }
  }

  void uploadDocuments() {
    if (businessNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter business name'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Check if all documents are uploaded
    bool allUploaded = selectedFiles.values.every((file) => file != null);

    if (!allUploaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload all required documents'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // ✅ TODO: Implement actual upload logic (Firebase / API)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All documents uploaded successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // ✅ Clear all fields after submission
    setState(() {
      businessNameController.clear(); // clear business name field
      for (var key in selectedFiles.keys) {
        selectedFiles[key] = null; // reset uploaded files
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Registration"),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Register Your Business",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),

            // Business name input
            TextField(
              controller: businessNameController,
              decoration: InputDecoration(
                labelText: "Business Name",
                hintText: "Enter your business name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.business_outlined),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Upload Required Documents",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // Dynamically create document upload fields
            Column(
              children: documentTypes.map((docType) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    onTap: () => pickDocument(docType),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.upload_file, color: Colors.teal),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              selectedFiles[docType] == null
                                  ? "Upload $docType"
                                  : selectedFiles[docType]!.path
                                        .split('/')
                                        .last,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: selectedFiles[docType] == null
                                    ? Colors.black54
                                    : Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          if (selectedFiles[docType] != null)
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 22,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            // Submit button
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: uploadDocuments,
                icon: const Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  "Submit All Documents",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
