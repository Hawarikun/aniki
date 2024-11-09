import 'package:aniki/core/config/text_size.dart';
import 'package:flutter/material.dart';

class ImageContent extends StatelessWidget {
  const ImageContent({
    super.key,
    required this.imageUrl,
    this.ratingScore,
  });
  final String imageUrl;
  final double? ratingScore;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.275,
      height: size.width * 0.39,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey.shade300,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fill,
          onError: (ctx, error) => const Center(child: Icon(Icons.error)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.015),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(size.width * 0.01),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                ratingScore != null ? ratingScore.toString() : "N/A",
                style: TextStyle(
                  fontSize: size.height * w4,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
