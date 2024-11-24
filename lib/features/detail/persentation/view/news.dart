import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/detail/persentation/controller/news.dart';
import 'package:aniki/widgets/buttons/text_button.dart';
import 'package:aniki/widgets/cards/news.dart';
import 'package:aniki/widgets/shimmers/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AnimeNews extends ConsumerWidget {
  const AnimeNews({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final newsData = ref.watch(animeNewsControllerProv(AnimeNewsParams(id)));

    return newsData.when(
      data: (data) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.03,
            0,
            size.width * 0.03,
            size.height * 0.03,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News",
                    style: TextStyle(
                      fontSize: size.height * h1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomTextButton(
                    label: "More Reviews",
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
              Gap(size.height * 0.02),
              ...List.generate(
                data.length > 3 ? 3 : data.length,
                (index) {
                  final news = data[index];
                  final imageUrl = news.images.jpg!.image_url;

                  return NewsCard(
                    imageUrl: imageUrl ?? "",
                    title: news.title ?? "N/A",
                    date: news.date!,
                    comments: news.comments ?? 0,
                  );
                },
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const ListImageSNews();
      },
    );
  }
}
