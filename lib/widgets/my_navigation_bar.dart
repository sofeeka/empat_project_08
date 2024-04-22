import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const MyNavigationBar({super.key,
    required this.selectedIndex,
    required this.onDestinationSelected});

  final Color _iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home_outlined, color: _iconColor),
          label: 'Home',
          selectedIcon: Icon(Icons.home, color: _iconColor),
        ),
        NavigationDestination(
          icon: Icon(Icons.bookmarks_outlined, color: _iconColor),
          label: 'My Books',
          selectedIcon: Icon(Icons.bookmarks, color: _iconColor),
        ),
        NavigationDestination(
          icon: Icon(const IconData(0xf037, fontFamily: 'MaterialIcons'),
              color: _iconColor),
          label: 'Discover',
          selectedIcon: Icon(
            const IconData(
              0xe248,
              fontFamily: 'MaterialIcons',
            ),
            color: _iconColor,
          ),
        ),
        NavigationDestination(
          icon: Icon(Icons.search, color: _iconColor),
          label: 'Search',
          selectedIcon: Icon(Icons.search_outlined, color: _iconColor),
        ),
        NavigationDestination(
          icon: Icon(
            Icons.format_list_bulleted,
            color: _iconColor,
          ),
          label: 'More',
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Colors.transparent,
    );
  }
}