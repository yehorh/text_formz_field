import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_formz_field/text_formz_field.dart';

import 'field.dart';

void main() {
  testWidgets('TextFormzField displays initial value and updates',
      (WidgetTester tester) async {
    // Create a FormzInput with an initial value
    var formzInput = Field.dirty('initial value');
    var onChangedValue = '';

    // Add the widget to the widget tester
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextFormzField(
            formzInput: formzInput,
            onChanged: (value) {
              onChangedValue = value;
            },
          ),
        ),
      ),
    );

    // Find the Text widget in the tree
    final textFinder = find.text('initial value');
    // Verify that the Text widget displays the initial value
    expect(textFinder, findsOneWidget);
    expect(onChangedValue, '');

    formzInput = Field.dirty('new value');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextFormzField(
            formzInput: formzInput,
            onChanged: (value) {
              onChangedValue = value;
            },
          ),
        ),
      ),
    );

    final textFinderNew = find.text('new value');
    expect(textFinderNew, findsOneWidget);
    expect(onChangedValue, '');
  });

  testWidgets('TextFormzField call onChanged when value changes',
      (WidgetTester tester) async {
    // Create a FormzInput with an initial value
    var formzInput = Field.pure('initial value');
    var onChangedValue = '';

    // Add the widget to the widget tester
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextFormzField(
            formzInput: formzInput,
            onChanged: (value) {
              onChangedValue = value;
            },
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormzField), 'new value');
    await tester.pump();

    expect(onChangedValue, 'new value');
  });
}
