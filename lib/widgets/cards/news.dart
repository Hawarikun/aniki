import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/extensions/date_time.dart';
import 'package:aniki/widgets/images/news.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.imageUrl, required this.title, required this.date, required this.comments,});

  final String imageUrl;
  final String title;
  final DateTime date;
  final int comments;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageNews(imageUrl: imageUrl),
            Gap(size.width * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: size.height * p1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(size.height * 0.005),
                  Text(
                    "${date.toMonthDayYear()} | $comments Comments",
                    style: TextStyle(
                      fontSize: size.height * p1,
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
