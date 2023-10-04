import 'dart:convert';

class Document {
  String title = "My Document";
  DateTime now = DateTime.now();

  Map<String, dynamic> getMetadata() {
    return {
      "title": title,
      "modified": now,
    };
  }
}


void main() {
  Document myDocument = Document();
  Map<String, dynamic> metadata = myDocument.getMetadata();
  print(metadata);
}


const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": false,
      "text": "Learn Dart 3"
    }
  ]
}
''';
