import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/detail/persentation/controller/character.dart';
import 'package:aniki/widgets/images/character.dart';
import 'package:aniki/widgets/shimmers/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CharactersInfo extends ConsumerWidget {
  const CharactersInfo({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final charData = ref.watch(
      animeCharControllerProv(
        AnimeCharParams(id: id),
      ),
    );
    return charData.when(
      data: (data) {
        return Visibility(
          visible: data.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Padding(
                padding: EdgeInsets.fromLTRB(
                  size.width * 0.03,
                  0,
                  size.width * 0.03,
                  0,
                ),
                child: Text(
                  "Characters & VA",
                  style: TextStyle(
                    fontSize: size.height * h1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gap(size.height * 0.02),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    /// Character
                    Row(
                      children: List.generate(
                        data.length,
                        (index) {
                          final char = data[index];
                          return Row(
                            children: [
                              Gap(size.width * 0.025),
                              CharacterImages(
                                imageUrl: char.character.images.jpg.imageUrl,
                                name: char.character.name,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Gap(size.height * 0.01),

                    /// VA
                    Row(
                      children: List.generate(
                        data.length,
                        (index) {
                          final char = data[index];
                          if (char.voiceActors.isNotEmpty) {
                            final va = char.voiceActors.first;

                            return Row(
                              children: [
                                Gap(size.width * 0.025),
                                CharacterImages(
                                  imageUrl: va.person.images.jpg.imageUrl,
                                  name: va.person.name,
                                ),
                              ],
                            );
                          } else {
                            return Row(
                              children: [
                                Gap(size.width * 0.025),
                                CharacterImages(
                                  imageUrl: '',
                                  name: char.character.name,
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
      error: (e, s) {
        return Center(
          child: Column(
            children: [
              Gap(size.height * 0.02),
              Text(e.toString()),
            ],
          ),
        );
      },
      loading: () {
        return const ListCharacterSIndex();
      },
    );
  }
}
