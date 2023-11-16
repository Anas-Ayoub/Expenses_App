import 'package:expense_tracker/Widget/ExpensesList/expense_item.dart';
import 'package:expense_tracker/Widget/Expenses.dart';
import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense(this.updateExpenses, {super.key});
  final void Function(Expense) updateExpenses;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

DateTime _selectedDate = DateTime.now();
Category _selectedCategory = Category.entertainment;

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void addNewExpense() {
    var amount = double.tryParse(_amountController.text);
    bool isAmountInvalid = (amount == null || amount <= 0);
    if (_titleController.text.trim().isEmpty || isAmountInvalid) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Invalid Input"),
              content: const Text(
                  "Please make sure a valid title and amount entered."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Okay'),
                ),
              ],
            );
          });
    } else {
      Expense e = Expense(
          title: _titleController.text.trim(),
          amount: amount,
          date: _selectedDate,
          category: _selectedCategory);
      widget.updateExpenses(e);
      Navigator.pop(context);
    }
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: firstDate,
        lastDate: DateTime.now());

    setState(() {
      if (pickedDate != null) {
        _selectedDate = pickedDate;
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  String txtIndicator = "";
  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, keyboardSpace + 20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                onChanged: (txt) {
                  setState(() {
                    txtIndicator = txt.toString();
                  });
                },
                maxLength: 25,
                decoration: const InputDecoration(
                  label: Text("Title"),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        label: Text("amount"),
                        prefixText: "\$ ",
                      ),
                      keyboardType: TextInputType.number,
                      controller: _amountController,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        formatter.format(_selectedDate),
                      ),
                      IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_month))
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              DropdownButton(
                items: Category.values
                    .map(
                      (cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(
                          cat.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (item) {
                  setState(
                    () {
                      _selectedCategory = item!;
                    },
                  );
                },
                value: _selectedCategory,
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: addNewExpense,
                    child: const Text("Add Expense"),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      
                    },
                    child: const Text("Cancel"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
