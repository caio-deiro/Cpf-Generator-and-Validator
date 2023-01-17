import 'package:cpf_generator/src/app/controller/home_viewmodel.dart';
import 'package:cpf_generator/src/shared/components/app_button.dart';
import 'package:flutter/material.dart';

class GenerateCpfPage extends StatefulWidget {
  const GenerateCpfPage({Key? key}) : super(key: key);

  @override
  State<GenerateCpfPage> createState() => _GenerateCpfPageState();
}

class _GenerateCpfPageState extends State<GenerateCpfPage> {
  final homeViewModel = HomeViewmodel();

  @override
  void initState() {
    super.initState();
    homeViewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gerar CPF'),
          centerTitle: true,
        ),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppButton(
                    onPressed: () => homeViewModel.generateCpf(),
                    child: Text('gerar CPF'),
                  ),
                  SizedBox(height: 25),
                  if (homeViewModel.showText)
                    Text('o CPF gerado é: ${homeViewModel.generateCpf()}'),
                ],
              ),
            )));
  }
}
