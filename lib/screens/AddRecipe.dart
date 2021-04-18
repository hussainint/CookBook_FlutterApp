import 'package:flutter/material.dart';

class AddRecipe extends StatefulWidget {
  String ing;
  AddRecipe(this.ing);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
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
              Navigator.of(context).pop("${ic.text.trim()}");
            },
            child: Text('SAVE'),
          ),
        ],
        title: Text(
          'Add Recipe',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            minLines: 5,
            controller: ic,
            maxLines: null,
            decoration: InputDecoration(hintText: 'Enter your Ingredients'),
          ),
        ),
      ),
    );
  }
}
