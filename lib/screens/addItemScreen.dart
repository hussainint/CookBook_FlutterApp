import 'package:cookbook/models/Items.dart';
import 'package:cookbook/screens/AddCategory.dart';
import 'package:cookbook/screens/AddIngredients.dart';
import 'package:cookbook/screens/AddRecipe.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AddItem extends StatefulWidget {
  AddItem(this.ob);
  var ob;
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  File _image;
  final picker = ImagePicker();
  int category = -1;
  String ingridents = "";
  String recipe = "";

  TextEditingController titlec = TextEditingController();
  TextEditingController servingc = TextEditingController();
  TextEditingController descriptionc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          print(_image);
        } else {
          print('No image selected.');
        }
      });
    }

    var _height = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
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
        title: Text(
          'Add Item',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          FlatButton(
            onPressed: () {
              // print(titlec.text.trim());
              // print(servingc.text.trim());
              // print(descriptionc.text.trim());
              // print(ingridents);
              // print(category);
              // print(recipe);
              var kk = Items(
                category: '$category',
                description: '${descriptionc.text.trim()}',
                ingredients: '$ingridents',
                title: '${titlec.text.trim()}',
                recipe: '$recipe',
                img: _image,
                servings: '${servingc.text}',
                // servings: '${servingc}'
              );
              widget.ob.addItem(kk);

              Navigator.of(context).pop();
            },
            child: Text('SAVE'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: getImage,
              child: Container(
                height: _height * 0.3,
                color: Colors.grey[200],
                child: _image != null
                    ? Center(
                        child: Image.file(
                        _image,
                        fit: BoxFit.cover,
                      ))
                    : Center(
                        child: Icon(Icons.add),
                      ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Title',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 7,
                          child: TextField(
                            controller: titlec,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Servings',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: TextField(
                          controller: servingc,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 7,
                          child: TextField(
                            controller: descriptionc,
                            maxLines: 3,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: ingridents == "" ? _height * 0.08 : _height * 0.15,
                    child: InkWell(
                      onTap: () async {
                        String k = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddIngredients('$ingridents'),
                          ),
                        );
                        setState(() {
                          ingridents = k;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Ingridents',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (ingridents != "")
                            Expanded(
                              flex: 7,
                              child: Text(
                                '$ingridents',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          if (ingridents == "")
                            Expanded(
                              flex: 7,
                              child: Text(
                                'Ingridents',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  InkWell(
                    onTap: () async {
                      int cat = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCategory(category),
                        ),
                      );
                      setState(() {
                        category = cat;
                      });
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                category == -1
                                    ? 'Add Category'
                                    : (category == 0
                                        ? 'Breakfast'
                                        : (category == 1
                                            ? 'Lunch'
                                            : category == 2
                                                ? 'Dinner'
                                                : 'Snacks')),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(Icons.navigate_next_rounded),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      String k = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddRecipe('$recipe'),
                        ),
                      );
                      setState(() {
                        recipe = k;
                      });
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recipe',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Add Recipe',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(Icons.navigate_next_rounded),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
