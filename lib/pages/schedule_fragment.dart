import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/schedule/persentation/view/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

final selectedDayProv = StateProvider<String>((ref) => "sunday");

class ScheduleFragment extends ConsumerWidget {
  const ScheduleFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final selectedDay = ref.watch(selectedDayProv);

    List<String> days = [
      "sunday",
      "monday",
      "tuesday",
      "wednesday",
      "thursday",
      "friday",
      "saturday",
      "Unknown",
      "Other"
    ];

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          0,
          0,
          size.width * 0.03,
          0,
        ),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  "Broadcast Schedule",
                  style: TextStyle(
                      fontSize: size.height * h1, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Gap(size.height * 0.02),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DaySchedule(
                      day: selectedDay,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        days.length,
                        (index) {
                          final day = days[index];

                          return InkWell(
                            onTap: () =>
                                ref.read(selectedDayProv.notifier).state = day,
                            child: Container(
                              width: size.width,
                              padding: EdgeInsets.fromLTRB(
                                size.width * 0.02,
                                size.width * 0.02,
                                size.width * 0.02,
                                size.width * 0.02,
                              ),
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.01),
                              decoration: BoxDecoration(
                                color: day == selectedDay
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                                border: day != selectedDay
                                    ? Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 1,
                                      )
                                    : null,
                              ),
                              child: Text(
                                day,
                                style: TextStyle(
                                  fontSize: size.height * p1,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
