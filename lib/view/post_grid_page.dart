// import 'package:flutter/material.dart';
// import '../controller/post_controller.dart';
// import '../model/post_model.dart';
// import 'project_viewer_page.dart';

// class PostGridPage extends StatelessWidget {
//   final PostController controller;

//   const PostGridPage({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, _) {
//         final List<PostModel> posts = controller.posts;

//         return GridView.builder(
//           padding: EdgeInsets.zero,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: posts.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             crossAxisSpacing: 2,
//             mainAxisSpacing: 2,
//           ),
//           itemBuilder: (context, index) {
//             final post = posts[index];

//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) =>
//                         FullScreenPostView(posts: posts, initialIndex: index),
//                   ),
//                 );
//               },
//               child: Hero(
//                 tag: post.imageUrl,
//                 child: Image.network(
//                   post.imageUrl,
//                   fit: BoxFit.cover,
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) return child;
//                     return const Center(
//                       child: CircularProgressIndicator(strokeWidth: 2),
//                     );
//                   },
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }




import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  final String imageUrl;

  const PostDetailPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          child: Hero(
            tag: imageUrl, // smooth transition
            child: Image.network(imageUrl, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
