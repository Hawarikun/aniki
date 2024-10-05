import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingleChoice extends ConsumerWidget {
  const SingleChoice({
    required this.selectedItem,
    required this.item,
    required this.provider,
    super.key,
  });
  final String selectedItem;
  final List<String> item;
  final StateProvider<String> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Wrap(
      spacing: size.width * 0.02,
      children: List<Widget>.generate(item.length, (index) {
        final isSelected = selectedItem == item[index];

        return ChoiceChip(
          labelStyle: TextStyle(
            fontSize: size.height * 0.0175,
          ),
          showCheckmark: false,
          selectedColor: Theme.of(context).colorScheme.primary,
          label: Text(item[index]),
          selected: selectedItem == "" ? item.first == item[index] : isSelected,
          onSelected: (value) {
            // Pastikan satu chip selalu dipilih
            if (!isSelected) {
              // Jika tidak dipilih, ubah status menjadi status yang dipilih
              if (item[index] == "all") {
                ref.read(provider.notifier).state = "";
              } else {
                ref.read(provider.notifier).state = item[index];
              }
            }
          },
        );
      }).toList(),
    );
  }
}
