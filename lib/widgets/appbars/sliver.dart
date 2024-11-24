import 'package:aniki/core/config/router.dart';
import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/random/controller/random.dart';
import 'package:aniki/widgets/appbars/appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSliverAppBar extends ConsumerWidget {
  final Widget body;

  const CustomSliverAppBar({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final animeData = ref.watch(randomControllerProv);

    return animeData.when(
      data: (data) {
        final genres = data.genres.map((genres) => genres.name).join(', ');

        return NestedScrollView(
          headerSliverBuilder: (context, isScrolled) => [
            SliverAppBar(
              // pinned: true,
              expandedHeight: size.height * 0.5,
              flexibleSpace: CustomAppBar(
                body: InkWell(
                  onTap: () {
                    AppRoutes.goRouter.pushNamed(AppRoutes.detail,
                        extra: data.mal_id.toString());
                  },
                  child: Stack(
                    children: [
                      FlexibleSpaceBar(
                        background: CachedNetworkImage(
                          imageUrl: data.images.webp!.large_image_url!,
                          fit: BoxFit.cover,
                          errorWidget: (ctx, error, _) =>
                              const Center(child: Icon(Icons.error)),
                        ),
                      ),
                      FlexibleSpaceBar(
                        background: Align(
                          alignment: Alignment.bottomLeft,
                          child: Stack(
                            children: [
                              Container(
                                height: size.height,
                                width: size.width,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(175, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                  size.width * 0.05,
                                  0,
                                  size.width * 0.25,
                                  size.height * 0.05,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.height * h1,
                                        color: Colors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      genres,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height * h2,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
          body: body,
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class CustomDetailSliverAppBar extends StatelessWidget {
  final double size;
  final String url;
  final Widget body;
  final Anime anime;

  const CustomDetailSliverAppBar({
    super.key,
    required this.size,
    required this.url,
    required this.body,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;

    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) => [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: size,
          flexibleSpace: CustomDetailAppBar(
            anime: anime,
            body: Stack(
              children: [
                FlexibleSpaceBar(
                  background: CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                    errorWidget: (ctx, error, _) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
                FlexibleSpaceBar(
                  background: Container(
                    height: size / 1.5,
                    width: sizes.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(100, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      body: body,
    );
  }
}
