import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/seasons/persentation/controller/archive.dart';
import 'package:aniki/features/seasons/persentation/view/archive/archive_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ArchiveSeason extends ConsumerWidget {
  const ArchiveSeason({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final data = ref.watch(archiveSeasonsControllerProv);

    return data.when(
      data: (data) {
        return SingleChildScrollView(
          child: Column(
            children: List.generate(
              data.length,
              (index) {
                final year = data[index].year;
                final seasons = data[index].seasons;

                return Column(
                  children: [
                    Text(
                      year.toString(),
                      style: TextStyle(
                        fontSize: size.height * h2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        seasons!.length,
                        (index) {
                          final season = seasons[index];

                          return GestureDetector(
                            onTap: () {
                              ref.read(selectedYearProvider.notifier).state =
                                  year;
                              ref.read(selectedSeasonProvider.notifier).state =
                                  season;
                            },
                            child: Container(
                              padding: EdgeInsets.all(size.width * 0.01),
                              margin: EdgeInsets.fromLTRB(
                                size.width * 0.015,
                                0,
                                size.width * 0.015,
                                0,
                              ),
                              width: size.width * 0.21,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                season,
                                style: TextStyle(fontSize: size.height * p1),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Gap(size.height * 0.02),
                  ],
                );
              },
            ),
          ),
        );
      },
      error: (error, s) => Text(
        error.toString(),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
