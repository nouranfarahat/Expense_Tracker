import 'package:expense_tracker/app_router.dart';
import 'package:expense_tracker/data/model/expense.dart';
import 'package:expense_tracker/presentation/expenses/widgets/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../constants/strings.dart';
import '../../../core/cubit/expense_cubit.dart';
import 'add_expense_screen.dart';
import 'edit_expense_screen.dart';

class HomeScreen extends StatelessWidget {
  //final AppRouter appRouter;

  static const pastelBlue = Color(0xFFE3F2FD);
  static const pastelGreen = Color(0xFFCEE8CF);
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
          child: const Icon(Icons.add,color: Colors.white,),
          onPressed: () => Navigator.pushNamed(context, addExpenseScreenRoute)),
      body: BlocBuilder<ExpenseCubit, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoading)
            return const Center(child: CircularProgressIndicator());
          if (state is ExpenseLoaded) {
            return Column(
              children: [
                _buildTotalAmount(state.expenses),
                _buildExpensesList(context, state.expenses),
              ],
            );
          }
          if (state is ExpenseError) return Center(child: Text(state.message));
          return const Center(child: Text('Add your first expense!'));
        },
      ),
    );
  }

  Widget _buildExpensesList(BuildContext context, List<Expense> expenses) {
    return Expanded(
        child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return Dismissible(
            key: Key(expense.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (_) => _showDeleteConfirmation(context),
            onDismissed: (_) => context.read<ExpenseCubit>().deleteExpense(expense.id),            child: ExpenseItem(
              expense: expense,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => EditExpenseScreen(expense: expense)),
              ),
              backgroundColor: index.isEven ? pastelGreen : pastelBlue,
            ),
          );
        }));
  }

  Future<bool?> _showDeleteConfirmation(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this expense?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete', style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }

  Widget _buildTotalAmount(List<Expense> expenses) {
    final total = expenses.fold(0.0, (sum, e) => sum + e.amount);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Total: \$${total.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
