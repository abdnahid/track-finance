import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String dayTitle;
  final double amount;
  final double percentage;

  ChartBar({this.dayTitle, this.amount, this.percentage});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FittedBox(
            child: Container(
              height: constraints.maxHeight * 0.1,
              child: Text(
                "\$${amount.toStringAsFixed(0)}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            width: 10,
            height: constraints.maxHeight * 0.7,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff0A192F),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )
              ],
            ),
          ),
          FittedBox(
            child: Container(
              height: constraints.maxHeight * 0.1,
              child: Text(
                dayTitle,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    });
  }
}
