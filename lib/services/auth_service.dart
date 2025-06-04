import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static bool hasToken = false;
  static String token = "";

  static Future<void> init() async {
    final db = await SharedPreferences.getInstance();
    token = db.getString("token") ?? "";
    hasToken = token.isNotEmpty;
  }

  static Future<void> login(String value) async {
    final db = await SharedPreferences.getInstance();
    await db.setString("token", value);
    token = value;
    hasToken = true;
  }

  static Future<void> logout() async {
    final db = await SharedPreferences.getInstance();
    await db.remove("token");
    token = "";
    hasToken = false;
  }
}