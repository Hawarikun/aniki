import 'package:aniki/core/config/text_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class AnimeIndexSCard extends StatelessWidget {
  const AnimeIndexSCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Gap(size.width * 0.025),
        SizedBox(
          width: size.width * 0.275,
          child: Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Container(
                  height: size.width * 0.39,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              Gap(size.height * 0.005),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Container(
                  height: size.height * h1,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ListAnimeIndexSCard extends StatelessWidget {
  const ListAnimeIndexSCard({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        children: List.generate(
          5,
          (index) => const AnimeIndexSCard(),
        ),
      ),
    );
  }
}
