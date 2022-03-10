import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_store/models/user_login.dart';

class UserDataPreferences {
  static final UserDataPreferences _instance = UserDataPreferences._();
  late SharedPreferences _sharedPreferences;

  UserDataPreferences._();

  factory UserDataPreferences() => _instance;

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> savePreferences({required UserLogin user}) async {
    await _sharedPreferences.setInt('id', user.id);
    await _sharedPreferences.setString('fullName', user.fullName);
    await _sharedPreferences.setString('email', user.email);
    await _sharedPreferences.setString('gender', user.gender);
    await _sharedPreferences.setString('fcmToken', user.fcmToken ?? '');
    await _sharedPreferences.setString('token', user.token);
    await _sharedPreferences.setString('refreshToken', user.refreshToken);
    await _sharedPreferences.setBool('isActive', user.isActive);

    await _sharedPreferences.setBool('logged_in', true);
  }

  UserLogin getCurrentUserData() {
    return UserLogin.user(
        id: _sharedPreferences.getInt('id')!,
       fullName: _sharedPreferences.getString('fullName')!,
        email: _sharedPreferences.getString('email')!,
        gender: _sharedPreferences.getString('gender')!,
        fcmToken: _sharedPreferences.getString('fcmToken'),
        token: _sharedPreferences.getString('token')!,
        refreshToken: _sharedPreferences.getString('refreshToken')!,
        isActive: _sharedPreferences.getBool('isActive') ?? false);
  }

  bool loggedIn() {
    return _sharedPreferences.getBool('logged_in') ?? false;
  }

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  Future<bool> clearForKey({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  String? getToken() => _sharedPreferences.getString('token');
}
