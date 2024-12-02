import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/infinite_scroll/controller/infinite_scroll.dart';
import 'package:aniki/features/search/persentation/view/filter.dart';
import 'package:aniki/features/search/persentation/view/search.dart';
import 'package:aniki/widgets/cards/tile.dart';
import 'package:aniki/widgets/shimmers/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:svg_flutter/svg.dart';

final pagingControllerProvider =
    StateProvider.autoDispose<PagingController<int, Anime>>((ref) {
  return PagingController(firstPageKey: 1);
});

class MoreAnimeFragment extends ConsumerStatefulWidget {
  const MoreAnimeFragment({
    super.key,
  });

  @override
  MoreAnimeFragmentState createState() => MoreAnimeFragmentState();
}

class MoreAnimeFragmentState extends ConsumerState<MoreAnimeFragment> {
  @override
  void initState() {
    super.initState();
    final pagingController = ref.read(pagingControllerProvider);
    pagingController.addPageRequestListener(
      (pageKey) {
        final searchController = ref.read(searchControllerProvider);
        final genres = ref.read(genresProvider);
        final type = ref.read(typeProvider);
        final orderBy = ref.read(orderByProvider);
        final status = ref.read(statusProvider);
        ref.watch(
          infiniteMoreControllerProv(
            InfiniteScrollParams(
              pageKey: pageKey,
              genres: genres,
              orderby: orderBy,
              query: searchController.text,
              status: status,
              type: type,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
