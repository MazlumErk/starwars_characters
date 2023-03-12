import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_characters/Cubit/CharacterCubit.dart';
import 'package:star_wars_characters/HiveBoxs/HiveBoxs.dart';
import 'package:star_wars_characters/Styles/BoxDecorations.dart';
import 'package:star_wars_characters/Styles/TextStyles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterCubit>(
      create: (_) => CharacterCubit(
        characterDetails: HiveBoxs.characterBox.get(1),
      ),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 1, 5),
      body: BlocBuilder<CharacterCubit, Map?>(
        builder: (context, Map? characterState) {
          if (characterState != null) {
            return Center(
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecorations.characterCardBoxDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Name: ',style: TextStyles.characterCardTitleTextStyle,),
                          Text(characterState['name']),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Height: ', style: TextStyles.characterCardTitleTextStyle,),
                          Text(characterState['height']),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Mass: ', style: TextStyles.characterCardTitleTextStyle,),
                          Text(characterState['mass']),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Hair Color: ', style: TextStyles.characterCardTitleTextStyle,),
                          Text(characterState['hair_color']),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Skin Color: ', style: TextStyles.characterCardTitleTextStyle,),
                          Text(characterState['skin_color']),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Eye Color: ', style: TextStyles.characterCardTitleTextStyle,),
                          Text(characterState['eye_color']),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Birth Year: ', style: TextStyles.characterCardTitleTextStyle,),
                          Text(characterState['birth_year']),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Gender: ', style: TextStyles.characterCardTitleTextStyle,),
                          Text(characterState['gender']),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: HiveBoxs.settingsBox.get('pageNum') > 1
                                ? TextButton(
                                    onPressed: () {
                                      HiveBoxs.settingsBox.put(
                                          'pageNum',
                                          HiveBoxs.settingsBox.get('pageNum') -
                                              1);
                                      Navigator.of(context)
                                          .pushReplacementNamed('/loading');
                                    },
                                    child: Text('Back',
                                        style: TextStyles.characterCardButtonTextStyle))
                                : const SizedBox(),
                          ),
                          Expanded(
                              flex: 1,
                              child: Text(HiveBoxs.settingsBox
                                  .get('pageNum')
                                  .toString())),
                          Expanded(
                            flex: 3,
                            child: HiveBoxs.settingsBox.get('pageNum') < 83
                                ? TextButton(
                                    onPressed: () {
                                      HiveBoxs.settingsBox.put(
                                          'pageNum',
                                          HiveBoxs.settingsBox.get('pageNum') +
                                              1);
                                      Navigator.of(context)
                                          .pushReplacementNamed('/loading');
                                    },
                                    child: Text('Forward',
                                        style: TextStyles.characterCardButtonTextStyle))
                                : const SizedBox(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        context.read<CharacterCubit>().getCharacterDetails();
                      },
                      child: Text(
                        'Click To Get Character',
                        style: TextStyles.getCharacterButtonTextStyle,
                      )),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                        'if the character information could not be downloaded, check your internet',
                        style: TextStyles.getCharacterButtonTextStyle),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}