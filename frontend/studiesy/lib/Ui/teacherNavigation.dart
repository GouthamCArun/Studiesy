import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:studiesy/Ui/profile.dart';
import 'package:studiesy/Ui/teachDash.dart';

class TeacherNavigation extends StatefulWidget {
  const TeacherNavigation({super.key});

  @override
  State<TeacherNavigation> createState() => _TeacherNavigationState();
}

class _TeacherNavigationState extends State<TeacherNavigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [const TeacherDash(), const ProfileScreen()];
    return Scaffold(
      bottomNavigationBar: MoltenBottomNavigationBar(
        domeCircleColor: const Color.fromARGB(255, 154, 91, 232),
        selectedIndex: _selectedIndex,
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            icon: const Icon(Icons.home),
          ),
          MoltenTab(
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: pages[_selectedIndex],
    );
  }
}
