import 'package:expense_tracker/Charts/chart.dart';
import 'package:expense_tracker/Widget/ExpensesList/expense_list.dart';
import 'package:expense_tracker/Widget/new_expense.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpenses = [
    Expense(
        title: "Mouse",
        amount: 30,
        date: DateTime.now(),
        category: Category.shopping),
    Expense(
        title: "KeyBoard",
        amount: 200,
        date: DateTime.now(),
        category: Category.shopping),
    Expense(
        title: "Movie",
        amount: 30,
        date: DateTime.now(),
        category: Category.entertainment),
    Expense(
        title: "Lunch",
        amount: 10,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Pizza",
        amount: 30,
        date: DateTime.now(),
        category: Category.food)
        ,
    Expense(
        title: "To New York",
        amount: 500,
        date: DateTime.now(),
        category: Category.travel)
        ,
    Expense(
        title: "Cat",
        amount: 150,
        date: DateTime.now(),
        category: Category.pets)
        ,
    Expense(
        title: "Cheer Park",
        amount: 50,
        date: DateTime.now(),
        category: Category.entertainment)

  ];

  void _openNewExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(updateExpenses),
    );
  }

  void updateExpenses(Expense e) {
    setState(() {
      _registredExpenses.add(e);
    });
  }

  void removeExpense(Expense e) {
    final expenseIndex = _registredExpenses.indexOf(e);
    setState(() {
      _registredExpenses.remove(e);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registredExpenses.insert(expenseIndex, e);
              });
            }),
      ),
    );
  }

  double getCategorieSum(Category c) {
    double sum = 0;
    for (Expense x in _registredExpenses) {
      if (x.category == c) {
        sum += x.amount;
      }
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No Expenses yet, Start Adding new one!"),
    );

    if (_registredExpenses.isNotEmpty) {
      mainContent = ExpensesList(removeExpense, expens: _registredExpenses);
    }
    return Scaffold(
      appBar: AppBar(
        
        elevation: 8,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Expense Tracker",
          style: GoogleFonts.abel(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: _openNewExpenseOverlay,
                icon: const Icon(Icons.add)),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                    child: Chart(getCategorieSum),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                    child: Chart(getCategorieSum),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
