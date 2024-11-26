import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/cast.dart';
import 'package:aniki/widgets/images/news.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CastTileCard extends StatelessWidget {
  const CastTileCard({
    super.key,
    required this.cast,
  });
  final AnimeCast cast;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: SizedBox(
        height: size.width * 0.275,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageNews(
              imageUrl: cast.character.images.jpg.image_url!,
            ),
            Gap(size.width * 0.03),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  size.width * 0.02,
                  0,
                  size.width * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cast.character.name,
                      style: TextStyle(
                        fontSize: size.height * h2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(),
                    Text(
                      cast.role,
                      style: TextStyle(
                        fontSize: size.height * p1,
                      ),
                    ),
                    Text(
                      "voice: ${cast.voice_actors.isNotEmpty ? cast.voice_actors.first.person.name : "Unknown"}",
                      style: TextStyle(
                        fontSize: size.height * p1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
