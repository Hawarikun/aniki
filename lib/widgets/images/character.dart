import 'package:aniki/core/config/text_size.dart';
import 'package:flutter/material.dart';

class CharacterImages extends StatelessWidget {
  const CharacterImages({
    super.key,
    this.imageUrl,
    required this.name,
  });

  final String? imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: size.width * 0.275,
          height: size.width * 0.39,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            image: DecorationImage(
              image: NetworkImage(imageUrl ?? ""),
              fit: BoxFit.fill,
              onError: (ctx, error) => const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        Container(
          width: size.width * 0.275,
          height: size.width * 0.39,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(175, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.015),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: size.height * p1,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                ),
                maxLines: 2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
