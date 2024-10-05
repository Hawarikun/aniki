import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/detail/persentation/controller/detail.dart';
import 'package:aniki/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';
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
              body: Padding(
                padding: EdgeInsets.fromLTRB(
                  size.width * 0.05,
                  0,
                  size.width * 0.05,
                  0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(size.height * 0.03),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              data.title,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_border_outlined),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star_half_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              SizedBox(width: size.width * 0.0175),
                              Text(
                                (data.score.toString().isEmpty)
                                    ? "-"
                                    : data.score.toString(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: size.height * p1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: size.width * 0.0175),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: size.height * 0.025,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            ],
                          ),
                          SizedBox(width: size.width * 0.03),
                          Text(
                            data.year.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: size.width * 0.03),
                          Container(
                            padding: EdgeInsets.all(size.width * 0.01),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              data.rating ?? "21+",
                              style: TextStyle(
                                fontSize: size.height * p1,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.03),
                          Container(
                            padding: EdgeInsets.all(size.width * 0.01),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              data.type,
                              style: TextStyle(
                                fontSize: size.height * p1,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(size.height * 0.02),
                      Text(
                        (genres.isNotEmpty) ? "Genre : $genres" : "-",
                        style: TextStyle(
                          fontSize: size.height * h2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(size.height * 0.02),
                      ReadMoreText(
                        data.synopsis!,
                        textAlign: TextAlign.justify,
                        trimLines: 5,
                        // colorClickableText: ColorApp.primary,
                        trimCollapsedText: 'Selengkapnya',
                        trimExpandedText: '\nSembunyikan',
                        moreStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        lessStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(size.height * 0.03),
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
                    ],
                  ),
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
