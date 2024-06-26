import 'package:flutter/material.dart';

class WikiEntryLink extends StatefulWidget {
  const WikiEntryLink({
    Key? key,
    required this.pageName,
    required this.onColorChanged,
  }) : super(key: key);

  final String pageName;
  final ValueChanged<Color?> onColorChanged;

  @override
  State<WikiEntryLink> createState() => _WikiEntryLinkState();
}

class _WikiEntryLinkState extends State<WikiEntryLink> {
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () async {
          final result = await Navigator.pushNamed(
            context,
            '/wikiPageDetail',
            arguments: {'pageName': widget.pageName},
          );

          if (result != null && result is Color) {
            setState(() {
              backgroundColor = result;
            });
            widget.onColorChanged(backgroundColor);
          }
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
