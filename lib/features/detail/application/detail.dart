import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
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
}
