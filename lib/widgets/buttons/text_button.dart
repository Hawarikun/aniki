import 'package:aniki/core/config/text_size.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.label,
      this.onTap,
      required this.color,
      this.textSize});

  final String label;
  final void Function()? onTap;
  final Color color;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.width * 0.01,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: textSize ?? size.height * h2,
          ),
        ),
      ),
    );
  }
}
