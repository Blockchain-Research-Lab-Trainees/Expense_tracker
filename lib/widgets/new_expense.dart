import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{

  const NewExpense({super.key});
 @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{
  final _ExpenseInputController = TextEditingController();
  final _AmountController = TextEditingController();


  void _PresentDatePicker(){
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    showDatePicker(context: context, firstDate: firstDate, lastDate: now);
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
          SizedBox(height : 9),
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
                      labelText: 'Amount',
                    ),
              ),
              const SizedBox(height: 10),




          SizedBox(height : 10),

          Row(
            children: [
              IconButton(onPressed: _PresentDatePicker,
                  icon: Icon(Icons.calendar_month
              )
              ),

              SizedBox(width: 5),

              Text('Pick a date'),
            ],
          ),



          //*********3RD PART OF COLUMN HAVING BUTTONS**************************
          Row(
            children: [
              //******************1ST BUTTON********************
              ElevatedButton(
                  onPressed:() {
                //print(enteredtitleinput);
                print(_ExpenseInputController.text);
                print(_AmountController.text);
              },
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