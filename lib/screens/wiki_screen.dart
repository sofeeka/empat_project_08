import 'package:flutter/material.dart';

class WikiHomeScreen extends StatelessWidget {

  WikiHomeScreen({super.key});

  final List<String> pages = [
    'Flutter',
    'Dart',
    'Widgets',
    'State Management',
    'Navigation',
    'UI/UX',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wiki Home'),
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pages[index]),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/wikiPageDetail',
                arguments: {'pageName': pages[index]},
              );
            },
          );
        },
      ),
    );
  }
}