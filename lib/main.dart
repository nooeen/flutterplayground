import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'product.dart';

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
      home: MyHomePage(title: 'Playground'),
      // home: const MyButton(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(title)),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ProductBox(item: items[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(item: items[index]),
                  ),
                );
              },
            );
          },
        ));
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("assets/images/" + item.image),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 9, 10, 0),
                      child: ScopedModel<Product>(
                          model: item,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(item.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(item.description),
                              Text("Price: " + item.price.toString()),
                              ScopedModelDescendant<Product>(
                                  builder: (context, child, item) {
                                return RatingBox(item: item);
                              })
                            ],
                          ))))
            ])));
  }
}

class RatingBox extends StatelessWidget {
  const RatingBox({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    double _size = 20;
    // print(_rating);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              icon: (item.rating >= 1
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.red[500],
              onPressed: () => item.updateRating(1),
              iconSize: _size,
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              icon: (item.rating >= 2
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.red[500],
              onPressed: () => item.updateRating(2),
              iconSize: _size,
            )),
        Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              icon: (item.rating >= 3
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.red[500],
              onPressed: () => item.updateRating(3),
              iconSize: _size,
            )),
      ],
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/" + item.image),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(0),
                        child: ScopedModel<Product>(
                            model: item,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(item.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(item.description),
                                Text("Price: " + item.price.toString()),
                                ScopedModelDescendant<Product>(
                                    builder: (context, child, item) {
                                  return RatingBox(item: item);
                                })
                              ],
                            ))))
              ]),
        ),
      ),
    );
  }
}
