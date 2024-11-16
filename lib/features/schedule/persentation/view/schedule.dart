import 'package:aniki/features/schedule/persentation/controller/schedule.dart';
import 'package:aniki/widgets/cards/card.dart';
import 'package:aniki/widgets/shimmers/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DaySchedule extends ConsumerWidget {
  const DaySchedule({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final scheduleData =
        ref.watch(scheduleControllerProv(ScheduleParams(day: day)));

    return scheduleData.when(
      data: (data) {
        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: size.height * 0.3,
          ),
          children: [
            ...List.generate(
              data.length,
              (index) => AnimeIndexCard(
                anime: data[index],
              ),
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
