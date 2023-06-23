import 'dart:io';

import 'package:flutter/material.dart';

class CadastroPessoa extends StatefulWidget {

  const CadastroPessoa({ super.key });

  @override
  State<CadastroPessoa> createState() => _CadastroPessoaState();
}

class _CadastroPessoaState extends State<CadastroPessoa> {

  final tecNome = TextEditingController();
  final tecN1 = TextEditingController();
  final tecN2 = TextEditingController();

  String nome = ''; 
  double n1 = 0; 
  double n2 = 0;
  double media = 0;
  
  void getControllerValues() {
    setState(() {
      nome = tecNome.text;
      n1 = double.parse(tecN1.text);
      n2 = double.parse(tecN2.text);
      media = (n1 + n2)/2;
    });
  }

  void mostrarMensagem(String mensagem) {
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(mensagem),
          duration: const Duration(seconds: 10),
          backgroundColor: Colors.blue,
        ),
      );
    });
  }

  void clearText() {
    tecNome.clear();
    tecN1.clear();
    tecN2.clear();
    media = 0;
  }
  
  @override
  void dispose() {
    tecNome.dispose();
    tecN1.dispose();
    tecN2.dispose();
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Média alunos'),),
           body: Container(
           margin: EdgeInsets.all(10),
           padding: EdgeInsets.all(10),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               TextFormField(
                 controller: tecNome,
                 autofocus: true,
                 decoration: InputDecoration(
                   isDense: true,
                   hintText: "Nome",
                   label: Text("Nome"),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5),
                   )
                 ),
                   maxLines: 1,
                   maxLength: 20,
               ),
               TextFormField(
                 controller: tecN1,
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   isDense: true,
                   hintText: "Nota 1",
                   label: Text("Primeira nota"),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5),
                   )
                 ),
                   maxLines: 1,
                   maxLength: 2,
               ),
               TextFormField(
                 controller: tecN2,
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   isDense: true,
                   hintText: "Nota 2",
                   label: Text("Segunda Nota"),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5),
                   )
                 ),
                   maxLines: 1,
                   maxLength: 2,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [

                   ElevatedButton(onPressed: () async {
                    getControllerValues();
                    if ((nome != '') && (n1 > 0) && (n2 > 0)) {
                      mostrarMensagem('aluno(a) $nome, com primeira nota $n1, segunda not $n2, ficou com a média: $media');
                      clearText();
                    } else {
                      mostrarMensagem('Campos obrigatórios não preenchidos');
                    }
                   }, child: const Text('Gravar')),

                   ElevatedButton(onPressed: () {
                    exit(0);
                   }, child: const Text('Cancelar')),

                 ],
               ),
             ],
           ),
           ),
       );
  }
}