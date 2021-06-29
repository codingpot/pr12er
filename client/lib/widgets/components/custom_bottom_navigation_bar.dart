import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends BottomNavigationBar {
  CustomBottomNavigationBar(
      {required int selectedBottomNavIndex, ValueChanged<int>? onTap})
      : super(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: '전체',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_added,
              ),
              label: '북마크',
            ),
          ],
          currentIndex: selectedBottomNavIndex,
          onTap: onTap,
        );
}
