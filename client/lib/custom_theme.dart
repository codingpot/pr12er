import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

/// _kHeadline1 는 Abstract/Recommendations/Repositories 등을 나타내는 헤딩1.
final _kHeadline1 = GoogleFonts.permanentMarker(fontSize: 25);

/// CustomTheme 은 전체 테마를 정의합니다.
///
/// # 사용법
///
/// ```dart
/// Consumer<CustomTheme>(builder: (context, theme, _child) { ... }
/// // or
/// context.read<CustomTheme>();
/// ```
class CustomTheme extends ChangeNotifier {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSwatch(backgroundColor: Colors.white);
    final textTheme =
        Typography.blackMountainView.copyWith(headline1: _kHeadline1);
    return ThemeData.from(colorScheme: colorScheme, textTheme: textTheme);
  }

  static ThemeData get darkTheme {
    const colorScheme = ColorScheme.dark();
    final textTheme =
        Typography.whiteMountainView.copyWith(headline1: _kHeadline1);
    return ThemeData.from(colorScheme: colorScheme, textTheme: textTheme);
  }

  bool _isDarkMode = false;

  bool get isDarkMode {
    return _isDarkMode;
  }

  void toggleMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  // This type should not be a widget(e.g. Icon) because of mockito support...
  IconData get icon =>
      _isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined;

  // This type should not be a widget(e.g. Text) because of mockito support...
  String get text => _isDarkMode ? "다크 모드" : "라이트 모드";
}
