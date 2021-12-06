import 'package:flutter/material.dart';
import 'package:mybank/models/transfer_model.dart';
import 'package:mybank/models/transfers_model.dart';
import 'package:provider/provider.dart';

import 'transfer_form.dart';

const _tituloAppBar = 'MyBank - Transfers';

class TransfersList extends StatelessWidget {
  const TransfersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: Consumer<Transfers>(builder: (context, transfers, child) {
        final _lastTransfer = transfers.transfers.reversed.toList();
        return ListView.builder(
          itemCount: transfers.transfers.length,
          itemBuilder: (context, index) {
            final transfer = _lastTransfer[index];
            return TransferItem(transfer);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TransferForm();
              },
            ),
          );
        },
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  // ignore: use_key_in_widget_constructors
  const TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading: const Icon(Icons.monetization_on_outlined),
        title: Text(
          _transfer.toStringName(),
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        subtitle: Text(_transfer.toStringConta()),
        trailing: Text(
          _transfer.toStringValor(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
