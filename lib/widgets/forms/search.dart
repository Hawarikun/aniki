import 'package:aniki/core/config/text_size.dart';
import 'package:flutter/material.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    super.key,
    required this.controller,
    required this.inputType,
    required this.hintText,
    this.maxLines,
    this.onEditingComplete,
    // required this.callBack,
    // this.isObsecure,
    // this.iconButton,
    // this.radius,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final String hintText;
  final int? maxLines;
  // final String? Function(String?)? callBack;
  final VoidCallback? onEditingComplete;
  // final Widget? iconButton;
  // final bool? isObsecure;
  // final double? radius;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TextFormField(
      autocorrect: false,
      controller: controller,
      keyboardType: inputType,
      style: TextStyle(
        fontSize: size.height * h2,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        focusColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        isDense: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(182, 189, 202, 1),
        ),
        suffixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: size.width * 0.006,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(16),
        //   borderSide: BorderSide(
        //     width: size.width * 0.006,
        //     color: Colors.red,
        //   ),
        // ),
      ),
      onEditingComplete: onEditingComplete,
      autofocus: true,
      // obscureText: isObsecure ?? false,
      // validator: callBack,
    );
  }
}
