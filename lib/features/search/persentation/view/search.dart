import 'package:aniki/core/apis/search.dart';
import 'package:aniki/core/config/router.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/search/data/search.dart';
import 'package:aniki/features/search/persentation/view/Filter.dart';
import 'package:aniki/widgets/card.dart';
import 'package:aniki/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final searchControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
        (ref) => TextEditingController());

final resultCountProvider = StateProvider.autoDispose<int>((ref) => 0);

final pagingControllerProvider =
    StateProvider.autoDispose<PagingController<int, Anime>>((ref) {
  return PagingController(firstPageKey: 1);
});

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends ConsumerState<SearchPage> {
  @override
  void initState() {
    super.initState();
    final searchController = ref.read(searchControllerProvider);
    searchController.addListener(() {
      ref.read(pagingControllerProvider).refresh(); // Reset paginated data
      fetchPage(1); // Trigger new search
    });

    final pagingController = ref.read(pagingControllerProvider);
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  void refreshSearch() {
    final pagingController = ref.read(pagingControllerProvider);
    pagingController.refresh();
  }

  Future<void> fetchPage(int pageKey) async {
    final searchController = ref.read(searchControllerProvider);
    final gendres = ref.read(gendresProvider);
    final type = ref.read(typeProvider);
    final orderBy = ref.read(orderByProvider);
    final status = ref.read(statusProvider);

    try {
      final newItems = await SearchAnimeRepository(SearchApi()).index(
        page: pageKey.toString(),
        gendre: gendres,
        orderby: orderBy,
        query: searchController.text,
        status: status,
        type: type,
      );
      final isLastPage =
          newItems.length < 3; // You can adjust the page size here
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
    final searchController = ref.watch(searchControllerProvider);
    final resultCount = ref.watch(resultCountProvider);
    // final gendres = ref.watch(gendresProvider);
    // final type = ref.watch(typeProvider);
    // final orderBy = ref.watch(orderByProvider);
    // final status = ref.watch(statusProvider);
    // final searchRepo = ref.watch(searchControllerProv(SearchAnimeParams(
    //   query: searchController.text,
    //   gendre: gendres,
    //   orderby: orderBy,
    //   status: status,
    //   type: type,
    // )));

    final pagingController = ref.watch(pagingControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                size.width * 0.025,
                size.height * 0.02,
                size.width * 0.05,
                0,
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => AppRoutes.goRouter.pop(),
                      icon: const Icon(Icons.arrow_back)),
                  Expanded(
                    child: CustomTextFormField(
                      controller: searchController,
                      hintText: "Search",
                      inputType: TextInputType.text,
                      maxLines: 1,
                    ),
                  ),
                  // Gap(size.width * 0.025),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  size.width * 0.05,
                  size.height * 0,
                  size.width * 0.05,
                  0,
                ),
                child: Column(
                  children: [
                    Gap(size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Results : $resultCount"),
                        InkWell(
                          onTap: () {
                            Filter().filter(context: context, ref: ref);
                          },
                          child: Container(
                            padding: EdgeInsets.all(size.width * 0.025),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              Icons.filter_alt_outlined,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(size.height * 0.01),
                    Expanded(
                      child: Visibility(
                        // visible: searchController.text.isNotEmpty,
                        child: PagedListView<int, Anime>(
                          pagingController: pagingController,
                          builderDelegate: PagedChildBuilderDelegate<Anime>(
                              animateTransitions: true,
                              // [transitionDuration] has a default value of 250 milliseconds.
                              transitionDuration:
                                  const Duration(milliseconds: 1000),
                              itemBuilder: (context, item, index) {
                                Future(() {
                                  ref.read(resultCountProvider.notifier).state =
                                      index;
                                });

                                return AnimeIndexTileCard(
                                  anime: item,
                                );
                              }),
                        ),
                        // child: searchRepo.when(
                        //   data: (data) {
                        //     return ListView.builder(
                        //       itemCount: data.length,
                        //       itemBuilder: (context, index) {
                        //         final anime = data[index];
                        //         if (data.isNotEmpty) {
                        //           Future(
                        //             () {
                        //               ref
                        //                   .read(resultCountProvider.notifier)
                        //                   .state = data.length;
                        //             },
                        //           );
                        //         }

                        //         return AnimeIndexTileCard(
                        //           anime: anime,
                        //         );
                        //       },
                        //     );
                        //   },
                        //   error: (error, stackTrace) {
                        //     Future(
                        //       () {
                        //         ref.read(resultCountProvider.notifier).state =
                        //             0;
                        //       },
                        //     );
                        //     return Text(error.toString());
                        //   },
                        //   loading: () => const Center(
                        //     child: CircularProgressIndicator(),
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
