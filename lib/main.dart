import 'package:expense_tracker/app_router.dart';
import 'package:expense_tracker/constants/strings.dart';
import 'package:expense_tracker/data/model/expense.dart';
import 'package:expense_tracker/presentation/expenses/widgets/expense_item.dart';
import 'package:flutter/material.dart';

void main() {
   runApp(MyApp(appRouter:AppRouter()));
}

class MyApp extends StatelessWidget {
  
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expense Tracker',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: homeScreenRoute,
        );

  }

}
