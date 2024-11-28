import 'package:aniki/core/config/router.dart';
import 'package:aniki/features/infinite_scroll/view/infinite_fragment.dart';
import 'package:aniki/features/search/persentation/view/filter.dart';
import 'package:aniki/widgets/forms/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

final searchControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
        (ref) => TextEditingController());

final resultCountProvider = StateProvider.autoDispose<int>((ref) => 0);

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final searchController = ref.watch(searchControllerProvider);
    final pagingController = ref.watch(pagingControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                size.width * 0.025,
                size.height * 0.02,
                size.width * 0.05,
                0,
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => AppRoutes.goRouter.pop(),
                      icon: const Icon(Icons.arrow_back)),
                  Expanded(
                    child: SearchForm(
                      controller: searchController,
                      hintText: "Search",
                      inputType: TextInputType.text,
                      maxLines: 1,
                      onEditingComplete: () {
                        pagingController.refresh();
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  Gap(size.width * 0.025),
                  InkWell(
                    onTap: () {
                      Filter().filter(context: context, ref: ref);
                    },
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.025),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  size.width * 0.05,
                  size.height * 0,
                  size.width * 0.05,
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Gap(size.height * 0.025),

                    // Gap(size.height * 0.01),
                    const Expanded(
                      child: Visibility(
                        child: MoreAnimeFragment(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
