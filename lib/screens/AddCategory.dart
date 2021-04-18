import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  int cat;
  AddCategory(this.cat);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    var _width = MediaQuery.of(context).size.width;
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
                Navigator.of(context).pop(widget.cat);
              },
              child: Text('SAVE'),
            ),
          ],
          title: Text(
            'Add categories',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: _width * 0.48,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.cat = 0;
                      });
                    },
                    child: Container(
                      height: _height * 0.2,
                      child: Card(
                          color: Colors.red,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Center(
                                        child: Image.asset(
                                            'assets/breakfast.png'))),
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(
                                      'Breakfast',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                Container(
                  width: _width * 0.48,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.cat = 1;
                      });
                    },
                    child: Container(
                      height: _height * 0.2,
                      child: Card(
                          color: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Center(
                                        child:
                                            Image.asset('assets/lunch.png'))),
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(
                                      'Lunch',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: _width * 0.48,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.cat = 2;
                      });
                    },
                    child: Container(
                      height: _height * 0.2,
                      child: Card(
                          color: Colors.indigoAccent,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Center(
                                        child:
                                            Image.asset('assets/dinner.png'))),
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(
                                      'Dinner',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                Container(
                  width: _width * 0.48,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.cat = 3;
                      });
                    },
                    child: Container(
                      height: _height * 0.2,
                      child: Card(
                          color: Colors.green,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Center(
                                        child:
                                            Image.asset('assets/snacks.png'))),
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(
                                      'Snacks',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.cat == -1
                  ? 'Add Category'
                  : (widget.cat == 0
                      ? 'Breakfast'
                      : (widget.cat == 1
                          ? 'Lunch'
                          : widget.cat == 2
                              ? 'Dinner'
                              : 'Snacks')),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
