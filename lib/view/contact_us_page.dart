import 'package:flutter/material.dart';
import 'package:flutter_project/controller/profile_controller.dart';
import 'package:flutter_project/view/edit_profile.dart';
import 'package:flutter_project/view/home_page.dart';


class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});
  @override
  State createState() => _ProjectPageState();
}

class _ProjectPageState extends State {
   final ProfileController controller = ProfileController();
  final List<Map<String, dynamic>> businessList = [
    {
      "image": "https://img.icons8.com/fluency/96/shop.png",
      "name": "Sanika Collections",
      "owner": "Sanika Pol",
      "contact": "9876543210",
      "rating": 4,
    },
    {
      "image":
          "https://th.bing.com/th/id/OIP.MhkuI4R0Mu5MakY-UQMWLAHaHa?w=195&h=195&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
      "name": "Pol Traders",
      "owner": "Sahil Pol",
      "contact": "9123456780",
      "rating": 5,
    },
    {
      "image":
          "https://th.bing.com/th/id/OIP.MhkuI4R0Mu5MakY-UQMWLAHaHa?w=195&h=195&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
      "name": "pol Construction",
      "owner": "Aniket Pol",
      "contact": "9123456780",
      "rating": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE3F2FD), Color(0xFFB3E5FC), Color(0xFF81D4FA)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.teal,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Your Projects",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // const Icon(Icons.location_on, color: Colors.teal),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),

                  ElevatedButton(
                    onPressed: () async {
                        final updatedProfile = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                EditProfilePage(controller: controller),
                          ),
                        );

                        if (updatedProfile != null) {
                          controller.updateProfile(updatedProfile);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Profile updated successfully!"),
                            ),
                          );
                        }
                      },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(90, 35),
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Add Your Project",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: businessList.length,
                    itemBuilder: (context, index) {
                      final shop = businessList[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Shop Pic + Shop Name Row
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      shop['image']!,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      shop['name']!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text("Owner: ${shop['owner']}"),
                              Text("Contact: ${shop['contact']}"),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Message"),
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Contact"),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 8),
                              Row(
                                children: List.generate(5, (starIndex) {
                                  return Icon(
                                    starIndex < shop['rating']
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.teal,
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 40,
                  //       vertical: 14,
                  //     ),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(25),
                  //     ),
                  //   ),
                  //   child: const Text(
                  //     "Get Started",
                  //     style: TextStyle(fontSize: 16, color: Colors.white),
                  //   ),
                  // ),
                  // const SizedBox(height: 30),

                  // Popular Categories
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}