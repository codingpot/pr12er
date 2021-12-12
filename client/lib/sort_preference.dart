import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _sharedPreferenceSortModeKey = "isDescOrder";

class SortMode extends ChangeNotifier {
  bool _isDescOrder = true;

  bool get isDescOrder {
    return _isDescOrder;
  }

  /// sharedPreferences is only visible for testing.
  /// It is used to test isDarkMode is being loaded from SharedPreferences.
  @visibleForTesting
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  void toggleMode() {
    _isDescOrder = !_isDescOrder;
    SharedPreferences.getInstance().then(
        (pref) => pref.setBool(_sharedPreferenceSortModeKey, _isDescOrder));
    notifyListeners();
  }

  // This type should not be a widget(e.g. Icon) because of mockito support...
  IconData get icon => _isDescOrder ? Icons.arrow_upward : Icons.arrow_downward;

  // This type should not be a widget(e.g. Text) because of mockito support...
  String get text => _isDescOrder ? "오름차순으로" : "내림차순으로";

  SortMode() {
    SharedPreferences.getInstance().then((pref) {
      final isDescOrder = pref.getBool(_sharedPreferenceSortModeKey);
      if (isDescOrder != null) {
        _isDescOrder = isDescOrder;
        notifyListeners();
      }
    });
  }
}
