import 'package:flutter_test/flutter_test.dart';
import 'package:pr12er/custom_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("CustomTheme", () {
    test("should load the initial state from the SharedPreference", () {
      SharedPreferences.setMockInitialValues({"isDarkMode": true});
      final c = CustomTheme();

      c.sharedPreferences.then((pref) {
        expect(pref.getBool("isDarkMode"), true);
        expect(c.isDarkMode, true);
      });

      expect(c.sharedPreferences, completes);
    });
  });
}
