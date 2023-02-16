import 'package:cpf_generator/src/app/models/cpf_model.dart';
import 'package:flutter/cupertino.dart';

class CpfController {
  Widget generateCpf() {
    final cpfModel = CpfModel(cpf: '');
    var result = cpfModel.generateCpf();
    return Text('O cpf gerado foi : $result');
  }
}
