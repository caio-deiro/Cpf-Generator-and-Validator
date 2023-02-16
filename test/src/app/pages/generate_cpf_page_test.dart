import 'package:cpf_generator/src/app/pages/generate_cpf_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget renderWidget(Widget child) {
    return MaterialApp(home: Builder(builder: ((context) => child)));
  }

  testWidgets('generate cpf page ...', (tester) async {
    await tester.pumpWidget(renderWidget(GenerateCpfPage()));

    expect(find.text('gerar CPF'), findsOneWidget);
  });
}
