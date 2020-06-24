import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class ApRatio extends StatelessWidget {
  final double aspectRatio;

  ApRatio({@required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        color: Colors.orange,
        child: Center(child: Text("Aspect Ratio")),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return HorizontalView(height(context), width(context));
          } else {
            return VerticalView(height(context) * 0.15, width(context) * 0.5);
          }
        },
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget VerticalView(double height, double width) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue.withOpacity(0.3),
      elevation: 0,
      title: Container(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.favorite),
            Icon(Icons.bookmark_border),
            Icon(Icons.star_border),
          ],
        ),
      ),
    ),
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              width: width,
              height: height,
              color: Colors.orange,
              child: Center(child: Text("Hello")),
            ),
            Container(
              width: width,
              height: height,
              color: Colors.orange,
              child: Center(child: Text("World")),
            ),
            Card(
              child: Row(children: [
                Text(
                  "Without fittedBox",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                  height: 200,
                  child: Image.network(
                      "https://lh3.googleusercontent.com/-svwfeFI7WnY/XvHmVb955QI/AAAAAAAAHvc/K3JwOtoUkNkalWy_CY9DJRgxfKddCUQswCK8BGAsYHg/s0/Untitled-3.png"),
                ),
              ]),
            ),
            FittedBox(
              child: Card(
                child: Row(
                  children: [
                    Text(
                      "With fittedBox",
                      style: TextStyle(fontSize: 25),
                    ),
                    Container(
                      height: 200,
                      child: Image.network(
                          "https://lh3.googleusercontent.com/-svwfeFI7WnY/XvHmVb955QI/AAAAAAAAHvc/K3JwOtoUkNkalWy_CY9DJRgxfKddCUQswCK8BGAsYHg/s0/Untitled-3.png"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: 50.0,
                child: Column(children: [
                  Flexible(
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      widthFactor: 0.5,
                      child: Container(color: Colors.orange),
                    ),
                  ),
                  Flexible(
                    child: FractionallySizedBox(
                        heightFactor: 1,
                        widthFactor: 0.25,
                        child: Container(color: Colors.green)),
                  ),
                  Flexible(
                    child: FractionallySizedBox(
                        heightFactor: 1,
                        widthFactor: 0.15,
                        child: Container(color: Colors.blue)),
                  ),
                ])),
            ApRatio(aspectRatio: 5.1),
          ],
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget HorizontalView(double height, double width) {
  return Scaffold(
    body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        NavigationRail(
          backgroundColor: Colors.blue.withOpacity(0.3),
          destinations: [
            NavigationRailDestination(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              selectedIcon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: Text('First'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.bookmark_border, color: Colors.white),
              selectedIcon: Icon(Icons.book, color: Colors.white),
              label: Text('Second'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.star_border, color: Colors.white),
              selectedIcon: Icon(Icons.star, color: Colors.white),
              label: Text('Third'),
            ),
          ],
          selectedIndex: 0,
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: width * 0.25,
                  height: height * 0.25,
                  color: Colors.orange,
                  child: Center(child: Text("Hello")),
                ),
                Container(
                  width: width * 0.25,
                  height: height * 0.25,
                  color: Colors.orange,
                  child: Center(child: Text("World")),
                ),
              ],
            ),
            Container(
              width: width * 0.75,
              child: Card(
                child: FittedBox(
                  child: Row(
                    children: [
                      Text(
                        "With fittedBox",
                        style: TextStyle(fontSize: 25),
                      ),
                      Container(
                        width: width * 0.25,
                        child: Image.network(
                            "https://lh3.googleusercontent.com/-svwfeFI7WnY/XvHmVb955QI/AAAAAAAAHvc/K3JwOtoUkNkalWy_CY9DJRgxfKddCUQswCK8BGAsYHg/s0/Untitled-3.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: width * 0.75,
              child: Card(
                child: Row(children: [
                  Text(
                    "Without fittedBox",
                    style: TextStyle(fontSize: 25),
                  ),
                  Container(
                    width: width * 0.25,
                    child: Image.network(
                        "https://lh3.googleusercontent.com/-svwfeFI7WnY/XvHmVb955QI/AAAAAAAAHvc/K3JwOtoUkNkalWy_CY9DJRgxfKddCUQswCK8BGAsYHg/s0/Untitled-3.png"),
                  ),
                ]),
              ),
            ),
          ],
        ),
        ApRatio(aspectRatio: 0.2)
      ],
    ),
  );
}

MediaQueryData mediaQueryData(BuildContext context) {
  return MediaQuery.of(context);
}

Size size(BuildContext buildContext) {
  return mediaQueryData(buildContext).size;
}

double width(BuildContext buildContext) {
  return size(buildContext).width;
}

double height(BuildContext buildContext) {
  return size(buildContext).height;
}


