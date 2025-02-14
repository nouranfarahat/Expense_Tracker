import 'package:expense_tracker/constants/strings.dart';
import 'package:expense_tracker/core/cubit/expense_cubit.dart';
import 'package:expense_tracker/presentation/expenses/screens/add_expense_screen.dart';
import 'package:expense_tracker/presentation/expenses/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter{
  ExpenseCubit _expenseCubit=ExpenseCubit();


  /*AppRouter()
  {
   _expenseCubit=ExpenseCubit();
  }*/

  Route? generateRoute(RouteSettings settings)
  {
    switch(settings.name){

      case homeScreenRoute:
        return MaterialPageRoute(builder: (_)=>BlocProvider.value(
          value: _expenseCubit,
          //create: (BuildContext context)=>ExpenseCubit(),
        child: HomeScreen(),));
      case addExpenseScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _expenseCubit,
            child: const AddExpenseScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ));
    }
  }
  void dispose() {
    _expenseCubit.close();
  }
}