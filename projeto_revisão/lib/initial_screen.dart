import 'package:flutter/material.dart';
import 'package:flutter_projects/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tem appbar, boddy e a parte de baixo do app
      appBar: AppBar(
        leading: Container(),
        title: const Text("Tarefas"),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0, //condição ternária
        duration: const Duration(milliseconds: 1000),
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
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}

