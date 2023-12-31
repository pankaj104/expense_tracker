// import 'dart:js';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
     
  final Function  addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
    final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData()
  {
    // addTx(titleController.text, double.parse(amountController.text)  );
   // titleController.text, double.parse(amountController.text),
   final enteredTitle = titleController.text;
   final enteredAmout = double.parse(amountController.text);

if(enteredTitle.isEmpty || enteredAmout <= 0)
{
  return;
}

 widget.addTx(
    enteredAmout,
    enteredTitle,
   );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    keyboardType: TextInputType.number,
                    onSubmitted:  (_) => submitData,
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    keyboardType: TextInputType.number,  
                    onSubmitted:  (_) => submitData,
                  ), 
                  ElevatedButton(
                    onPressed: submitData,
                    child: const Text('Add Transaction'),
                  ),
                ],
              ),
            ),
          );
  }
}