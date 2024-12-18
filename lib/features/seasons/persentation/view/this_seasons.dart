import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/dummys/List.dart';
import 'package:aniki/features/seasons/persentation/controller/this.dart';
import 'package:aniki/widgets/buttons/dropdown.dart';
import 'package:aniki/widgets/cards/card.dart';
import 'package:aniki/widgets/shimmers/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:svg_flutter/svg.dart';

final thisSeasonPagingControllerProv =
    StateProvider.autoDispose<PagingController<int, Anime>>((ref) {
  return PagingController(firstPageKey: 1);
});

class ThisSeasonsFragment extends ConsumerStatefulWidget {
  const ThisSeasonsFragment({super.key});

  @override
  ThisSeasonsFragmentState createState() => ThisSeasonsFragmentState();
}

class ThisSeasonsFragmentState extends ConsumerState<ThisSeasonsFragment> {
  String ddValue = types.first;

  @override
  void initState() {
    final controller = ref.read(thisSeasonPagingControllerProv);
    controller.addPageRequestListener(
      (pageKey) => ref.read(
        thisSeasonAnimeConProv(
          ThisSeasonAnimeParams(pageKey: pageKey, type: ddValue),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = ref.watch(thisSeasonPagingControllerProv);
    // final ddValue = ref.read(ddValueProvider);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        size.width * 0.03,
        size.height * 0.01,
        size.width * 0.03,
        0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomDropdownButton(
                  value: ddValue,
                  onChanged: (value) {
                    // ref.read(ddValueProvider.notifier).state = value!;
                    setState(() {
                      ddValue = value!;
                    });

                    controller.refresh();
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    "seasonYear",
                    style: TextStyle(fontSize: size.height * h2),
                  ),
                ),
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.filter,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: PagedGridView<int, Anime>(
              pagingController: controller,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: size.height * 0.3,
              ),
              builderDelegate: PagedChildBuilderDelegate<Anime>(
                animateTransitions: true,
                // [transitionDuration] has a default value of 250 milliseconds.
                transitionDuration: const Duration(milliseconds: 1000),
                itemBuilder: (context, item, index) {
                  return AnimeIndexCard(
                    mal_id: item.mal_id.toString(),
                    title: item.title,
                    image: item.images.jpg!.large_image_url!,
                    score: item.score,
                  );
                },
                firstPageProgressIndicatorBuilder: (context) =>
                    const AnimeIndexSCard(),
                firstPageErrorIndicatorBuilder: (_) => Center(
                  child: Text(
                    controller.error.toString(),
                  ),
                ),
                newPageErrorIndicatorBuilder: (_) => Center(
                  child: Text(
                    controller.error.toString(),
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
            ),
          ),
        ],
      ),
    );
  }
}
