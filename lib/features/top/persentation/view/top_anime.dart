import 'package:aniki/features/top/persentation/controller/top_anime.dart';
import 'package:aniki/widgets/button.dart';
import 'package:aniki/widgets/cards/card.dart';
import 'package:aniki/widgets/shimmers/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopAnimeList extends ConsumerWidget {
  const TopAnimeList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final animeList = ref.watch(
      topAnimeControllerProv(
        const TopAnimeParams(
          page: 1,
          limit: 10,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.05,
            0,
            size.width * 0.05,
            size.height * 0.02,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Anime Teratas",
                style: TextStyle(
                  fontSize: size.height * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextButton(
                onTap: () {},
                label: "Semua",
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
        animeList.when(
          data: (data) {
            return ListAnimeIndexCard(
              data: data,
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
            ),
          ),
          loading: () => const ListAnimeIndexSCard(),
        )
      ],
    );
  }
}
