import 'package:expense_tracker/core/model/expense.dart';
import 'package:expense_tracker/features/expenses/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/cubit/expense_cubit.dart';
import 'features/expenses/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //MyApp({super.key});
  Expense e1 = Expense(
      amount: 20,
      description: "description1",
      category: "Food",
      currency: "EGP");
  Expense e2 = Expense(
      amount: 50,
      description: "description2",
      category: "Shopping",
      currency: "USD");
  Expense e3 = Expense(
      amount: 200,
      description: "description3",
      category: "Transport",
      currency: "JPY");
  List<Expense> expenses = [];
  MyApp() {
    expenses = [e1, e2, e3];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Column(
          children: [buildExpensesList(expenses, context)],
        ));
    /*return BlocProvider(
      create: (context) => ExpenseCubit()..loadExpenses(),
      child: MaterialApp(
        title: 'Expense Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );*/
  }

  Widget buildExpensesList(List<Expense> expenses, BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) => Dismissible(
                key: ValueKey(expenses[index].id),
                child: ExpenseItem(
                  expense: expenses[index],
                  onTap: () => print("tappp"),
                ))));
  }
}
