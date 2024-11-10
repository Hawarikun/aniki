import 'package:aniki/core/config/text_size.dart';
import 'package:flutter/material.dart';

class BorderText extends StatelessWidget {
  const BorderText({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(size.width * 0.01),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        content,
        style: TextStyle(
          fontSize: size.height * w4,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
