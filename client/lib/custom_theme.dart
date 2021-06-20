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
    final colorScheme = themeData.colorScheme
        .copyWith(onPrimary: Colors.white, onBackground: Colors.black87);
    return _themeData(themeData, colorScheme);
  }

  static ThemeData get darkTheme {
    final themeData = ThemeData.dark();
    final colorScheme = themeData.colorScheme
        .copyWith(onPrimary: Colors.white, onBackground: Colors.white);
    return _themeData(themeData, colorScheme);
  }

  static ThemeData _themeData(ThemeData baseTheme, ColorScheme colorScheme) {
    final textTheme = baseTheme.textTheme
        .copyWith(headline1: _kHeadline1)
        .apply(displayColor: colorScheme.onBackground);

    return baseTheme.copyWith(colorScheme: colorScheme, textTheme: textTheme);
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
