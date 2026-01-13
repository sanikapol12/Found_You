// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_project/view/verification_page.dart';
// import 'package:image_picker/image_picker.dart';
// import '../controller/profile_controller.dart';
// import '../model/profile_model.dart';

// class EditProfilePage extends StatefulWidget {
//   final ProfileController controller;

//   const EditProfilePage({super.key, required this.controller});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _phoneNoController;
//   late TextEditingController _joinDateController;
//   late TextEditingController _passwordController;

//   ImagePicker imagePicker = ImagePicker();
//   XFile? selectedImage;
//   bool _isLoading = true;
//   String _currentImageUrl =
//       "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180";

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _emailController = TextEditingController();
//     _phoneNoController = TextEditingController();
//     _loadUserData();
//   }

//   /// Load user data from Firestore
//   Future<void> _loadUserData() async {
//     try {
//       final userSnap = await widget.controller.getUserData();
//       final userData = userSnap.data() as Map<String, dynamic>? ?? {};

//       setState(() {
//         _nameController.text = userData['name'] ?? '';
//         _emailController.text = userData['email'] ?? '';
//         _phoneNoController.text = userData['phoneNo'] ?? '';
//         _joinDateController.text = userData['joinDate'] ?? '';
//         _passwordController.text = userData['password'] ?? '';

//         _currentImageUrl =
//             userData['profileImage'] ??
//             "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180";
//         _isLoading = false;
//       });
//     } catch (e) {
//       debugPrint("Error loading user data: $e");
//       setState(() => _isLoading = false);
//     }
//   }

//   /// Upload image and save profile data
//   Future<void> _saveProfile() async {
//     try {
//       String imageUrl = _currentImageUrl;

//       // If new image selected → upload it
//       if (selectedImage != null) {
//         final fileName =
//             "${DateTime.now().millisecondsSinceEpoch}_${selectedImage!.name}";
//         await widget.controller.uploadImage(
//           filename: fileName,
//           selectedFile: File(selectedImage!.path),
//         );
//         imageUrl = await widget.controller.downloadImage(fileName: fileName);
//       }

//       // Update Firestore
//       await widget.controller.addData(
//         data: {
//           'email': _emailController
//               .text, // email not editable but required for doc id
//           'name': _nameController.text,
//           'phoneNo': _phoneNoController.text,
//           'profileImage': imageUrl,
//           'password': _passwordController.text,
//           'joinDate': _joinDateController.text,
//         },
//       );

//       // Update local model
//       widget.controller.updateProfile(
//         ProfileModel(name: _nameController.text, profileImage: imageUrl),
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Profile updated successfully!")),
//       );

//       if (mounted) Navigator.pop(context, widget.controller.profile);
//     } catch (e) {
//       debugPrint("Error saving profile: $e");
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Failed to update profile")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "Edit Profile",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           TextButton(
//             onPressed: _saveProfile,
//             child: const Text("Save", style: TextStyle(color: Colors.blue)),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Profile Image
//             Center(
//               child: Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   CircleAvatar(
//                     radius: 55,
//                     backgroundImage: selectedImage != null
//                         ? FileImage(File(selectedImage!.path))
//                         : NetworkImage(_currentImageUrl) as ImageProvider,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       selectedImage = await imagePicker.pickImage(
//                         source: ImageSource.gallery,
//                       );
//                       if (selectedImage != null) {
//                         setState(() {});
//                       }
//                     },
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.blue,
//                         shape: BoxShape.circle,
//                       ),
//                       padding: const EdgeInsets.all(6),
//                       child: const Icon(
//                         Icons.edit,
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Name
//             _buildTextField("Name", _nameController),

//             // Email (non-editable)
//             _buildTextField("Email", _emailController, enabled: false),

//             // Phone
//             _buildTextField("Phone No", _phoneNoController),

//             const SizedBox(height: 20),

