import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:wallet/data/data.dart';
import 'package:wallet/models/credit_card.dart';
import 'package:wallet/models/spending.dart';
import 'package:wallet/widgets/credit_card.dart';
import 'package:wallet/widgets/spending.dart';

class TransactionReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _screenWisth = MediaQuery.of(context).size.width;

    final CreditCard _creditCard = CreditCard(
      clientName: 'John Smith',
      bankName: 'Amazon Platinium',
      cardNumberFirst: '4756',
      cardNumberLast: '9018',
      balance: '3.469.52',
      cardType: CardType.Visa,
    );

    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
          width: _screenWisth,
          color: const Color(0xFF281C9D),
          child: Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height,
                ),
                Positioned(
                  top: -70.0,
                  left: 0,
                  right: 0,
                  child: CreditCardWidget(
                    creditCard: _creditCard,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 170.0),
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                            ),
                            child: ListView(
                              shrinkWrap: true,
                              children: listOfSpendings(),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )),
    );
  }

  List<Widget> listOfSpendings() {
    final List<Widget> _items = [];
    spendings.sort((a, b) => b.spendingDate.millisecondsSinceEpoch.compareTo(a.spendingDate.millisecondsSinceEpoch));

    final Map<String, List<Spending>> newMap = groupBy(spendings, (Spending obj) => DateFormat('yMd').format(obj.spendingDate));

    String dateStr = '';

    newMap.forEach((k, v) {
      if (dateStr != k) {
        if (dateStr != '')
          _items.add(const SizedBox(
            height: 30.0,
          ));
        _items.add(
          Text(
            DateFormat('yMd').format(DateTime.now()) == k ? 'Today' : DateFormat('yMd').format(DateTime.now().subtract(const Duration(days: 1))) == k ? 'Yesterday' : k,
            style: TextStyle(
              color: const Color(0xFF989898),
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        dateStr = k;
      }

      for (var i = 0; i < v.length; i++) {
        _items.add(SpendingWidget(
          spending: v[i],
        ));
        _items.add(const Divider(
          height: 0,
        ));
      }
    });

    return _items;
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Transaction report'),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 0,
    );
  }
}
