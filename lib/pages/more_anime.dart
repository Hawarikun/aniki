import 'package:aniki/core/apis/ongoing.dart';
import 'package:aniki/core/apis/top_anime.dart';
import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/ongoing/data/ongoing.dart';
import 'package:aniki/features/search/persentation/view/search.dart';
import 'package:aniki/features/top/data/top_anime.dart';
import 'package:aniki/widgets/cards/tile.dart';
import 'package:aniki/widgets/shimmers/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final typeAnimeProvider = StateProvider.autoDispose<String?>((ref) => null);

class MoreAnimePage extends ConsumerStatefulWidget {
  const MoreAnimePage({super.key});

  @override
  MoreAnimePageState createState() => MoreAnimePageState();
}

class MoreAnimePageState extends ConsumerState<MoreAnimePage> {
  @override
  void initState() {
    super.initState();

    final pagingController = ref.read(pagingControllerProvider);
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey) async {
    final type = ref.watch(typeAnimeProvider);

    List<Anime> newItems = [];
    try {
      if (type == 'ongoing') {
        newItems = await OngoingRepository(OngoingApi())
            .index(page: pageKey, limit: 25);
      } else {
        newItems = await TopAnimeRepository(TopAnimeApi())
            .index(page: pageKey, limit: 25);
      }

      final isLastPage = newItems.length < 24;
      final pagingController = ref.read(pagingControllerProvider);
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;

        Future.delayed(
          const Duration(seconds: 1),
          () {
            pagingController.appendPage(newItems, nextPageKey);
          },
        );
      }
    } catch (error) {
      final pagingController = ref.read(pagingControllerProvider);
      pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final type = ref.watch(typeAnimeProvider);
    final pagingController = ref.watch(pagingControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: type == 'ongoing'
            ? const Text("Ongoing Anime")
            : const Text("Top Anime"),
        titleTextStyle: TextStyle(
          fontSize: size.height * h1,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        surfaceTintColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          size.width * 0.03,
          size.height * 0.01,
          size.width * 0.03,
          0,
        ),
        child: PagedListView<int, Anime>(
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate<Anime>(
            animateTransitions: true,
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
          ),
        ),
      ),
    );
  }
}
