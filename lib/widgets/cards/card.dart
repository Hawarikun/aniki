// ignore_for_file: non_constant_identifier_names

import 'package:aniki/core/config/router.dart';
import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/widgets/images/content.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListAnimeIndexCard extends StatelessWidget {
  const ListAnimeIndexCard({super.key, required this.datas});

  final List<Anime> datas;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          datas.length,
          (index) {
            final data = datas[index];
            return AnimeIndexCard(
              mal_id: data.mal_id.toString(),
              title: data.title,
              score: data.score,
              image: data.images.webp!.large_image_url!,
            );
          },
        ),
      ),
    );
  }
}

class AnimeIndexCard extends StatelessWidget {
  const AnimeIndexCard({
    super.key,
    required this.mal_id,
    required this.title,
    required this.score,
    required this.image,
  });

  final String mal_id;
  final String title;
  final double? score;
  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Gap(size.width * 0.025),
        InkWell(
          onTap: () {
            AppRoutes.goRouter.pushNamed(AppRoutes.detail, extra: mal_id);
          },
          child: SizedBox(
            width: size.width * 0.275,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContent(
                  imageUrl: image,
                  ratingScore: score,
                ),
                Gap(size.height * 0.005),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: size.height * p1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
