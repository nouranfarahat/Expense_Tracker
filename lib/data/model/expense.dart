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
  Expense copyWith({
    String? id,
    double? amount,
    String? description,
    String? category,
    String? currency,
    DateTime? date,
  }) {
    return Expense(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      category: category ?? this.category,
      currency: currency ?? this.currency,
      date: date ?? this.date,
    );
  }
}