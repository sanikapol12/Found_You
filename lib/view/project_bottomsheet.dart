import 'package:flutter/material.dart';
import '../controller/project_controller.dart';

class AddProjectBottomSheet {
  static void show(BuildContext context) {
    final controller = ProjectController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController categoryController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 24,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add Project",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Image picker
                  GestureDetector(
                    onTap: () async {
                      await controller.pickImage();
                      setState(() {});
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                        image: controller.selectedImage != null
                            ? DecorationImage(
                                image: FileImage(controller.selectedImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: controller.selectedImage == null
                          ? const Center(
                              child: Icon(Icons.add_a_photo,
                                  size: 40, color: Colors.grey),
                            )
                          : null,
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(labelText: "Project Name (optional)"),
                  ),
                  // TextField(
                  //   controller: priceController,
                  //   decoration: const InputDecoration(labelText: "Price"),
                  //   keyboardType: TextInputType.number,
                  // ),
                  // TextField(
                  //   controller: categoryController,
                  //   decoration: const InputDecoration(labelText: "Category"),
                  // ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: "Description (optional)",
                    ),
                    maxLines: 2,
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      await controller.addProject(
                        name: nameController.text,
                        price: priceController.text,
                        category: categoryController.text,
                        description: descriptionController.text.isEmpty
                            ? null
                            : descriptionController.text,
                      );
                      Navigator.pop(context);
                    },
                    child: const Text("Add Project"),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
