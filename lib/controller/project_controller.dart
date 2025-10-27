import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProjectController {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  /// Pick image from gallery
  Future<File?> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        return selectedImage;
      } else {
        print("❌ No image selected");
        return null;
      }
    } catch (e) {
      print("⚠️ Error picking image: $e");
      return null;
    }
  }

  /// Add project (for now: print data)
  Future<void> addProject({
    required String name,
    required String price,
    required String category,
    String? description,
  }) async {
    print(
      "✅ Project added: $name, ₹$price, $category, desc=$description, img=$selectedImage",
    );
  }
}
