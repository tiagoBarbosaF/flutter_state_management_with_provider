import 'package:intl/intl.dart';

class Transfer {
  final String name;
  final double valor;
  final int numeroConta;

  Transfer(this.name, this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transfer{Titular: $name, Número da Conta: $numeroConta, Valor: $valor}';
  }

  String toStringName() {
    return name;
  }

  String toStringConta() {
    return 'Account: $numeroConta';
  }

  String toStringValor() {
    return NumberFormat.simpleCurrency(
            name: 'BRL', locale: 'pt_BR', decimalDigits: 2)
        .format(valor);
  }
}
