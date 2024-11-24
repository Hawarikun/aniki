import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/extensions/string.dart';
import 'package:aniki/features/detail/application/detail.dart';
import 'package:aniki/widgets/buttons/text_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MoreInformation extends StatelessWidget {
  const MoreInformation({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final studios = anime.studios!.map((studios) => studios.name).join(', ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Information(title: "Source", content: anime.source ?? "N/A"),
                  Gap(size.height * 0.02),
                  Information(title: "Studio", content: studios),
                  Gap(size.height * 0.02),
                  Information(
                    title: "Episodes",
                    content:
                        "${anime.episodes ?? "N/A"}, ${anime.duration ?? "N/A"}",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Information(
                    title: "Season",
                    content:
                        "${anime.season != null ? anime.season!.capitalize() : "N/A"} ${anime.year ?? "N/A"}",
                  ),
                  Gap(size.height * 0.02),
                  Information(
                    title: "Aired",
                    content: anime.aired.string ?? "N/A",
                  ),
                  Gap(size.height * 0.02),
                  Information(
                    title: "Status",
                    content: anime.status ?? "N/A",
                  ),
                ],
              ),
            )
          ],
        ),
        Gap(size.height * 0.02),
        CustomTextButton(
          label: "More Information",
          color: Theme.of(context).colorScheme.primary,
          onTap: () {
            DetailAnimeApplication().moreInformation(
              context: context,
              anime: anime,
            );
          },
        )
      ],
    );
  }
}

class Information extends StatelessWidget {
  const Information({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: size.height * p1,
            color: Theme.of(context).colorScheme.primary,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        Text(
          content,
          style: TextStyle(fontSize: size.height * p1),
        ),
      ],
    );
  }
}
