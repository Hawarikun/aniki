import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/seasons/persentation/view/this_seasons.dart';
import 'package:aniki/features/seasons/persentation/view/upcoming_seasons.dart';
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
          length: 3,
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
              const Expanded(
                child: TabBarView(
                  children: [
                    ThisSeasonsFragment(),
                    UpcomingSeasonsFragment(),
                    Center(
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
