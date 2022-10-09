import 'package:flutter/material.dart';
import './widgets/expenses/addNewTransaction.dart';
import './widgets/expenses/transactionList.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
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
  void addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              onPressed: () {
                viewAddTxModal(context);
              },
              icon: Icon(Icons.add_box_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF0a192f),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Container(
                  child: Text("Expense chart"),
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  color: Colors.orange[100],
                ),
              ),
              TransactionList(
                transactions: _transactions,
              )
            ],
          ),
        ),
      ),
    );
  }
}
