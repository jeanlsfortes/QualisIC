import 'package:flutter/material.dart';
import 'package:qualis_ic/data/conteudo.dart';

class LivrosList extends StatelessWidget {
  const LivrosList({super.key});

  @override
  Widget build(BuildContext context) {
    const livros = {...LIVROS_DADOS};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Livros'),
      ),
      body: ListView.builder(
        itemCount: livros.length,
        itemBuilder: (ctx, i) => Text(livros.values.elementAt(i).nome ?? ''),
      ),
    );
  }
}
