import 'package:cpf_generator/src/app/viewModel/viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ViewModel homeViewmodel;
  setUp(() {
    homeViewmodel = ViewModel();
  });

  group('Testing cpf validate function', () {
    test('should return a false if CPF is not valid', () {
      var response = homeViewmodel.validateCpf('11154515455');
      expect(response, false);
    });

    test('should return true if CPF is valid', () {
      var response = homeViewmodel.validateCpf('75957712698');
      expect(response, true);
    });
  });

  group('testing cpf generate function', () {
    test('should return true if the cpf is valid', () {
      var cpfGenerate = homeViewmodel.generateCpf();
      var result = homeViewmodel.validateCpf(cpfGenerate);
      expect(result, true);
    });
  });
}
