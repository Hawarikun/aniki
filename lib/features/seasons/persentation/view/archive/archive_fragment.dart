import 'package:aniki/features/seasons/persentation/view/archive/archive_list.dart';
import 'package:aniki/features/seasons/persentation/view/archive/season.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedYearProvider = StateProvider.autoDispose<int?>((ref) => null);
final selectedSeasonProvider =
    StateProvider.autoDispose<String?>((ref) => null);

class ArchiveSeasonFragment extends ConsumerWidget {
  const ArchiveSeasonFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSeasons = ref.watch(selectedSeasonProvider);
    final selectedYear = ref.watch(selectedYearProvider);

    return selectedSeasons == null
        ? const ArchiveSeason()
        : SeasonAnime(
            year: selectedYear!,
            season: selectedSeasons,
          );
  }
}
