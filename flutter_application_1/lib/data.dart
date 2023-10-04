import 'dart:convert';

class Block {
  final String type;
  final String text;

  Block(this.type, this.text);

  factory Block.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('type') && json.containsKey('text')) {
      var type = json['type'] as String;
      var text = json['text'] as String;
      return Block(type, text);
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}

class Document {
  final Map<String, Object?> _json;

  Document({String? title, DateTime? modified}) : _json = {
        'metadata': {
          'title': title ?? 'My Document',
          'modified': modified?.toIso8601String() ?? DateTime.now().toIso8601String(),
        },
        'blocks': [
          {
            'type': 'h1',
            'text': 'Chapter 1',
          },
          {
            'type': 'p',
            'text': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          },
          {
            'type': 'checkbox',
            'text': 'Learn Dart 3',
          },
        ],
      };

  Map<String, Object?> getMetadata() {
    if (_json.containsKey('metadata')) {
      var metadataJson = _json['metadata'];
      if (metadataJson is Map) {
        if (metadataJson.containsKey('title') && metadataJson.containsKey('modified')) {
          var title = metadataJson['title'] as String;
          var localModified = metadataJson['modified'] as String;
          return {
            'title': title,
            'modified': DateTime.parse(localModified),
          };
        }
      }
    }
    throw const FormatException('Unexpected JSON');
  }

  List<Block> getBlocks() {
    if (_json.containsKey('blocks') && _json['blocks'] is List) {
      var blocksJson = _json['blocks'] as List;
      return <Block>[
        for (var blockJson in blocksJson) Block.fromJson(blockJson)
      ];
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}

void main() {
  Document myDocument = Document(title: 'Custom Title', modified: DateTime(2023, 5, 27));
  Map<String, Object?> metadata = myDocument.getMetadata();
  print(metadata);

  List<Block> blocks = myDocument.getBlocks();
  blocks.forEach((block) {
    print('Block Type: ${block.type}, Text: ${block.text}');
  });
}
