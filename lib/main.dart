import 'package:flutter/material.dart';
import 'package:mybank/models/balance_model.dart';
import 'package:mybank/models/transfers_model.dart';
import 'screens/dashboard/dashboard.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Balance(0),
          ),
          ChangeNotifierProvider(
            create: (context) => Transfers(),
          )
        ],
        child: const MyBankApp(),
      ),
    );

class MyBankApp extends StatelessWidget {
  const MyBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          secondary: Colors.tealAccent[900],
        ),
      ),
      home: const Dashboard(),
    );
  }
}
