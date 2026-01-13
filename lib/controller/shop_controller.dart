// import '../model/shop_model.dart';

// class ShopController {
//   // In real app, this could be fetched from API/Firestore
//   List<Shop> getAllShops() {
//     return [
//       Shop(
//         name: "Gourmet Cafe",
//         imageUrl: "https://picsum.photos/200/150?random=1",
//         category: "Cafe",
//         rating: 4.5,
//         description: "Cozy place with amazing coffee and pastries.",
//         phone: "+91 9876543210",
//         location: "MG Road, Pune",
//         distance: 1.2,
//       ),
//       Shop(
//         name: "TechMart",
//         imageUrl: "https://picsum.photos/200/150?random=2",
//         category: "Electronics",
//         rating: 4.2,
//         description: "Best deals on electronics and gadgets.",
//         phone: "+91 9876501234",
//         location: "FC Road, Pune",
//         distance: 2.5,
//       ),
//       Shop(
//         name: "Fashion Hub",
//         imageUrl: "https://picsum.photos/200/150?random=3",
//         category: "Clothing",
//         rating: 4.8,
//         description: "Trendy fashion apparel for all ages.",
//         phone: "+91 9876549870",
//         location: "Kothrud, Pune",
//         distance: 3.0,
//       ),
//     ];
//   }
// }


import '../model/shop_model.dart';

class ShopController {
  // For now, mock data (later you can fetch from Firebase)
  List<Shop> getAllShops() {
    return [
      Shop(
        name: "Brick & Bolt",
        rating: 4.8,
        location: "Pune, Maharashtra",
        imageUrl:
            "https://th.bing.com/th/id/OIP.bltvb0BuobkFoFXuebH4IgHaEK?w=290&h=180",
        description:
            "Brick & Bolt is a trusted name in construction and renovation. We provide top-quality service for residential and commercial projects.",
        reviews: [
          {"user": "Amit Pawar", "comment": "Excellent service!", "stars": 5},
          {"user": "Sneha Kulkarni", "comment": "On time delivery.", "stars": 4},
          {"user": "Ravi Deshmukh", "comment": "Very professional team.", "stars": 5},
        ],
      ),
      Shop(
        name: "Tathe Groups",
        rating: 4.5,
        location: "Mumbai, Maharashtra",
        imageUrl:
            "https://th.bing.com/th/id/OIP.Mk4Sp1rCubJVW5hmd8bS5AHaE8?w=244&h=180",
        description:
            "We handle everything from home maintenance to new constructions. Our goal is to bring your vision to life with perfection.",
        reviews: [
          {"user": "Rohit Kale", "comment": "Very responsive.", "stars": 4},
          {"user": "Prachi Patil", "comment": "Loved the finishing work!", "stars": 5},
        ],
      ),
    ];
  }
}
