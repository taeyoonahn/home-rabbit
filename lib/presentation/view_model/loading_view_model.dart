import 'package:flutter/material.dart';

class LoadingViewModel extends ChangeNotifier {
  static final LoadingViewModel _instance = LoadingViewModel._internal();
  factory LoadingViewModel() => _instance;

  LoadingViewModel._internal();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void loading() {
    _isLoading = true;
    notifyListeners();
  }

  void notLoading() {
    _isLoading = false;
    notifyListeners();
  }
}
