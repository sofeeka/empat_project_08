import 'package:empat_project_08/screens/wiki_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTabIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
      _controller.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: TabBar(
        controller: _controller,
        tabs: const [
          Tab(icon: Icon(Icons.home), text: 'Home' ),
          Tab(icon: Icon(Icons.article), text: 'Wiki'),
        ],
        onTap: _onTabIndexChanged,
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          WikiHomeScreen(),
          // Add other screens as needed
          Container(
            child: const Center(
              child: Text('Wiki Screen Placeholder'),
            ),
          ),
        ],
      ),
    );
  }
}
