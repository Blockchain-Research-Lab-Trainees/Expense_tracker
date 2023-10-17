

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget{
  ExpenseItem(this.expense,{super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context){
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical : 30
        ),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 10),
            Row(
              children: [
                //Text('\$${expense.amount.toStringAsFixed(2)}'
                Text('₹${expense.amount.toStringAsFixed(0)}'
                ),
                //text widget wants a string but amount is of type double
                //so tostring is to be used
                //even better, tostringasfixed is used to take only upto x place of decimal
                //since $ is a part of the syntax \$ is used to ignore it
                //curly braces are added to not treat the value as string rather treat it
                //as function or variable whose value is to be extracted and then printed
                  Spacer(),
               
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    SizedBox(width: 10),
                    Text(expense.formattedDate
                    ),
                  ],
                )
              ],
            )
          ],
        )
      ),
    );
  }

}