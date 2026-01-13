import 'package:flutter/material.dart';
import '../model/post_model.dart';

class PostController extends ChangeNotifier {
  final List<PostModel> _posts = [
    PostModel(imageUrl: 'https://picsum.photos/400/400?random=1'),
    PostModel(imageUrl: 'https://picsum.photos/400/400?random=2'),
    PostModel(imageUrl: 'https://picsum.photos/400/400?random=3'),
  ];

  List<PostModel> get posts => _posts;

  void addPost(String imageUrl) {
    _posts.add(PostModel(imageUrl: imageUrl));
    notifyListeners(); // notifies the UI to rebuild
  }
}
