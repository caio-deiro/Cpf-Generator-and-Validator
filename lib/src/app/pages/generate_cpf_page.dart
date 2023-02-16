import 'package:cpf_generator/src/app/controller/cpf_controller.dart';
import 'package:cpf_generator/src/app/presenter/presenter_cpf.dart';
import 'package:cpf_generator/src/shared/components/app_button.dart';
import 'package:flutter/material.dart';

import '../viewModel/viewmodel.dart';

class GenerateCpfPage extends StatefulWidget {
  const GenerateCpfPage({Key? key}) : super(key: key);

  @override
  State<GenerateCpfPage> createState() => _GenerateCpfPageState();
}

class _GenerateCpfPageState extends State<GenerateCpfPage> implements CpfView {
  final viewModel = ViewModel();
  late final presenter = PresenterCpf(this);
  final controller = CpfController();

  @override
  void initState() {
    super.initState();
    viewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Gerar CPF',
          ),
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
                    onPressed: () => viewModel.generateCpf(),
                    child: Text('Gerar CPF'),
                  ),
                  SizedBox(height: 25),
                  if (viewModel.showText)
                    Text(
                      'o CPF gerado é: ${viewModel.generateCpf()}',
                    ),
                ],
              ),
            )));
  }

  @override
  void update() {
    setState(() {});
  }
}
