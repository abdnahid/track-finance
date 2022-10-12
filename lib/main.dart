import 'package:flutter/material.dart';
import 'widgets/chart.dart';
import 'widgets/addNewTransaction.dart';
import 'widgets/transactionList.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track Finance',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'new shoes', amount: 70.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'groceries', amount: 20.19, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'paint house', amount: 62.99, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'buy tv', amount: 352.62, date: DateTime.now()),
    Transaction(
        id: 't5', title: 'phone bill', amount: 12.62, date: DateTime.now()),
  ];
  void addTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: txDate);
    setState(() {
      _transactions.add(newTx);
    });
  }

  void viewAddTxModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddNewTransaction(addTransaction);
        });
  }

  void handleDelete(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'FinTrack',
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: 25),
      ),
      actions: [
        IconButton(
            onPressed: () => viewAddTxModal(context),
            icon: Icon(Icons.add_box_rounded))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF0a192f),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(
                  recentTransactions: _transactions,
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: TransactionList(
                  transactions: _transactions,
                  deleteTx: handleDelete,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
