import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/infinite_scroll/persentation/view/infinite_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final typeAnimeProvider = StateProvider<String>((ref) => "search");

class MoreAnimePage extends ConsumerWidget {
  const MoreAnimePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final type = ref.watch(typeAnimeProvider);

    return Scaffold(
      appBar: AppBar(
        title: type == 'ongoing'
            ? const Text("Ongoing Anime")
            : const Text("Top Anime"),
        titleTextStyle: TextStyle(
          fontSize: size.height * h1,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        surfaceTintColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.03,
            size.height * 0.01,
            size.width * 0.03,
            0,
          ),
          child: const InfiniteScrollFragment()),
    );
  }
}
