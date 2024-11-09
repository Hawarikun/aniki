import 'package:aniki/core/config/text_size.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Synopsis extends StatelessWidget {
  const Synopsis({super.key, required this.synopsis});
  final String synopsis;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ReadMoreText(
      synopsis,
      textAlign: TextAlign.justify,
      trimLines: 5,
      // colorClickableText: ColorApp.primary,
      trimCollapsedText: 'Selengkapnya',
      trimExpandedText: '\nSembunyikan',
      style: TextStyle(
        fontSize: size.height * p1,
      ),
      moreStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
        fontSize: size.height * p1,
      ),
      lessStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
        fontSize: size.height * p1,
      ),
    );
  }
}
