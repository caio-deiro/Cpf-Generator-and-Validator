import 'package:cpf_generator/src/app/models/cpf_model.dart';

abstract class CpfView {
  void update();
}

class PresenterCpf {
  final CpfView cpfView;

  PresenterCpf(this.cpfView);

  var result = '';

  void generateCpf() {
    final cpfModel = CpfModel(cpf: '');
    result = cpfModel.generateCpf();
    cpfView.update();
  }
}
