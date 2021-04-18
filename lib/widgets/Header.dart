import 'package:cookbook/screens/CategoryShow.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  var ob;
  Header(this.ob);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ImageContain(
              'assets/breakfast.png',
              'Breakfast',
              Colors.blue,
              ob,
              0,
            ),
            ImageContain(
              'assets/lunch.png',
              'Lunch',
              Colors.green,
              ob,
              1,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            ImageContain(
              'assets/dinner.png',
              'Dinner',
              Colors.red,
              ob,
              2,
            ),
            ImageContain(
              'assets/snacks.png',
              'Snacks',
              Colors.cyanAccent,
              ob,
              3,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class ImageContain extends StatelessWidget {
  ImageContain(this.img, this.cat, this.c, this.ob, this.index);
  String img, cat;
  Color c;
  var ob;
  int index;
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryShowGrid(
                cat: '$cat',
                ob: ob,
                index: index,
              ),
            ),
          );
        },
        child: Container(
          height: _height * 0.2,
          child: Card(
              color: c,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 7, child: Center(child: Image.asset('$img'))),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          '$cat',
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
    );
  }
}
