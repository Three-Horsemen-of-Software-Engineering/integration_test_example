import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    //Some predefined finders
    final counterTextFinder = find.byType('Text');
    final buttonFinder = find.byTooltip('Increment');
    final buttonFinderType = find.byType('FloatingActionButton');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter by 2', () async {
      //trying to use different finders to
      await driver.tap(buttonFinder);
      await driver.tap(buttonFinderType);
      expect(await driver.getText(counterTextFinder), "2");
    });
    test(
      'Assert that list contains 6 element',
      () async {
        await driver.tap(buttonFinder);
        await driver.tap(buttonFinderType);
        await driver.tap(find.text("6"));
        driver.screenshot();
        expect(await driver.getText(find.text("Current selected is 6")),
            "Current selected is 6");
      },
    );
    test(
      'Assert that 16 element is exists in list on the end of the list',
      () async {
        //defining scroll offset is required, dy for vertical, dx for horizontal
        await driver.scrollUntilVisible(
            find.byType("ListView"), find.text("16"),
            dyScroll: -200);
        await driver.tap(find.text("16"));
        expect(await driver.getText(find.text("Current selected is 16")),
            "Current selected is 16");
      },
    );
    test('Assert that application page navigated to text input', () async {
      await driver.tap(find.text('To text input'));
      expect(await driver.getText(find.byType("Text")), "initial");
    });
    test(
      'Assert that text that was inputted to input ares is '
      'written on screen after input finished',
      () async {
        final String givenText = "given text";
        await driver.tap(find.byType("TextField"));
        await driver.enterText(givenText);
        await driver.tap(find.byType("CupertinoButton"));
        expect(await driver.getText(find.byType("Text")), givenText);
      },
    );
  });
}