//             Container(
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xFF7F00FF),
//                     Color(0xFFE100FF),
//                   ], // Purple → Pink
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: ElevatedButton.icon(
//                 onPressed: _saveProfile,
//                 // icon: const Icon(Icons.check, color: Colors.white),
//                 label: const Text(
//                   "Save Changes",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent, // 👈 important
//                   shadowColor: Colors.transparent, // 👈 remove default shadow
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 12,
//                     horizontal: 30,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             TextButton.icon(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => BusinessDocumentUploadPage(),
//                   ),
//                 );
//               },
//               icon: ShaderMask(
//                 shaderCallback: (bounds) => const LinearGradient(
//                   colors: [
//                     Color(0xFF7F00FF),
//                     Color(0xFFE100FF),
//                   ], // Purple → Pink
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ).createShader(bounds),
//                 child: const Icon(Icons.check, color: Colors.white),
//               ),
//               label: ShaderMask(
//                 shaderCallback: (bounds) => const LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 127, 180, 203),
//                     Color.fromARGB(255, 40, 62, 190),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ).createShader(bounds),
//                 child: const Text(
//                   "Verify your Business",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               style: TextButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 12,
//                   horizontal: 30,
//                 ),
//               ),
//             ),

//             // ElevatedButton.icon(
//             //   onPressed: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(
//             //         builder: (_) => BusinessDocumentUploadPage(),
//             //       ),
//             //     );
//             //   },

//             //   label: const Text("Verify your buisness"),
//             //   style: ElevatedButton.styleFrom(
//             //     backgroundColor: Colors.black,
//             //     foregroundColor: Colors.white,
//             //     padding: const EdgeInsets.symmetric(
//             //       vertical: 12,
//             //       horizontal: 30,
//             //     ),
//             //     shape: RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.circular(10),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     String label,
//     TextEditingController controller, {
//     bool enabled = true,
//     int maxLines = 1,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: TextField(
//         controller: controller,
//         enabled: enabled,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: const TextStyle(color: Colors.grey),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import '../controller/profile_controller.dart';
// import '../model/profile_model.dart';

// class EditProfilePage extends StatefulWidget {
//   final ProfileController controller;

//   const EditProfilePage({super.key, required this.controller});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _phoneNoController;
//   late TextEditingController _joinDateController;
//   late TextEditingController _passwordController;

//   ImagePicker imagePicker = ImagePicker();
//   XFile? selectedImage;
//   bool _isLoading = true;
//   String _currentImageUrl =
//       "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180";

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _emailController = TextEditingController();
//     _phoneNoController = TextEditingController();
//     _loadUserData();
//   }

//   /// Load user data from Firestore
//   Future<void> _loadUserData() async {
//     try {
//       final userSnap = await widget.controller.getUserData();
//       final userData = userSnap.data() as Map<String, dynamic>? ?? {};

//       setState(() {
//         _nameController.text = userData['name'] ?? '';
//         _emailController.text = userData['email'] ?? '';
//         _phoneNoController.text = userData['phoneNo'] ?? '';
//         _joinDateController.text = userData['joinDate'] ?? '';
//         _passwordController.text = userData['password'] ?? '';

//         _currentImageUrl =
//             userData['profileImage'] ??
//             "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180";
//         _isLoading = false;
//       });
//     } catch (e) {
//       debugPrint("Error loading user data: $e");
//       setState(() => _isLoading = false);
//     }
//   }

//   /// Upload image and save profile data
//   Future<void> _saveProfile() async {
//     try {
//       String imageUrl = _currentImageUrl;

//       // If new image selected → upload it
//       if (selectedImage != null) {
//         final fileName =
//             "${DateTime.now().millisecondsSinceEpoch}_${selectedImage!.name}";
//         await widget.controller.uploadImage(
//           filename: fileName,
//           selectedFile: File(selectedImage!.path),
//         );
//         imageUrl = await widget.controller.downloadImage(fileName: fileName);
//       }

//       // Update Firestore
//       await widget.controller.addData(
//         data: {
//           'email': _emailController
//               .text, // email not editable but required for doc id
//           'name': _nameController.text,
//           'phoneNo': _phoneNoController.text,
//           'profileImage': imageUrl,
//           'password': _passwordController.text,
//           'joinDate': _joinDateController.text,
//         },
//       );

//       // Update local model
//       widget.controller.updateProfile(
//         ProfileModel(name: _nameController.text, profileImage: imageUrl),
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Profile updated successfully!")),
//       );

