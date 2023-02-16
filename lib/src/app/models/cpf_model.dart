import 'dart:math';

class CpfModel {
  final String cpf;

  CpfModel({required this.cpf});

  bool validateCpf() {
    var firstDigit = validateCpfFirsDigit();
    var secondDigit = validateCpfSecondDigit(firstDigit);
    var cpfToString = cpf.toString();
    var cpfToList = cpfToString.split('');
    var cpfToListInt = cpfToList.map((e) => int.parse(e)).toList();

    if (cpfToListInt.elementAt(9) == firstDigit &&
        cpfToListInt.elementAt(10) == secondDigit) {
      return true;
    } else {
      return false;
    }
  }

  String generateCpf() {
    var random = Random();
    var cpfList = <int>[];
    for (var i = 0; i < 11; i++) {
      cpfList.add(random.nextInt(10));
    }
    var cpf = cpfList.join();
    var model = CpfModel(cpf: cpf);

    if (model.validateCpf()) {
      return cpf;
    }
    return generateCpf();
  }

  int validateCpfFirsDigit() {
    var cpfNumberMultiplication = 10;
    var cpfToList = cpf.split('');
    var cpfFirstNineDigits = <int>[];
    var cpfWithNumbersMultiplicated = <int>[];
    int cpfAllNumbersSomed;
    int result;

    for (var index = 0; index < 9; index++) {
      cpfFirstNineDigits.add(int.parse(cpfToList[index]));
    }

    for (var index = 0; index < cpfFirstNineDigits.length; index++) {
      cpfWithNumbersMultiplicated
          .add(cpfFirstNineDigits[index] * cpfNumberMultiplication);
      cpfNumberMultiplication--;
    }

    cpfAllNumbersSomed =
        cpfWithNumbersMultiplicated.reduce((value, element) => value + element);

    if (cpfAllNumbersSomed % 11 < 2) {
      result = 0;
    } else {
      //digito igual a 11 - cpfAllNumbersSomed % 11
      result = (11 - cpfAllNumbersSomed % 11);
    }
    return result;
  }

  int validateCpfSecondDigit(int firstCpfDigit) {
    var cpfNumberMultiplication = 11;
    var cpfToList = cpf.split('');
    var cpfFirstTenDigits = <int>[];
    var cpfWithNumbersMultiplicated = <int>[];
    int cpfAllNumbersSomed;
    int result;

    for (var index = 0; index < 10; index++) {
      cpfFirstTenDigits.add(int.parse(cpfToList[index]));
    }

    for (var index = 0; index < cpfFirstTenDigits.length; index++) {
      cpfWithNumbersMultiplicated
          .add(cpfFirstTenDigits[index] * cpfNumberMultiplication);
      cpfNumberMultiplication--;
    }

    cpfAllNumbersSomed =
        cpfWithNumbersMultiplicated.reduce((value, element) => value + element);

    if (cpfAllNumbersSomed % 11 < 2) {
      result = 0;
    } else {
      result = (11 - cpfAllNumbersSomed % 11);
    }
    return result;
  }
}
