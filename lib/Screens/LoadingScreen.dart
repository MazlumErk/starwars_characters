import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_characters/Styles/TextStyles.dart';

import '../HiveBoxs/HiveBoxs.dart';
import '../Models/CharacterModel.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Future getCharacterDetails() async {
    Map<dynamic, String> characterDetails = {};
    final url = Uri.http(
      'swapi.dev',
      '/api/people/${HiveBoxs.settingsBox.get("pageNum")}/',
      {'format': 'json'},
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = dataFromJson(response.body);
        if (mounted) {
          setState(() {});
          characterDetails['name'] = result.name;
          characterDetails['height'] = result.height;
          characterDetails['mass'] = result.mass;
          characterDetails['hair_color'] = result.hairColor;
          characterDetails['skin_color'] = result.skinColor;
          characterDetails['eye_color'] = result.eyeColor;
          characterDetails['birth_year'] = result.birthYear;
          characterDetails['gender'] = result.gender;

          HiveBoxs.characterBox.put(1, characterDetails);
          Navigator.of(context).pushReplacementNamed('/home');
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCharacterDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 1, 5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Colors.yellow,),
            const SizedBox(height: 30,),
            Text('Loading...', style: TextStyles.loadingTextStyle,)
          ],
        ),
      ),
    );
  }
}