//       if (mounted) Navigator.pop(context, widget.controller.profile);
//     } catch (e) {
//       debugPrint("Error saving profile: $e");
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Failed to update profile")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "Edit Profile",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           TextButton(
//             onPressed: _saveProfile,
//             child: const Text("Save", style: TextStyle(color: Colors.blue)),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Profile Image
//             Center(
//               child: Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   CircleAvatar(
//                     radius: 55,
//                     backgroundImage: selectedImage != null
//                         ? FileImage(File(selectedImage!.path))
//                         : NetworkImage(_currentImageUrl) as ImageProvider,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       selectedImage = await imagePicker.pickImage(
//                         source: ImageSource.gallery,
//                       );
//                       if (selectedImage != null) {
//                         setState(() {});
//                       }
//                     },
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.blue,
//                         shape: BoxShape.circle,
//                       ),
//                       padding: const EdgeInsets.all(6),
//                       child: const Icon(
//                         Icons.edit,
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Name
//             _buildTextField("Name", _nameController),

//             // Email (non-editable)
//             _buildTextField("Email", _emailController, enabled: false),

//             // Phone
//             _buildTextField("Phone No", _phoneNoController),

//             const SizedBox(height: 20),

//             ElevatedButton.icon(
//               onPressed: _saveProfile,
//               icon: const Icon(Icons.check),
//               label: const Text("Save Changes"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 12,
//                   horizontal: 30,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     String label,
//     TextEditingController controller, {
//     bool enabled = true,
//     int maxLines = 1,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: TextField(
//         controller: controller,
//         enabled: enabled,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: const TextStyle(color: Colors.grey),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import '../controller/profile_controller.dart';
// import '../model/profile_model.dart';

// class EditProfilePage extends StatefulWidget {
//   final ProfileController controller;

//   const EditProfilePage({super.key, required this.controller});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _phoneNoController;
//   late TextEditingController _joinDateController;
//   late TextEditingController _passwordController;

//   ImagePicker imagePicker = ImagePicker();
//   XFile? selectedImage;
//   bool _isLoading = true;
//   String _currentImageUrl =
//       "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180";

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _emailController = TextEditingController();
//     _phoneNoController = TextEditingController();
//     _loadUserData();
//   }

//   /// Load user data from Firestore
//   Future<void> _loadUserData() async {
//     try {
//       final userSnap = await widget.controller.getUserData();
//       final userData = userSnap.data() as Map<String, dynamic>? ?? {};

//       setState(() {
//         _nameController.text = userData['name'] ?? '';
//         _emailController.text = userData['email'] ?? '';
//         _phoneNoController.text = userData['phoneNo'] ?? '';
//         _joinDateController.text = userData['joinDate'] ?? '';
//         _passwordController.text = userData['password'] ?? '';

//         _currentImageUrl =
//             userData['profileImage'] ??
//             "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180";
//         _isLoading = false;
//       });
//     } catch (e) {
//       debugPrint("Error loading user data: $e");
//       setState(() => _isLoading = false);
//     }
//   }

//   /// Upload image and save profile data
//   Future<void> _saveProfile() async {
//     try {
//       String imageUrl = _currentImageUrl;

//       // If new image selected → upload it
//       if (selectedImage != null) {
//         final fileName =
//             "${DateTime.now().millisecondsSinceEpoch}_${selectedImage!.name}";
//         await widget.controller.uploadImage(
//           filename: fileName,
//           selectedFile: File(selectedImage!.path),
//         );
//         imageUrl = await widget.controller.downloadImage(fileName: fileName);
//       }

//       // Update Firestore
//       await widget.controller.addData(
//         data: {
//           'email': _emailController
//               .text, // email not editable but required for doc id
//           'name': _nameController.text,
//           'phoneNo': _phoneNoController.text,
//           'profileImage': imageUrl,
//           'password': _passwordController.text,
//           'joinDate': _joinDateController.text,
//         },
//       );

//       // Update local model
//       widget.controller.updateProfile(
//         ProfileModel(name: _nameController.text, profileImage: imageUrl),
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Profile updated successfully!")),
//       );

//       if (mounted) Navigator.pop(context, widget.controller.profile);
//     } catch (e) {
//       debugPrint("Error saving profile: $e");
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Failed to update profile")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "Edit Profile",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           TextButton(
//             onPressed: _saveProfile,
//             child: const Text("Save", style: TextStyle(color: Colors.blue)),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Profile Image
//             Center(
//               child: Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   CircleAvatar(
//                     radius: 55,
//                     backgroundImage: selectedImage != null
//                         ? FileImage(File(selectedImage!.path))
//                         : NetworkImage(_currentImageUrl) as ImageProvider,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       selectedImage = await imagePicker.pickImage(
//                         source: ImageSource.gallery,
//                       );
//                       if (selectedImage != null) {
//                         setState(() {});
//                       }
//                     },
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.blue,
//                         shape: BoxShape.circle,
//                       ),
//                       padding: const EdgeInsets.all(6),
//                       child: const Icon(
//                         Icons.edit,
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Name
//             _buildTextField("Name", _nameController),

