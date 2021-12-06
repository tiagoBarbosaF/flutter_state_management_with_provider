import 'package:flutter/material.dart';
import 'package:mybank/components/editor.dart';
import 'package:mybank/models/balance_model.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Deposit';
const _rotuloName = 'Name';
const _rotuloCampoValor = 'Value';
const _dicaCampoValor = '0.00';
const _textoBotaoConfirmar = 'Confirm';

class DepositForm extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  DepositForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_titleAppBar),
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
                controller: _controllerValue,
                label: _rotuloCampoValor,
                tip: _dicaCampoValor,
                icon: Icons.monetization_on_outlined),
            ElevatedButton(
              onPressed: () => _depositCreate(context),
              child: const Text(
                _textoBotaoConfirmar,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _depositCreate(context) {
    final double? value = double.tryParse(_controllerValue.text);
    final depositValid = _depositValidate(value);

    if (depositValid) {
      _updateState(context, value);
      Navigator.pop(context);
    }
  }

  _depositValidate(value) {
    final _filledField = value != null;
    return _filledField;
  }

  _updateState(context, value) {
    Provider.of<Balance>(context, listen: false).addBalance(value);
  }
}
