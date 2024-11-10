import 'package:flutter/material.dart';
import 'expense_card.dart';
//import 'date_picker_button.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> expenses = [
    {'title': 'Groceries', 'amount': 50.0, 'date': DateTime.now()},
    {'title': 'Internet', 'amount': 30.0, 'date': DateTime.now()},
    {'title': 'Rent', 'amount': 300.0, 'date': DateTime.now()},
  ];

  void addExpense(String title, double amount, DateTime date) {
    setState(() {
      expenses.add({'title': title, 'amount': amount, 'date': date});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return ExpenseCard(
            title: expenses[index]['title'],
            amount: expenses[index]['amount'],
            date: expenses[index]['date'],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (selectedDate != null) {
            // Here you should gather user input for title and amount
            String title = 'New Expense'; // You can replace this with user input
            double amount = 100.0; // You can replace this with user input
            addExpense(title, amount, selectedDate);
            print('Selected date: $selectedDate');
          }
        },
        child: Icon(Icons.date_range),
        tooltip: 'Select Date',
      ),
    );
  }
}
