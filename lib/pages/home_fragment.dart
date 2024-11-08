import 'package:aniki/features/ongoing/persentation/view/ongoing.dart';
import 'package:aniki/features/top/persentation/view/top_anime.dart';
import 'package:aniki/widgets/appbars/sliver.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomSliverAppBar(
      imageUrl: "https://picsum.photos/200/300",
      title: "Whats",
      genres: "genres",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(size.height * 0.03),
            const OngoingList(),
            Gap(size.height * 0.03),
            const TopAnimeList(),
          ],
        ),
      ),
    );
  }
}
