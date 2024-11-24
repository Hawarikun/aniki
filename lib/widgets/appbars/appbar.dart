import 'dart:ui';

import 'package:aniki/core/config/assets.dart';
import 'package:aniki/core/config/router.dart';
import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/pages/more_anime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

class CustomAppBar extends StatelessWidget {
  final Widget body;

  const CustomAppBar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          body,
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                size.width * 0.03,
                size.height * 0.01,
                size.width * 0.03,
                0,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      size.width * 0.03,
                      0,
                      size.width * 0.015,
                      0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.01), // Semi-transparent white
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.08,
                          child: SvgPicture.asset(appLogo),
                        ),
                        Row(
                          children: [
                            Consumer(
                              builder: (context, ref, _) {
                                return IconButton(
                                  onPressed: () {
                                    ref.read(typeAnimeProvider.notifier).state =
                                        "search";
                                    AppRoutes.goRouter
                                        .pushNamed(AppRoutes.search);
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomDetailAppBar extends StatelessWidget {
  const CustomDetailAppBar({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        body,
        SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              size.width * 0.03,
              size.height * 0,
              size.width * 0.05,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    AppRoutes.goRouter.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    size: size.height * 0.03,
                    color: Colors.white,
                  ),
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.cast_rounded,
                //     color: Colors.white,
                //   ),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CustomPageAppBar extends StatelessWidget {
  final Widget body;
  final String title;

  const CustomPageAppBar({super.key, required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                size.width * 0.03,
                0,
                size.width * 0.03,
                0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: size.width * 0.08,
                    child: SvgPicture.asset(appLogo),
                  ),
                  Gap(size.width * 0.05),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: size.height * h1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}
