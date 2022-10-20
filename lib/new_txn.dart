import "package:flutter/material.dart";
import "package:intl/intl.dart";

// import "../Models/txn_detail.dart";

class NewTxn extends StatefulWidget {
  final Function addTxn;

  NewTxn(this.addTxn);

  @override
  _NewTxnState createState() => _NewTxnState();
}

class _NewTxnState extends State<NewTxn> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  DateTime selectedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(priceController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTxn(
      enteredTitle,
      enteredAmount,
    );

    // Navigator.of(context).pop();
  }

  void presentDateSheet() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            child: TextField(
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
              controller: titleController,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            child: TextField(
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Price",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
                fillColor: Colors.white,
              ),
              controller: priceController,
              // onSubmitted: (_) => addTxn(
              //     titleController.text, double.parse(priceController.text).toStringAsFixed(2)),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  selectedDate == null
                      ? Text("Choose Date -->",
                          style: TextStyle(color: Colors.grey[400]))
                      : Text(
                          "${DateFormat.yMMMd().format(selectedDate)}",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                  FlatButton(
                    child: Text(
                      "Seclect Date",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: presentDateSheet,
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: RaisedButton(
              child: Text("Add Transaction",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              color: Colors.blue,
              onPressed: submitData, //()=> widget.addTxn(titleController,pri),
            ),
          ),
        ],
      ),
    );
  }
}
