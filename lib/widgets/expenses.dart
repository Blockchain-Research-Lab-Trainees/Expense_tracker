import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<Expenses> createState(){
    return _ExpensesState();
  }

}





class _ExpensesState extends State<Expenses>{

final List<Expense> _registeredExpenses = [
  //angular brackets ke bich me expense ko call kra,
  //jis se required wale arguments niche input kre
  //this is a list and   _registeredExpenses is the name of the list
  Expense(
    title: 'Watch',
    amount: 2000,
    date: DateTime.now(),
    category: Category.work
      //enum ko call kara
  ),

  Expense(
      title: 'Drums',
      amount: 25000,
      date: DateTime.now(),
      category: Category.leisure
  ),

  Expense(
      title: 'Laptop',
      amount: 60000,
      date: DateTime.now(),
      category: Category.work,
  ),

];

void _openAddExpenseOverlay(){
  showModalBottomSheet(
    isScrollControlled: true,
      context: (context),
      builder: (ctx) => NewExpense(onAddExpense: _addExpense)
  );

}


void _addExpense(Expense expense){
  setState(() {
    _registeredExpenses.add(expense);
  });
}


void _removeExpense(Expense expense){
  setState(() {
    _registeredExpenses.remove(expense);
  });
}



  @override

  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('Expense Tracker'),
      actions : [
         IconButton(

           icon: Icon(Icons.add_circle_outline_rounded),
        onPressed: _openAddExpenseOverlay

        ),
      ]
    ),
    body: Column(

    children: [
      Text('The chart'
      ),
    Expanded(
        child: ExpensesList(expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
        )
    )
      ]
  ),

  );

  }

}