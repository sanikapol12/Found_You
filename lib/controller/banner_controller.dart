import '../model/banner_model.dart';

class BannerController {
  List<BannerItem> getAllBanners() {
    return [
      BannerItem(
        title: "Exclusive Offers Just for You!",
        imageUrl:
            "https://th.bing.com/th/id/OIP.wYUpSzHA0G3Lc_rhqsCH8gHaEK?w=304&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        // gradientColors: [Color(0xFF2196F3), Color(0xFF9C27B0)],
      ),
      BannerItem(
        title: "Summer Travel Deals ☀️",
        imageUrl:
            "https://th.bing.com/th/id/OIP.IDs9vlq93vkuJr8Rb4KYyQHaDM?w=300&h=151&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        //  gradientColors: [Colors.orange, Colors.red],
      ),
      BannerItem(
        title: "Winter Fashion Sale 🧥",
        imageUrl:
            "https://th.bing.com/th/id/OIP.CX383daJtprJ-NrTwLtvjQHaEJ?w=317&h=186&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        // gradientColors: [Colors.teal, Colors.green],
      ),
      BannerItem(
        title: "Top Electronics Offers ⚡",
        imageUrl:
            "https://th.bing.com/th/id/OIP.GrPzeIHbZOXWK8k9rTMOWAHaD8?w=280&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        // gradientColors: [Colors.indigo, Colors.purple],
      ),
    ];
  }
}
