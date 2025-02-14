import 'package:expense_tracker/data/model/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  final VoidCallback onTap;
  final Color backgroundColor;
  const ExpenseItem({super.key, required this.expense, required this.onTap,required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        //isThreeLine: true,
        leading: Icon(
          getCategoryIcon(expense.category),
          color: getCategoryColor(expense.category),
        ),
        title: Text(
          expense.category,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        subtitle: Text('${expense.description}\n${_formatDate(expense.date)}',
        style: TextStyle(fontSize: 13,color: Colors.grey.shade700),),
        trailing: Text(
            '${getCurrencySymbol(expense.currency)}${expense.amount.toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.red.shade700)),
        onTap: onTap,
      ),
    );
  }

  Color getCategoryColor(String category) {
    final colors = {
      'Food': Colors.orange,
      'Transport': Colors.blue,
      'Housing': Colors.green,
      'Education': Colors.blueGrey,
      'Entertainment': Colors.purple,
      'Shopping': Colors.pink,
      'Groceries': Colors.teal,
    };
    return colors[category] ?? Colors.grey;
  }

  IconData? getCategoryIcon(String category) {
    switch (category) {
      case 'Food':
        return Icons.restaurant;
      case 'Transport':
        return Icons.bus_alert_sharp;
      case 'Education':
        return Icons.book;
      case 'Shopping':
        return Icons.shopping_bag;
      case 'Groceries':
        return Icons.local_grocery_store;
      case 'Housing':
        return Icons.home;
      case 'Entertainment':
        return Icons.movie;
      default:
        return Icons.category;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String getCurrencySymbol(String currencyCode) {
    switch (currencyCode.toUpperCase()) {
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'GBP':
        return '£';
      case 'EGP':
        return 'E£';
      case 'JPY':
        return '¥';
      default:
        return '$currencyCode ';
    }
  }
}
