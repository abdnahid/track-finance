import 'package:flutter/material.dart';

class AddNewTransaction extends StatefulWidget {
  final Function addTx;

  AddNewTransaction(this.addTx);

  @override
  State<AddNewTransaction> createState() => _AddNewTransactionState();
}

class _AddNewTransactionState extends State<AddNewTransaction> {
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();

  void handleAddTx() {
    final title = titleInput.text;
    final amount = double.parse(amountInput.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.addTx(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        color: Color(0xff112240),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.white),
              controller: titleInput,
              onSubmitted: (_) => handleAddTx(),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Colors.grey)),
              controller: amountInput,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => handleAddTx(),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.purple[400]),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: handleAddTx,
                child: Text('Add Expense'))
          ],
        ),
      ),
    );
  }
}
