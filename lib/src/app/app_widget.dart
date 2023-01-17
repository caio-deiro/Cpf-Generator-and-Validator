import 'package:cpf_generator/src/app/pages/validate_cpf_page.dart';
import 'package:cpf_generator/src/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: ValidateCpfPage(),
        routes: {...routes});
  }
}
