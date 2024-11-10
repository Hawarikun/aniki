import 'package:flutter/material.dart';

class ImageNews extends StatelessWidget {
  const ImageNews({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.2,
      height: size.width * 0.275,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(6),
        color: Colors.grey.shade300,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fill,
          onError: (ctx, error) => const Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
