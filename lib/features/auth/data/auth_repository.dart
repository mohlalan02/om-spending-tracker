import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  static const String _tokenKey = 'access_token';

  final FlutterSecureStorage _storage;

  const AuthRepository({
    FlutterSecureStorage storage = const FlutterSecureStorage(),
  }) : _storage = storage;

  Future<void> login() async {
    await _storage.write(
      key: _tokenKey,
      value: 'mock_access_token_123',
    );
  }

  Future<void> logout() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: _tokenKey);
    return token != null;
  }
}