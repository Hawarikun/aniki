import 'package:aniki/core/config/router.dart';
import 'package:aniki/core/dummys/genres.dart';
import 'package:aniki/features/search/persentation/controller/search.dart';
import 'package:aniki/features/search/persentation/view/search.dart';
import 'package:aniki/widgets/buttons/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

// final genresProvider = StateProvider<String>((ref) => "");
final typeProvider = StateProvider<String>((ref) => "");
final orderByProvider = StateProvider<String>((ref) => "");
final sortProvider = StateProvider<String>((ref) => "");
final statusProvider = StateProvider<String>((ref) => "");
final currentIndexProvider = StateProvider<int>((ref) => 0);
final genresProvider = StateProvider<List<int>>((ref) => []);

class Filter {
  filter({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final size = MediaQuery.of(context).size;
    // final currentIndex = ref.watch(currentIndexProvider);
    final searchController = ref.watch(searchControllerProvider);
    final type = ref.watch(typeProvider);
    final genres = ref.watch(genresProvider);
    final orderBy = ref.watch(orderByProvider);
    // final sort = ref.watch(sortProvider);
    final status = ref.watch(statusProvider);

    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return DefaultTabController(
          length: 2, // Jumlah tab (Gendre dan Type)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Tombol untuk menutup modal
              TextButton.icon(
                onPressed: () => AppRoutes.goRouter.pop(),
                icon: const Icon(Icons.close),
                label: const Text('Filter'),
              ),
              Gap(size.height * 0.01),

              // TabBar di sini
              TabBar(
                // indicator: BoxDecoration(
                //   color: Colors.grey.shade300,
                // ),
                dividerColor: Colors.transparent,
                onTap: (value) =>
                    ref.read(currentIndexProvider.notifier).state = value,
                tabs: const [
                  Tab(text: "General"),
                  Tab(text: "Genres"),
                ],
              ),

              // TabBarView untuk konten tab
              const Expanded(
                child: TabBarView(
                  children: [
                    FilterGeneral(),
                    FilterGenres(),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(
                  size.width * 0.05,
                  0,
                  size.width * 0.05,
                  size.height * 0.02,
                ),
                width: size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  onPressed: () {
                    ref.invalidate(
                      searchControllerProv(
                        SearchAnimeParams(
                          query: searchController.text,
                          gendre: genres.map((genres) => genres).join(','),
                          orderby: orderBy,
                          status: status,
                          type: type,
                        ),
                      ),
                    );

                    ref.read(pagingControllerProvider).refresh();

                    Future.delayed(const Duration(milliseconds: 500), () {
                      AppRoutes.goRouter.pop();
                    });
                  },
                  child: const Text(
                    "Apply",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FilterGeneral extends ConsumerWidget {
  const FilterGeneral({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    List<String> status = [
      "all",
      "airing",
      "complete",
      "upcoming",
    ];

    List<String> type = [
      "all",
      "tv",
      "movie",
      "ova",
      "special",
      "ona",
      "music",
    ];

    List<String> order = [
      "Relevance",
      "A-Z",
      "Z-A",
      "last updated",
      "last added",
      "popularity",
    ];

    final selectedStatus = ref.watch(statusProvider);
    final selectedType = ref.watch(typeProvider);
    final selectedOrder = ref.watch(orderByProvider);
    final sort = ref.watch(sortProvider);

    // print("selected : $selectedStatus");
    // print("selected : $selectedType");
    // print("selected : $selectedOrder");
    // print("selected : $sort");

    return Padding(
      padding: EdgeInsets.fromLTRB(
        size.width * 0.05,
        size.height * 0.02,
        size.width * 0.05,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Status",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Gap(size.height * 0.005),
          SingleChoice(
            selectedItem: selectedStatus,
            item: status,
            provider: statusProvider,
          ),
          Gap(size.height * 0.01),
          const Text(
            "Type",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Gap(size.height * 0.005),
          SingleChoice(
            selectedItem: selectedType,
            item: type,
            provider: typeProvider,
          ),
          Gap(size.height * 0.01),
          const Text(
            "Order by",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Gap(size.height * 0.005),
          Wrap(
            spacing: size.width * 0.02,
            children: List<Widget>.generate(order.length, (index) {
              final isSelected = selectedOrder == order[index];

              return ChoiceChip(
                labelStyle: TextStyle(
                  fontSize: size.height * 0.0175,
                ),
                showCheckmark: false,
                selectedColor: Theme.of(context).colorScheme.primary,
                label: Text(order[index]),
                selected: selectedOrder == ""
                    ? order.first == order[index]
                    : selectedOrder == "title" && sort == "asc"
                        ? order[1] == order[index]
                        : selectedOrder == "title" && sort == "desc"
                            ? order[2] == order[index]
                            : selectedOrder == "episodes"
                                ? order[3] == order[index]
                                : selectedOrder == "start_date"
                                    ? order[4] == order[index]
                                    : isSelected,
                onSelected: (value) {
                  // Pastikan satu chip selalu dipilih
                  if (!isSelected) {
                    // Jika tidak dipilih, ubah status menjadi status yang dipilih
                    if (order[index] == "Relevance") {
                      ref.read(orderByProvider.notifier).state = "";
                      ref.read(sortProvider.notifier).state = "";
                    } else if (order[index] == "A-Z") {
                      ref.read(orderByProvider.notifier).state = "title";
                      ref.read(sortProvider.notifier).state = "asc";
                    } else if (order[index] == "Z-A") {
                      ref.read(orderByProvider.notifier).state = "title";
                      ref.read(sortProvider.notifier).state = "desc";
                    } else if (order[index] == "last updated") {
                      ref.read(orderByProvider.notifier).state = "episodes";
                      ref.read(sortProvider.notifier).state = "asc";
                    } else if (order[index] == "last added") {
                      ref.read(orderByProvider.notifier).state = "start_date";
                      ref.read(sortProvider.notifier).state = "asc";
                    } else {
                      ref.read(orderByProvider.notifier).state = order[index];
                      ref.read(sortProvider.notifier).state = "asc";
                    }
                  }
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class FilterGenres extends ConsumerWidget {
  const FilterGenres({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final selectedGenres = ref.watch(genresProvider);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        size.width * 0.05,
        size.height * 0.02,
        size.width * 0.05,
        0,
      ),
      child: MultiChoice(
        selectedItems: selectedGenres,
        items: genres,
        provider: genresProvider,
      ),
      // child: Wrap(
      //   spacing: size.width * 0.025,
      //   runSpacing: size.width * 0.025,
      //   children: genres
      //       .map((genre) => FilterChip(
      //             label: Text(genre.name),
      //             selectedColor: Theme.of(context).colorScheme.primary,
      //             selected: selectedGenres == genre.malId,
      //             onSelected: (value) {
      //               ref.read(genreProvider.notifier).state = genre.malId;
      //             },
      //       ))
      //       .toList(),
      // ),
    );
  }
}
