import 'package:aniki/core/config/text_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.width * 0.015,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
            size: size.height * h2,
          ),
          Gap(size.width * 0.015),
          Text(
            "My List",
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * p1,
            ),
          ),
        ],
      ),
    );
  }
}
