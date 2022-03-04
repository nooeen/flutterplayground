import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const MyHomePage(title: 'Playground'),
      // home: const MyButton(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(title)),
        body: SingleChildScrollView(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              children: const <Widget>[
                ProductBox(
                  name: 'Brave Enough',
                  description: 'Lindsey Stirling',
                  price: 275,
                  image: 'braveenough.jpg',
                ),
                ProductBox(
                  name: 'Starboy',
                  description: 'The Weeknd',
                  price: 275,
                  image: 'starboy.jpg',
                ),
                ProductBox(
                  name: 'Kaleidoscope',
                  description: 'Coldplay',
                  price: 275,
                  image: 'kaleidoscope.jpg',
                ),
                ProductBox(
                  name: 'What We Drew',
                  description: 'Yaeji',
                  price: 275,
                  image: 'whatwedrew.jpg',
                ),
                ProductBox(
                  name: 'Future Nostalagia',
                  description: 'Dua Lipa',
                  price: 275,
                  image: 'futurenostalagia.jpg',
                ),
              ]),
        ));
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("assets/images/" + image),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 9, 10, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(description),
                          Text("Price: " + price.toString()),
                          const RatingBox(),
                        ],
                      )))
            ])));
  }
}

class RatingBox extends StatefulWidget {
  const RatingBox({Key? key}) : super(key: key);

  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;

  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }

  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }

  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _size = 20;
    // print(_rating);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              icon: (_rating >= 1
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.red[500],
              onPressed: _setRatingAsOne,
              iconSize: _size,
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              icon: (_rating >= 2
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.red[500],
              onPressed: _setRatingAsTwo,
              iconSize: _size,
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              icon: (_rating >= 3
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.red[500],
              onPressed: _setRatingAsThree,
              iconSize: _size,
            )),
      ],
    );
  }
}
