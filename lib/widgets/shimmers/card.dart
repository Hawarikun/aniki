import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AnimeIndexSCard extends StatelessWidget {
  const AnimeIndexSCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        // size.width * 0.05,
        size.width * 0.025,
        0,
        size.width * 0.025,
        0,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: Container(
          width: size.width * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.025),
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}

class ListAnimeIndexSCard extends StatelessWidget {
  const ListAnimeIndexSCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return const AnimeIndexSCard();
        },
      ),
    );
  }
}


