import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;

  ExpenseCard({
    Key? key,
    required this.title, 
    required this.amount, 
    required this.date
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        subtitle: Text('${date.toLocal()}'.split(' ')[0]), // Display date in a readable format
        trailing: Text('\$${amount.toStringAsFixed(2)}'), // Format amount
      ),
    );
  }
}
