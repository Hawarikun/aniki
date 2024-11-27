import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/core/dummys/enum.dart';
import 'package:aniki/features/infinite_scroll/persentation/view/infinite_fragment.dart';
import 'package:aniki/widgets/buttons/dropdown.dart';
import 'package:flutter/material.dart';

class ThisSeasonTabContent extends StatelessWidget {
  const ThisSeasonTabContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: CustomDropdownButton(),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Summer 2024",
                  style: TextStyle(fontSize: size.height * h2),
                ),
              ),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.filter,
                ),
              ),
            )
          ],
        ),
        const Expanded(
          child: InfiniteScrollFragment(
            typeCard: TypeCard.card,
          ),
        )
      ],
    );
  }
}
