import 'package:aniki/core/config/router.dart';
import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/bookmark/persentation/controller/check.dart';
import 'package:aniki/widgets/buttons/bookmark.dart';
import 'package:aniki/widgets/images/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
            .pushNamed(AppRoutes.detail, extra: anime.mal_id.toString());
      },
      child: Column(
        children: [
          SizedBox(
            height: size.width * 0.39,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContent(
                  imageUrl: anime.images.webp!.large_image_url ?? "",
                  ratingScore: anime.score,
                ),
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
                        "${anime.year == null ? "Unknown" : anime.year.toString()} | ${anime.season ?? "Unknown"} | ${anime.type} ",
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
                      Consumer(
                        builder: (context, ref, _) {
                          final isBookmarked = ref.watch(
                            checkBookmarkControllerProvider(
                              CheckBookmarkParams(mal_id: anime.mal_id),
                            ),
                          );

                          return isBookmarked.when(
                            data: (isBookmarkedData) {
                              return BookmarkButton(
                                isBookmarked: isBookmarkedData.isNotEmpty,
                                anime: anime,
                              );
                            },
                            loading: () => const CircularProgressIndicator(),
                            error: (error, stackTrace) => Text(
                              error.toString(),
                            ),
                          );
                        },
                      )
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
