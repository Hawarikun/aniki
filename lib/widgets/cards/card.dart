import 'package:aniki/core/config/router.dart';
import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListAnimeIndexCard extends StatelessWidget {
  const ListAnimeIndexCard({super.key, required this.data});

  final List<Anime> data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final anime = data[index];
          return AnimeIndexCard(anime: anime);
        },
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
    return Padding(
      padding: EdgeInsets.fromLTRB(
        // size.width * 0.05,
        size.width * 0.025,
        0,
        size.width * 0.025,
        0,
      ),
      child: InkWell(
        onTap: () {
          AppRoutes.goRouter
              .pushNamed(AppRoutes.detail, extra: anime.id.toString());
        },
        child: Container(
          width: size.width * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.025),
            color: Colors.grey.shade300,
            image: DecorationImage(
              image: NetworkImage(anime.images),
              fit: BoxFit.fill,
              onError: (ctx, error) => const Center(child: Icon(Icons.error)),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(size.width * 0.0125),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    anime.score.toString(),
                    style: TextStyle(
                      fontSize: size.height * h2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


