import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: 'Tests'),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Progress'),
        BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Leaderboard'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
