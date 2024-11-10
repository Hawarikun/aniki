import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/detail/persentation/controller/review.dart';
import 'package:aniki/widgets/button.dart';
import 'package:aniki/widgets/cards/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AnimeReview extends ConsumerWidget {
  const AnimeReview({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final reviewData = ref.watch(
      animeReviewControllerProv(
        AnimeReviewParams(id),
      ),
    );

    return reviewData.when(
      data: (data) {
        return Visibility(
          visible: data.isNotEmpty,
          child: Padding(
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
                      "Reviews",
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
                    final review = data[index];

                    return ReviewCard(
                      score: review.score!,
                      username: review.user!.username!,
                      reactions: review.reactions!.overall!,
                      date: review.date!,
                      review: review.review!,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
      error: (e, s) {
        return Center(
          child: Column(
            children: [
              Gap(size.height * 0.02),
              Text(e.toString()),
            ],
          ),
        );
      },
      loading: () {
        return Center(
          child: Column(
            children: [
              Gap(size.height * 0.02),
              const CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
