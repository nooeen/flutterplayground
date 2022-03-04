import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Playground | Hello World'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  // user defined function
  void _showDialog(BuildContext context) {
    // user defined function void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text("Message"),
          content: const Text("Hello World"),
          actions: <Widget>[
            TextButton(
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "Hello ",
                        style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(
                        text: "World",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: GestureDetector(
        onTap: () {
          _showDialog(context);
        },
        child: const Text(
          'Hello World',
          style: TextStyle(
            color: Colors.red,
            letterSpacing: 0.5,
            fontSize: 30,
          ),
          textDirection: TextDirection.ltr,
        ),
      )),
    );
  }
}
