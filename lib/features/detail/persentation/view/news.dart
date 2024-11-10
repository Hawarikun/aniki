import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/extensions/date_time.dart';
import 'package:aniki/features/detail/persentation/controller/news.dart';
import 'package:aniki/widgets/button.dart';
import 'package:aniki/widgets/images/news.dart';
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
            0,
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
                    label: "See all",
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
              Gap(size.height * 0.02),
              ...List.generate(
                data.length > 3 ? 3 : data.length,
                (index) {
                  final news = data[index];
                  final imageUrl = news.images!.jpg!.imageUrl;

                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageNews(imageUrl: imageUrl ?? ""),
                          Gap(size.width * 0.03),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news.title ?? "N/A",
                                  style: TextStyle(
                                    fontSize: size.height * p1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gap(size.height * 0.005),
                                Text(
                                  "${news.date!.toMonthDayYear()} | ${news.comments ?? 0} Comments",
                                  style: TextStyle(
                                    fontSize: size.height * p1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(size.height * 0.02),
                    ],
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
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
