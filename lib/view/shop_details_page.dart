import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controller/favorite_controller.dart';
import 'package:flutter_project/controller/project_controller.dart';
import 'package:flutter_project/view/home_page.dart';
import 'package:flutter_project/view/post_grid_page.dart';
import 'package:flutter_project/widget/botton_nav_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';

class ShopDetailsPage extends StatefulWidget {
  final Map<String, dynamic> shop;

  const ShopDetailsPage({super.key, required this.shop});

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  bool isFavorite = false;
  final Addtofavoriteclass addtofavoritecontrollerObj = Addtofavoriteclass();
  final TextEditingController reviewController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ProjectController controller = ProjectController();

  double _rating = 0.0;
  bool _showReviewField = false;
  bool _isServiceRequested = false;
  List<String> posts = [];
  bool loading = true;

  Future<void> _launchCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch $callUri';
    }
  }

  @override
  void initState() {
    super.initState();
    final email = widget.shop['userEmail'] ?? widget.shop['email'];
    if (email != null && email.isNotEmpty) {
      loadImages(email: email);
    } else {
      setState(() => loading = false);
    }
  }

  Future<void> loadImages({required String email}) async {
    try {
      posts = await controller.getProjectImageinbusiness(userId: email);
    } catch (e) {
      log("Error loading images: $e");
    } finally {
      setState(() => loading = false);
    }
  }

  Future<void> _submitReview() async {
    final reviewText = reviewController.text.trim();

    if (_rating == 0.0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select a rating ⭐")));
      return;
    }

    if (reviewText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please write a review before submitting"),
        ),
      );
      return;
    }

    try {
      await _firestore.collection('reviews').add({
        'shopId': widget.shop['id'] ?? widget.shop['businessName'],
        'shopName': widget.shop['businessName'] ?? 'Unknown Shop',
        'review': reviewText,
        'rating': _rating,
        'timestamp': DateTime.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Review submitted successfully ✅")),
      );

      setState(() {
        _rating = 0.0;
        _showReviewField = false;
      });
      reviewController.clear();
    } catch (e) {
      log("Error submitting review: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to submit review: $e")));
    }
  }

  // Future<void> loadImages({required String email}) async {
  //   posts = await controller.getProjectImageinbusiness(userId: email);
  //   setState(() => loading = false);
  // }

  @override
  Widget build(BuildContext context) {
    final shop = widget.shop;
    final imageUrl =
        shop['imageURL'] ??
        shop['imageUrl'] ??
        shop['photoUrl'] ??
        shop['businessImage'] ??
        '';

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
          ).createShader(bounds),
          child: Text(
            shop['businessName'] ?? "Shop Details",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.purple),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 200,
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: Icon(Icons.store, size: 100, color: Colors.grey),
                      ),
                    ),
            ),
            const SizedBox(height: 18),

            // Shop Name + Ratings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    shop['businessName'] ?? "No Name",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('reviews')
                      .where(
                        'shopId',
                        isEqualTo: shop['id'] ?? shop['businessName'],
                      )
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(strokeWidth: 2);
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Chip(
                        backgroundColor: Color(0xFFE8EAF6),
                        label: Text(
                          "No Ratings",
                          style: TextStyle(color: Colors.black54),
                        ),
                      );
                    }

                    final reviews = snapshot.data!.docs;
                    double total = 0;
                    for (var doc in reviews) {
                      total += (doc['rating'] ?? 0).toDouble();
                    }
                    final avg = total / reviews.length;

                    return Chip(
                      backgroundColor: Colors.purple.shade100,
                      avatar: const Icon(
                        Icons.star,
                        color: Colors.purple,
                        size: 18,
                      ),
                      label: Text(
                        "${avg.toStringAsFixed(1)} ★ (${reviews.length})",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),
            Text(
              "Category: ${shop['category'] ?? 'Unknown'}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            Text(
              "Subcategory: ${shop['subcategory2'] ?? 'Unknown'}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const Divider(height: 30),

            // Description
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              shop['discription'] ?? "No description available.",
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),

            const Divider(height: 30),

            // Contact Details
            const Text(
              "Contact Details & Address Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "📞 ${shop['phoneNo'] ?? 'N/A'}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "Business Address 🏢",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${shop['plotNo'] ?? ''}, ${shop['buildingName'] ?? ''}",
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            Text(
              "${shop['road'] ?? ''}, ${shop['area'] ?? ''}",
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            Text(
              "${shop['city'] ?? ''}, ${shop['state'] ?? ''} - ${shop['pincode'] ?? ''}",
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),

            const SizedBox(height: 18),

            // Action Buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 8), // optional padding at start
                  _actionButton(Icons.call, "Call", Colors.purple, () {
                    final phone = shop['phoneNo'] ?? "";
                    phone.isNotEmpty
                        ? _launchCall(phone)
                        : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Phone number not available 📞"),
                            ),
                          );
                  }),
                  const SizedBox(width: 10),
                  _actionButton(Icons.map, "Map", Colors.purple, () {}),
                  const SizedBox(width: 10),
                  _actionButton(
                    isFavorite ? Icons.bookmark : Icons.bookmark_border,
                    isFavorite ? "Favorited" : "Favorite",
                    isFavorite ? Colors.deepPurple : Colors.purple,
                    () async {
                      setState(() => isFavorite = !isFavorite);
                      if (isFavorite) {
                        await addtofavoritecontrollerObj.addtofavorite(
                          data: shop,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Added ${shop['businessName']} to favorites ❤️",
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Removed from favorites 💔"),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                  _actionButton(Icons.share, "Share", Colors.purple, () {
                    final name = shop['businessName'] ?? 'Shop';
                    final phone = shop['phoneNo'] ?? 'N/A';
                    final address = shop['address'] ?? 'N/A';
                    final message =
                        "Check out this shop!\n\n$name\n📍 $address\n📞 $phone";
                    Share.share(message);
                  }),
                  const SizedBox(width: 8), // optional padding at end
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Get Service Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isServiceRequested
                    ? null
                    : () {
                        setState(() => _isServiceRequested = true);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Request sent to ${shop['businessName']}",
                            ),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isServiceRequested
                      ? Colors.grey
                      : Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  "Get Services",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Rating Section
            const Text(
              "Rate this Shop",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                final starIndex = index + 1;
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    color: starIndex <= _rating ? Colors.amber : Colors.grey,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = starIndex.toDouble();
                      _showReviewField = true;
                    });
                  },
                );
              }),
            ),
            if (_showReviewField) ...[
              TextField(
                controller: reviewController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Share your experience...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _submitReview,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Submit Review",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],

            const SizedBox(height: 20),

            const Text(
              "Projects",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // const SizedBox(height: 10),
            const Divider(),
            StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('reviews')
                  .where(
                    'shopId',
                    isEqualTo: shop['id'] ?? shop['businessName'],
                  )
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      "",
                      // "No reviews yet. Be the first to review!",
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  );
                }

                final reviews = snapshot.data!.docs;
                return Column(
                  children: reviews.map((doc) {
                    final review = doc['review'];
                    final rating = (doc['rating'] ?? 0).toDouble();
                    final time = (doc['timestamp'] as Timestamp).toDate();

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Row(
                          children: List.generate(5, (i) {
                            return Icon(
                              Icons.star,
                              size: 16,
                              color: i < rating ? Colors.amber : Colors.grey,
                            );
                          }),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(review),
                            const SizedBox(height: 4),
                            Text(
                              time.toString().split('.')[0],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            loading
                ? const Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                    itemBuilder: (context, index) {
                      final imageUrl = posts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  PostDetailPage(imageUrl: imageUrl),
                            ),
                          );
                        },
                        child: Hero(
                          tag: imageUrl,
                          child: Image.network(imageUrl, fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavWidget(currentIndex: 0),
    );
  }

  Widget _actionButton(
    IconData icon,
    String label,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      icon: Icon(icon, color: color),
      label: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
