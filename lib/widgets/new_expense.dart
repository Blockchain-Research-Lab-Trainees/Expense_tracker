import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';

final formatter = DateFormat.yMd();
enum _Category {work, leisure, food, rent}



class NewExpense extends StatefulWidget{

  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;





 @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{
  final _ExpenseInputController = TextEditingController();
  final _AmountController = TextEditingController();
  DateTime? _selectedDate;
  _Category _selectedCategory = _Category.leisure;

  void _PresentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        firstDate: firstDate,
        initialDate: now,
        lastDate: now

    );

    setState(() {
      _selectedDate = pickedDate;
    }
    );
  }

  void _submitExpenseData () {

    final enteredAmount = double.tryParse(_AmountController.text);
    // print('hello');
    // print('hi');
    //parse string value ko double me convert kr deta h
    //if it cant convert, it gives null
    //logic is if null recieved

//amountIsInvalid is a boolean, agar entered amount null hai, to amountisinvalid
    // jo boolean hai wo true ho jayega then if condition satisfy ho jayega
    final amountIsInvalid = enteredAmount == null || enteredAmount <=0;
    if(_ExpenseInputController.text.trim().isEmpty
        || amountIsInvalid || _selectedDate == null)
    {
        showDialog(context: context,
          builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
            content: Text('Invalid Input'),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(ctx);
              },
                  child: Text("Ok")
              )
            ],
        ),
        );
        return;
    }


    widget.onAddExpense(
      Expense(
        title: _ExpenseInputController.text,
        amount: enteredAmount,
        date : _selectedDate!,
        category: selectedCategoryy

      )
    );

    Navigator.pop(context);

  }

  @override
  void dispose(){
  _ExpenseInputController.dispose();
  _AmountController.dispose;
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Padding(padding:
      EdgeInsets.symmetric(horizontal: 20),
      child: Column(//********************************************************////////////////----------------------+++++++++**************************/////////
        children: [
          SizedBox(height : 100),
          //***********1st TEXT FIELD***************************************
          TextField(
            //onChanged: _SaveTitleInput,
            controller: _ExpenseInputController,
            maxLength: 30,
            decoration: InputDecoration(
              //hintText: 'Expense Name'
              labelText: 'Expense Name'
            ),
          ),

          SizedBox(height: 10),

          //************2ND TEXT FIELD*******************************

              TextField(
                controller : _AmountController,
                    maxLength : 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //hintText: '₹'
                          prefixText : '₹',
                      labelText: '₹',
                    ),
              ),
              const SizedBox(height: 10),




          SizedBox(height : 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              DropdownButton(
                  value: _selectedCategory,
                  items: _Category.values
                  .map(
                      (category) => DropdownMenuItem(
                          value : category,
              child : Text(category.name.toUpperCase(),
              )
              )
              ).toList(),
                  onChanged: (value){

                if(value == null){
                  return;
                }

                //if value will be null, return will be called
                //after which the code isnt executed i.e.
                // set state and value changes wont occur
                //else setstate call hoga aur value change hogi


                setState(() {
                  _selectedCategory = value;
                });

                  }),


          Spacer(),



              IconButton(onPressed: _PresentDatePicker,
                  icon: Icon(Icons.calendar_month
              )
              ),

              SizedBox(width: 5),

              Text(_selectedDate == null ? 'Select a Date' : formatter.format(_selectedDate!)
              ),

           //exclamation mark tells dart that the value that could have been null
              //we are assuring that it wont be null
            ],
          ),

          SizedBox(height: 20),


          //*********3RD PART OF COLUMN HAVING BUTTONS**************************
          Row(
            children: [
              //******************1ST BUTTON********************
              ElevatedButton(
                  onPressed: _submitExpenseData,
                //print(enteredtitleinput);
                // print(_ExpenseInputController.text);
                // print(_AmountController.text);


                  child: Text('Save')
              ),
            //****************2ND BUTTON IN A ROW*****************************
              TextButton(onPressed: (){
              Navigator.pop(context);

              },
                  child: Text('Cancel',
                      style: TextStyle(fontSize: 15, color: Colors.black26)
                  )
              )
            ],
          )
        ],
      ),
    );
  }

}