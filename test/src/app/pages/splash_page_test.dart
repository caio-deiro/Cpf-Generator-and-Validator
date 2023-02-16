import 'dart:ui';

import 'package:cpf_generator/src/app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should show the splash image when the screen load',
      (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: ((context) => SplashPage()))));

      expect(find.image(AssetImage('assets/images/cpf_image.png')),
          findsOneWidget);
    });
  });
}
