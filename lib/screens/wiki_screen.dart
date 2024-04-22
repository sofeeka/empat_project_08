import 'package:flutter/material.dart';
import '../widgets/wiki_entry_link.dart';

class WikiHomeScreen extends StatefulWidget {
  WikiHomeScreen({super.key});

  @override
  _WikiHomeScreenState createState() => _WikiHomeScreenState();
}

class _WikiHomeScreenState extends State<WikiHomeScreen> {
  final List<String> pages = [
    'Flutter',
    'Dart',
    'Widgets',
    'State Management',
    'Navigation',
    'UI/UX',
  ];

  final Map<String, Color?> linkColors = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return WikiEntryLink(
            pageName: pages[index],
            onColorChanged: (color) {
              setState(() {
                linkColors[pages[index]] = color;
              });
            },
          );
        },
      ),
    );
  }
}
