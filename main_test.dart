import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab15/main.dart'; // назва твого проєкту


class FunctionCalculator {

  double calculate(double x) {
    return 8 * x * x - 9 * x;
  }
}

void main() {
  group('FunctionCalculator Tests', () {
    final calculator = FunctionCalculator();

    test('Check calculation of f(x)', () {
      expect(calculator.calculate(0), 0);
      expect(calculator.calculate(1), -1);
      expect(calculator.calculate(2), 14);
    });
  });

  group('UI Tests', () {
    testWidgets('Check app title contains group and name', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());


      expect(find.text('IPZ-32: Andrew\'s last Flutter App'), findsOneWidget);
    });

    testWidgets('Check FloatingActionButton icon', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());


      expect(
        find.byWidgetPredicate(
              (widget) =>
          widget is FloatingActionButton &&
              widget.child is Icon &&
              (widget.child as Icon).icon == Icons.electric_car,
        ),
        findsOneWidget,
      );
    });

    testWidgets('Check counter increment', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());


      expect(find.text('0'), findsOneWidget);


      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();


      expect(find.text('1'), findsOneWidget);
    });
  });
}
