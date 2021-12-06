import 'package:flutter/material.dart';
import 'package:mybank/screens/dashboard/balance.dart';
import 'package:mybank/screens/deposit/deposit_form.dart';
import 'package:mybank/screens/transfer/last_transfers.dart';
import 'package:mybank/screens/transfer/transfer_form.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('myBank'),
      ),
      body: ListView(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: BalanceCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DepositForm();
                      },
                    ),
                  );
                },
                child: const Text(
                  'Deposit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
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
                child: const Text(
                  'Transfer',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          const LastTransfers()
        ],
      ),
    );
  }
}
