import 'package:flutter/material.dart';
import 'package:flutter_project/controller/favorite_controller.dart';
import 'package:flutter_project/view/home_page.dart';
import 'package:flutter_project/widget/botton_nav_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animate_do/animate_do.dart'; // Add in pubspec.yaml: animate_do: ^3.0.2

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final Addtofavoriteclass addtofavoriteObj = Addtofavoriteclass();
  bool _isLoading = true;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> _favoriteDocs = [];

  @override
  void initState() {
    super.initState();
    fetchFavoriteData();
  }

  Future<void> fetchFavoriteData() async {
    setState(() => _isLoading = true);
    try {
      final snapshot = await addtofavoriteObj.getfavoritebuisnessData();
      setState(() {
        _favoriteDocs = snapshot.docs
            .cast<QueryDocumentSnapshot<Map<String, dynamic>>>();
        _isLoading = false;
      });
    } catch (e) {
      debugPrint(" Error fetching favorites: $e");
      setState(() => _isLoading = false);
    }
  }

  Future<void> deleteFavorite(String docId) async {
    await addtofavoriteObj.deleteFavoriteBusiness(docId);
    await fetchFavoriteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            );
          },
          icon: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            "Favorites",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _favoriteDocs.isEmpty
          ? const Center(
              child: Text(
                "No favorite shops yet ❤️",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              itemCount: _favoriteDocs.length,
              itemBuilder: (context, index) {
                final item = _favoriteDocs[index].data();
                final docId = _favoriteDocs[index].id;
                final imageUrl = item['imageURL'] ?? item['imageUrl'] ?? '';

                return FadeInUp(
                  duration: Duration(milliseconds: 350 + (index * 100)),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    padding: const EdgeInsets.all(1.5), // border width
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            child: Image.network(
                              imageUrl.isNotEmpty
                                  ? imageUrl
                                  : "https://cdn-icons-png.flaticon.com/512/679/679720.png",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    item["businessName"] ?? "Unknown Business",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item["discription"] ??
                                        "No description available",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Color.fromARGB(255, 243, 23, 23),
                              size: 26,
                            ),
                            onPressed: () async {
                              await deleteFavorite(docId);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.purpleAccent,
                                  content: const Text(
                                    "Removed from favorites ❤️",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

      bottomNavigationBar: const BottomNavWidget(currentIndex: 2),
    );
  }
}
