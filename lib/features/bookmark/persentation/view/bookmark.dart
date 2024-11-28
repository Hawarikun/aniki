import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/data/sqflite/bookmark_database.dart';
import 'package:aniki/features/bookmark/persentation/controller/get.dart';
import 'package:aniki/widgets/cards/card.dart';
import 'package:aniki/widgets/shimmers/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

class ListBookmark extends ConsumerWidget {
  const ListBookmark({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final bookmarkData = ref.watch(getBookmarkControllerProvider);

    return bookmarkData.when(
      data: (data) {
        if (data.isEmpty) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              size.width * 0.03,
              size.height * 0.1,
              size.width * 0.03,
              0,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  child: SvgPicture.asset("assets/svg/empty.svg"),
                ),
                Gap(size.height * 0.02),
                Text(
                  "Your List is Empty",
                  style: TextStyle(
                    fontSize: size.height * h1,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Gap(size.height * 0.02),
                Text(
                  "It seems that you haven't added \nany anime to the list",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.height * h3,
                  ),
                ),
              ],
            ),
          );
        }

        return Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: size.height * 0.3,
            ),
            children: List.generate(
              data.length,
              (index) => AnimeIndexCard(
                mal_id: data[index].mal_id.toString(),
                title: data[index].title,
                score: data[index].score,
                image: data[index].image ?? "",
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Column(
        children: [
          Text(
            error.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              final db = BookmarkDatabase();
              db.deleteAll();
            },
            child: const Text("Clear"),
          ),
        ],
      ),
      loading: () => GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: size.height * 0.3,
        ),
        children: [
          ...List.generate(
            4,
            (index) => const AnimeIndexSCard(),
          ),
        ],
      ),
    );
  }
}
