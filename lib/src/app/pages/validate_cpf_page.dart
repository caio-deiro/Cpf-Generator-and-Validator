import 'package:cpf_generator/src/shared/components/app_button.dart';
import 'package:cpf_generator/src/shared/masks/cpf_mask.dart';
import 'package:flutter/material.dart';

import '../viewModel/viewmodel.dart';

class ValidateCpfPage extends StatefulWidget {
  const ValidateCpfPage({Key? key}) : super(key: key);

  @override
  State<ValidateCpfPage> createState() => _ValidateCpfPageState();
}

class _ValidateCpfPageState extends State<ValidateCpfPage> {
  late ViewModel homeController;

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    homeController = ViewModel();
    homeController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Validacao de CPF'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: formkey,
                  child: TextFormField(
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    controller: homeController.cpfController,
                    decoration: InputDecoration(
                      label: Text('Coloque seu CPF!'),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != null) {
                        if (value.isEmpty) {
                          return 'campo vazio!, ensira um cpf';
                        } else if (value.contains(RegExp(r'[^0-9]'))) {
                          return 'digitar apenas números!';
                        } else if (value.length < 11) {
                          return 'coloque um CPF com 11 digitos';
                        }
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) async {
                      if (formkey.currentState?.validate() ?? false) {
                        if (homeController
                            .validateCpf(homeController.cpfController.text)) {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'CPF Válido!',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Voltar'),
                                    )
                                  ],
                                );
                              });
                        } else {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('CPF Inválido'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Voltar'),
                                    )
                                  ],
                                );
                              });
                        }
                      } else {
                        homeController.enableButtonAfterSecondsOver();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(
                            'Campo vazio! ensira os numeros para validar!',
                          ),
                        ));
                      }
                    },
                  ),
                ),
                SizedBox(height: 15),
                AppButton(
                  onPressed: homeController.enableButton
                      ? () async {
                          if (formkey.currentState?.validate() ?? false) {
                            if (homeController.validateCpf(
                                homeController.cpfController.text)) {
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'CPF Válido!',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('Voltar'),
                                        )
                                      ],
                                    );
                                  });
                            } else {
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('CPF Inválido'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('Voltar'),
                                        )
                                      ],
                                    );
                                  });
                            }
                          } else {
                            homeController.enableButtonAfterSecondsOver();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text(
                                'Campo vazio! ensira os numeros para validar!',
                              ),
                            ));
                          }
                        }
                      : null,
                  child: Text('Validar CPF!'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/generate'),
                    child: Text('Clique aqui para gerar um CPF'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
