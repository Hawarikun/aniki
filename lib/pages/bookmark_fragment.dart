import 'package:aniki/features/bookmark/persentation/view/bookmark.dart';
import 'package:aniki/widgets/appbars/appbar.dart';
import 'package:flutter/material.dart';

class BookmarkFragment extends StatelessWidget {
  const BookmarkFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPageAppBar(body: ListBookmark(), title: "My List");
  }
}
