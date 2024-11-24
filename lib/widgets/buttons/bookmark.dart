import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/bookmark/application/save_bookmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class BookmarkButton extends ConsumerWidget {
  const BookmarkButton({
    super.key,
    required this.anime,
    required this.isBookmarked,
  });

  final Anime anime;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        isBookmarked
            ? BookmarkApplication()
                .remove(context: context, mal_id: anime.mal_id)
            : BookmarkApplication().save(
                context: context,
                size: size,
                mal_id: anime.mal_id,
                title: anime.title,
                score: anime.score,
                image: anime.images.webp!.large_image_url!,
              );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.width * 0.015,
        ),
        decoration: BoxDecoration(
          color: isBookmarked ? Theme.of(context).colorScheme.primary : null,
          border: Border.all(
            width: 1,
            color: isBookmarked
                ? Colors.transparent
                : Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              color: isBookmarked
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary,
              size: size.height * h2,
            ),
            Gap(size.width * 0.015),
            Text(
              "My List",
              style: TextStyle(
                color: isBookmarked
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
                fontSize: size.height * p1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookmarkIconButton extends StatelessWidget {
  const BookmarkIconButton({
    super.key,
    required this.anime,
    required this.isBookmarked,
  });

  final Anime anime;
  final bool isBookmarked;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return IconButton(
      onPressed: () {
        isBookmarked
            ? BookmarkApplication()
                .remove(context: context, mal_id: anime.mal_id)
            : BookmarkApplication().save(
                context: context,
                size: size,
                mal_id: anime.mal_id,
                title: anime.title,
                score: anime.score,
                image: anime.images.webp!.large_image_url!,
              );
      },
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border_outlined,
        color:
            isBookmarked ? Theme.of(context).colorScheme.primary : Colors.white,
        size: size.height * 0.03,
      ),
    );
  }
}
