import 'package:cookbook/models/Items.dart';
import 'package:flutter/material.dart';

class CategoryShowGrid extends StatefulWidget {
  CategoryShowGrid({
    this.ob,
    this.cat,
    this.index,
  });
  var ob;
  String cat;
  int index;

  @override
  _CategoryShowGridState createState() => _CategoryShowGridState();
}

class _CategoryShowGridState extends State<CategoryShowGrid> {
  List<Items> data = [];
  List<Items> data2 = [];
  getData() {
    data2 = widget.ob.getItems();
    setState(() {
      for (var i = 0; i < data2.length; i++) {
        if (data2[i].category == '${widget.index}') data.add(data2[i]);
      }
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
        title: Text('${widget.cat}'),
      ),
      body: GridView.builder(
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
            onTap: () {},
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
    );
  }
}
