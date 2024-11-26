import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/extensions/date_time.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.score,
    required this.username,
    required this.reactions,
    required this.date,
    required this.review,
  });

  final int score;
  final String username;
  final int reactions;
  final DateTime date;
  final String review;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Gap(size.height * 0.0125),
        Row(
          children: [
            Icon(
              score > 8
                  ? Icons.star_rounded
                  : score > 3
                      ? Icons.star_half_rounded
                      : Icons.star_border_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: size.height * h1,
            ),
            Gap(size.width * 0.01),
            Text(
              "${score.toString()}/10 by $username",
              style: TextStyle(
                fontSize: size.height * p1,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Gap(size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$reactions helpfuls",
              style: TextStyle(fontSize: size.height * p1),
            ),
            Text(
              date.toMonthDayYear(),
              style: TextStyle(fontSize: size.height * p1),
            )
          ],
        ),
        Gap(size.height * 0.01),
        Text(
          review,
          maxLines: 2,
          style: TextStyle(
            fontSize: size.height * p1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Gap(size.height * 0.0125),
        Divider(
          thickness: 1,
          color: Colors.grey.shade500,
        )
      ],
    );
  }
}
