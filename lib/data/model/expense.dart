// core/models/expense.dart
import 'package:uuid/uuid.dart';

class Expense {
  final String id;
  final double amount;
  final String description;
  final String category;
  final String currency;
  final DateTime date;

  Expense({
    String? id,
    required this.amount,
    required this.description,
    required this.category,
    required this.currency,
    DateTime? date,
  })  : id = id ?? const Uuid().v4(),
        date = date ?? DateTime.now();
}