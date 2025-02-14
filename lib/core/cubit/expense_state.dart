part of 'expense_cubit.dart';

@immutable
sealed class ExpenseState {}

final class ExpenseInitial extends ExpenseState {}
class ExpenseLoading extends ExpenseState{}
class ExpenseLoaded extends ExpenseState{
  final List<Expense> expenses;

  ExpenseLoaded(this.expenses);
}

class ExpenseError extends ExpenseState{
  final String message;
  ExpenseError(this.message);
}
