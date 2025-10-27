import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  // Controllers for text fields
  TextEditingController nameController = TextEditingController(text: "Priya Sharma");
  TextEditingController emailController = TextEditingController(text: "priya@email.com");
  TextEditingController phoneController = TextEditingController(text: "+91 9876543210");
  TextEditingController dobController = TextEditingController(text: "01 Jan 2000");
  TextEditingController locationController = TextEditingController(text: "Pune, Maharashtra");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Information",style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: const Color.fromARGB(255, 89, 53, 106),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3'),
            ),
            const SizedBox(height: 16),

            // Editable Fields
            _buildTextField("Full Name", nameController, icon: Icons.person),
            _buildTextField("Email", emailController, icon: Icons.email),
            _buildTextField("Phone Number", phoneController, icon: Icons.phone),
            _buildTextField("Date of Birth", dobController, icon: Icons.cake),
            _buildTextField("Location", locationController, icon: Icons.location_on),

            const SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Here you can save changes to backend or local storage
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Information updated successfully!",style: TextStyle(
                    color: Colors.white
                  ),)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 89, 53, 106),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Save Changes",
                style: TextStyle(fontSize: 16,
                color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon, color: Colors.purple) : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}