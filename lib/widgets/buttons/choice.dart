import 'package:aniki/core/domain/anime.dart';
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

class MultiChoice extends ConsumerWidget {
  const MultiChoice({
    required this.selectedItems,
    required this.items,
    required this.provider,
    super.key,
  });

  final List<int> selectedItems;
  final List<Genre> items;
  final StateProvider<List<int>> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Wrap(
      spacing: size.width * 0.02,
      children: List<Widget>.generate(items.length, (index) {
        final isSelected = selectedItems.contains(items[index].mal_id);

        return ChoiceChip(
          labelStyle: TextStyle(
            fontSize: size.height * 0.0175,
          ),
          showCheckmark: false,
          selectedColor: Theme.of(context).colorScheme.primary,
          label: Text(items[index].name),
          selected: isSelected,
          onSelected: (value) {
            final selectedList = List<int>.from(selectedItems);

            if (isSelected) {
              // If the genre is already selected, remove it from the list
              selectedList.remove(items[index].mal_id);
            } else {
              // If the genre is not selected, add it to the list
              selectedList.add(items[index].mal_id);
            }

            // Update the provider state with the new selected list of genre IDs
            ref.read(provider.notifier).state = selectedList;
          },
        );
      }).toList(),
    );
  }
}
