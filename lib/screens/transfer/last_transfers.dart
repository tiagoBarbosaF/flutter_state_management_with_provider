import 'package:flutter/material.dart';
import 'package:mybank/models/transfers_model.dart';
import 'package:mybank/screens/transfer/transfer_list.dart';
import 'package:provider/provider.dart';

const _title = 'Last transfers';

class LastTransfers extends StatelessWidget {
  const LastTransfers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 14),
          child: Text(
            _title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Consumer<Transfers>(
          builder: (context, transfers, child) {
            final _lastTransfers = transfers.transfers.reversed.toList();
            final _quantity = transfers.transfers.length;
            int size = 2;

            if (_quantity == 0) {
              return const NoRegisteredTransfers();
            }

            if (_quantity < 2) {
              size = _quantity;
            }

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: size,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TransferItem(_lastTransfers[index]);
              },
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const TransfersList();
                },
              ),
            );
          },
          child: const Text(
            'Transfer List',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class NoRegisteredTransfers extends StatelessWidget {
  const NoRegisteredTransfers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Text(
        'You don\'t have any registered transfer.',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
