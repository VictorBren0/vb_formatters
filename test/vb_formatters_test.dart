import 'package:flutter_test/flutter_test.dart';
import 'package:vb_formatters/vb_formatters.dart';

void main() {
  group('moneyInputFormatter', () {
    final formatter = moneyInputFormatter();

    test('deve formatar 0 como R\$ 0,00', () {
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        const TextEditingValue(text: '0'),
      );
      expect(result.text.replaceAll('\u00A0', ' '), 'R\$ 0,00');
    });

    test('deve formatar 123 como R\$ 1,23', () {
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        const TextEditingValue(text: '123'),
      );
      expect(result.text.replaceAll('\u00A0', ' '), 'R\$ 1,23');
    });

    test('deve remover caracteres não numéricos e formatar', () {
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        const TextEditingValue(text: '12abc34'),
      );
      expect(result.text.replaceAll('\u00A0', ' '), 'R\$ 12,34');
    });

    test('deve formatar valores grandes corretamente', () {
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        const TextEditingValue(text: '123456789'),
      );
      expect(result.text.replaceAll('\u00A0', ' '), 'R\$ 1.234.567,89');
    });
  });

  group('phoneInputFormatter', () {
    final formatter = phoneInputFormatter();

    test('deve formatar 2 dígitos como DDD', () {
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        const TextEditingValue(text: '11'),
      );
      expect(result.text, '(11)');
    });

    test('deve formatar até 6 dígitos sem traço', () {
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        const TextEditingValue(text: '119999'),
      );
      expect(result.text, '(11) 9999');
    });

    test('deve formatar 11 dígitos corretamente', () {
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        const TextEditingValue(text: '11999998888'),
      );
      expect(result.text, '(11) 99999-8888');
    });

    test('deve truncar entradas com mais de 11 dígitos', () {
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        const TextEditingValue(text: '11999998888999'),
      );
      expect(result.text, '(11) 99999-8888');
    });

    test('deve remover todos os caracteres não numéricos', () {
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        const TextEditingValue(text: '(11) 99999-8888'),
      );
      expect(result.text, '(11) 99999-8888');
    });
  });
}
