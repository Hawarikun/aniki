import 'package:aniki/widgets/appbars/appbar.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  // final double size;
  final String imageUrl;
  final String title;
  final String genres;
  final Widget body;
  // final model.Anime anime;

  const CustomSliverAppBar({
    super.key,
    // required this.size,
    required this.imageUrl,
    required this.title,
    required this.genres,
    required this.body,
    // required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) => [
        SliverAppBar(
          pinned: true,
          expandedHeight: size.height * 0.5,
          flexibleSpace: CustomAppBar(
            body: InkWell(
              onTap: () {
                // AppRoutes.goRouter.pushNamed(AppRoutes.detail, extra: anime);
              },
              child: Stack(
                children: [
                  FlexibleSpaceBar(
                    background: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, error, _) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                  FlexibleSpaceBar(
                    background: Align(
                      alignment: Alignment.bottomLeft,
                      child: Stack(children: [
                        Container(
                          height: size.height * 0.4 / 1.5,
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
                            size.height * 0.12,
                            size.width * 0.25,
                            0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.04,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                genres,
                                style: const TextStyle(color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ]),
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
  }
}

class CustomDetailSliverAppBar extends StatelessWidget {
  final double size;
  final String url;
  final Widget body;

  const CustomDetailSliverAppBar(
      {super.key, required this.size, required this.url, required this.body});

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;

    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) => [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: size,
          flexibleSpace: CustomDetailAppBar(
            body: Stack(
              children: [
                FlexibleSpaceBar(
                  background: Image.network(
                    url,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, error, _) =>
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
