import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({super.key});
  @override
 State createState() => _FavoritePageState();

}
class _FavoritePageState extends State{


  final List<Map<String, String>> favoriteItems = [
    {
      "title": "Stylish Chair",
      "subtitle": "Comfortable wooden chair for living room",
      "image":
          "https://th.bing.com/th/id/OIP.po3Sxdf4a2oZZzkSN9D3IQHaHa?w=171&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
      "price": "\$120",
    },
    {
      "title": "Modern Lamp",
      "subtitle": "Bright LED lamp for study or work desk",
      "image":
          "https://th.bing.com/th/id/OIP.wZ9TIXABLaRIq6TLMm3rSwHaHa?w=196&h=196&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
      "price": "\$45",
    },
    {
      "title": "Cozy Sofa",
      "subtitle": "Elegant 3-seater sofa for your living room",
      "image":
          "https://th.bing.com/th/id/OIF.vGfGAoqQex3jQxllFotmfA?w=206&h=206&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
      "price": "\$350",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
          child: const Text(
            "Favorites",
            style: TextStyle(
              color: Colors.white, // Required for ShaderMask
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return GestureDetector(
            onTap: () {
              // Navigate to product details page
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Product Image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      item["image"]!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Product Info
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["title"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item["subtitle"]!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item["price"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2575FC),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Favorite Action
                 IconButton(
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              favoriteItems.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Item removed from favorites"),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
