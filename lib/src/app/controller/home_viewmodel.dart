import 'dart:async';

import 'package:cpf_generator/src/app/models/cpf_model.dart';
import 'package:flutter/cupertino.dart';

class HomeViewmodel extends ChangeNotifier {
  late CpfModel cpfModel;

  TextEditingController cpfController = TextEditingController();
  bool enableButton = true;

  bool showText = false;

  bool validateCpf(String cpf) {
    cpfModel = CpfModel(cpf: cpfController.text);
    return cpfModel.validateCpf();
  }

  String generateCpf() {
    showText = true;
    notifyListeners();
    cpfModel = CpfModel(cpf: cpfController.text);
    return cpfModel.generateCpf();
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
