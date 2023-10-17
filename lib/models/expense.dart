import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
var uuid = Uuid();

enum Category {work, leisure, food, rent}

const categoryIcons = {

  Category.food : Icons.lunch_dining,
  Category.work : Icons.work,
  Category.rent: Icons.home,
  Category.leisure : Icons.sports_bar

};
class Expense{
//below is the constructor function
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }
      ): id = uuid.v4();
  //colon used is simply a part of the syntax
  //uuid.v4 creates an id and is assigned to "id"

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }

}