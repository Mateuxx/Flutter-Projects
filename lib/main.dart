import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.blue,
              width: 100,
              height: 50,
            ),
            Container(
              color: Colors.red,
              width: 200,
              height: 100,
            ),
            Container(
              color: Colors.amber,
              height: 30,
              width: 300,
              child: Text(
                'Diamante Amarelo',
                style: TextStyle(color: Colors.black, fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print("voce apertou um botão");
                },
                child: Text('Apere o botão!'))
          ],
        ),
      ),
    );
  }
}
