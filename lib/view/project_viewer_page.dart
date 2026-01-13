import 'package:flutter/material.dart';
import '../model/post_model.dart';

class FullScreenPostView extends StatefulWidget {
  final List<PostModel> posts;
  final int initialIndex;

  const FullScreenPostView({
    super.key,
    required this.posts,
    required this.initialIndex,
  });

  @override
  State<FullScreenPostView> createState() => _FullScreenPostViewState();
}

class _FullScreenPostViewState extends State<FullScreenPostView> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          final post = widget.posts[index];
          return Center(
            child: Hero(
              tag: post.imageUrl,
              child: Image.network(
                post.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
