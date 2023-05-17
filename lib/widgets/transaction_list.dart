import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> tran;

  TransactionList(this.tran);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: widget.tran.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('No Transaction added yet!!',
                    style: TextStyle(color: Colors.grey)),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
                  ),
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                  color: HexColor('#8358FF'),
                  child: ListTile(
                    leading: Container(
                      child: CircleAvatar(
                        backgroundColor: HexColor('#FF007A'),
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: FittedBox(
                            child: Text(
                              '\₹${widget.tran[index].amount}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      widget.tran[index].title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Checkbox.width),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(widget.tran[index].date),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    trailing: SizedBox(
                      width: 70,
                      child: Row(children: [
                        Expanded(
                          child: InkWell(
                            child: Icon(Icons.delete_outline,color: Colors.white,),
                            onTap: (){
                              setState(() {
                                widget.tran.removeAt(index);
                              });
                            },
                          ),
                        )
                      ]),
                    ),
                  ),
                );
              },
              itemCount: widget.tran.length,
            ),
    );
  }
}
