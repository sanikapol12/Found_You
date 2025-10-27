import '../model/shop_model.dart';

class ShopController {
  // In real app, this could be fetched from API/Firestore
  List<Shop> getAllShops() {
    return [
      Shop(
        name: "Gourmet Cafe",
        imageUrl: "https://picsum.photos/200/150?random=1",
        category: "Cafe",
        rating: 4.5,
        description: "Cozy place with amazing coffee and pastries.",
        phone: "+91 9876543210",
        location: "MG Road, Pune",
        distance: 1.2,
      ),
      Shop(
        name: "TechMart",
        imageUrl: "https://picsum.photos/200/150?random=2",
        category: "Electronics",
        rating: 4.2,
        description: "Best deals on electronics and gadgets.",
        phone: "+91 9876501234",
        location: "FC Road, Pune",
        distance: 2.5,
      ),
      Shop(
        name: "Fashion Hub",
        imageUrl: "https://picsum.photos/200/150?random=3",
        category: "Clothing",
        rating: 4.8,
        description: "Trendy fashion apparel for all ages.",
        phone: "+91 9876549870",
        location: "Kothrud, Pune",
        distance: 3.0,
      ),
    ];
  }
}
