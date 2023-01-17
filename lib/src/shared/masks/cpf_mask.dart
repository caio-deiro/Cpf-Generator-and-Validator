import 'package:flutter/services.dart';

class CpfMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // ignore: unused_local_variable
    int selectionIndex = newValue.selection.end;

    final selectionIndexFromTheRight =
        newValue.text.length - newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newValue.text.length == 3) {
      newText.write('${newValue.text.substring(0, usedSubstringIndex = 3)}.');
      if (newValue.selection.end > 4) selectionIndex = 3;
    }
    if (newValue.text.length == 7) {
      newText.write('${newValue.text.substring(0, usedSubstringIndex = 7)}.');
      if (newValue.selection.end >= 7) selectionIndex = 8;
    }
    if (newValue.text.length == 11) {
      newText.write('${newValue.text.substring(0, usedSubstringIndex = 11)}-');
      if (newValue.selection.end >= 11) selectionIndex = 11;
    }

    if (newValue.text.length >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(
          offset: newText.length - selectionIndexFromTheRight),
    );
  }
}
