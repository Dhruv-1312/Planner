import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double totalspending;
  ChartBar(this.label, this.spending, this.totalspending);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: FittedBox(child: Text('\₹${spending.toStringAsFixed(0)}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 100,
          width: 25,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                ),
              ),
              FractionallySizedBox(
                heightFactor: totalspending,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1.2),
                    color: HexColor('#8358FF'),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ],
    );
  }
}
