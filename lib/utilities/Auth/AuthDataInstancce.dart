import 'package:shared_preferences/shared_preferences.dart';

class SaveAndRead {
  void save() async {
    final preferencesSave = await SharedPreferences.getInstance();
    final keySave = "loginSave";
    final value = true;

    preferencesSave.setBool(keySave, value);
  }

  Future<bool> read() async {
    final preferencesGet = await SharedPreferences.getInstance();
    final keySave = "loginSave";
    final value = preferencesGet.getBool(keySave) ?? false;
    
    return value;
  }
}