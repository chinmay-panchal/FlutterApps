import 'package:expense_tracker/widgets/charts/chart.dart';
import 'package:expense_tracker/widgets/expenses-list/expenses_list.dart';
import 'package:expense_tracker/models/expense_blueprint.dart';
import 'package:expense_tracker/widgets/new_expenses.dart';
import 'package:flutter/material.dart';

// this screen is the main screen

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseBlueprint> _registeredExpenses = [
    ExpenseBlueprint(
      title: 'Burger',
      amount: 59.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    ExpenseBlueprint(
      title: 'Jacket',
      amount: 1799,
      date: DateTime.now(),
      category: Category.clothes,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(ExpenseBlueprint expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(ExpenseBlueprint expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // for not delaying the current removed expense's undo option
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('expense deleted'),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // print(MediaQuery.of(context).size.height);

    Widget mainContent = const Center(
      child: Text('No expense found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter action bar'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 500 
      ? Column(
          children: [
            // const Text('chart'),
            Chart(expenses: _registeredExpenses),
            Expanded(
              child: mainContent,
            )
          ],
        )
      : Row(
        children: [
            // const Text('chart'),
            Expanded(child: Chart(expenses: _registeredExpenses),),
            Expanded(
              child: mainContent,
            ),
          ],
      )
    );
  }
}
