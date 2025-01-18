import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_rabbit/domain/use_case/use_cases.dart';

class ServiceUserViewModel with ChangeNotifier {
  String _userName = '';
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  final UseCases useCases;

  ServiceUserViewModel(this.useCases);

  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    saveUserNameToStorage(value);
    notifyListeners();
  }

  bool _isSubscribed = false;
  bool get isSubscribed => _isSubscribed;
  set isSubscribed(value) {
    _isSubscribed = value;
    notifyListeners();
  }

  Future<void> saveUserNameToStorage(String value) async {
    await _storage.write(key: 'userName', value: value);
  }

  Future<void> loadUserNameFromStorage() async {
    String? savedUserName = await _storage.read(key: 'userName');
    if (savedUserName != null) {
      _userName = savedUserName;
      notifyListeners();
    }
  }

  Future<void> setUserName(String value) async {
    _userName = value;
    notifyListeners();
    await saveUserNameToStorage(value);
  }

  String getCurrentUserName() {
    return _userName;
  }

  Future<void> deleteUser() async {
    _userName = '';
    await _storage.delete(key: 'userName');
    notifyListeners();
  }
}
