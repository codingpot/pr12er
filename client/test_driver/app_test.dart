import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Main App', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      driver.close();
    });

    test("shows the list view", () async {
      final listTile = find.byValueKey("ListTile-0");
      await driver.tap(listTile);

      final detailScreenTitle = find.byValueKey("detail_app/appBar/title");
      expect(await driver.getText(detailScreenTitle),
          "Generative Adversarial Nets");
    });
  });
}
