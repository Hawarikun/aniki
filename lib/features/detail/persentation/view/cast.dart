import 'package:aniki/core/config/text_size.dart';
import 'package:aniki/features/detail/application/detail.dart';
import 'package:aniki/features/detail/persentation/controller/cast.dart';
import 'package:aniki/widgets/buttons/text_button.dart';
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
    final castData = ref.watch(
      animeCastControllerProv(
        AnimeCastParams(id: id),
      ),
    );
    return castData.when(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cast",
                      style: TextStyle(
                        fontSize: size.height * h1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomTextButton(
                      onTap: () {
                        DetailAnimeApplication().moreAnimeCast(
                          context: context,
                          casts: data,
                        );
                      },
                      label: "More Cast",
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
              Gap(size.height * 0.02),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    /// Character
                    Row(
                      children: [
                        ...List.generate(
                          data.length > 10 ? 10 : data.length,
                          (index) {
                            final char = data[index];
                            return Row(
                              children: [
                                Gap(size.width * 0.025),
                                CharacterImages(
                                  imageUrl: char.character.images.jpg.image_url,
                                  name: char.character.name,
                                ),
                              ],
                            );
                          },
                        ),
                        Gap(size.width * 0.025),
                      ],
                    ),
                    Gap(size.height * 0.01),

                    /// VA
                    Row(
                      children: [
                        ...List.generate(
                          data.length > 10 ? 10 : data.length,
                          (index) {
                            final char = data[index];
                            if (char.voice_actors.isNotEmpty) {
                              final va = char.voice_actors.first;

                              return Row(
                                children: [
                                  Gap(size.width * 0.025),
                                  CharacterImages(
                                    imageUrl: va.person.images.jpg.image_url,
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
                        Gap(size.width * 0.025),
                      ],
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
