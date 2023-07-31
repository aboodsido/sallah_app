import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> writeSecureToken(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readSecureToken(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteSecureToken(String key) async {
    // Same here: delete is a type of void, so it shouldn't return anything
    await storage.delete(key: key);
  }
}
