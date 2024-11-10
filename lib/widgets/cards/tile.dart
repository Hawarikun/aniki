import 'package:aniki/core/config/router.dart';
import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/widgets/buttons/bookmark.dart';
import 'package:aniki/widgets/images/content.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AnimeIndexTileCard extends StatelessWidget {
  const AnimeIndexTileCard({super.key, required this.anime});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final genres = anime.genres.map((genres) => genres.name).join(', ');

    return InkWell(
      onTap: () {
        AppRoutes.goRouter
            .pushNamed(AppRoutes.detail, extra: anime.id.toString());
      },
      child: Column(
        children: [
          SizedBox(
            height: size.width * 0.39,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContent(imageUrl: anime.images, ratingScore: anime.score),
                Gap(size.width * 0.025),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        anime.title,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: size.height * h2,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Gap(size.height * 0.01),
                      Text(
                        "${anime.year.toString()} | ${anime.season} | ${anime.type} ",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: size.height * p1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "Genre : $genres",
                        style: TextStyle(
                          fontSize: size.height * p1,
                        ),
                      ),
                      const BookmarkButton()
                    ],
                  ),
                )
              ],
            ),
          ),
          Gap(size.height * 0.01),
        ],
      ),
    );
  }
}
