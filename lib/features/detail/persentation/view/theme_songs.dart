import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

final moreOpeningProvider = StateProvider.autoDispose<bool>((ref) => false);
final moreEndingProvider = StateProvider.autoDispose<bool>((ref) => false);

class ThemeSongsFragment extends ConsumerWidget {
  const ThemeSongsFragment({super.key, required this.theme});

  final ThemeSongs theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final moreOpening = ref.watch(moreOpeningProvider);
    final moreEnding = ref.watch(moreEndingProvider);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        size.width * 0.03,
        0,
        size.width * 0.03,
        size.height * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Opening Theme",
            style: TextStyle(
              fontSize: size.height * p1,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(size.height * 0.01),
          ...List.generate(
            theme.openings!.length < 3
                ? theme.openings!.length
                : moreOpening == true && theme.openings!.length > 3
                    ? theme.openings!.length
                    : 3,
            (index) => SongsContainer(
              titleSongs: theme.openings![index],
            ),
          ),
          Visibility(
            visible: theme.openings!.length > 3,
            child: Center(
              child: IconButton(
                icon: Icon(
                  moreOpening
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () =>
                    ref.read(moreOpeningProvider.notifier).state = !moreOpening,
              ),
            ),
          ),
          Gap(size.height * 0.02),
          Text(
            "Ending Theme",
            style: TextStyle(
              fontSize: size.height * p1,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(size.height * 0.01),
          ...List.generate(
            theme.endings!.length < 3
                ? theme.endings!.length
                : moreEnding == true && theme.endings!.length > 3
                    ? theme.endings!.length
                    : 3,
            (index) => SongsContainer(
              titleSongs: theme.endings![index],
            ),
          ),
          Visibility(
            visible: theme.endings!.length > 3,
            child: Center(
              child: IconButton(
                icon: Icon(
                  moreEnding
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () =>
                    ref.read(moreEndingProvider.notifier).state = !moreEnding,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongsContainer extends StatelessWidget {
  const SongsContainer({
    super.key,
    required this.titleSongs,
  });

  final String titleSongs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.005),
      child: Row(
        children: [
          Icon(
            Icons.play_circle_outline_rounded,
            size: size.height * 0.04,
          ),
          Gap(size.width * 0.02),
          Expanded(
            child: Text(
              titleSongs,
              style: TextStyle(fontSize: size.height * p1),
            ),
          ),
          Gap(size.width * 0.02),
          Container(
            padding: EdgeInsets.all(size.width * 0.01),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              "MV",
              style: TextStyle(
                fontSize: size.height * p1,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
