import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/dummys/List.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final ddValueProvider = StateProvider.autoDispose<String>((ref) => types.first);

class CustomDropdownButton extends ConsumerWidget {
  const CustomDropdownButton({
    super.key,
    required this.onChanged,
    required this.value,
  });

  final ValueChanged<String?>? onChanged;
  final String value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return DropdownButton<String>(
      value: value,
      isDense: true,
      isExpanded: true,
      underline: const SizedBox(),
      style: TextStyle(
        fontSize: size.height * h2,
        color: Colors.black,
      ),
      items: types.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: onChanged,
    );
  }
}
