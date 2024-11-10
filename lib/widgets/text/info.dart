import 'package:aniki/core/config/text_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MoreInformation extends StatelessWidget {
  const MoreInformation({
    super.key,
    required this.source,
    required this.studio,
    required this.season,
    required this.episodes,
  });

  final String source;
  final String studio;
  final String season;
  final String episodes;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Information(title: "Source", content: source),
              Gap(size.height * 0.02),
              Information(title: "Studio", content: studio),
              Gap(size.height * 0.02),
              Information(title: "Episodes", content: episodes),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Information(title: "Season", content: season),
              Gap(size.height * 0.02),
              const Information(title: "Aired", content: "Unknown"),
            ],
          ),
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
