
import 'package:empat_project_08/screens/home_screen.dart';
import 'package:empat_project_08/screens/wiki_page_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiki App',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Wiki App'), // 1
        '/wikiPageDetail' : (context) { // 2
          final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
          final pageName = arguments['pageName'] as String;
          return WikiPageScreen(pageName: pageName); // 3
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(
              child: Text('Route not found!'),
            ),
          ),
        );
      },
      debugShowCheckedModeBanner: false,
    );
  }
}