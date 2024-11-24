// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:aniki/core/config/router.dart';
import 'package:aniki/core/domain/bookmark.dart';
import 'package:aniki/features/bookmark/persentation/controller/check.dart';
import 'package:aniki/features/bookmark/persentation/controller/remove.dart';
import 'package:aniki/features/bookmark/persentation/controller/save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkApplication {
  save({
    required BuildContext context,
    required Size size,
    required int mal_id,
    required String title,
    required double? score,
    required String image,
  }) {
    final bookmark = Bookmark(
      mal_id: mal_id,
      title: title,
      score: score,
      image: image,
    );

    showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, _) {
            final response = ref.watch(
              saveBookmarkControllerProv(
                SaveBookmarkParams(
                  bookmark: bookmark,
                ),
              ),
            );

            return response.when(
              data: (data) {
                Future.delayed(
                  const Duration(milliseconds: 300),
                  () {
                    ref.invalidate(checkBookmarkControllerProvider);

                    Future.delayed(
                      const Duration(milliseconds: 300),
                      () {
                        AppRoutes.goRouter.pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Saved to bookmark"),
                          ),
                        );
                      },
                    );
                  },
                );

                return const SizedBox.shrink();
              },
              error: (e, s) {
                Future.delayed(
                  const Duration(milliseconds: 300),
                  () {
                    debugPrint(e.toString());
                    AppRoutes.goRouter.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Failed to save to bookmark"),
                      ),
                    );
                  },
                );

                return const SizedBox.shrink();
              },
              loading: () {
                return const SizedBox.shrink();
              },
            );
          },
        );
      },
    );
  }

  remove({required BuildContext context, required int mal_id}) {
    showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, _) {
            final response = ref.watch(
              removeBookmarkControllerprov(
                RemoveBookmarkParams(
                  mal_id: mal_id,
                ),
              ),
            );

            return response.when(
              data: (data) {
                Future.delayed(
                  const Duration(milliseconds: 300),
                  () {
                    ref.invalidate(checkBookmarkControllerProvider);

                    Future.delayed(
                      const Duration(milliseconds: 300),
                      () {
                        AppRoutes.goRouter.pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Successfully removed from bookmark"),
                          ),
                        );
                      },
                    );
                  },
                );

                return const SizedBox.shrink();
              },
              error: (e, s) {
                Future.delayed(
                  const Duration(milliseconds: 300),
                  () {
                    debugPrint(e.toString());
                    AppRoutes.goRouter.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Failed to remove from bookmark"),
                      ),
                    );
                  },
                );

                return const SizedBox.shrink();
              },
              loading: () {
                return const SizedBox.shrink();
              },
            );
          },
        );
      },
    );
  }
}
