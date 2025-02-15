import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group(
    "Flutter reverse app test",
    () {
      FlutterDriver? driver;
      setUpAll(
        () async {
          driver = await FlutterDriver.connect();
        },
      );
      tearDownAll(() async {
        if (driver != null) {
          await driver!.close();
        }
      });
      var textField = find.byType("TextField");
      var button = find.text("Reverse");
      var reverse = find.text("olleH");

      test(
        "reverses the string",
        () async {
          await driver!.tap(textField);
          await Future.delayed(Duration(seconds: 2));
          await driver!.enterText("Hello");
          await Future.delayed(Duration(seconds: 2));
          await driver!.waitForAbsent(reverse);
          await driver!.tap(button);
          await Future.delayed(Duration(seconds: 2));
          await driver!.waitFor(reverse);
          await driver!.waitUntilNoTransientCallbacks();
        },
      );
    },
  );
}
