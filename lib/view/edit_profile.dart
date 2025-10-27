import 'package:flutter/material.dart';
import '../controller/profile_controller.dart';
import '../model/profile_model.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileController controller;

  const EditProfilePage({super.key, required this.controller});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _categoryController;
  late TextEditingController _websiteController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    final profile = widget.controller.profile;
    _nameController = TextEditingController(text: profile.name);
    _categoryController = TextEditingController(text: profile.category);
    _websiteController = TextEditingController(text: profile.website);
    _bioController = TextEditingController(text: profile.bio);
  }

  @override
  Widget build(BuildContext context) {
    final profile = widget.controller.profile;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child: const Text("Save", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profile.profileImage),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField("Name", _nameController),
            _buildTextField("Category", _categoryController),
            _buildTextField("Website", _websiteController),
            _buildTextField("Bio", _bioController, maxLines: 3),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _saveProfile,
              icon: const Icon(Icons.check),
              label: const Text("Save Changes"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 30,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }

  void _saveProfile() {
    final updatedProfile = ProfileModel(
      name: _nameController.text,
      category: _categoryController.text,
      website: _websiteController.text,
      bio: _bioController.text,
      profileImage: widget.controller.profile.profileImage,
    );

    widget.controller.updateProfile(updatedProfile);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated successfully!")),
    );

    Navigator.pop(context, updatedProfile);
  }
}
