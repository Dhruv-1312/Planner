import 'package:hexcolor/hexcolor.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenTransactions;
  Chart(this.recenTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recenTransactions.length; i++) {
        if (recenTransactions[i].date.day == weekday.day &&
            recenTransactions[i].date.month == weekday.month &&
            recenTransactions[i].date.year == weekday.year) {
          totalSum = totalSum + recenTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekday));
      print(totalSum);
      return {
        'day': DateFormat.E().format(weekday).substring(
              0,
            ),
        'amount': totalSum
      };
    });
  }

  double get sumSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Container(
      width: 500,
      height: 205 ,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                HexColor('#FF007A'),
                Colors.black,
              ],
              center: Alignment(-1,-1),
              radius: 0.9,
              focalRadius: 0.10
           
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    (data['day'] as String),
                    (data['amount'] as double),
                    sumSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / sumSpending),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
