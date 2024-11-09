import 'package:aniki/core/config/text_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class CharacterSIndex extends StatelessWidget {
  const CharacterSIndex({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        width: size.width * 0.275,
        height: size.width * 0.39,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}

class ListCharacterSIndex extends StatelessWidget {
  const ListCharacterSIndex({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.03,
            0,
            size.width * 0.03,
            0,
          ),
          child: Text(
            "Characters & VA",
            style: TextStyle(
              fontSize: size.height * h1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Gap(size.height * 0.02),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) => Row(
                    children: [
                      Gap(size.width * 0.025),
                      const CharacterSIndex(),
                    ],
                  ),
                ),
              ),
              Gap(size.height * 0.01),
              Row(
                children: List.generate(
                  5,
                  (index) => Row(
                    children: [
                      Gap(size.width * 0.025),
                      const CharacterSIndex(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
