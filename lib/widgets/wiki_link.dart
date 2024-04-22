import 'package:flutter/material.dart';

class WikiEntryLink extends StatefulWidget {
  const WikiEntryLink({super.key, required this.pageName});

  final String pageName;

  @override
  State<WikiEntryLink> createState() => _WikiEntryLinkState();
}

class _WikiEntryLinkState extends State<WikiEntryLink> {
  Color? backgroundColor;

  void changeBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/wikiPageDetail',
            arguments: {'pageName': widget.pageName},
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.blueGrey,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Text(
            widget.pageName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
