import 'package:aniki/core/config/router.dart';
import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/ongoing/persentation/controller/ongoing.dart';
import 'package:aniki/pages/more_anime.dart';
import 'package:aniki/widgets/buttons/text_button.dart';
import 'package:aniki/widgets/cards/card.dart';
import 'package:aniki/widgets/shimmers/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OngoingList extends ConsumerWidget {
  const OngoingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final animeList = ref.watch(
      ongoingControllerProv(
        const OngoingParams(
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
            size.width * 0.03,
            0,
            size.width * 0.03,
            size.height * 0.02,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Anime Ongoing",
                style: TextStyle(
                  fontSize: size.height * h1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextButton(
                onTap: () {
                  ref.read(typeAnimeProvider.notifier).state = "ongoing";

                  AppRoutes.goRouter.pushNamed(AppRoutes.more);
                },
                label: "See all",
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
        animeList.when(
          data: (datas) {
            return ListAnimeIndexCard(
              datas: datas,
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
