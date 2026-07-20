import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:motora/core/constants/storageKeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  final storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      // ignore: deprecated_member_use
      encryptedSharedPreferences: true, // Works without biometrics
    ),
  );

  Future saveToken(String accessToken, String refreshToken) async {
    await storage.write(key: "accessToken", value: accessToken);
    await storage.write(key: "refreshToken", value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await storage.read(key: "accessToken") ?? "";
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: "refreshToken") ?? "";
  }

  Future<void> clearTokens() async {
    await storage.delete(key: "accessToken");
    await storage.delete(key: "refreshToken");
  }

  static Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(StorageKeys.onboardingSeen, true);
  }

  static Future<bool> isOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(StorageKeys.onboardingSeen) ?? false;
  }

  /// يحفظ اختيار الـ theme كـ String ('light', 'dark', 'system')
  static Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageKeys.themeMode, mode.name);
  }

  /// يرجّع الـ ThemeMode المحفوظ، أو system لو مفيش حاجة متخزنة
  static Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(StorageKeys.themeMode);

    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}