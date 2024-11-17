import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/schedule/persentation/view/schedule.dart';
import 'package:aniki/widgets/appbars/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDayProv = StateProvider<String>((ref) => "Sundays");

class ScheduleFragment extends ConsumerWidget {
  const ScheduleFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final selectedDay = ref.watch(selectedDayProv);

    List<String> days = [
      "Sundays",
      "Mondays",
      "Tuesdays",
      "Wednesdays",
      "Thursdays",
      "Fridays",
      "Saturdays",
    ];

    return SafeArea(
      child: CustomPageAppBar(
        title: "Ongoing Schedule",
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            0,
            size.width * 0.03,
            0,
          ),
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
                          margin: EdgeInsets.only(bottom: size.height * 0.01),
                          decoration: BoxDecoration(
                            color: day == selectedDay
                                ? Theme.of(context).colorScheme.primary
                                : null,
                            border: day != selectedDay
                                ? Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 1,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(5),
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
      ),
    );
  }
}
