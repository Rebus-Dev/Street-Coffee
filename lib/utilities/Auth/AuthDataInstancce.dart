import 'package:shared_preferences/shared_preferences.dart';

class SaveAndRead {
  void save(String phone) async {
    final preferencesSave = await SharedPreferences.getInstance();
    final keySave = "loginSave";

    preferencesSave.setString(keySave, phone);
  }

  Future<String> read() async {
    final preferencesGet = await SharedPreferences.getInstance();
    final keySave = "loginSave";
    final value = preferencesGet.getString(keySave) ?? '';
    
    return value;
  }
}