//             // Email (non-editable)
//             _buildTextField("Email", _emailController, enabled: false),

//             // Phone
//             _buildTextField("Phone No", _phoneNoController),

//             const SizedBox(height: 20),

//             ElevatedButton.icon(
//               onPressed: _saveProfile,
//               icon: const Icon(Icons.check),
//               label: const Text("Save Changes"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 12,
//                   horizontal: 30,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     String label,
//     TextEditingController controller, {
//     bool enabled = true,
//     int maxLines = 1,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: TextField(
//         controller: controller,
//         enabled: enabled,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: const TextStyle(color: Colors.grey),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project/view/verification_business.dart';
import 'package:image_picker/image_picker.dart';
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
  late TextEditingController _emailController;
  late TextEditingController _phoneNoController;
  late TextEditingController _joinDateController;
  late TextEditingController _passwordController;

  final ImagePicker imagePicker = ImagePicker();
  XFile? selectedImage;
  bool _isLoading = true;
  String _currentImageUrl =
      "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180";

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNoController = TextEditingController();
    _joinDateController = TextEditingController();
    _passwordController = TextEditingController();
    _loadUserData();
  }

  /// Load user data
  Future<void> _loadUserData() async {
    try {
      final userSnap = await widget.controller.getUserData();
      final userData = userSnap.data() as Map<String, dynamic>? ?? {};

      setState(() {
        _nameController.text = userData['name'] ?? '';
        _emailController.text = userData['email'] ?? '';
        _phoneNoController.text = userData['phoneNo'] ?? '';
        _joinDateController.text = userData['joinDate'] ?? '';
        _passwordController.text = userData['password'] ?? '';

        _currentImageUrl =
            userData['profileImage'] ??
            "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180";
        _isLoading = false;
      });
    } catch (e) {
      debugPrint("Error loading user data: $e");
      setState(() => _isLoading = false);
    }
  }

  /// Save Profile
  Future<void> _saveProfile() async {
    try {
      String imageUrl = _currentImageUrl;

      // Upload new image if selected
      if (selectedImage != null) {
        final fileName =
            "${DateTime.now().millisecondsSinceEpoch}_${selectedImage!.name}";
        await widget.controller.uploadImage(
          filename: fileName,
          selectedFile: File(selectedImage!.path),
        );
        imageUrl = await widget.controller.downloadImage(fileName: fileName);
      }

      // Update Firestore data
      await widget.controller.addData(
        data: {
          'email': _emailController.text,
          'name': _nameController.text,
          'phoneNo': _phoneNoController.text,
          'profileImage': imageUrl,
          'password': _passwordController.text,
          'joinDate': _joinDateController.text,
        },
      );

      // Update local object
      widget.controller.updateProfile(
        ProfileModel(name: _nameController.text, profileImage: imageUrl),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully!")),
      );

      if (mounted) Navigator.pop(context, widget.controller.profile);
    } catch (e) {
      debugPrint("Error saving profile: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed to update profile")));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
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
            // Profile Image
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: selectedImage != null
                        ? FileImage(File(selectedImage!.path))
                        : NetworkImage(_currentImageUrl) as ImageProvider,
                  ),
                  GestureDetector(
                    onTap: () async {
                      selectedImage = await imagePicker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (selectedImage != null) setState(() {});
                    },
                    child: Container(
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
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _buildTextField("Name", _nameController),
            _buildTextField("Email", _emailController, enabled: false),
            _buildTextField("Phone No", _phoneNoController),
            _buildTextField("Join Date", _joinDateController),
            _buildTextField("Password", _passwordController),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: _saveProfile,
              child: Container(
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
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Save Changes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VerifyBusinessScreen()),
                );
              },
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Color(0xFF6A11CB),
                    Color(0xFF2575FC),
                  ], // purple to blue
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  "Verify your business",
                  style: TextStyle(
                    color:
                        Colors.white, // keep white so gradient applies cleanly
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    //  decoration: TextDecoration.underline,
                  ),
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
    bool enabled = true,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        enabled: enabled,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
