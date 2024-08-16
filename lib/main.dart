import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

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
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0, //condição ternária
          duration: Duration(milliseconds: 1000),
          child: ListView(
            children: const [
              Task(
                  'Aprender Flutter',
                  "https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png",
                  3),
              Task(
                  'Andar de bike',
                  "https://www.sesc-sc.com.br/Manager/show_image.php?show_arquivo=institucional&show_campo=institucional_imagem_pq&show_chave=Institucional_id=4175",
                  2),
              Task(
                  'Meditar',
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUqDS-0-oReeghWnA7aL5W3nsonIH3N3wHaA&s",
                  5),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            opacidade = !opacidade;
          }); //Se eh falso vira verdadeiro
        },
          child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

/// Classe para colocar layout de maneira estática e variada
/// Criar nosso proprio Widget basicamente
///
class Task extends StatefulWidget {
  final String nome; //Parametro da classe
  final String foto;
  final int Dificuldade;

  const Task(this.nome, this.foto, this.Dificuldade, {super.key});

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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black26,
                        width: 72,
                        height: 100,
                        child: Image.network(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // Aonde eles irão começar no layout
                        children: [
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
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 16,
                                color: (widget.Dificuldade >= 1)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: (widget.Dificuldade >= 2)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: (widget.Dificuldade >= 3)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: (widget.Dificuldade >= 4)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: (widget.Dificuldade >= 5)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                            ],
                          )
                        ],
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  "UP",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )),
                      ),
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
                          value: (nivel / widget.Dificuldade) /
                              10, //Maximo que da pra ir eh lvl 10
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8), //padding
                      child: Text(
                        'Nivel: $nivel',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
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
