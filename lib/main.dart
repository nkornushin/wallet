import 'package:flutter/material.dart';
import 'package:wallet/screens/transaction_report.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TransactionReport(),
      theme: ThemeData(
        primaryColor: const Color(0xFF281C9D),
      ),
    );
  }
}
