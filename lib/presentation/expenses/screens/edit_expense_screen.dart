// features/expenses/screens/edit_expense_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/expense_cubit.dart';
import '../../../data/model/expense.dart';

class EditExpenseScreen extends StatefulWidget {
  final Expense expense;

  const EditExpenseScreen({super.key, required this.expense});

  @override
  State<EditExpenseScreen> createState() => _EditExpenseScreenState();
}

class _EditExpenseScreenState extends State<EditExpenseScreen> {
  late final TextEditingController _amountController;
  late final TextEditingController _descriptionController;
  late String _selectedCategory;
  late String _selectedCurrency;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: widget.expense.amount.toString());
    _descriptionController = TextEditingController(text: widget.expense.description);
    _selectedCategory = widget.expense.category;
    _selectedCurrency = widget.expense.currency;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Expense',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
        backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              DropdownButtonFormField(
                value: _selectedCategory,
                items: ['Food', 'Transport', 'Housing', 'Entertainment','Education','Shopping','Groceries', 'Other']
                    .map((category) => DropdownMenuItem(
                  value: category,
                  child: Text(category),
                ))
                    .toList(),
                onChanged: (value) => setState(() => _selectedCategory = value!),
              ),
              DropdownButtonFormField(
                value: _selectedCurrency,
                items: ['USD', 'EUR', 'GBP','EGP', 'JPY']
                    .map((currency) => DropdownMenuItem(
                  value: currency,
                  child: Text(currency),
                ))
                    .toList(),
                onChanged: (value) => setState(() => _selectedCurrency = value!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: _updateExpense,
                  child: const Text('Save Changes',style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }

  void _updateExpense() {
    final updatedExpense = Expense(
      amount: double.parse(_amountController.text),
      description: _descriptionController.text,
      category: _selectedCategory,
      currency: _selectedCurrency,
    );
    if (updatedExpense.amount != null) {
      context.read<ExpenseCubit>().updateExpense(updatedExpense);
      Navigator.pop(context);
    } else {
      // Show error if amount is invalid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
    }
  }
}