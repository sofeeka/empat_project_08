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
            buildElevatedButton(context, 'Flutter'),
            buildElevatedButton(context, 'Dart'),
            buildElevatedButton(context, 'Widgets'),
            buildElevatedButton(context, 'State Management'),
            buildElevatedButton(context, 'Navigation'),
            buildElevatedButton(context, 'UI/UX'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, Colors.black12);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context, String name) {
    return ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/wikiPageDetail',
                arguments: {'pageName': name},
              );
            },
            child: Text(name),
          );
  }
}
