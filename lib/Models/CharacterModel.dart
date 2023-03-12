import 'dart:ffi';
import 'dart:convert';


Character dataFromJson(String str) => Character.fromJson(json.decode(str));


class Character{
  Character({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  String name;
  String height;
  String mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  String gender;
  String homeworld;
  List<dynamic> films;
  List<dynamic> species;
  List<dynamic> vehicles;
  List<dynamic> starships;
  String created;
  String edited;
  String url;
  
  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name : json["name"],
        height : json["height"],
        mass : json["mass"],
        hairColor : json["hair_color"],
        skinColor : json["skin_color"],
        eyeColor : json["eye_color"],
        birthYear : json["birth_year"],
        gender : json["gender"],
        homeworld : json["homeworld"],
        films : json["films"],
        species : json["species"],
        vehicles : json["vehicles"],
        starships : json["starships"],
        created : json["created"],
        edited : json["edited"],
        url : json["url"],
      );

}