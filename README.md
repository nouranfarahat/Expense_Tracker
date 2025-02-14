# Expense Tracker

A simple and intuitive expense tracking application built with Flutter and Cubit for state management. This app allows users to track their expenses, view a list of all expenses, and manage their finances efficiently.
## Features
- Add Expenses: Users can add new expenses with details like amount, description, category, and currency.

- View Expenses: A list of all expenses is displayed with alternating card colors for better readability.

- Edit Expenses: Users can update existing expense details.

- Delete Expenses: Expenses can be deleted with a confirmation dialog.

- Currency Support: Supports multiple currencies (USD, EUR, GBP, JPY).

- Different Categories: Expenses are categorized (e.g., Food, Transport, Housing).

- Clean Architecture: Separation of UI, business logic, and data models.

- State Management: Uses Cubit for efficient state management.

- Routing: Navigation between screens is handled using a custom AppRoute
## Project Structure
  lib/
  
├── constants/

│   └── strings.dart          # Route names and constants

├── core/

│   ├── cubit/

│   │   ├── expense_cubit.dart  # Business logic

│   │   └── expense_state.dart  # State definitions

│   └── models/

│       └── expense.dart       # Expense data model

        └── income.dart       # Income data model
        
├── presentation/

│   └── expenses/

│       ├── screens/

│       │   ├── home_screen.dart      # Main screen

│       │   ├── add_expense_screen.dart # Add expense screen

│       │   └── edit_expense_screen.dart # Edit expense screen

│       └── widgets/

│           └── expense_item.dart     # Reusable expense item widget

├── app_router.dart            # Custom router for navigation

└── main.dart                  # App entry point

## Implementation Details
1. State Management with Cubit
    ExpenseCubit: Manages the state of expenses (adding, updating, deleting).

    ExpenseState: Represents different states (initial, loading, loaded, error).

2. Routing
    AppRouter: Handles navigation between screens using named routes.

    Routes:

      homeScreenRoute: The main screen displaying the list of expenses.
  
      addExpenseScreenRoute: Screen for adding a new expense.
  
      editExpenseScreenRoute: Screen for editing an existing expense.

3. UI Components
    HomeScreen: Displays the list of expenses with alternating card colors (pastel blue and green).
  
    AddExpenseScreen: A form for adding new expenses with validation.
  
    EditExpenseScreen: A form for editing existing expenses.
  
    ExpenseItem: A reusable widget for displaying individual expense items.

4. Data Model
    Expense: Represents an expense with fields like id, amount, description, category, currency, and date.
  
5. Navigation
    Uses Navigator.pushNamed() and Navigator.pop() for screen transitions.

    Confirmation dialog appears before deleting an expense.




