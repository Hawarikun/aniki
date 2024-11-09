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
    final size = MediaQuery.of(context).size;

    // return SizedBox(
    //   height: size.width * 0.5,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: data.length,
    //     itemBuilder: (context, index) {
    //       final anime = data[index];
    //       return AnimeIndexCard(anime: anime);
    //     },
    //   ),
    // );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          datas.length,
          (index) {
            final anime = datas[index];
            return AnimeIndexCard(anime: anime);
          },
        ),
      ),
    );
  }
}

class AnimeIndexCard extends StatelessWidget {
  const AnimeIndexCard({super.key, required this.anime});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Gap(size.width * 0.025),
        InkWell(
          onTap: () {
            AppRoutes.goRouter
                .pushNamed(AppRoutes.detail, extra: anime.id.toString());
          },
          child: SizedBox(
            width: size.width * 0.275,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContent(
                  imageUrl: anime.images,
                  ratingScore: anime.score,
                ),
                Gap(size.height * 0.005),
                Text(
                  anime.title,
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
