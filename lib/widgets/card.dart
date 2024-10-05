import 'package:aniki/core/config/router.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                      fontSize: size.height * 0.0175,
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

class AnimeIndexTileCard extends StatelessWidget {
  const AnimeIndexTileCard({super.key, required this.anime});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final genres = anime.genres.map((genres) => genres.name).join(', ');

    return Padding(
      padding: EdgeInsets.fromLTRB(
        // size.width * 0.05,
        size.width * 0,
        0,
        size.width * 0,
        size.height * 0.025,
      ),
      child: InkWell(
        onTap: () {
          AppRoutes.goRouter
              .pushNamed(AppRoutes.detail, extra: anime.id.toString());
        },
        child: SizedBox(
          height: size.height * 0.275,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.025),
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                    image: NetworkImage(anime.images),
                    fit: BoxFit.fill,
                    onError: (ctx, error) =>
                        const Center(child: Icon(Icons.error)),
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
                            fontSize: size.height * 0.0175,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(size.width * 0.025),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      anime.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Gap(size.height * 0.01),
                    Text(
                      "${anime.year.toString()} | ${anime.type}",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: size.height * 0.0175,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text("Genre : $genres"),
                    const AddListButton()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimeIndexSCard extends StatelessWidget {
  const AnimeIndexSCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.025, 0, 0),
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.025),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
