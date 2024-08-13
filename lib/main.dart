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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        // Tem appbar, boddy e a parte de baixo do app
        appBar: AppBar(
          title: Text("Tarefas"),
        ),
        body: ListView(
          children: [
            Task('Aprender Flutter'),
            Task('Andar de bike'),
            Task('Meditar'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

/// Classe para colocar layout de maneira estática e variada
/// Criar nosso proprio Widget basicamente
class Task extends StatelessWidget {
  final String nome; //Parametro da classe

  const Task(this.nome, {super.key}); //Construtor
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black26,
                    width: 72,
                    height: 100,
                  ),
                  Container(
                    // Colocar o texto sobre um container para evitar overflow
                    width: 200,
                    child: Text(
                      nome,
                      style: TextStyle(fontSize: 24),
                      overflow: TextOverflow
                          .ellipsis, //caso de overflow no meu texto - 3 pontinhos fica subentendido
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: Icon(Icons.arrow_drop_up))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
