// core/models/income.dart
import 'package:uuid/uuid.dart';

class Income {
  final String id;
  final double amount;
  final String currency;
  final DateTime date;

  Income({
    String? id,
    required this.amount,
    required this.currency,
    DateTime? date,
  })  : id = id ?? const Uuid().v4(),
        date = date ?? DateTime.now();
}