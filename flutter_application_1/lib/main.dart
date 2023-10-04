import 'data.dart'; // Substitua 'document.dart' pelo caminho real do arquivo

import 'package:flutter/material.dart';

void main() {
 runApp(const DocumentApp());
}

class DocumentApp extends StatelessWidget {
  const DocumentApp({Key? key}) : super(key: key);

  // Adicione o novo método personalizado aqui
  void myCustomMethod() {
    // O código da sua função personalizada vai aqui
    // Por exemplo, você pode adicionar a lógica para realizar alguma ação especial.
  }

  @override
  Widget build(BuildContext context) {
    // O código do método build continua aqui
    Document document = Document();
    var metadataRecord = document.getMetadata();

    return Scaffold(
      appBar: AppBar(
        title: Text(metadataRecord['title'] as String),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Last modified ${metadataRecord['modified']}',
            ),
          ),
        ],
      ),
    );
  }
}


class BlockWidget extends StatelessWidget {
  final Block block;

  const BlockWidget({
    required this.block,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle;
    switch (block.type) {
      case 'h1':
        textStyle = Theme.of(context).textTheme.displayMedium;
        break;
      case 'p':
      case 'checkbox':
        textStyle = Theme.of(context).textTheme.bodyMedium;
        break;
      default:
        textStyle = Theme.of(context).textTheme.bodySmall;
        break;
    }

    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(
        block.text,
        style: textStyle,
      ),
    );
  }
}


class DocumentScreen extends StatelessWidget {
  final Document document;

  const DocumentScreen({
    required this.document,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var metadata = document.getMetadata();
    var title = metadata['title'] as String;
    var modified = metadata['modified'] as DateTime;
    var blocks = document.getBlocks(); 

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Text('Last modified: ${formattedModifiedDate(modified)}'),
          Expanded(
            child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (context, index) {
                return BlockWidget(block: blocks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

String formattedModifiedDate(DateTime dateTime) {
  var today = DateTime.now();
  var difference = dateTime.difference(today);
  var days = difference.inDays;

  if (days == 0) {
    return 'today';
  } else if (days == 1) {
    return 'tomorrow';
  } else if (days == -1) {
    return 'yesterday';
  } else if (days > 7) {
    return '${days ~/ 7} weeks from now';
  } else if (days < -7) {
    return '${days.abs() ~/ 7} weeks ago';
  } else if (days < 0) {
    return '${days.abs()} days ago';
  } else {
    return '$days days from now';
  }
}

}
