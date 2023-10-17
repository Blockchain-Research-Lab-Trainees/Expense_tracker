

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{

  const NewExpense();
 @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{

  @override
  Widget build(BuildContext context) {
    return Padding(padding:
      EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            maxLength: 30,
            decoration: InputDecoration(
              hintText: 'hello'
            ),
          )
        ],
      ),
    );
  }

}