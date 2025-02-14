import 'package:expense_tracker/data/model/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinanceItem extends StatelessWidget {
  final String financeType;
  final VoidCallback onTap;
  final double amount;
  final Color backgroundColor;
  const FinanceItem({super.key, required this.financeType, required this.onTap,required this.backgroundColor, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        //isThreeLine: true,
        leading: Icon(
          getTypeIcon(financeType),
          color: getTypeColor(financeType),
        ),
        title: Text(
          financeType,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        subtitle: Text('${getCurrencySymbol(financeType)}${amount.toStringAsFixed(2)}',
          style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.red.shade700)),
        onTap: onTap,
      ),
    );
  }

  Color getTypeColor(String category) {
    final colors = {
      'Income': Colors.green,
      'Expense': Colors.red,
    };
    return colors[category] ?? Colors.grey;
  }

  IconData? getTypeIcon(String category) {
    switch (category) {
      case 'Income':
        return Icons.add_card_sharp;
      case 'Expense':
        return Icons.credit_card;
      default:
        return Icons.category;
    }
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
