import 'package:hive/hive.dart';

class HiveBoxs{
  static var characterBox = Hive.box('characterBox');
  static var settingsBox = Hive.box('settingsBox');
}