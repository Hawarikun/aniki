import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/seasons/persentation/view/this_seasons.dart';
import 'package:aniki/widgets/appbars/appbar.dart';
import 'package:flutter/material.dart';

class SeasonsFragment extends StatelessWidget {
  const SeasonsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomPageAppBar(
      body: Center(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TabBar(
                labelPadding: EdgeInsets.zero,
                labelStyle: TextStyle(
                  fontSize: size.height * p1,
                ),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(
                    text: "Last",
                  ),
                  Tab(
                    text: "This Seasons",
                  ),
                  Tab(
                    text: "Next",
                  ),
                  Tab(
                    text: "Archive",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const Center(
                      child: Text("This Season"),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        size.width * 0.03,
                        0,
                        size.width * 0.03,
                        0,
                      ),
                      child: const ThisSeasonTabContent(),
                    ),
                    const Center(
                      child: Text("Next"),
                    ),
                    const Center(
                      child: Text("Archive"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      title: "Seasons",
    );
  }
}
