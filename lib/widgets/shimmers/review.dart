import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/widgets/buttons/text_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class AnimeReviewS extends StatelessWidget {
  const AnimeReviewS({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Container(
            width: size.width * 0.3,
            height: size.height * h1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade300,
            ),
          ),
        ),
        Gap(size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: Container(
                width: size.width * 0.2,
                height: size.height * h1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: Container(
                width: size.width * 0.175,
                height: size.height * h1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ],
        ),
        Gap(size.height * 0.01),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Container(
            width: size.width,
            height: size.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade300,
            ),
          ),
        ),
        Gap(size.height * 0.025),
      ],
    );
  }
}

class ListAnimeReviewS extends StatelessWidget {
  const ListAnimeReviewS({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        size.width * 0.03,
        0,
        size.width * 0.03,
        0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reviews",
                style: TextStyle(
                  fontSize: size.height * h1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextButton(
                label: "More Reviews",
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          Gap(size.height * 0.02),
          ...List.generate(
            3,
            (index) => const AnimeReviewS(),
          ),
        ],
      ),
    );
  }
}
