import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewTransaction extends StatefulWidget {
  final Function addTx;

  AddNewTransaction(this.addTx);

  @override
  State<AddNewTransaction> createState() => _AddNewTransactionState();
}

class _AddNewTransactionState extends State<AddNewTransaction> {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  DateTime _selectedDate;

  void handleAddTx() {
    final title = titleInput.text;
    final amount = double.parse(amountInput.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _handleDateSelect() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now().add(Duration(days: 7)))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  _selectedDate == null
                      ? "No Date Chosen"
                      : "Selected Date: ${DateFormat.yMd().format(_selectedDate)}",
                  style: TextStyle(color: Colors.white),
                )),
                TextButton(
                    onPressed: _handleDateSelect, child: Text("Choose Date"))
              ],
            ),
            SizedBox(
              height: 15,
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
