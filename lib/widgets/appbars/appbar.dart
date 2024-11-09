import 'package:aniki/core/config/assets.dart';
import 'package:aniki/core/config/router.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomAppBar extends StatelessWidget {
  final Widget body;

  const CustomAppBar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          body,
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                size.width * 0.05,
                size.height * 0,
                size.width * 0.05,
                0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.08,
                    child: SvgPicture.asset(appLogo),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          AppRoutes.goRouter.pushNamed(AppRoutes.search);
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomDetailAppBar extends StatelessWidget {
  const CustomDetailAppBar({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        body,
        SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              size.width * 0.03,
              size.height * 0,
              size.width * 0.05,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    AppRoutes.goRouter.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cast_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
