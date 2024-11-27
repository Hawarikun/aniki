import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/dummys/List.dart';
import 'package:aniki/features/infinite_scroll/persentation/view/infinite_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ddValueProvider = StateProvider.autoDispose<String>((ref) => types.first);

class CustomDropdownButton extends ConsumerWidget {
  const CustomDropdownButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final values = ref.watch(ddValueProvider);
    final pagingController = ref.watch(pagingControllerProvider);

    return DropdownButton<String>(
      value: values,
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
      onChanged: (value) {
        ref.read(ddValueProvider.notifier).state = value!;

        pagingController.refresh();
      },
    );
  }
}
