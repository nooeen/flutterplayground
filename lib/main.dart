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
      theme: ThemeData.light().copyWith(useMaterial3: true),
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
      appBar: AppBar(title: Text(title)),
      body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: const <Widget>[
            ProductBox(
              name: 'Kayak',
              description: 'A boat for one person',
              price: 275,
              image: 'braveenough.jpg',
            ),
            ProductBox(
              name: 'Kayak',
              description: 'A boat for one person',
              price: 275,
              image: 'starboy.jpg',
            ),
            ProductBox(
              name: 'Kayak',
              description: 'A boat for one person',
              price: 275,
              image: 'kaleidoscope.jpg',
            ),
            ProductBox(
              name: 'Kayak',
              description: 'A boat for one person',
              price: 275,
              image: 'whatwedrew.jpg',
            ),
            ProductBox(
              name: 'Kayak',
              description: 'A boat for one person',
              price: 275,
              image: 'futurenostalagia.jpg',
            ),
          ]),
    );
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
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(description),
                          Text("Price: " + price.toString()),
                        ],
                      )))
            ])));
  }
}
