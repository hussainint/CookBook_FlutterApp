import 'dart:io';

import 'package:cookbook/models/ItemStore.dart';
import 'package:cookbook/models/Items.dart';
import 'package:cookbook/screens/ShowRecipe.dart';
import 'package:cookbook/widgets/Header.dart';
import 'package:cookbook/widgets/rightSilde.dart';
import 'package:flutter/material.dart';

import 'addItemScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ItemStore ob = new ItemStore();
  List<Items> data = [];
  getData() {
    setState(() {
      data = ob.getItems();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CookBook',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () async {
              var t = await Navigator.push(
                context,
                SlideRightRoute(
                  page: AddItem(ob),
                ),
              );
              getData();
            },
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              ob,
            ),
            if (data.length > 0)
              Text(
                ' Recently Added',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              // reverse: true,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                // childAspectRatio: 5 / 4,
              ),
              itemBuilder: (ctx, i) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowRecipe(data[i]),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    child: GridTile(
                      child: data[i].img != null
                          ? Image.file(data[i].img)
                          : Image.asset(
                              'assets/food1.jpg',
                              fit: BoxFit.cover,
                            ),
                      footer: GridTileBar(
                        subtitle: data[i].servings != null
                            ? Text('${data[i].servings} Servings')
                            : Container(),
                        backgroundColor: Colors.black54,
                        title: Text(
                          '${data[i].title}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
