import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class AnimeIndexSTileCard extends StatelessWidget {
  const AnimeIndexSTileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.width * 0.39,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Container(
                  width: size.width * 0.275,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              Gap(size.width * 0.025),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.025),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                    Gap(size.height * 0.025),
                    Flexible(
                      flex: 1,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                        child: Container(
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Gap(size.height * 0.01),
      ],
    );
  }
}

class ListAnimeIndexSTileCard extends StatelessWidget {
  const ListAnimeIndexSTileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: List.generate(
          5,
          (index) => const AnimeIndexSTileCard(),
        ),
      ),
    );
  }
}
