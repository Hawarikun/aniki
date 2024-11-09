import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/detail/persentation/controller/detail.dart';
import 'package:aniki/features/detail/persentation/view/character.dart';
import 'package:aniki/widgets/appbars/sliver.dart';
import 'package:aniki/widgets/text/synopsis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final youtubeControllerProvider =
    StateProvider.autoDispose<YoutubePlayerController?>((ref) => null);

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final detailAnime = ref.watch(
      animeDetailControllerProv(
        AnimeDetailParams(
          animeId: id,
        ),
      ),
    );

    final youtubeController = ref.watch(youtubeControllerProvider);

    return Scaffold(
      body: detailAnime.when(
        data: (data) {
          final genres = data.genres.map((genres) => genres.name).join(', ');

          // Inisialisasi controller hanya jika youtubeId tidak null dan belum diinisialisasi
          if (data.trailer!.youtubeId != null) {
            Future(() {
              ref.read(youtubeControllerProvider.notifier).state =
                  YoutubePlayerController(
                initialVideoId: data.trailer!.youtubeId!,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              );
            });
          }

          if (youtubeController == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: youtubeController,
              showVideoProgressIndicator: true,
            ),
            builder: (contex, player) => CustomDetailSliverAppBar(
              size: size.height * 0.5,
              url: data.images,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        size.width * 0.03,
                        0,
                        size.width * 0.03,
                        0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(size.height * 0.015),

                          /// Title
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  data.title,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: size.height * h1,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark_border_outlined,
                                  size: size.height * 0.03,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  size: size.height * 0.03,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              /// Score
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_half_rounded,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  Gap(size.width * 0.0175),
                                  Text(
                                    (data.score.toString().isEmpty)
                                        ? "-"
                                        : data.score.toString(),
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: size.height * p1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Gap(size.width * 0.0175),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: size.height * 0.025,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                ],
                              ),
                              Gap(size.width * 0.03),

                              /// Year
                              Text(
                                data.year.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * p1,
                                ),
                              ),
                              Gap(size.width * 0.03),

                              /// Rating
                              Container(
                                padding: EdgeInsets.all(size.width * 0.01),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  data.rating ?? "21+",
                                  style: TextStyle(
                                    fontSize: size.height * w4,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                              Gap(size.width * 0.03),

                              /// Type
                              Container(
                                padding: EdgeInsets.all(size.width * 0.01),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  data.type,
                                  style: TextStyle(
                                    fontSize: size.height * w4,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(size.height * 0.02),

                          /// Genres
                          Text(
                            (genres.isNotEmpty) ? "Genre : $genres" : "-",
                            style: TextStyle(
                              fontSize: size.height * p1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gap(size.height * 0.02),

                          /// Synopsis
                          Synopsis(synopsis: data.synopsis ?? "-"),
                          Gap(size.height * 0.03),

                          /// Trailer
                          Visibility(
                            visible: data.trailer!.youtubeId != null,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Thailer",
                                  style: TextStyle(
                                    fontSize: size.height * h1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gap(size.height * 0.01),
                                player,
                                Gap(size.height * 0.01),
                              ],
                            ),
                          ),
                          Gap(size.height * 0.02),
                        ],
                      ),
                    ),

                    /// Characters
                    CharactersInfo(id: id),
                  ],
                ),
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
