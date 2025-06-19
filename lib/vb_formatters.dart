import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

TextInputFormatter moneyInputFormatter() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
      final text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
      final value = double.tryParse(text) ?? 0.0;
      final formattedText = formatter.format(value / 100);
      return newValue.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    });
  }

TextInputFormatter phoneInputFormatter() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

      if (digits.length > 11) digits = digits.substring(0, 11);

      String formatted = digits;

      if (digits.length >= 2) {
        formatted = '(${digits.substring(0, 2)})';
        if (digits.length >= 7) {
          formatted += ' ${digits.substring(2, 7)}-${digits.substring(7)}';
        } else if (digits.length > 2) {
          formatted += ' ${digits.substring(2)}';
        }
      }

      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    });
  }