import 'package:flutter/material.dart';

import 'package:wallet/models/spending.dart';

class SpendingWidget extends StatelessWidget {
  const SpendingWidget({
    Key key,
    this.spending,
  }) : super(key: key);

  final Spending spending;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: spending.spendingType.toColor(),
          borderRadius: BorderRadius.circular(12),
        ),
        child: spending.spendingType.toIcon(),
      ),
      title: Text(
        spending.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        spending.spendingStatus.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFFB9B9B9),
        ),
      ),
      trailing: Text(
        (spending.amount < 0 ? '- ' : '+') + '\$${spending.amount < 0 ? spending.amount * (-1) : spending.amount}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: spending.amount <= 0 ? const Color(0xFFFF4D71) : const Color(0xFF4946A6),
        ),
      ),
    );
  }
}
