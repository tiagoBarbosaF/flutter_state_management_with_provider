import 'package:flutter/material.dart';
import 'package:mybank/components/editor.dart';
import 'package:mybank/models/balance_model.dart';
import 'package:mybank/models/transfer_model.dart';
import 'package:mybank/models/transfers_model.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = "Creating transfer";

const _rotuloName = "Holder name";
const _rotuloCampoValor = "Value";
const _dicaCampoValor = "0.00";

const _rotuloCampoNumeroConta = "Account Number";
const _dicaCampoNumeroConta = "0000";
const _textoBotaoConfirmar = "Confirm";

class TransferForm extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerAccountNumber =
      TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  TransferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _controllerName,
              label: _rotuloName,
              tip: '',
              icon: Icons.person,
            ),
            Editor(
              controller: _controllerAccountNumber,
              label: _rotuloCampoNumeroConta,
              tip: _dicaCampoNumeroConta,
              icon: Icons.forum,
            ),
            Editor(
                controller: _controllerValue,
                label: _rotuloCampoValor,
                tip: _dicaCampoValor,
                icon: Icons.monetization_on_outlined),
            ElevatedButton(
              onPressed: () => _transferCreate(context),
              child: const Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }

  void _transferCreate(BuildContext context) {
    final String name = _controllerName.text;
    final int? numeroConta = int.tryParse(_controllerAccountNumber.text);
    final double? valor = double.tryParse(_controllerValue.text);
    final validTransfer = _transferValidate(context, numeroConta, valor);

    if (validTransfer) {
      final newTransfer = Transfer(name, valor!, numeroConta!);

      _updateState(context, newTransfer, valor);
      Navigator.pop(context);
    }
  }

  _transferValidate(context, numeroConta, valor) {
    final _filledFields = numeroConta != null && valor != null;
    final _sufficientBalance =
        valor <= Provider.of<Balance>(context, listen: false).value;
    return _filledFields && _sufficientBalance;
  }

  _updateState(context, newTransfer, valor) {
    Provider.of<Transfers>(context, listen: false).addTransfer(newTransfer);
    Provider.of<Balance>(context, listen: false).subtratic(valor);
  }
}
