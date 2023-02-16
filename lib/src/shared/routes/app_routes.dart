import 'package:cpf_generator/src/app/pages/generate_cpf_page.dart';
import 'package:cpf_generator/src/app/pages/splash_page.dart';
import 'package:cpf_generator/src/app/pages/validate_cpf_page.dart';
import 'package:flutter/cupertino.dart';

final routes = <String, WidgetBuilder>{
  '/': (context) => SplashPage(),
  '/validate': (context) => ValidateCpfPage(),
  '/generate': (context) => GenerateCpfPage(),
};
