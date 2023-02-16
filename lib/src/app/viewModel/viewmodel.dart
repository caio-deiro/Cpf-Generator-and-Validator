import 'dart:async';

import 'package:cpf_generator/src/app/models/cpf_model.dart';
import 'package:flutter/cupertino.dart';

class ViewModel extends ChangeNotifier {
  late CpfModel cpfModel;

  TextEditingController cpfController = TextEditingController();
  bool enableButton = true;

  bool showText = false;

  bool validateCpf(String cpf) {
    cpfModel = CpfModel(cpf: cpf);
    return cpfModel.validateCpf();
  }

  String generateCpf() {
    var result = '';
    cpfModel = CpfModel(cpf: '');
    result = cpfModel.generateCpf();
    showText = true;
    notifyListeners();
    return result;
  }

  void enableButtonAfterSecondsOver() {
    enableButton = false;
    notifyListeners();
    Timer(Duration(milliseconds: 4500), () {
      enableButton = true;
      notifyListeners();
    });
  }
}
