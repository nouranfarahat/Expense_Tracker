import 'package:bloc/bloc.dart';
import 'package:expense_tracker/data/model/expense.dart';
import 'package:meta/meta.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {

  final List<Expense> _expenses=[];
  ExpenseCubit() : super(ExpenseInitial()){
    loadExpenses();
  }

  void loadExpenses()
  {
    emit(ExpenseLoading());
    try{
      emit(ExpenseLoaded(_expenses));
    }
    catch(e){
      emit(ExpenseError("Failed to load Expenses"));
    }
  }

  void addExpense(Expense expense)
  {
    emit(ExpenseLoading());
    try{
      _expenses.add(expense);
      emit(ExpenseLoaded(_expenses));
    }
    catch(e){
      emit(ExpenseError("Failed to add Expense"));
    }

  }
  void deleteExpense(String id)
  {
    emit(ExpenseLoading());
    try{
      _expenses.removeWhere((e)=>e.id==id);
      emit(ExpenseLoaded(_expenses));
    }
    catch(e){
      emit(ExpenseError("Failed to delete Expense"));
    }

  }
  void updateExpense(Expense updatedExpense)
  {
    emit(ExpenseLoading());
    try{
      final index=_expenses.indexWhere((e)=>e.id==updatedExpense.id);
      if(index!=-1){
        _expenses[index]=updatedExpense;
      }
      emit(ExpenseLoaded(_expenses));
    }
    catch(e){
      emit(ExpenseError("Failed to update Expense"));
    }

  }
}
