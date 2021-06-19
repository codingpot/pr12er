import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// _kHeadline1 는 Abstract/Recommendations/Repositories 등을 나타내는 헤딩1.
const _kHeadline1 = TextStyle(fontFamily: 'PermanentMarker', fontSize: 25);

/// CustomTheme 은 전체 테마를 정의합니다.
///
/// # 사용법
///
/// ```dart
/// Consumer<CustomTheme>(builder: (context, theme, _child) { ... }
/// ```
class CustomTheme extends ChangeNotifier {
  static ThemeData get lightTheme {
    final themeData = ThemeData();

    return themeData.copyWith(
        textTheme: themeData.textTheme.copyWith(headline1: _kHeadline1));
  }

  static ThemeData get darkTheme {
    final themeData = ThemeData.dark();
    final textTheme = themeData.textTheme;

    return themeData.copyWith(
        textTheme: textTheme.copyWith(
            headline1: textTheme.headline1?.merge(_kHeadline1) ??
                _kHeadline1.copyWith(color: Colors.white)));
  }

  bool _isDarkMode = false;

  void toggleMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Icon get icon => _isDarkMode
      ? const Icon(Icons.dark_mode_outlined)
      : const Icon(Icons.light_mode_outlined);
}