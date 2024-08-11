import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto; // ATRIBUTO FINAL
  final void Function() quandoSelecionado; //OUTRO ATRIBUTO DA CLASSE

  const Resposta(this.texto, this.quandoSelecionado,/*quando selecionado passsada como parametro para esse componente */ {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        //  same as container
        width: double.infinity, //COLOCA A LARGURA A TELA TODA!!
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            onPressed: quandoSelecionado,
          child: Text(texto)
    )
    );
  }
}
