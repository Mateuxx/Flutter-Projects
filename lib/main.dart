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
          leading: Container(),
          title: const Text("Tarefas"),
        ),
        body: ListView(
          children: [
            const Task('Aprender Flutter'),
            const Task('Andar de bike'),
            const Task('Meditar'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

/// Classe para colocar layout de maneira estática e variada
/// Criar nosso proprio Widget basicamente
///
class Task extends StatefulWidget {
  final String nome; //Parametro da classe

  const Task(this.nome, {super.key});

  @override
  State<Task> createState() =>
      _TaskState(); // Fica de olho nas variaveis para caso elas mudem
}

/**
 * Ficar de olho no estado, caso o estado mude ele irá
 * resenhar a tela a cada mudança de estado
 */
class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          // alignment: Alignment.center,
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
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
                          widget.nome, //Padrão de sintaxe do stateful
                          style: const TextStyle(fontSize: 24),
                          overflow: TextOverflow
                              .ellipsis, //caso de overflow no meu texto - 3 pontinhos fica subentendido
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        child: ElevatedButton(
                            onPressed: () {
                              /**
                               * Função que diz para o widget quem eh que está mudando
                               * Irá reconstruir a tela com as mudanças de estado
                               */
                              setState(() {
                                nivel++; //Aumenta o nivel ao pressionar o botão
                              });
                              print(nivel);
                            },
                            child:  const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text("UP", style: TextStyle(
                                  fontSize: 12
                                ),)
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      // qual lado que voce quer tenha o padding
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel / 10, //Maximo que da pra ir eh lvl 10
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8), //padding
                      child: Text(
                        'Nivel: $nivel',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
