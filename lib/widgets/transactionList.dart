import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList({this.transactions, this.deleteTx});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "Oops! No Transactions saved yet",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(
                    'assets/images/empty.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) => Card(
                color: Color(0xff112240),
                elevation: 6,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.cyan,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FittedBox(
                        child: Text(
                          "\$${transactions[index].amount}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    radius: 30,
                  ),
                  title: Text(
                    transactions[index].title.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMEd().format(transactions[index].date),
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTx(transactions[index].id),
                  ),
                ),
              ),
            ),
    );
  }
}


// Card(
//                     color: Color(0xff112240),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 100,
//                           margin: EdgeInsets.all(10),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 10),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               width: 2,
//                               color: Colors.cyan,
//                             ),
//                           ),
//                           child: Text(
//                             '\$ ${transactions[index].amount}',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: Colors.cyan,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16),
//                           ),
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               transactions[index].title.toUpperCase(),
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                   color: Colors.white),
//                             ),
//                             Text(
//                               DateFormat.yMMMEd()
//                                   .format(transactions[index].date),
//                               style: TextStyle(color: Colors.grey),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )),