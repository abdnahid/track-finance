import 'package:flutter/material.dart';
import './chart/chartBar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart({this.recentTransactions});
  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.MMMd().format(weekDay), 'amount': totalSum};
    });
  }

  double get totalSpend {
    return groupedTransaction.fold(
        0.0, (prevSum, item) => prevSum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Color(0xff112240),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransaction
              .map((e) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                      amount: e['amount'],
                      dayTitle: e['day'],
                      percentage: totalSpend != 0
                          ? (e['amount'] as double) / totalSpend
                          : 0.0,
                    ),
                  ))
              .toList()),
    );
  }
}
