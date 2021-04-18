import 'package:flutter/material.dart';

class AddIngredients extends StatefulWidget {
  String ing;
  AddIngredients(this.ing);

  @override
  _AddIngredientsState createState() => _AddIngredientsState();
}

class _AddIngredientsState extends State<AddIngredients> {
  TextEditingController ic = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ic.text = widget.ing;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          FlatButton(
            onPressed: () {
              var k = ic.text.trim();
              var kk = " ";
              if ('${ic.text.trim()}' == null)
                kk = "";
              else
                kk = '${ic.text.trim()}';
              Navigator.of(context).pop("$kk");
            },
            child: Text('SAVE'),
          ),
        ],
        title: Text(
          'Add Ingredients',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: ic,
            maxLines: null,
            decoration: InputDecoration(hintText: 'Enter your Ingredients'),
          ),
        ),
      ),
    );
  }
}
