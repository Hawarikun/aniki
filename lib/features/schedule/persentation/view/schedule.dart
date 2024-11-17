import 'package:aniki/core/apis/ongoing.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/schedule/data/schedule.dart';
import 'package:aniki/features/schedule/persentation/controller/schedule.dart';
import 'package:aniki/widgets/cards/card.dart';
import 'package:aniki/widgets/shimmers/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scheduleProvider =
    StateNotifierProvider<ScheduleAnimeController, AsyncValue<List<Anime>>>(
        (ref) {
  return ScheduleAnimeController(ScheduleAnimeRepository(OngoingApi()),
      ScheduleParams(page: 1, limit: 10));
});

class DaySchedule extends ConsumerWidget {
  const DaySchedule({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final scheduleData = ref.watch(scheduleProvider);

    return scheduleData.when(
      data: (data) {
        Future.delayed(const Duration(milliseconds: 300), () {
          ref.watch(scheduleProvider.notifier).nextPage();
        });
        final broadcast = data.where((c) => c.broadcast.day == day).toList();
        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: size.height * 0.3,
          ),
          children: [
            ...List.generate(
              broadcast.length,
              (index) {
                return AnimeIndexCard(
                  mal_id: broadcast[index].mal_id.toString(),
                  title: broadcast[index].title,
                  score: broadcast[index].score,
                  image: broadcast[index].images.webp!.large_image_url!,
                );
              },
            ),
          ],
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(
          error.toString(),
        ),
      ),
      loading: () => GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: size.height * 0.3,
        ),
        children: [
          ...List.generate(
            3,
            (index) => const AnimeIndexSCard(),
          ),
        ],
      ),
    );
  }
}
