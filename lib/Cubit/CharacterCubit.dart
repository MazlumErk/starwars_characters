import 'package:bloc/bloc.dart';
import 'package:star_wars_characters/HiveBoxs/HiveBoxs.dart';


class CharacterCubit extends Cubit<Map?> {
  CharacterCubit({required this.characterDetails}) : super(null);
  final Map<dynamic, String> characterDetails;
  void getCharacterDetails(){
    return emit(characterDetails);
  }

  void getPageNum(){
    return emit(HiveBoxs.settingsBox.get('pageNum'));
  }
}
