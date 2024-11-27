import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/infinite_scroll/persentation/view/infinite_fragment.dart';
import 'package:aniki/widgets/cards/tile.dart';
import 'package:aniki/widgets/shimmers/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:svg_flutter/svg.dart';

class TileInfiniteScrollFragment extends ConsumerWidget {
  const TileInfiniteScrollFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final pagingController = ref.watch(pagingControllerProvider);


    return PagedListView<int, Anime>(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<Anime>(
        animateTransitions: true,
        // [transitionDuration] has a default value of 250 milliseconds.
        transitionDuration: const Duration(milliseconds: 1000),
        itemBuilder: (context, item, index) {
          return AnimeIndexTileCard(
            anime: item,
          );
        },
        firstPageProgressIndicatorBuilder: (context) =>
            const ListAnimeIndexSTileCard(),
        firstPageErrorIndicatorBuilder: (_) => Center(
          child: Text(
            pagingController.error.toString(),
          ),
        ),
        newPageErrorIndicatorBuilder: (_) => Center(
          child: Text(
            pagingController.error.toString(),
          ),
        ),
        noItemsFoundIndicatorBuilder: (_) => Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(size.height * 0.1),
              SizedBox(
                width: size.width * 0.7,
                child: SvgPicture.asset(
                  "assets/svg/404.svg",
                ),
              ),
              Gap(size.height * 0.01),
              Text(
                "Not Found",
                style: TextStyle(
                  fontSize: h1 * size.height,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Gap(size.height * 0.01),
              Text(
                "Sorry, the keyword you entered could not be found. Try to check again or search with other keywords.",
                style: TextStyle(
                  fontSize: h3 * size.height,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
