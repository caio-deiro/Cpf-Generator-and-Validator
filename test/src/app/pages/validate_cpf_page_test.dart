import 'package:cpf_generator/src/app/pages/validate_cpf_page.dart';
import 'package:cpf_generator/src/shared/components/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget renderWidget(Widget child) {
    return MaterialApp(home: Builder(builder: ((context) => child)));
  }

  testWidgets('validate cpf page ...', (tester) async {
    await tester.pumpWidget(Material(child: renderWidget(ValidateCpfPage())));

    expect(find.bySubtype<AppButton>(), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
  });
}
