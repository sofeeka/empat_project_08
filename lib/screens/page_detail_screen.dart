import 'package:flutter/material.dart';

class WikiPageScreen extends StatefulWidget {
  final String pageName;

  const WikiPageScreen({super.key, required this.pageName});

  @override
  _WikiPageScreenState createState() => _WikiPageScreenState();
}

class _WikiPageScreenState extends State<WikiPageScreen> {
  late String content;

  @override
  void initState() {
    super.initState();
    // Sample content with links
    content = '''
      This is the content of ${widget.pageName}.
      Click on [Flutter](#Flutter) to learn more about Flutter.
      Click on [Dart](#Dart) to learn more about Dart.
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/wikiPageDetail',
                  arguments: {'pageName': 'Flutter'},
                );
              },
              child: const Text('Flutter'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/wikiPageDetail',
                  arguments: {'pageName': 'Dart'},
                );
              },
              child: const Text('Dart'),
            ),
          ],
        ),
      ),
    );
  }
}
