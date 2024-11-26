import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/domain/cast.dart';
import 'package:aniki/core/domain/news.dart';
import 'package:aniki/core/domain/review.dart';
import 'package:aniki/widgets/cards/cast_tile.dart';
import 'package:aniki/widgets/cards/news.dart';
import 'package:aniki/widgets/cards/review.dart';
import 'package:aniki/widgets/text/info.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailAnimeApplication {
  moreInformation({
    required BuildContext context,
    required Anime anime,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        final size = MediaQuery.of(context).size;
        final synonims = anime.title_synonyms!
            .map(
              (synonims) => synonims,
            )
            .join('; ');
        final producers = anime.producers
            .map(
              (producers) => producers.name,
            )
            .join('  •  ');
        final licencors = anime.licensors
            .map(
              (licencors) => licencors.name,
            )
            .join('  •  ');

        return Dialog(
          insetPadding: EdgeInsets.all(size.width * 0.03),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              size.width * 0.03,
              size.height * 0.02,
              size.width * 0.03,
              size.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  anime.background!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: size.height * p1,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Gap(size.height * 0.02),
                Information(
                  title: "Japanese",
                  content: anime.title_japanese!,
                ),
                Gap(size.height * 0.02),
                Visibility(
                  visible: synonims.isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.02),
                    child: Information(
                      title: "Synonims",
                      content: synonims,
                    ),
                  ),
                ),
                Information(
                  title: "Producers",
                  content: producers,
                ),
                Gap(size.height * 0.02),
                Information(
                  title: "Producers",
                  content: producers,
                ),
                Gap(size.height * 0.02),
                Visibility(
                  visible: licencors.isNotEmpty,
                  child: Information(
                    title: "Licencors",
                    content: licencors,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  moreAnimeCast(
      {required BuildContext context, required List<AnimeCast> casts}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        final size = MediaQuery.of(context).size;
        return Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.03,
            0,
            size.width * 0.03,
            0,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.4),
                child: Divider(
                  thickness: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Gap(size.height * 0.01),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      casts.length,
                      (index) {
                        return CastTileCard(
                          cast: casts[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  moreAnimeReview(
      {required BuildContext context, required List<Review> reviews}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        final size = MediaQuery.of(context).size;
        return Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.03,
            0,
            size.width * 0.03,
            0,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.4),
                child: Divider(
                  thickness: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Gap(size.height * 0.01),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      reviews.length,
                      (index) {
                        final data = reviews[index];
                        return ReviewCard(
                          score: data.score!,
                          username: data.user!.username!,
                          reactions: data.reactions!.overall!,
                          date: data.date!,
                          review: data.review!,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  moreAnimeNews({
    required BuildContext context,
    required List<News> news,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        final size = MediaQuery.of(context).size;
        return Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.03,
            0,
            size.width * 0.03,
            0,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.4),
                child: Divider(
                  thickness: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Gap(size.height * 0.01),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      news.length,
                      (index) {
                        final data = news[index];
                        return NewsCard(
                          imageUrl: data.images.jpg!.image_url ?? "",
                          title: data.title ?? "",
                          date: data.date!,
                          comments: data.comments ?? 0,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
