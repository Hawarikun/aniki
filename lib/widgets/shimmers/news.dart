import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/widgets/buttons/text_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class ImageSNews extends StatelessWidget {
  const ImageSNews({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: Container(
                width: size.width * 0.2,
                height: size.width * 0.275,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            Gap(size.width * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: Container(
                      height: size.height * 0.04,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  Gap(size.height * 0.005),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: Container(
                      width: size.width * 0.4,
                      height: size.width * 0.02,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(size.height * 0.02),
      ],
    );
  }
}

class ListImageSNews extends StatelessWidget {
  const ListImageSNews({super.key});

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
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "News",
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
          (index) => const ImageSNews(),
        ),
      ]),
    );
  }
}
