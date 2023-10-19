
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';
//reusable widget that will be used later on
class ExpensesList extends StatelessWidget{

  const ExpensesList({super.key, required this.expenses,required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context){
    return ListView.builder(itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          //this valuekey is a built in construcutor function
          onDismissed: (direction){

            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expenses[index])),
    );

  }






}