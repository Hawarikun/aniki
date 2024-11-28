import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/pages/bookmark_fragment.dart';
import 'package:aniki/pages/home_fragment.dart';
import 'package:aniki/pages/schedule_fragment.dart';
import 'package:aniki/pages/seasons_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
final pageControllerProvider =
    StateProvider.autoDispose<PageController>((ref) => PageController());

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final currentIndex = ref.watch(currentIndexProvider);
    final pageController = ref.watch(pageControllerProvider);

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeFragment(),
          ScheduleFragment(),
          SeasonsFragment(),
          BookmarkFragment(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: size.width * 0.06,
        showUnselectedLabels: true,
        useLegacyColorScheme: false,
        type: BottomNavigationBarType.fixed,

        /// selected color and font style
        selectedItemColor: Theme.of(context).colorScheme.primary,
        selectedLabelStyle: TextStyle(
          fontSize: size.height * h3,
          fontWeight: FontWeight.bold,
        ),

        /// unselected color and font style
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(
          fontSize: size.height * p1,
        ),
        currentIndex: currentIndex,
        onTap: (index) {
          pageController.jumpToPage(index);
          ref.read(currentIndexProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range_outlined),
            activeIcon: Icon(Icons.date_range_rounded),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_outlined),
            activeIcon: Icon(Icons.cloud),
            label: "Season",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            label: "My List",
          ),
        ],
      ),
    );
  }
}
