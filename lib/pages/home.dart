import 'package:aniki/pages/home_fragment.dart';
import 'package:aniki/pages/schedule_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
final pageControllerProvider =
    StateProvider.autoDispose<PageController>((ref) => PageController());

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final size = MediaQuery.of(context).size;
    final currentIndex = ref.watch(currentIndexProvider);
    final pageController = ref.watch(pageControllerProvider);

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeFragment(),
          ScheduleFragment(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          pageController.jumpToPage(index);
          ref.read(currentIndexProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
