import '../model/profile_model.dart';

class ProfileController {
  ProfileModel _profile = ProfileModel(
    name: "Sanika Construction",
    category: "Real Estate",
    website: "www.sanikapol.com",
    bio: "Building trust with every brick 🏗️",
    profileImage:
        "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180",
  );

  ProfileModel get profile => _profile;

  void updateProfile(ProfileModel updatedProfile) {
    _profile = updatedProfile;
  }
}
