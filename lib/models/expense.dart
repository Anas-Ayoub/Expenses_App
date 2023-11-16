import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
var formatter = DateFormat.yMd();

enum Category { food , travel, entertainment, work, shopping, pets }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight,
  Category.entertainment: Icons.music_note,
  Category.work: Icons.work,
  Category.shopping: Icons.shopping_basket,
  Category.pets: Icons.pets,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    categoryIcon[0];
    return formatter.format(date);
  }
}
