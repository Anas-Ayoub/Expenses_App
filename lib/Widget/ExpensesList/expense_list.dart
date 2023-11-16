import 'package:expense_tracker/Widget/ExpensesList/expense_item.dart';
import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.removeExpense, {super.key, required this.expens});

  final List<Expense> expens;
  final Function(Expense) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expens.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          background: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(50),
                color: kColorScheme.error,
              ),
              alignment: Alignment.centerLeft,
              //color: kColorScheme.error,
              padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Delete",
                        style:
                            GoogleFonts.abel(color: Colors.white, fontSize: 28),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        "Delete",
                        style:
                            GoogleFonts.abel(color: Colors.white, fontSize: 28),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          key: ValueKey(expens[index]), 
          onDismissed: (direction) => removeExpense(expens[index]),
          child: ExpenseItem(item: expens[index]),
        );
      },
    );
  }
}
