import 'package:flutter/material.dart';
import 'package:merkur_casino/pages/cuki_main_page.dart';
import 'package:merkur_casino/pages/map_page.dart';
import 'package:merkur_casino/pages/note_interesante.dart';
import 'package:merkur_casino/pages/notite_interesante.dart';

import 'package:merkur_casino/pages/volum_control_page.dart';

class Baradenavigare extends StatefulWidget {
  const Baradenavigare({super.key});

  @override
  State<Baradenavigare> createState() => _BaradenavigareState();
}

class _BaradenavigareState extends State<Baradenavigare> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const cukimainpage(),
    NoteInteresante(),
    const VolumeControlPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if ((_pageController.page ?? 0).round() == index - 1 ||
        (_pageController.page ?? 0).round() == index + 1) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _pageController.jumpToPage(index);
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff03AED2),
        unselectedItemColor: const Color(0xffCB9DF0),
        backgroundColor: const Color(0xffFDDE55), // Culoarea de fundal a barei
        items: List.generate(3, (index) {
          return BottomNavigationBarItem(
            icon: Icon(
              index == 0
                  ? Icons.cookie
                  : index == 1
                      ? Icons.note_rounded
                      : Icons.settings,
            ),
            label: index == 0
                ? 'Food'
                : index == 1
                    ? 'Notes'
                    : 'Settings',
          );
        }),
      ),
    );
  }
}
