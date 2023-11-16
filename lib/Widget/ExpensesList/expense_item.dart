import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.item});

  final Expense item;

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: gr,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: GoogleFonts.abel(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 14,),
            Row(
              children: [
                Text(
                  "\$${item.amount.toStringAsFixed(2)}",
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[item.category]),
                    SizedBox(width: 15,),
                    Text(item.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
