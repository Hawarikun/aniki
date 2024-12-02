import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/dummys/List.dart';
import 'package:aniki/core/extensions/string.dart';
import 'package:aniki/features/seasons/persentation/controller/season.dart';
import 'package:aniki/features/seasons/persentation/view/archive/archive_fragment.dart';
import 'package:aniki/widgets/buttons/dropdown.dart';
import 'package:aniki/widgets/cards/card.dart';
import 'package:aniki/widgets/shimmers/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:svg_flutter/svg.dart';

class SeasonAnime extends ConsumerStatefulWidget {
  const SeasonAnime({
    super.key,
    required this.year,
    required this.season,
  });

  final int year;
  final String season;

  @override
  SeasonAnimeState createState() => SeasonAnimeState();
}

class SeasonAnimeState extends ConsumerState<SeasonAnime> {
  late PagingController<int, Anime> pagingController;
  String ddValue = types.first;

  @override
  void initState() {
    pagingController = PagingController(firstPageKey: 1);

    pagingController.addPageRequestListener(
      (pageKey) {
        ref.watch(
          seasonAnimeControllerProv(
            SeasonParams(
              controller: pagingController,
              year: widget.year,
              seasons: widget.season,
              page: pageKey,
              type: ddValue,
            ),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   titleSpacing: 0,
      //   automaticallyImplyLeading: false,
      //   // leading: ,
      //   backgroundColor: Colors.black,
      //   surfaceTintColor: Colors.white,
      //   elevation: 0,
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(size.height * 0.01),
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      //       child: Row(
      //         children: [
      //           Expanded(
      //             child: CustomDropdownButton(
      //               value: ddValue,
      //               onChanged: (value) {
      //                 setState(
      //                   () {
      //                     ddValue = value!;
      //                   },
      //                 );
      //               },
      //             ),
      //           ),
      //           Expanded(
      //             flex: 3,
      //             child: Center(
      //               child: Text(
      //                 "${widget.season.capitalize()} ${widget.year}",
      //                 style: TextStyle(
      //                   fontSize: size.height * h2,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //           ),
      //           const Expanded(
      //             child: Align(
      //               alignment: Alignment.centerRight,
      //               child: Icon(
      //                 Icons.filter,
      //               ),
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          PagedGridView<int, Anime>(
            padding: EdgeInsets.fromLTRB(
              0,
              size.height * 0.125,
              0,
              0,
            ),
            pagingController: pagingController,
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
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: size.height * 0.0275,
                  ),
                  onPressed: () {
                    ref.read(selectedSeasonProvider.notifier).state = null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    size.width * 0.03,
                    0,
                    size.width * 0.03,
                    size.height * 0.01,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomDropdownButton(
                          value: ddValue,
                          onChanged: (value) {
                            setState(
                              () {
                                ddValue = value!;
                              },
                            );

                            pagingController.refresh();
                          },
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            "${widget.season.capitalize()} ${widget.year}",
                            style: TextStyle(
                              fontSize: size.height * h2,
                              fontWeight: FontWeight.bold,
                            ),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
